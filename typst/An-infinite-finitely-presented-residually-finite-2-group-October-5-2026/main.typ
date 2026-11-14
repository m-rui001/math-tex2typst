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

#align(center)[#text(size: 16pt, weight: "bold")[An infinite finitely presented residually finite 2-group]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A group is #emph[periodic] if each of its elements has finite order.
  It is #emph[residually finite] if, for every nonidentity element $g$,
  there is a homomorphism to a finite group whose value at $g$ is nonidentity.
  We use #emph[2-group] to mean a group in which every element has finite 2-power order;
  the group itself need not be finite. An #emph[ordinary finite presentation] is a quotient of a free group on
  finitely many generators by the normal closure of finitely many words. We prove the following.

#thm([Theorem 1.1.])[
  #emph[There exists an infinite residually finite group with an ordinary finite presentation in which every
    element has finite 2-power order.]
] <thm:main>

The group is an abstract discrete group. Finite presentation is meant in that category,
  rather than in a variety of groups or in the category of pro-2 groups.
  The orders of its elements are necessarily unbounded.

=== History and relation to earlier constructions <history-and-relation-to-earlier-constructions>

Burnside’s finiteness questions [2] ask how finite-order conditions constrain a group with finitely many
  generators. Golod’s construction [3] Example 2, based on the Golod–Shafarevich dimension argument [4],
  already produces infinite finitely generated residually finite $p$-groups.
  Its algebraic mechanism is particularly relevant here: nilpotence gives finite $p$-power orders,
  while a grading separates elements in finite quotients. Grigorchuk later gave a concrete infinite finitely
  generated residually finite 2-group [5]; his original theorem also establishes that this group is not finitely
  presented. Thus residual finiteness and fixed-prime torsion can coexist with finite generation.
  The additional requirement in Theorem 1 is an ordinary finite presentation.

The question whether an infinite periodic group can have an ordinary finite presentation is recorded in [12] p. 45
  and again in [6] Section 2.2(IX). The torsion-by-cyclic groups of [12] Theorem 1.1 have an infinite cyclic
  quotient. They establish a different finite-presentation result and are not themselves periodic.
  The companion paper [13] constructs an infinite finitely presented periodic group using a graded algebra with a
  matrix-nil positive-degree ideal. The present paper strengthens that construction by proving residual finiteness
  and passing to a finite-index subgroup with 2-power torsion.
  The companion’s algebra and finite local-rule hierarchy are essential inputs;
  we state their precise properties in Section 2.

A bound on all element orders would change the problem. Novikov and Adian constructed infinite finitely generated
  groups of bounded exponent [11]. In the residually finite setting, however,
  Zel’manov’s solution of the restricted Burnside problem for 2-groups [20] Theorem 2 implies that a finitely
  generated residually finite group of exponent dividing $2^a$ is finite.
  Consequently the group in Theorem 1 has unbounded exponent. Its finite quotients are nevertheless all 2-groups:
  a finite image has only elements of 2-power order, and Cauchy’s theorem excludes every odd prime divisor of its order.

=== The proof and its main ingredients <the-proof-and-its-main-ingredients>

The companion supplies an infinite finitely presented graded algebra

$ R = bb(F)_2 xor I \, wide I = xor.big_(d gt.eq 1) R_d \, $

such that every matrix in $M_n \( I \)$ is nilpotent, for every finite $n$.
  Each homogeneous component $R_d$ is finite-dimensional. The elementary matrix group $"E"_n \( R \)$ is generated
  by the matrices $e_(i j) \( a \)$ obtained by adding $a in R$ to an off-diagonal position of the identity.
  The Steinberg group $"St"_n \( R \)$ is generated by symbols $x_(i j) \( a \)$ subject to the elementary
  addition and nonopposite-root commutator relations; these are written explicitly in Section 3. There is a natural map

$ "St"_n \( R \) arrow.r "E"_n \( R \) \, wide x_(i j) \( a \) mapsto e_(i j) \( a \) . $

Finite presentability of Steinberg groups in rank at least four over finitely presented unital rings is due to
  Krstić and McCool [8] Theorem 3; an adapted proof is also given in [13] Theorem 4.1.
  We take $n = 12$ and eventually use the kernel of reduction from $"St"_12 \( R \)$ to $"St"_12 \( bb(F)_2 \)$.

The degree truncations $R \/ R_(gt.eq d)$, where $R_(gt.eq d) = xor.big_(b gt.eq d) R_b$, are finite rings.
  They immediately detect nonidentity matrices over $R$. The main difficulty is to detect elements of the
  Steinberg kernel as well. We first work in the stable group $"St" \( R \) = "inj lim"_n "St"_n \( R \)$,
  put $"E" \( R \) = "inj lim"_n "E"_n \( R \)$, and write

$ J \( R \) = ker #scale(x: 120%, y: 120%)[\(] "St" \( R \) arrow.r "E" \( R \) #scale(x: 120%, y: 120%)[\)] . $

This kernel is central. We first prove detection in the stable group,
  where a finite calculation may always use additional coordinates. We return to fixed rank afterward.

Two calculations of one cyclic substitution provide the detection argument.
  If $z in J \( R \)$, the grading replaces each homogeneous root entry $a in R_d$ by $a t^d$.
  Substituting the cyclic shift matrix $C_L$ for $t$ and expanding into ordinary roots gives an element
  $W_z \( C_L \) in J \( R \)$. This is a matrix realization of a graded transfer.
  Weibel’s work on graded rings [18] develops the corresponding transfer operations and their eventual vanishing;
  it also implies $p$-primary torsion in relative graded $K$-groups in characteristic $p$.
  Following the elementary Steinberg treatment in [13], Section 4 proves directly that

$ W_z \( C_L \) = 1 quad upright("for all sufficiently large ") L $

whenever $z$ reduces to $1$ over $bb(F)_2$. Taking $L$ to be a power of two also shows that every such $z$ has
  2-power order.

The second calculation uses additional structure of this particular ring.
  Its finite local rules give a basis of nonzero word classes.
  For arbitrarily large odd integers $L$, each sufficiently long nonzero word has a start phase $sigma \( w \) in
  bb(Z) \/ L$ and an end phase $tau \( w \) = sigma \( w \) + \| w \|$.
  These phases depend only on the word class, and a nonzero product must match end phase to start phase.
  Section 2 derives the phases from the hierarchy’s bounded token decompositions.

If $z$ is missed by all degree truncations, it can be represented using roots whose entries are arbitrarily long
  words. The phases allow us to move the endpoints of each such root to coordinates labeled by its start and end
  phases, without changing $z$. Establishing this identity requires control of opposite-root commutators in the
  Steinberg group, as well as a subgroup on which the matrix map is injective.
  Sections 5 and 6 prove these facts and obtain, for the long-entry representative,

$ W_z \( C_L \) = z^L . $

We first choose an odd $L$ for which the first calculation vanishes,
  and then find a representative long enough for the second calculation. Thus $z^L = 1$.
  Since $z$ also has 2-power order, it is the identity. This proves separation by finite degree truncations,
  the additional step beyond torsion supplied by graded transfers alone.

To pass back to twelve coordinates, we need the injectivity of $"St"_12 \( R \) arrow.r "St" \( R \)$.
  Stability over the local ring $R$ is covered by the classical theorem of Suslin and Tulenbaev [16].
  Section 7 gives a direct integral homology proof using ordered frames and universal central extensions of their
  stabilizers. This supplies the bridge from stable detection to the finitely presented group.

All arguments establishing these phase, stabilization, and detection claims are included below.
  We quote from the companion the algebra construction and the finite-rank elementary facts needed to apply them,
  with their hypotheses stated at the points of use. The final passage to finite groups and to the subgroup of
  2-power torsion is carried out in Section 8.

== 2 The algebra and phases of long words <sec:ring-phases>

The ring used below has two relevant features. Its positive-degree matrices are nilpotent,
  which will give torsion, and its long nonzero words carry compatible positions modulo arbitrarily large odd
  integers, which will give detection by finite quotients. The first feature is an input from the companion paper.
  We derive the second from the word hierarchy in that paper.

An ideal $I$ of a unital associative algebra is #emph[matrix-nil] if every square matrix of every finite size with
  entries in $I$ is nilpotent. All algebras in this paper are over $bb(F)_2$.

#thm([Proposition 2.1.])[
  (The companion algebra).  #emph[There is an infinite finitely presented unital associative algebra
$ R = xor.big_(d gt.eq 0) R_d = bb(F)_2 xor I \, wide R_0 = bb(F)_2 \, wide I = xor.big_(d gt.eq 1) R_d \, $

 such that every $R_d$ is finite-dimensional and $I$ is matrix-nil.
   This algebra has the word presentation and hierarchy specified in Proposition 3.]
] <prop:ring-input>

This is the algebra constructed in [13] Theorem 3.7. We now give the precise part of its structure that we use.
  In a presentation by words, a #emph[replacement] is a relation $v = v'$ between nonempty words of equal length,
  usable in either direction inside any word. A #emph[zero declaration] is a relation $v =
  0$ for a nonempty word $v$. The length of a replacement is the common length of its two sides.
  For a word $w$, write $\| w \|$ for its length and $\[ w \]$ for its image in the relevant algebra.

#thm([Proposition 2.2.])[
  (The companion hierarchy).  #emph[The algebra $R$ in Proposition 2 is the first algebra $A_0$ of a sequence
    $\( A_j \)_(j gt.eq 0)$ with the following properties. There are positive integers $c \, k \, h_0 \, D$,
    with $D > 10 \( c + 1 \) \( k + 1 \)$, and
$ h_j = h_0 D^j \, wide L_j = 2 dot.op 2^(h_j) + 1 . $

 For each $j gt.eq 0$:]
  + #emph[$A_j$ is presented by a finite alphabet $Sigma_j$, finitely many replacements,
    and finitely many zero declarations, all of length at most $k$. It is graded by word length.]
  + #emph[There is a substitution $E_j$ sending each letter of $Sigma_(j + 1)$ to a word of length $L_j$ over
    $Sigma_j$. Extended by concatenation, it induces a unital algebra homomorphism $A_(j + 1) arrow.r A_j$.]
  + #emph[A specified subset of $Sigma_j$ gives cuts immediately before its letters.
    There are integers $B_j \, T_j gt.eq 0$ and a finite set of words $cal(T)_j$ such that every nonzero word $w$
    of length at least $T_j$ has the unique decomposition
#[#set math.equation(numbering: n => "(2.1)")
 $ w = p_w thin t_1 dots.h.c t_r thin s_w \, wide \| p_w \| \, \| s_w \| lt.eq B_j \, wide
   t_i in cal(T)_j . $ <eq:token-decomposition>]

 Here $p_w$ precedes the first cut, $s_w$ begins at the last cut,
   and the $t_i$ are exactly the intervals between consecutive cuts.
   A cut is counted only if its following letter occurs in the word.
   For each $t in cal(T)_j$ there is a nonempty word $u_t$ over $Sigma_(j + 1)$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ 1 lt.eq \| u_t \| lt.eq k \, wide \| t \| = L_j \| u_t \| \, wide \[ t \] = \[ E_j \( u_t \) \] quad
   upright("in ") A_j . $ <eq:token-upper-word>]

]
] <prop:hierarchy-input>

These are the applicable conclusions of [13] Proposition 2.2 and the choice of parameters in Section 3.
  In particular, the cuts in (iii) are recognized from individual letters;
  restricting to a subword cannot create or move a cut. We will not need arbitrary concatenations of tokens to be
  nonzero.

We recall the elementary word-basis argument [13] Lemma 2.1,
  since it will also identify exactly which equalities of long words must preserve their phases.
  Form a graph whose vertices are all words, including the empty word,
  and whose edges are replacements in arbitrary contexts. Quotienting the free algebra by the replacement
  relations leaves one basis vector for each connected component:
  the defining ideal is precisely the span of differences of words in a common component.
  Imposing the zero declarations then kills exactly the components containing a word with a zero-declared subword.
  Thus, in every $A_j$, the nonzero replacement classes form a basis, and

#[#set math.equation(numbering: n => "(2.3)")
 $ \[ w \] = 0 quad arrow.l.r.double quad
   w upright(" can be replaced by a word containing a zero-declared subword.") $ <eq:word-zero-criterion>]

In particular, a subword of a nonzero word is nonzero. The product of two basis classes is either zero or the
  class of their concatenation. We will often use the same symbol for a nonzero word and its basis class when it
  occurs as an algebra entry.

The finite alphabet also shows directly that each homogeneous part $R_d$ is finite-dimensional. Write

$ R_(gt.eq d) = xor.big_(e gt.eq d) R_e . $

For $d gt.eq 1$ this is a two-sided ideal, and $R \/ R_(gt.eq d)$ is a finite ring.
  The remaining task in this Section is to extract compatible modular positions from the hierarchy.

#thm([Lemma 2.3.])[
  (Phases of long words).  #emph[For every integer $d gt.eq 0$, put
$ L = L_0 L_1 dots.h.c L_d . $

 There is an integer $N gt.eq 1$ such that every nonzero word $w$ in $R$ of length at least $N$ has a start phase
   $sigma \( w \) in bb(Z) \/ L bb(Z)$ and an end phase
$ tau \( w \) = sigma \( w \) + \| w \| in bb(Z) \/ L bb(Z) $

 with the following properties:]
  + #emph[Both phases depend only on the basis class of $w$.]
  + #emph[If $v$ is a contiguous subword of $w$, has length at least $N$,
    and starts at offset $b$ from the beginning of $w$, then
#[#set math.equation(numbering: n => "(2.4)")
 $ sigma \( v \) = sigma \( w \) + b . $ <eq:phase-subword>]

]
  #emph[The integers $L$ so obtained are odd and arbitrarily large.]
] <lem:phases>

#proof[
  Fix $d$. First we construct phases for literal nonzero words, without claiming invariance under replacements.
    We work backward through the levels $j = d \, d - 1 \, dots.h \, 0$.
    At level $d + 1$, use the trivial phase modulo the empty product $1$, with threshold $1$.
    Suppose that phases with the subword property have been constructed at level $j + 1$ modulo
  $ L' = L_(j + 1) dots.h.c L_d \, $
  above a threshold $n_(j + 1) gt.eq 1$.
  For every token $t in cal(T)_j$, choose one word $u_t$ satisfying (2.2),
    and use this same choice at every occurrence of $t$. For the decomposition (2.1), set
  $ U \( w \) = u_(t_1) dots.h.c u_(t_r) . $
  Choose
  #[#set math.equation(numbering: n => "(2.5)")
   $ n_j gt.eq max { 1 \, T_j \, thin 2 B_j + L_j n_(j + 1) } . $ <eq:literal-threshold>]
  Then every nonzero word $w$ of length at least $n_j$ has such a decomposition and
  $ \| U \( w \) \| = frac(\| w \| - \| p_w \| - \| s_w \|, L_j) gt.eq n_(j + 1) . $
  Moreover, $U \( w \)$ is nonzero in $A_(j + 1)$. Indeed, the substitution homomorphism and the token equalities give
  $ \[ w \] = \[ p_w \] thin \[ E_j \( U \( w \) \) \] thin \[ s_w \] \, $
  so $\[ U \( w \) \] = 0$ would imply $\[ w \] = 0$. Define the literal start phase by
  #[#set math.equation(numbering: n => "(2.6)")
   $ sigma_j \( w \) = L_j sigma_(j + 1) \( U \( w \) \) - \| p_w \| med \( mod med L_j L' \) . $ <eq:phase-induction>]
  Multiplication by $L_j$ makes this independent of the representative chosen for the residue
    $sigma_(j + 1) \( U \( w \) \)$ modulo $L'$.
  We verify the subword property at level $j$. Let $v$ be a subword of $w$ of length at least $n_j$,
    starting at offset $b$. Its cuts are exactly the cuts of $w$ whose following letters lie in $v$.
    Consequently, its complete tokens are a consecutive subsequence of the complete tokens of $w$.
    Our fixed token choices make $U \( v \)$ a literal subword of $U \( w \)$.
    If $a$ is its upper-level offset, the lower-level distance to its first complete token can be computed in two ways:
  #[#set math.equation(numbering: n => "(2.7)")
   $ b + \| p_v \| = \| p_w \| + L_j a . $ <eq:token-offset>]
  Both upper words meet the upper-level threshold. Applying the inductive subword property and then (2.7) yields
  $ sigma_j \( v \) & = L_j #scale(x: 120%, y: 120%)[\(] sigma_(j + 1) \( U \( w \) \) +
    a #scale(x: 120%, y: 120%)[\)] - \| p_v \|\
 & = L_j sigma_(j + 1) \( U \( w \) \) - \| p_w \| + b = sigma_j \( w \) + b med \( mod med L_j L' \) . $
  This completes the backward induction.
  At level zero we now have literal phases modulo $L$, with the subword property for lengths at least $n_0$.
    Only invariance under replacements remains. Choose
  $ N = 2 n_0 + k . $
  Consider one replacement inside a nonzero word of length at least $N$.
    It affects at most $k$ letters, so an unchanged prefix or an unchanged suffix has length at least $n_0$.
    That common subword has the same offset before and after the replacement,
    because the replacement preserves length. Applying the literal subword property to both words shows that their
    phases agree. Every intermediate word in a nonzero replacement class is nonzero.
    Chaining these equalities proves that the start phase is constant on each class.
    Word length is constant on each class as well, so the end phase is also invariant.
    The subword property already proved continues to hold after increasing the threshold from $n_0$ to $N$.
    Finally, every $L_j$ is an odd integer greater than one, so the products $L_0 dots.h.c L_d$ are odd and unbounded. ◻
]

#thm([Corollary 2.4.])[
  #emph[Fix $L \, N \, sigma \, tau$ from Lemma 4. If $u \, v$ are nonzero basis words of lengths at least $N$, then
$ tau \( u \) eq.not sigma \( v \) quad arrow.r.double quad u v = 0 . $

 If $u v eq.not 0$, its phases satisfy $sigma \( u v \) = sigma \( u \)$ and $tau \( u v \) = tau \( v \)$.]
] <cor:phase-products>

#proof[
  If the concatenation is nonzero, apply (2.4) to its prefix $u$ and its suffix $v$.
    This gives $sigma \( u v \) = sigma \( u \)$ and $sigma \( v \) = sigma \( u v \) + \| u \| = tau \( u \)$;
    adding $\| v \|$ gives the end-phase identity. ◻
]

== 3 Steinberg groups and faithful strips <sec:steinberg>

We next introduce the group that records elementary matrix operations before imposing any relations beyond the
  Steinberg relations. Its kernel over matrices is the part that finite degree truncations must detect.
  All algebras in this section are unital associative $bb(F)_2$-algebras.

For such an algebra $B$ and $n gt.eq 3$, the group $"St"_n \( B \)$ has generators $x_(i j) \( a \)$,
  where $a in B$ and $1 lt.eq i \, j lt.eq n$ with $i eq.not j$, and relations

#[#set math.equation(numbering: n => "(3.1)")
 $ x_(i j) \( a \) x_(i j) \( b \) & = x_(i j) \( a + b \) \,\
 & = 1 &  & \( j eq.not l \, med i eq.not t \) \,\
 & = x_(i t) \( a b \) &  & \( i \, j \, t upright(" distinct") \) . $ <eq:root-addition>]

Our convention is $\[ X \, Y \] = X Y X^(- 1) Y^(- 1)$. In particular, $x_(i j) \( 0 \) =
  1$ and each root element has square $1$. The elementary matrix $e_(i j) \( a \)$ is the identity with $a$ added
  in position $\( i \, j \)$. These matrices satisfy (3.1)–(3.1), giving an epimorphism

$ pi_n : "St"_n \( B \) arrow.r "E"_n \( B \) := chevron.l e_(i j) \( a \) : a in B \, med i eq.not j chevron.r . $

Write $J_n \( B \) = ker pi_n$. We use the same presentation with a countable index set to define $"St" \( B \)$,
  and put

$ "E" \( B \) = "inj lim"_n "E"_n \( B \) \, wide J \( B \) =
  ker #scale(x: 120%, y: 120%)[\(] "St" \( B \) arrow.r "E" \( B \) #scale(x: 120%, y: 120%)[\)] . $

Thus $"St" \( B \) = "inj lim"_n "St"_n \( B \)$: each word and each finite derivation uses only finitely many
  indices. This is a direct limit of discrete groups. No completion is involved.
  The fixed-rank injectivity needed for $R$ will be proved separately in Section 7.

The presentation and its relation to algebraic $K$-theory are classical; see [10,19].
  We will use the following elementary consequences repeatedly.
  They also explain when an identity of matrices does imply the corresponding identity in the Steinberg group.

#thm([Lemma 3.1.])[
  (Faithful strips).  #emph[Let $S \, T$ be disjoint finite sets of coordinates.
    The subgroup generated by $x_(i j) \( a \)$ with $i in S$,
    $j in T$ maps isomorphically onto the additive group of matrices supported in $S times
    T$ under $u mapsto pi \( u \) - I$. A word supported on $S$ normalizes this subgroup and acts on its entries
    by left multiplication by its matrix on $S$. On the reverse strip $T times S$,
    its action is right multiplication by the inverse matrix on $S$.]
] <lem:strip>

#proof[
  All roots in $S times T$ commute by (3.1). Root addition collects a word into one factor per coordinate pair.
    The corresponding entry matrices have pairwise zero products,
    so the matrix image reads each collected coefficient directly.
    This proves injectivity and identifies the group law with addition.
  For one root supported on $S$, conjugation on an outgoing strip follows from (3.1):
    it performs the corresponding elementary row addition. The same relations on the reverse strip perform the
    inverse elementary column operation. Iterating over the factors of a word gives the stated left and right
    actions, with their prescribed order over the possibly noncommutative algebra $B$. ◻
]

#thm([Lemma 3.2.])[
  (Stable centrality).  #emph[For every $B$, the group $J \( B \)$ is central in $"St" \( B \)$.]
] <lem:stable-center>

#proof[
  Let $z in J \( B \)$ and choose a finite set $S$ containing the support of a representative of $z$.
    To show that $z$ commutes with a specified root, enlarge $S$ to contain both indices of that root.
    Choose $h in.not S$. By Lemma 6, $z$ acts trivially on the strips $S times { h }$ and ${ h } times S$,
    since its matrix image is the identity. For $i \, j in S$ with $i eq.not j$, the identity
  $ x_(i j) \( a \) = \[ x_(i h) \( a \) \, x_(h j) \( 1 \) \] $
  therefore implies that $z$ commutes with $x_(i j) \( a \)$. These roots generate the group. ◻
]

#thm([Lemma 3.3.])[
  (Coordinate permutations).  #emph[In characteristic two, every permutation of a finite set of coordinates is
    induced on roots by conjugation in the Steinberg group after adjoining an outside coordinate if necessary.
    In particular, relabeling the finitely many coordinates in a representative of $z in
    J \( B \)$ leaves the element $z$ unchanged in $"St" \( B \)$.]
] <lem:permutations>

#proof[
  For a transposition of coordinates $a \, b$, use
  $ p = x_(a b) \( 1 \) x_(b a) \( 1 \) x_(a b) \( 1 \) . $
  On a column strip from ${ a \, b }$ to an outside coordinate,
    its three elementary row additions exchange the two entries over $bb(F)_2$.
    Lemma 6 gives this as an exact group action. The reverse strip is exchanged in the same way.
    Roots with both indices outside ${ a \, b }$ commute with $p$.
    The remaining two root positions can be written, with $c in.not { a \, b }$, as
  $ x_(a b) \( u \) = \[ x_(a c) \( u \) \, x_(c b) \( 1 \) \] \, wide
    x_(b a) \( u \) = \[ x_(b c) \( u \) \, x_(c a) \( 1 \) \] . $
  The strip actions exchange these as well. Products of transpositions give arbitrary finite permutations.
    Any injective relabeling of a finite set extends to a permutation of a larger finite set,
    so the last assertion follows from Lemma 7. ◻
]

This proof of Lemma 8 is the argument of [13] Lemma 6.3; its exact action on roots,
  rather than only on their matrix images, will matter below.

#thm([Lemma 3.4.])[
  (A commutator identity).  #emph[In any group, let $A = \[ X \, Y \]$ and $B' = \[ Y \, Z \]$. If
$ \[ X \, Z \] = \[ A \, X \] = \[ B' \, Z \] = \[ A \, B' \] = 1 \, $

 then $\[ A \, Z \] = \[ X \, B' \]$. This common commutator commutes with $A \, Z \, X \, B'$.]
] <lem:commutator>

#proof[
  The subgroups $H = chevron.l A \, Z chevron.r$ and $K = chevron.l X \,
    B' chevron.r$ commute elementwise by the four hypotheses. Conjugating $\[ X \, Z \] = 1$ by $Y$ gives
  $ \[ A^(- 1) X \, B' Z \] = 1 . $
  Separating the commuting $H$ and $K$ factors yields $\[ A^(- 1) \, Z \] \[ X \, B' \] = 1$.
    Thus $\[ X \, B' \] = \[ A^(- 1) \, Z \]^(- 1)$ lies in $H ∩ K$, which is central in both $H$ and $K$.
    Centrality in $H$ then gives $\[ A \, Z \] = \[ A^(- 1) \, Z \]^(- 1) = \[ X \, B' \]$. ◻
]

Finally, $"St"_n \( B \)$ and $"E"_n \( B \)$ are perfect for $n gt.eq 3$:
  each generating root is the commutator in (3.1) with one coefficient equal to $1$.
  If $B$ is infinite, both groups are infinite, since distinct coefficients at a fixed root position give distinct
  elementary matrices.

== 4 Cyclic shifts and the relative central kernel <sec:shifts>

We now study elements of $J \( R \)$ whose reduction to $"St" \( bb(F)_2 \)$ is trivial.
  The grading lets us evaluate such an element at a finite numerical matrix.
  We shall prove that evaluation at a sufficiently long cyclic shift is trivial,
  and that evaluation at a cyclic shift of $2$-power size is a power of the original element.
  These two identities imply $2$-primary torsion in the relative central kernel.
  Later we will compare the first identity with an odd power.

The matrix substitutions are elementary versions of the graded transfer operations of Weibel [18] Section 1.
  At the level of stable algebraic $K$-theory, the relative torsion conclusion also follows from his continuous
  Witt-vector action [18] Theorem 0.1. We reproduce the concrete Steinberg-group arguments of the companion [13]
  Lemmas 6.4–6.7, since their exact identities, rather than identities of matrix images, are needed here.

=== 4.1 Block roots and triangular evaluation <block-roots-and-triangular-evaluation>

For the next three lemmas, let $B$ be any unital $bb(F)_2$-algebra.
  Fix $n gt.eq 3$ and $b gt.eq 1$, and label $n b$ coordinates by $\( i \, s \)$, where $1 lt.eq i lt.eq
  n$ and $0 lt.eq s < b$. We call $i$ the outer index and $s$ the inner index.
  For $A = \( a_(s t) \) in "Mat"_b \( B \)$ and $i eq.not j$, define the #emph[block root]

$ X_(i j) \( A \) = product_(s \, t = 0)^(b - 1) x_(\( i \, s \) \, \( j \, t \)) \( a_(s t) \) in
  "St"_(n b) \( B \) . $

All factors commute, because their source outer index is $i$ and their target outer index is the different index $j$.

#thm([Lemma 4.1.])[
  (Block roots and coordinate changes).  #emph[The block roots satisfy the Steinberg relations over $"Mat"_b \( B \)$:
$ X_(i j) \( A + A' \) & = X_(i j) \( A \) X_(i j) \( A' \) \,\
 & = 1 &  & upright("if ") j eq.not k upright(" and ") i eq.not l \,\
 & = X_(i k) \( A A' \) &  & upright("if ") i \, j \, k upright(" are distinct") . $

 Consequently they define a homomorphism $"St"_n \( "Mat"_b \( B \) \) arrow.r "St"_(n b) \( B \)$.
   Moreover, for every $P in "GL"_b \( bb(F)_2 \)$ there is an element $q in "St"_(n b) \( B \)$ such that
$ q^(- 1) X_(i j) \( A \) q = X_(i j) \( P^(- 1) A P \) wide \( i eq.not j \) . $

 Its matrix image is the block diagonal matrix with a copy of $P$ in every outer block.]
] <lem:block-laws>

#proof[
  Additivity and the commuting relation follow factor by factor.
    For the consecutive commutator, the only nontrivial elementary commutators are
  $ \[ x_(\( i \, s \) \, \( j \, t \)) \( a_(s t) \) \, x_(\( j \, t \) \, \( k \, v \)) \( a'_(t v) \) \] =
    x_(\( i \, s \) \, \( k \, v \)) \( a_(s t) a'_(t v) \) . $
  Each resulting root commutes with both input blocks. Expanding the commutator and using additivity at each
    position therefore gives the entries $sum_t a_(s t) a'_(t v)$ of $A A'$.
  An elementary operation supported inside outer block $i$ acts on the outgoing strip to block $j$ by the
    corresponding row operation; an operation inside block $j$ acts by the inverse column operation.
    These are exact strip actions by Lemma 6. An operation inside any other outer block centralizes the block
    root. Gaussian elimination over $bb(F)_2$ writes $P$ as a product of elementary matrices:
    every nonzero pivot is $1$, and a row transposition is a product of three row additions.
    Lift those factors inside each outer block. Applying the strip actions successively gives the asserted
    conjugation. For $b = 1$, $P = 1$ and the assertion is immediate. ◻
]

If $v \( t \)$ is a root word over the polynomial algebra $B \[ t \]$, with $t$ central,
  and $T in "Mat"_b \( bb(F)_2 \)$, let $W_v \( T \)$ be its evaluation at $t = T$,
  followed by the block-root homomorphism. The substitution $B \[ t \] arrow.r
  "Mat"_b \( B \)$ is a unital algebra homomorphism: the numerical matrix $T$ commutes with every scalar matrix
  from $B$. In particular, if $v \( t \)$ has identity matrix image over $B \[ t \]$,
  then $W_v \( T \)$ has identity matrix image over $B$. For each inner index $s$, also write

$ iota_s : "St"_n \( B \) arrow.r "St"_(n b) \( B \) \, wide
  x_(i j) \( a \) mapsto x_(\( i \, s \) \, \( j \, s \)) \( a \) . $

These coordinate homomorphisms have commuting images for distinct $s$; we do not assume they are injective.

#thm([Lemma 4.2.])[
  (Triangular evaluation).  #emph[Let $U$ be generated by the roots $x_(\( i \, s \) \, \( j \, t \)) \( a \)$
    with $s < t$, allowing $i = j$. Then $U$ injects into its matrix image and is normalized by every root whose
    inner indices agree. If a root word $v \( t \)$ over $B \[ t \]$ has identity matrix image,
    and $T in "Mat"_b \( bb(F)_2 \)$ is upper triangular with constant diagonal entry $lambda$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ W_v \( T \) = product_(s = 0)^(b - 1) iota_s #scale(x: 120%, y: 120%)[\(] v \( lambda \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:triangular-evaluation>]

]
] <lem:triangular>

#proof[
  The #emph[gap] of a generator of $U$ is $t - s > 0$. Two such roots either commute or have a commutator root
    whose gap is the sum of their gaps, by the consecutive-root relations in the two possible orders.
    They cannot be opposite roots. For $g gt.eq 1$, let $U_g$ be generated by roots of gap at least $g$;
    thus $U_1 = U$ and $U_b = 1$. Conjugating a generator of $U_g$ by a generator of $U$ adds only roots of larger
    gap, so $U_g$ is normal in $U$. Modulo $U_(g + 1)$, the group $U_g$ is generated by the commuting roots of gap $g$.
  It follows, successively for $g = 1 \, dots.h \, b - 1$, that every element of $U$ is an ordered product with
    one factor at each coordinate pair, in increasing gap; repeated coefficients at a given pair are added.
    This is a finite collection process, since there are finitely many coordinate pairs and $U_b = 1$.
    If its matrix image is the identity, the entries of gap one are precisely the corresponding collected
    coefficients, so they vanish. After coefficients of smaller gap have vanished,
    the same assertion holds at gap $g$: any product of two remaining entry matrices has gap greater than $g$.
    Induction makes every coefficient zero and proves faithfulness.
  A root with equal inner indices cannot be opposite to a positive-gap root.
    Its commutator with a positive-gap root is either trivial or has the same positive gap.
    This proves that it normalizes $U$.
  For a polynomial entry $a \( t \)$, the matrix $a \( T \)$ is upper triangular with diagonal entries
    $a \( lambda \)$. Split its block root into its commuting diagonal and strictly upper factors.
    The diagonal factors normalize $U$, so the strictly upper factors in the complete word can be collected on the
    right. Diagonal factors at different inner indices commute, giving
  $ W_v \( T \) = (product_s iota_s \( v \( lambda \) \)) u \, wide u in U . $
  The left side and all the words $v \( lambda \)$ have identity matrix image.
    Hence $u$ has identity matrix image. Faithfulness of $U$ gives $u = 1$ and proves (4.1). ◻
]

=== 4.2 Removing the wrap of a cyclic shift <removing-the-wrap-of-a-cyclic-shift>

Let $C_b$ be the numerical cyclic shift from row $s$ to column $s + 1$ modulo $b$,
  and let $S_b$ be the shift with the same entries except for the entry from row $b - 1$ to column $0$,
  which is removed. Thus $S_b$ is strictly upper triangular.
  The next lemma replaces $C_b$ by $S_b$ without changing the evaluated Steinberg element.
  Its proof confines the difference to a faithful strip between two disjoint bands of inner indices.

#thm([Lemma 4.3.])[
  (Removing the wrap).  #emph[Let $v \( t \)$ be a product of $m gt.eq 1$ root factors over $B \[ t \]$,
    whose polynomial entries have degrees at most $d gt.eq 0$.
    Suppose its matrix image is the identity over $B \[ t \]$. Put $delta = max { 1 \, d }$. If
$ b > 2 \( m + 1 \) delta \, $

 then $W_v \( C_b \) = W_v \( S_b \)$ in $"St"_(n b) \( B \)$.]
] <lem:wrap>

#proof[
  For each factor, split its cyclic evaluation as $D_h F_h$,
    where $D_h$ is its evaluation at $S_b$ and $F_h$ consists of the entries that wrap past inner index $b - 1$.
    The splitting is exact because all roots in one outer rectangle commute.
    Since $d < b$, a term of degree $a lt.eq d$ goes from $s$ to $s + a$ and can wrap only once.
    Every root in $F_h$ therefore has source in ${ b - delta \, dots.h \, b - 1 }$ and target in ${ 0 \, dots.h \,
    delta - 1 }$.
  For $r gt.eq 1$, set
  $ H_r = { b - r delta \, dots.h \, b - 1 } \, wide L_r = { 0 \, dots.h \, r delta - 1 } . $
  When $b > 2 r delta$, the roots from inner indices in $H_r$ to inner indices in $L_r$,
    with arbitrary outer indices, form an abelian strip $V_r$ that injects into matrices by Lemma 6.
    Figure 1 displays these two bands. We shall show that conjugation by one $D_h$ enlarges their widths by at
    most $delta$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.9, 0.52), fill: rgb("#ececec"), stroke: none)
  rect((7.6, 0), (9.5, 0.52), fill: rgb("#d9d9d9"), stroke: none)
  rect((0, 0), (9.5, 0.52), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.9, 0), (1.9, 0.52), (7.6, 0), (7.6, 0.52), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.95, 0.26), [$L_r$])
  content((8.55, 0.26), [$H_r$])
  line((8.55, 0.68), (8.55, 1.12), (0.95, 1.12), (0.95, 0.68), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.75, 1.416), [correction roots])
  content((0, 0), [$0$], anchor: "north", padding: 0.1176cm)
  content((1.9, 0), [$r delta -1$], anchor: "north", padding: 0.1176cm)
  content((7.6, 0), [$b-r delta$], anchor: "north", padding: 0.1176cm)
  content((9.5, 0), [$b-1$], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: The correction strip $V_r$ goes from the right band $H_r$ to the left band $L_r$; each band includes every outer index. The proof shows that one truncated block factor moves each endpoint by at most $delta$. The bound $b > 2 \( m + 1 \) delta$ keeps the enlarged bands disjoint throughout the collection. ],
  ) <fig:wrap-strip>
  More precisely, for $r lt.eq m$ we claim that
  #[#set math.equation(numbering: n => "(4.2)")
   $ D_h^(- 1) V_r D_h subset.eq V_(r + 1) . $ <eq:strip-enlargement>]
  Fix a root of $V_r$. The constituents of $D_h$ all have the same outer source $i$ and outer target $j eq.not i$,
    and inner displacements between $0$ and $d$. They commute with one another.
    A constituent that commutes with the initial root also commutes with every conjugate of it by the other
    constituents, and so can be omitted from this conjugation.
  An interacting constituent changes the source endpoint only when its target is the old source;
    the new source is at most $d$ positions to the left. It changes the target endpoint only when its source is
    the old target; the new target is at most $d$ positions to the right.
    These statements follow directly from the consecutive-root relations, including their reverse order.
    An opposite-root interaction cannot occur. Initially the source inner index minus the target inner index is
    greater than $b - 2 r delta$. After one endpoint has moved, the difference is still greater than
  $ b - \( 2 r + 1 \) delta > delta gt.eq d . $
  Thus no constituent, whose forward displacement is at most $d$,
    can be opposite to either the initial root or a root obtained after one endpoint move.
  Nor can displacements accumulate repeatedly at one endpoint during this conjugation.
    A changed source has outer index $i$, whereas every constituent has target outer index $j eq.not i$;
    the source cannot change again. A changed target has outer index $j$,
    whereas every constituent has source outer index $i$; the target cannot change again.
    Both endpoints may change, but each changes at most once.
    A root with both endpoints changed has outer indices $i \, j$ and commutes with every constituent.
    All roots produced lie in $V_(r + 1)$, proving (4.2). This reasoning applies to a product of strip roots as well.
  It remains to collect the corrections without conjugating them by one another.
    Put $D_(> h) = D_(h + 1) dots.h.c D_m$ and $D_(> m) = 1$. The exact group identity
  $ product_(h = 1)^m \( D_h F_h \) = \( D_1 dots.h.c D_m \) product_(h = 1)^m \( D_(> h)^(- 1) F_h D_(> h) \) \, $
  where the final product is in increasing order of $h$, does this.
    Every $F_h$ starts in $V_1$, and every suffix has at most $m$ factors.
    By (4.2), all final corrections belong to $V_(m + 1)$. Therefore
  $ W_v \( C_b \) = W_v \( S_b \) u \, wide u in V_(m + 1) . $
  Both evaluated words have identity matrix image. The same is true of $u$,
    and the disjointness of $H_(m + 1)$ and $L_(m + 1)$ makes $V_(m + 1)$ faithful. Hence $u = 1$. ◻
]

=== 4.3 Graded evaluation and powers of central elements <graded-evaluation-and-powers-of-central-elements>

Return to the graded algebra $R = xor.big_(a gt.eq 0) R_a$ with $R_0 = bb(F)_2$. The map

$ gamma : R arrow.r R \[ t \] \, wide sum_a r_a mapsto sum_a r_a t^a quad \( r_a in R_a \) $

is a unital algebra homomorphism. Applying it to a root word representing $z in
  J \( R \)$ gives a word $z \( t \)$ with identity matrix image over $R \[ t \]$.
  Its evaluations at $1$ and $0$ are $z$ and the degree-zero reduction of $z$, respectively.

For $T in "Mat"_b \( bb(F)_2 \)$, fix an injection from the pairs $\( i \, s \)$,
  where $i$ ranges over the stable index set and $0 lt.eq s < b$, into the stable index set.
  Define $W_z \( T \)$ by applying the graded substitution and evaluating by block roots in those coordinates.
  This is a homomorphism on $"St" \( R \)$ by Lemma 10, so $W_z \( T \)$ depends only on $z$.
  The element $W_z \( T \)$ belongs to $J \( R \)$. All words and their block evaluations use finitely many
  coordinates; choosing a different injection gives the same element by centrality and Lemma 8.

#thm([Lemma 4.4.])[
  (Vanishing at long cyclic shifts).  #emph[If $z in J \( R \)$ maps to $1$ in $"St" \( bb(F)_2 \)$, then
$ W_z \( C_b \) = 1 wide upright("for every sufficiently large integer ") b . $

 More precisely, if the graded word $z \( t \)$ has $m gt.eq 1$ factors of degrees at most $d$,
   it suffices that $b > 2 \( m + 1 \) max { 1 \, d }$.]
] <lem:cyclic-vanishing>

#proof[
  Choose one finite root word for $z$, and apply Lemma 12 to its graded word.
    Since $S_b$ is strictly upper triangular, Lemma 11 gives, in the stable group,
  $ W_z \( C_b \) = W_z \( S_b \) = product_(s = 0)^(b - 1) iota_s \( z \( 0 \) \) = 1 . $
  The fixed injection extends each $iota_s$ to a homomorphism on the stable group.
    Since $z \( 0 \)$ is trivial there by hypothesis, every displayed coordinate image is trivial.
    The empty word satisfies the conclusion for all $b$. ◻
]

#thm([Proposition 4.5.])[
  (Relative $2$-primary torsion).  #emph[Every element of
$ J \( R \) ∩ ker #scale(x: 120%, y: 120%)[\(] "St" \( R \) arrow.r "St" \( bb(F)_2 \) #scale(x: 120%, y: 120%)[\)] $

 has finite $2$-power order.]
] <prop:relative-torsion>

#proof[
  Let $z$ be such an element. If $b$ is a power of two, then $C_b^b =
    I$ and characteristic two gives $\( C_b - I \)^b = 0$. A basis adapted to the successive kernels of the
    nilpotent map $C_b - I$ makes $C_b$ upper triangular with all diagonal entries $1$.
    Thus some $P in "GL"_b \( bb(F)_2 \)$ has this effect. By Lemma 10,
    conjugation by a Steinberg lift of the repeated basis change takes $W_z \( C_b \)$ to
    $W_z \( P^(- 1) C_b P \)$. Centrality of $J \( R \)$ makes these elements equal. Lemma 11 then gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ W_z \( C_b \) = product_(s = 0)^(b - 1) iota_s \( z \) = z^b . $ <eq:cyclic-two-power>]
  The last equality uses Lemma 8: every coordinate image of the central element $z$ equals $z$ in the stable
    group. Choose a power of two $b$ large enough for Lemma 13. Then $z^b = 1$. ◻
]

Only the positive grading and the degree-zero field were used in this section.
  To detect central elements by finite degree truncations, we next use the additional phase structure of the
  specific algebra $R$. It will yield an odd-power counterpart of (4.3).

== 5 Commutators of long entries <sec:long-entries>

The phase property will let us distribute a long word among several coordinate blocks.
  To do this inside the Steinberg group, we must control the extra factors produced by moving its roots.
  The main point of this section is that these factors lie in an abelian subgroup on which the matrix map is
  injective. Opposite roots require particular care: their commutation cannot be inferred just from their matrix images.

Fix an odd integer $L$ and a threshold $N gt.eq 1$ from Lemma 4.
  Let $k$ bound the lengths of the defining word rules, and fix

#[#set math.equation(numbering: n => "(5.1)")
 $ M gt.eq 2 N + k + 1 . $ <eq:long-threshold>]

All groups in this section are stable groups over $R$. We identify a nonzero word class with its basis element in
  $R$, and write $\| w \|$ for its length. Write $E_(i j)$ for the matrix unit in position $\( i \, j \)$.
  Phases always take values in $bb(Z) \/ L$.

=== 5.1 Opposite roots and movement of a cut <opposite-roots-and-movement-of-a-cut>

#thm([Lemma 5.1.])[
  #emph[Suppose $a \, c in R$ satisfy $c a = 0$. For distinct indices $i \, h \, j$ and every $b in R$,
#[#set math.equation(numbering: n => "(5.2)")
 $ \[ x_(i j) \( a b \) \, x_(j i) \( c \) \] = \[ x_(i h) \( a \) \, x_(h i) \( b c \) \] . $ <eq:cut-movement>]

 In particular, $\[ x_(i j) \( a \) \, x_(j i) \( c \) \]$ is independent of $j eq.not i$.
   It commutes with both defining roots, has square $1$, and has matrix image $I + a c E_(i i)$.]
] <lem:opposite>

#proof[
  Apply Lemma 9 to
  $ X = x_(i h) \( a \) \, wide Y = x_(h j) \( b \) \, wide Z = x_(j i) \( c \) . $
  Then $A = \[ X \, Y \] = x_(i j) \( a b \)$ and $B' = \[ Y \, Z \] = x_(h i) \( b c \)$.
    The Steinberg relations give $\[ A \, X \] = \[ B' \, Z \] = 1$.
    They also give $\[ X \, Z \] = 1$ because $c a = 0$, and $\[ A \, B' \] = 1$ because $\( b c \) \( a b \) =
    b \( c a \) b = 0$. This proves (5.2).
  Taking $b = 1$ proves independence of the auxiliary index.
    Express the commutator using an index $h$ different from $i \, j$.
    Each of its two factors then commutes with $x_(i j) \( a \)$ and with $x_(j i) \( c \)$:
    the only potential nonzero consecutive-root coefficient is $c a$.
    Thus the commutator commutes with both defining roots. Since each root has square $1$,
    expanding $\[ x_(i j) \( a \)^2 \, x_(j i) \( c \) \]$ shows that its square is $1$.
    Finally, multiplication of the four elementary matrices, using $c a = 0$, gives $I + a c E_(i i)$. ◻
]

#thm([Lemma 5.2.])[
  #emph[For each coordinate $i$ and every nonzero word class $w$ satisfying $\| w \| gt.eq
    M$ and $sigma \( w \) eq.not tau \( w \)$, there is an element $H_i \( w \) in
    "St" \( R \)$ with the following property. If $p \, q$ are nonzero words with
$ \| p \| \, \| q \| gt.eq N \, wide \| p \| + \| q \| gt.eq M \, wide sigma \( p \) eq.not tau \( q \) \, $

 then, for every $j eq.not i$,
#[#set math.equation(numbering: n => "(5.3)")
 $ \[ x_(i j) \( p \) \, x_(j i) \( q \) \] =
   cases(delim: "{", H_i \( w \) \, & p q upright(" represents the nonzero class ") w \,, 1 \, & p q = 0
   upright(" in ") R .) $ <eq:long-opposite>]

 The element $H_i \( w \)$ has square $1$ and matrix image $I + w E_(i i)$.]
] <lem:long-commutator>

#proof[
  The phase mismatch gives $q p = 0$, so Lemma 15 applies. We first show that the commutator does not change when
    the cut between $p$ and $q$ moves, provided both new parts still have length at least $N$.
  For a move to the right, write the original word as $a b c$, with $a = p$ and $b c = q$, and with $\| c \| gt.eq
    N$. The word $c$ is nonzero and has $tau \( c \) = tau \( q \)$.
    Hence $c a = 0$, and (5.2), together with auxiliary-index independence,
    identifies the commutators for the cuts $a divides b c$ and $a b divides c$.
    This equality remains valid if $a b = 0$, in which case the commutator is $1$.
    Otherwise $sigma \( a b \) = sigma \( a \)$, so the new cut retains the mismatch.
    For a move to the left, write $p = a b$ and $q = c$ with $\| a \| gt.eq N$.
    Now $a$ is nonzero with $sigma \( a \) = sigma \( p \)$, so $c a = 0$ again,
    and the same identity compares $a b divides c$ with $a divides b c$.
    If the new suffix is zero we again obtain $1$; otherwise its end phase is unchanged.
    This proves invariance under every allowed movement of the cut.
    If a part becomes zero, the equalities already obtained show that the original commutator was $1$,
    and the argument can stop.
  Next consider a single defining replacement inside a word of length $n gt.eq M$.
    The allowed cut positions are the integers in $\[ N \, n - N \]$.
    A rule of length at most $k$ can straddle at most $k - 1$ of these positions,
    whereas (5.1) supplies more than $k$ allowed positions. We can therefore move the cut so that the entire
    replacement lies in one part. That part has the same value in $R$ before and after the replacement.
    If it is nonzero, its phases are unchanged because phases depend only on the word class.
    The other part is unchanged. The commutator consequently survives the replacement with the same value and
    mismatch, unless a zero part has already proved the original commutator to be $1$.
  If the concatenation is nonzero, every part of every equivalent word is nonzero.
    Cut movement and the preceding replacement argument show that the commutator depends only on the class of the
    concatenation. Conversely, a nonzero class $w$ as in the statement can be cut into two parts of lengths at
    least $N$. The subword assertion of Lemma 4 makes their start and end phases $sigma \( w \)$ and
    $tau \( w \)$, respectively. Define $H_i \( w \)$ by any such cut.
    The independence just proved makes this definition unambiguous.
  If the concatenation represents zero, the criterion (2.3) gives a sequence of replacements ending at a word that
    contains a zero-declared subword. Follow this sequence with the commutator.
    Either a part has already become zero, or the cut can be moved once more to put the final zero-declared
    subword wholly in one part. That part is zero in $R$, and the commutator is $1$.
    This proves the zero case as well. The order and matrix-image assertions now follow from Lemma 15. ◻
]

=== 5.2 A subgroup detected by its matrix entries <a-subgroup-detected-by-its-matrix-entries>

Let $S$ be a finite set of coordinates, with a phase $P \( i \) in bb(Z) \/ L$ assigned to each $i in S$.
  An entry $w$ from $i$ to $j$ will be called #emph[consistent] if it is a nonzero word class of length at least $M$ and

$ sigma \( w \) = P \( i \) \, wide tau \( w \) = P \( j \) . $

We call it a #emph[wrong-row entry] if instead

#[#set math.equation(numbering: n => "(5.4)")
 $ \| w \| gt.eq M \, wide sigma \( w \) eq.not P \( i \) \, wide tau \( w \) = P \( j \) . $ <eq:wrong-row>]

For $i eq.not j$, a wrong-row entry defines the root $x_(i j) \( w \)$.
  For $i = j$, it defines $H_i \( w \)$ by Lemma 16. Let $U \( S \, P \)$ be the subgroup generated by all these
  elements.

#thm([Lemma 5.3.])[
  #emph[The subgroup $U \( S \, P \)$ is abelian of exponent at most $2$, and the matrix map is injective on it.
    Every root with a consistent entry normalizes $U \( S \, P \)$.]
] <lem:wrong-row>

#proof[
  Write $U = U \( S \, P \)$. First consider an off-diagonal generator $x_(i j) \( a \)$ of $U$ and an
    off-diagonal root $x_(e f) \( b \)$ whose entry is either wrong-row or consistent.
    If $j = e$ and $i eq.not f$, their commutator is $x_(i f) \( a b \)$.
    The product is zero when $b$ is wrong-row, since $tau \( a \) = P \( j \) eq.not sigma \( b \)$.
    When $b$ is consistent and $a b eq.not 0$, the product inherits $sigma \( a \)$ and $tau \( b \)$,
    so it is a wrong-row entry from $i$ to $f$. If $i = f$ and $j eq.not e$, the reverse product $b a$ is zero,
    because $tau \( b \) = P \( i \) eq.not sigma \( a \)$, and the roots commute.
  If the two positions are opposite, so that $e = j$ and $f = i$,
    the same mismatch $sigma \( a \) eq.not tau \( b \)$ allows us to use (5.3).
    The commutator is $H_i \( a b \)$ when $a b eq.not 0$, and is $1$ when $a b = 0$.
    In the first case $a b$ is a wrong-row entry from $i$ to itself.
    In particular the commutator is $1$ whenever $b$ is wrong-row.
    All remaining pairs of positions commute by the defining Steinberg relations.
    This proves both the required commutations between off-diagonal generators of $U$ and their required behavior
    under consistent roots.
  Now take a diagonal generator $H_i \( w \)$. Represent it as a commutator through an auxiliary coordinate $h
    in.not S$. To compare it with a root $x_(e f) \( b \)$ on $S$, choose $h$ outside its indices as well.
    If neither index is $i$, the supports are disjoint and the elements commute.
    If one index is $i$, the root lies in a strip between ${ i \, h }$ and its complement.
    By Lemma 6, conjugation by $H_i \( w \)$ acts on that strip by its matrix $I + w E_(i i)$.
    This matrix is its own inverse, since $w^2 = 0$ by the phase mismatch.
    Consequently, for $f eq.not i$ and $e eq.not i$,
  $ H_i \( w \) x_(i f) \( b \) H_i \( w \)^(- 1) & = x_(i f) \( b + w b \) \,\
H_i \( w \) x_(e i) \( b \) H_i \( w \)^(- 1) & = x_(e i) \( b + b w \) . $
  The incoming product $b w$ is always zero, because $tau \( b \) = P \( i \) eq.not sigma \( w \)$.
    The outgoing product $w b$ is zero when $b$ is wrong-row; when $b$ is consistent and $w b eq.not 0$,
    it is a wrong-row entry from $i$ to $f$. These formulas prove that diagonal generators commute with
    off-diagonal generators of $U$, and that their commutators with consistent roots belong to $U$.
  Two diagonal generators at different coordinates can be represented using disjoint pairs of coordinates,
    and hence commute. For two at the same coordinate $i$, write the second as
  $ H_i \( w' \) = \[ x_(i t) \( a \) \, x_(t i) \( c \) \] \, wide a c = w' \, quad \| a \| \, \| c \| gt.eq N \, $
  using $t$ distinct from the auxiliary coordinate for the first.
    Here $sigma \( a \) = sigma \( w' \) eq.not P \( i \)$ and $tau \( c \) = tau \( w' \) = P \( i \)$.
    The phase rule therefore gives $w a = 0$ and $c w = 0$. Applying the same strip action to the two displayed
    factors shows that $H_i \( w \)$ fixes both, and thus commutes with $H_i \( w' \)$.
    The use of parts of length at least $N$ is sufficient for these two applications of the phase rule.
  We have proved that all generators of $U$ commute. They have square $1$ by root addition and Lemma 16.
    Their matrix images are $I + w E_(i j)$, indexed by positions and nonzero word classes satisfying (5.4).
    Any two added matrices multiply to zero: a potentially nonzero product requires matching positions,
    and then the end phase of the first entry is the designated row phase of the second,
    which differs from its start phase. Thus a product of distinct generators has matrix image
  $ I + sum_(\( i \, j \, w \)) w E_(i j) . $
  The word classes form a basis of $R$, so this is the identity only when the sum is empty.
    This proves injectivity on $U$. Finally, the commutator calculations show that conjugation by any consistent
    root sends every generator of $U$ into $U$. Such a root is its own inverse, so it normalizes $U$. ◻
]

== 6 Detection by degree truncations <sec:detection>

We now show that degree truncations detect every element of $"St" \( R \)$.
  The central kernel is the essential case. For a representative whose entries are sufficiently long,
  phases turn cyclic-shift evaluation into an odd power of the original element.
  For an element invisible in all truncations, Lemma 13 makes the same evaluation trivial.
  Its already established $2$-power order then forces the element itself to be trivial.

Keep $L \, N \, M$ as in Section 5. For a root word with entries of lengths at least $M$,
  the following lemma puts the start and end phases directly into the coordinate labels.

#thm([Lemma 6.1.])[
  (Relocation by phases).  #emph[Suppose $z in J \( R \)$ is represented by a finite word
#[#set math.equation(numbering: n => "(6.1)")
 $ z = product_(nu = 1)^m x_(i_nu j_nu) \( w_nu \) \, wide \| w_nu \| gt.eq M \, $ <eq:high-word>]

 where every $w_nu$ is a nonzero word class. Label new coordinates by $\( i \, s \)$, with $s in bb(Z) \/ L$.
   In the stable group,
#[#set math.equation(numbering: n => "(6.2)")
 $ z = product_(nu = 1)^m x_(\( i_nu \, sigma \( w_nu \) \) \, \( j_nu \, tau \( w_nu \) \)) \( w_nu \) .
   $ <eq:relocation>]

]
] <lem:relocation>

#proof[
  The empty word presents no issue, so assume $m gt.eq 1$, and let $S$ contain the finitely many original indices
    and at least three coordinates. Put $A = bb(F)_2 xor R_(gt.eq M) subset.eq R$.
    We shall compare several evaluations of the word (6.1). Choose numerical columns $u_s in
    bb(F)_2^L$ and rows $v_s in \( bb(F)_2^L \)^(*)$ such that $v_s u_s = 1$ for every $s in bb(Z) \/ L$.
    On the word basis of the tail, set
  #[#set math.equation(numbering: n => "(6.3)")
   $ rho \( w \) = u_(sigma \( w \)) v_(tau \( w \)) thin w \, wide rho \( 1 \) = I_L \, $ <eq:phase-rank-one>]
  and extend linearly to $A$. This is a unital algebra homomorphism $A arrow.r "Mat"_L \( R \)$.
    Indeed, a nonzero product $w w'$ has matching middle phases and inherits the outside phases, so
  $ rho \( w \) rho \( w' \) = u_(sigma \( w \)) #scale(x: 120%, y: 120%)[\(] v_(tau \( w \)) u_(sigma \( w' \))
    #scale(x: 120%, y: 120%)[\)] v_(tau \( w' \)) w w' = rho \( w w' \) . $
  If $w w' = 0$, the product of the two entry matrices is zero as well,
    regardless of the middle numerical pairing. Scalar products are immediate.
  Applying $rho$ to the entries in (6.1), and then using the block roots of Lemma 10,
    produces an element of $J \( R \)$. To justify this assertion,
    the original matrix word is the identity already over the subalgebra $A$,
    since all its entries belong to $A$ and $A arrow.r.hook R$ is injective.
    Its image under $rho$ is therefore the identity matrix. This uses only the matrix identity;
    no injectivity assertion about $"St" \( A \) arrow.r "St" \( R \)$ is needed.
  Write $upright(bold(e))_s$ for the standard numerical columns and $upright(bold(e))_s^(*)$ for their rows.
    Start with $u_s = upright(bold(e))_0$ and $v_s = upright(bold(e))_0^(*)$ for every $s$.
    The evaluated word is $z$ supported on the coordinates $\( i \, 0 \)$,
    which is the same stable element by Lemma 8 and centrality. We change this evaluation in three steps.
  #emph[Add entries in unused columns.] Keep all $u_s = upright(bold(e))_0$, and change the rows to
  $ v_0 = upright(bold(e))_0^(*) \, wide v_t = upright(bold(e))_0^(*) + upright(bold(e))_t^(*) quad \( t eq.not 0 \) . $
  Every pairing $v_t u_s$ is still $1$. Each block root acquires at most one additional factor,
    going from a coordinate $\( i \, 0 \)$ to an unused coordinate $\( j \, t \)$ with $t eq.not 0$.
    These factors belong to the strip from $S times { 0 }$ to $S times \( bb(Z) \/ L \\ { 0 } \)$.
    The original factors, supported on $S times { 0 }$, normalize this strip by Lemma 6.
    We can therefore collect the additional factors into a single strip element.
    Both the old and new evaluated words have identity matrix image,
    so that strip element has identity matrix image. Strip injectivity makes it trivial.
    The new evaluation is still $z$.
  #emph[Change the numerical basis.] The rows $v_t$ just defined form a basis.
    Let $Q$ be the numerical matrix with these rows, so that $v_t Q^(- 1) = upright(bold(e))_t^(*)$.
    Also $Q upright(bold(e))_0 = sum_s upright(bold(e))_s$, because $v_t upright(bold(e))_0 = 1$ for every $t$.
    Conjugating all entry matrices by $Q$ therefore changes the columns and rows to
  $ u_s = sum_(r in bb(Z) \/ L) upright(bold(e))_r quad upright("for every ") s \, wide v_t = upright(bold(e))_t^(*) . $
  Apply the exact block-conjugation assertion of Lemma 10 with $P = Q^(- 1)$.
    This simultaneous basis change is induced by conjugation in $"St" \( R \)$.
    The evaluated word belongs to the central kernel, so it remains $z$.
  #emph[Remove the factors in the wrong rows.] Give coordinate $\( i \, s \)$ the designated phase
    $P \( \( i \, s \) \) = s$. A block root with entry $w$ now factors as
  $ product_(r in bb(Z) \/ L) x_(\( i \, r \) \, \( j \, tau \( w \) \)) \( w \) . $
  Its factors commute. The factor with $r = sigma \( w \)$ is the root in (6.2);
    all the other factors are wrong-row generators of $U \( S times bb(Z) \/ L \, P \)$.
    Lemma 17 says that the retained, consistent roots normalize this subgroup.
    Collecting the other factors expresses the evaluated word as the right side of (6.2) times an element $u in
    U \( S times bb(Z) \/ L \, P \)$. The retained word itself has identity matrix image:
    apply (6.3) with $u_s = upright(bold(e))_s$ and $v_t = upright(bold(e))_t^(*)$.
    Hence $u$ has identity matrix image. Injectivity on the wrong-row subgroup gives $u = 1$, proving (6.2). ◻
]

#thm([Proposition 6.2.])[
  #emph[Under the hypotheses of Lemma 18,
#[#set math.equation(numbering: n => "(6.4)")
 $ W_z \( C_L \) = z^L . $ <eq:odd-power>]

]
] <prop:odd-power>

#proof[
  For a homogeneous word $w$ of degree $d = \| w \|$, the cyclic-shift evaluation of $x_(i j) \( w \)$ is the
    block root with entry $w C_L^d$. Since $tau \( w \) - sigma \( w \) = d$ in $bb(Z) \/ L$, its factors are
  #[#set math.equation(numbering: n => "(6.5)")
   $ x_(\( i \, sigma \( w \) + a \) \, \( j \, tau \( w \) + a \)) \( w \) \, wide
     a in bb(Z) \/ L . $ <eq:offset-factors>]
  We claim that any two such factors arising from different offsets $a eq.not a'$ commute,
    even when they come from different roots of the original word.
  Write their entries as $w \, w'$. A match between the column coordinate of the first factor and the row
    coordinate of the second requires $tau \( w \) + a = sigma \( w' \) + a'$.
    Since $a eq.not a'$, this implies $tau \( w \) eq.not sigma \( w' \)$, and hence $w w' = 0$.
    A match in the reverse direction similarly implies $w' w = 0$.
    Thus the Steinberg relations prove the claim unless the two roots are opposite.
    In that case both products vanish, and the reverse match also gives $sigma \( w \) eq.not tau \( w' \)$.
    Lemma 16, whose length hypotheses hold because $\| w \| \, \| w' \| gt.eq M gt.eq N$,
    then gives $\[ x_(u v) \( w \) \, x_(v u) \( w' \) \] = 1$. This proves the claim in every case.
  We may consequently collect the product by offsets, preserving within each offset the order of the original
    word. The offset-zero word is precisely the relocated word of Lemma 18,
    and every other offset word is its coordinate permutation. They all give $z$, since $z in J \( R \)$.
    There are $L$ offsets, proving (6.4). ◻
]

It remains to obtain a long-entry representative from triviality in a degree truncation.
  Stable coordinates make this possible: a spare coordinate separates the two factors of a long word while it is
  being conjugated.

#thm([Lemma 6.3.])[
  #emph[For every integer $M gt.eq 1$, each element of
$ ker #scale(x: 120%, y: 120%)[\(] "St" \( R \) arrow.r "St" \( R \/ R_(gt.eq 2 M) \) #scale(x: 120%, y: 120%)[\)] $

 can be represented by a finite product of roots whose entries are nonzero word classes of lengths at least $M$.]
] <lem:high-entries>

#proof[
  For any two-sided ideal $K$ of a unital ring, the Steinberg presentation shows that the kernel of $"St" \( R \)
    arrow.r "St" \( R \/ K \)$ is the normal closure of the roots $x_(i j) \( a \)$ with $a in K$.
    Indeed, after these roots are killed, root addition makes $x_(i j) \( a \)$ depend only on the class of $a$
    modulo $K$, and the remaining relations are exactly the Steinberg relations over $R \/ K$.
    For $K = R_(gt.eq 2 M)$, root addition expands every such entry in the homogeneous word basis.
    It is therefore enough to handle a conjugate $g x_(i j) \( w \) g^(- 1)$ with $\| w \| gt.eq 2 M$.
  Choose a representative word $w = a b$ with $\| a \| \, \| b \| gt.eq M$.
    Both parts are nonzero because $w$ is nonzero. Let $S$ contain $i \,
    j$ and every coordinate used by a fixed root word for $g$, and choose $h in.not S$.
    The consecutive-root relation gives
  $ g x_(i j) \( w \) g^(- 1) = \[ g x_(i h) \( a \) g^(- 1) \, thin g x_(h j) \( b \) g^(- 1) \] . $
  The two conjugated factors lie respectively in the strips from $S$ to ${ h }$ and from ${ h }$ to $S$.
    More explicitly, write $A_g = pi \( g \) \|_S$. By Lemma 6,
  $ g x_(i h) \( a \) g^(- 1) & = product_(r in S) x_(r h) #scale(x: 120%, y: 120%)[\(] \( A_g \)_(r i) a
    #scale(x: 120%, y: 120%)[\)] \,\
g x_(h j) \( b \) g^(- 1) & = product_(s in S) x_(h s) #scale(x: 120%, y: 120%)[\(] b \( A_g^(- 1) \)_(j s)
  #scale(x: 120%, y: 120%)[\)] . $
  Since $R_(gt.eq M)$ is a two-sided ideal, every displayed entry still belongs to $R_(gt.eq M)$.
    Expand the two strip elements into roots, expand each entry in the word basis,
    and then expand their commutator. All resulting root entries have length at least $M$.
    Doing this for the finitely many conjugates in a normal-closure expression proves the lemma. ◻
]

#thm([Theorem 6.4.])[
  #emph[Degree truncations detect the stable Steinberg group:
#[#set math.equation(numbering: n => "(6.6)")
 $ ⋂_(d gt.eq 1) ker #scale(x: 120%, y: 120%)[\(] "St" \( R \) arrow.r
   "St" \( R \/ R_(gt.eq d) \) #scale(x: 120%, y: 120%)[\)] = 1 . $ <eq:stable-detection>]

]
] <thm:detection>

#proof[
  Let $z$ lie in the displayed intersection. Its matrix image becomes the identity modulo every $R_(gt.eq d)$.
    The grading has $⋂_d R_(gt.eq d) = 0$, so its matrix image is the identity over $R$ and $z in J \( R \)$.
    Taking $d = 1$ also shows that $z$ maps to $1$ in $"St" \( bb(F)_2 \)$.
  By Lemma 13, $W_z \( C_b \) = 1$ for every sufficiently large integer $b$.
    Choose an odd phase modulus $L$ from Lemma 4 beyond this threshold.
    This choice uses a fixed representative of $z$ and precedes every choice of a long-entry representative.
    Now choose its phase threshold $N$ and an integer $M gt.eq 2 N + k + 1$.
  The element $z$ is trivial in the truncation at degree $2 M$.
    Lemma 20 supplies a representative with nonzero word entries of lengths at least $M$.
    Applying Proposition 19 to this representative yields
  $ z^L = W_z \( C_L \) = 1 . $
  On the other hand, Proposition 14 gives $z^(2^a) = 1$ for some $a gt.eq 0$,
    since $z in J \( R \)$ has trivial reduction to $"St" \( bb(F)_2 \)$. The integers $L$ and $2^a$ are coprime.
    Thus $z = 1$. ◻
]

== 7 Integral stability in a fixed number of coordinates <sec:stability>

The detection argument used additional coordinates in the stable Steinberg group.
  To apply Theorem 21 to a finitely presented group, we must now show that adjoining these coordinates does not
  kill an element already in a fixed rank. We prove that rank twelve suffices.
  All homology in this section has integral coefficients.

Throughout this Section, let $B = bb(F)_2 xor I_B$ be a unital associative algebra,
  with $I_B$ a two-sided ideal such that every finite square matrix over $I_B$ is nilpotent.
  No grading or finite generation assumption is needed. We often suppress $B$ from the notation for its matrix and
  Steinberg groups.

#thm([Proposition 7.1.])[
  (Finite-rank inputs).  #emph[For such an algebra $B$, the following statements hold.]
  + #emph[Every tuple of columns of $B^m$ with linearly independent reductions in $bb(F)_2^m$ extends to an
    invertible matrix.]
  + #emph[The kernel $J_r \( B \)$ is central in $"St"_r \( B \)$ for $r gt.eq 6$.]
  + #emph[For $r gt.eq 5$, the group $"E"_r \( B \)$ is normal in $"GL"_r \( B \)$, and the natural maps
$ "GL"_r \( B \) \/ "E"_r \( B \) arrow.r "GL"_(r + 1) \( B \) \/ "E"_(r + 1) \( B \) $

 are isomorphisms.]
] <prop:finite-rank-input>

These are, respectively, Lemma 5.1, Proposition 5.4, and Lemma 5.5 of the companion paper [13].
  They have exactly the hypotheses stated above. The integral conclusion we need is the following.

#thm([Theorem 7.2.])[
  #emph[Let $B = bb(F)_2 xor I_B$ satisfy the hypotheses of Proposition 22.
    For every $n gt.eq 12$, the standard stabilization map $J_n \( B \) arrow.r
    J_(n + 1) \( B \)$ is an isomorphism, and the natural homomorphism
$ "St"_n \( B \) arrow.r "St" \( B \) $

 is injective.]
] <thm:stability>

The ring $B$ is local: its elements outside $I_B$ are units, whereas its elements in $I_B$ are nilpotent.
  Thus the injectivity conclusion also follows, with a better rank bound,
  from the classical stability theorem of Suslin and Tulenbaev [16] Theorem 4.1.
  We include a direct proof to make the integral homology comparison and its natural maps explicit.
  It compares successive ranks by the action on ordered frames,
  following the classical method of homological stability for linear groups; see van der Kallen [17].
  Two details matter here: we use ordered frames with integral chains,
  and identify the second homology of their stabilizers by universal central extensions.
  We give both arguments explicitly.

=== 7.1 Central extensions of frame stabilizers <central-extensions-of-frame-stabilizers>

A group is #emph[perfect] if it equals its commutator subgroup.
  A #emph[universal central extension] of a perfect group $H$ is a central extension $tilde(H) arrow.r
  H$ admitting a unique homomorphism over $H$ to every central extension of $H$.
  Its kernel is naturally $H_2 \( H \; bb(Z) \)$; this identification is natural for homomorphisms lifted between
  universal central extensions. We use this standard connection between Steinberg groups and second homology in
  its integral form; see [19] Theorems III.5.4 and III.5.5.

For $r gt.eq 6$ and $l gt.eq 0$, put

#[#set math.equation(numbering: n => "(7.1)")
 $ S_(r \, l) = {mat(delim: "(", A, 0; C, I_l) : A in "E"_r \( B \) \, med
   C in "Mat"_(l times r) \( B \)} . $ <eq:frame-stabilizer>]

This is the semidirect product of its additive lower-left strip with $"E"_r \( B \)$.
  Replace $"E"_r \( B \)$ in this semidirect product by $"St"_r \( B \)$, acting through its matrix image,
  and denote the resulting group by $tilde(S)_(r \, l)$. There is a natural surjection $tilde(S)_(r \, l) arrow.r
  S_(r \, l)$ with kernel $J_r \( B \)$.

#thm([Lemma 7.3.])[
  #emph[The map $tilde(S)_(r \, l) arrow.r S_(r \, l)$ is a universal central extension.
    Consequently the inclusion of the complementary block induces a natural isomorphism
#[#set math.equation(numbering: n => "(7.2)")
 $ H_2 \( "E"_r \( B \) \; bb(Z) \) arrow.r^(med tilde.op med) H_2 \( S_(r \, l) \; bb(Z) \) \,
   $ <eq:stabilizer-homology>]

 and both groups identify naturally with $J_r \( B \)$.]
] <lem:stabilizer-uce>

#proof[
  The extension is central by Proposition 22(ii), because its kernel acts trivially on the strip.
    Both its source and target are perfect. Indeed, an internal root is a consecutive-root commutator,
    and a strip root has the same expression using an intermediate index among the first $r$ coordinates.
  Consider an arbitrary central extension $T arrow.r S_(r \, l)$.
    The roots available in $S_(r \, l)$ are $e_(i j) \( a \)$ with $j lt.eq r$ and $i eq.not j$,
    where $i$ may also be one of the last $l$ coordinates. Choose arbitrary lifts $y_(i j) \( a \) in T$.
    We first show that lifts of roots appearing in a Steinberg commuting relation actually commute:
  #[#set math.equation(numbering: n => "(7.3)")
   $ \[ y_(i j) \( a \) \, y_(k t) \( b \) \] = 1 wide upright("if ") j eq.not k upright(" and ") i eq.not t .
     $ <eq:lifts-commute>]
  Choose $h lt.eq r$ distinct from $i \, j \, k \, t$. In matrices,
  $ e_(i j) \( a \) = \[ e_(i h) \( a \) \, e_(h j) \( 1 \) \] \, $
  and both factors on the right commute with $e_(k t) \( b \)$.
    In $T$, their commutators with $y_(k t) \( b \)$ are therefore central.
    Conjugating each factor by $y_(k t) \( b \)$ changes it only by a central factor, so fixes their commutator.
    Since this commutator differs from $y_(i j) \( a \)$ by a central element, (7.3) follows.
    The bound $r gt.eq 6$ supplies every spare index used below as well.
  Define corrected lifts by
  #[#set math.equation(numbering: n => "(7.4)")
   $ hat(y)_(i j) \( a \) = \[ y_(i h) \( a \) \, y_(h j) \( 1 \) \] \, wide h lt.eq r \, quad h eq.not i \,
     j . $ <eq:canonical-root-lift>]
  They are independent of $h$ and satisfy
  #[#set math.equation(numbering: n => "(7.5)")
   $ \[ y_(i h) \( a \) \, y_(h j) \( b \) \] = hat(y)_(i j) \( a b \)
     wide \( h lt.eq r \; med i \, h \, j upright(" distinct") \) . $ <eq:lifts-product>]
  To prove this, choose a fourth distinct index $f lt.eq r$ and apply Lemma 9 to
  $ X = y_(i h) \( a \) \, wide Y = y_(h f) \( b \) \, wide Z = y_(f j) \( 1 \) . $
  All its commuting hypotheses follow from (7.3), since $\[ X \, Y \]$ and $\[ Y \, Z \]$ lift, respectively,
    $e_(i f) \( a b \)$ and $e_(h j) \( b \)$. The resulting identity equates the left side of (7.5) with
    $\[ y_(i f) \( a b \) \, y_(f j) \( 1 \) \]$: replacing a lift by a central multiple does not change a
    commutator. Setting $b = 1$ proves independence in (7.4); the same identity then proves (7.5) for arbitrary $b$.
  The corrected lifts are additive in their parameters. In (7.4),
    use $y_(i h) \( a \) y_(i h) \( a' \)$ as a lift of $e_(i h) \( a + a' \)$ and expand its commutator with
    $y_(h j) \( 1 \)$. Equation (7.3) allows the commutator factors to pass the $i h$ factors, giving
  $ hat(y)_(i j) \( a + a' \) = hat(y)_(i j) \( a \) hat(y)_(i j) \( a' \) . $
  Here $hat(y)_(i j) \( 0 \) = 1$, since any lift of an identity matrix is central.
    Together with (7.3) and (7.5), this proves all Steinberg relations for the corrected lifts on the available roots.
  On the first $r$ coordinates they therefore define a homomorphism $"St"_r \( B \) arrow.r T$.
    On the strip they define a homomorphism from the additive group $"Mat"_(l times r) \( B \)$ to $T$.
    These homomorphisms respect the semidirect-product action:
    conjugation of a strip root by an internal root is determined by a commuting relation,
    except when their indices form a consecutive path, in which case it is determined by (7.5).
    These are exactly the matrix conjugation rules. Thus they give a homomorphism $tilde(S)_(r \, l) arrow.r
    T$ over $S_(r \, l)$. It is unique, since two such homomorphisms differ by a homomorphism from the perfect
    group $tilde(S)_(r \, l)$ to the central, abelian kernel of $T arrow.r S_(r \, l)$. This proves universality.
  Taking $l = 0$ identifies $H_2 \( "E"_r \( B \) \; bb(Z) \)$ with $J_r \( B \)$.
    The inclusion $"E"_r \( B \) arrow.r S_(r \, l)$ lifts by adjoining the zero strip and is the identity on the
    kernels $J_r \( B \)$. Naturality of the universal central extension now proves (7.2). ◻
]

=== 7.2 The integral complex of ordered frames <the-integral-complex-of-ordered-frames>

An #emph[ordered frame] of $B^m$ is an ordered tuple of columns whose reductions modulo $I_B$ are linearly
  independent. Let $C_p \( m \)$ be the free abelian group on ordered frames of length $p + 1$, for $p gt.eq 0$,
  with boundary the alternating sum of deletions. Set $C_(- 1) \( m \) = bb(Z)$, generated by the empty frame,
  and augment by sending each one-column frame to $1$. Every ordering is a separate generator;
  we impose no relation that identifies two orderings by a sign.

The corresponding finite complexes are complexes of injective words on matroid independence complexes.
  Their shellability is established in [7] Theorem 1.2 and Example 3.3.
  The following direct proof gives the precise integral vanishing range we need.

#thm([Lemma 7.4.])[
  #emph[The augmented chain complex $C_bullet \( m \)$ is exact in degrees at most $m - 2$.]
] <lem:ordered-frames>

#proof[
  First let $V$ be a finite labeled collection of nonzero vectors spanning a vector space of dimension $m$.
    Different labels remain different vertices even if their vectors agree.
    Write $C_bullet \( V \)$ for the augmented complex on its ordered independent tuples.
    We prove the claimed vanishing by induction on the number of labels, allowing $m = 0$:
    the empty collection has its only chain group in degree $- 1$, and the asserted range is then empty.
  Delete a label $v$, and let $V' = V \\ { v }$. In the relative complex
  $ Q_bullet = C_bullet \( V \) \/ C_bullet \( V' \) \, $
  the generators are the independent tuples containing $v$.
    Filter $Q_bullet$ increasingly by the number $a$ of labels before $v$.
    Deleting $v$ is zero in the relative complex; deleting a label before it lowers the filtration;
    deleting a label after it preserves the filtration. Thus the associated graded complex for a fixed $a$ is a
    direct sum, over independent ordered prefixes $\( u_1 \, dots.h \, u_a \, v \)$,
    of complexes in which only the suffix varies.
  For one such prefix, project all remaining labeled vectors to the quotient by $chevron.l u_1 \, dots.h \, u_a \,
    v chevron.r$, and discard the zero projections. The projected collection spans dimension $m - a -
    1$ and has fewer labels than $V$. Its augmented ordered-tuple complex, shifted up by $a + 1$ degrees,
    is precisely the corresponding summand of the associated graded complex,
    up to the constant boundary sign $\( - 1 \)^(a + 1)$. By induction its homology vanishes through degree
  $ \( m - a - 1 \) - 2 + \( a + 1 \) = m - 2 . $
  This also covers a zero-dimensional quotient: its sole homology in degree $- 1$ shifts to degree $a = m - 1$,
    outside the asserted range. The filtration is finite, so $H_i \( Q_bullet \) = 0$ for $i lt.eq m - 2$.
  If $V'$ still spans dimension $m$, induction and the long exact sequence of the pair give the required vanishing
    for $V$. Otherwise $V'$ spans dimension $m - 1$, and $v$ is independent of its entire span.
    Prepending $v$ to every tuple of $V'$ gives a chain homotopy from its inclusion into $C_bullet \( V \)$ to
    zero; in augmented degree $- 1$ it sends $1$ to $\( v \)$.
    The induced maps $H_i \( C_bullet \( V' \) \) arrow.r H_i \( C_bullet \( V \) \)$ are therefore zero.
    They are also surjective for $i lt.eq m - 2$, by the relative vanishing just proved.
    The homology of $C_bullet \( V \)$ vanishes in this range.
  Finally, any cycle in $C_bullet \( m \)$ uses finitely many columns.
    Adjoin the standard basis columns to this finite collection.
    Their reductions, with column labels retained, form a finite collection spanning $bb(F)_2^m$.
    The finite result supplies a bounding chain in the asserted range, proving the Lemma. ◻
]

=== 7.3 Second homology in successive ranks <second-homology-in-successive-ranks>

#proof[
  We now combine the stabilizer calculation with the ordered-frame complex to prove Theorem 23.
    Fix $m gt.eq 13$ and let $"E"_m \( B \)$ act on ordered frames by left multiplication.
    For frame lengths $l lt.eq 5$, this action is transitive.
    To see this, complete a given frame to an invertible matrix, placing it in the last $l$ columns, and put $r =
    m - l$. By Proposition 22(iii), the map $"GL"_r \/ "E"_r arrow.r "GL"_m \/ "E"_m$ is an isomorphism.
    Right multiplication by a suitable complementary $"GL"_r$ block therefore brings the completion into $"E"_m$
    without changing its last $l$ columns.
  The pointwise stabilizer of the last $l$ standard columns is exactly $S_(m - l \, l)$ from (7.1).
    Indeed, its general form has $A in "GL"_(m - l)$ and arbitrary lower-left strip.
    The strip is elementary, and the injectivity of $"GL"_(m - l) \/ "E"_(m - l) arrow.r
    "GL"_m \/ "E"_m$ says that this matrix belongs to $"E"_m$ precisely when $A in "E"_(m - l)$.
    Write $S_l = S_(m - l \, l)$ for the rest of the proof. All these complementary ranks are at least eight,
    so Lemma 24 applies.
  Take a free right $bb(Z) \[ "E"_m \]$-resolution $P_bullet arrow.r
    bb(Z)$ of the trivial module and form the first-quadrant double complex
  #[#set math.equation(numbering: n => "(7.6)")
   $ D_(p \, q) = P_q ⊗_(bb(Z) \[ "E"_m \]) C_p \( m \) \, wide p \, q gt.eq 0 . $ <eq:frames-double-complex>]
  This is the usual equivariant homology double complex; see [1] Chapter VII.
    Its total homology in degree two is $H_2 \( "E"_m \; bb(Z) \)$ via augmentation.
    For completeness, adjoining the augmentation column $p = -
    1$ gives the same tensor product with the augmented frame complex.
    Each $P_q$ is free and hence flat, so Lemma 25 makes the rows exact in the stated range.
    The augmented total complex has zero homology in degrees one and two.
    The long exact sequence separating its augmentation column from (7.6) consequently gives the asserted isomorphism.
  Take vertical homology first. For $0 lt.eq p lt.eq 4$, the permutation module on ordered $\( p + 1 \)$-frames
    has one orbit and stabilizer $S_(p + 1)$. Shapiro’s Lemma identifies the first page as
  #[#set math.equation(numbering: n => "(7.7)")
   $ E_(p \, q)^1 = H_q \( S_(p + 1) \; bb(Z) \) \, wide 0 lt.eq p lt.eq 4 . $ <eq:frames-first-page>]
  The first differential is the alternating sum of the face maps,
    each expressed by a stabilizer inclusion and a coordinate change that returns the remaining frame to the
    chosen standard frame.
  The row $q = 1$ is zero in these columns, because every $S_l$ is perfect.
    In row $q = 0$, all entries are $bb(Z)$ and each face map is the identity.
    Hence the first differential is zero for odd $p$ and the identity for even $p$. In particular,
  #[#set math.equation(numbering: n => "(7.8)")
   $ E_(1 \, 1)^2 = E_(2 \, 1)^2 = E_(2 \, 0)^2 = E_(3 \, 0)^2 = 0 . $ <eq:vanishing-second-page>]
  In row $q = 2$, the two face maps from column one to column zero coincide.
    Indeed, the inclusion $"E"_(m - 2) arrow.r S_2$ induces an isomorphism on $H_2$ by Lemma 24,
    so it suffices to compare the faces on this complementary block.
    The first standard frame is $\( e_(m - 1) \, e_m \)$. Deleting its first column gives $e_m$.
    Deleting its second column gives $e_(m - 1)$, which is returned to $e_m$ by swapping the last two coordinates.
    This swap is elementary in characteristic two and centralizes the first $m - 2$ coordinates.
    The two induced maps on that block are therefore identical. Their alternating sum vanishes, and
  $ E_(0 \, 2)^2 = H_2 \( S_1 \; bb(Z) \) . $
  No higher differential leaves position $\( 0 \, 2 \)$. The only possible incoming differentials are from
    $\( 2 \, 1 \)$ on the second page and $\( 3 \, 0 \)$ on the third page; both vanish by (7.8).
    The other positions of total degree two, $\( 1 \, 1 \)$ and $\( 2 \, 0 \)$, also vanish.
    The spectral sequence thus shows that the edge map
  $ H_2 \( S_1 \; bb(Z) \) arrow.r H_2 \( "E"_m \; bb(Z) \) $
  is an isomorphism. This is the map induced by inclusion: the zero-th column corresponds to the standard column
    $e_m$, and its map into the total complex followed by augmentation is the usual homology map for its
    stabilizer inclusion.
  Combining with (7.2), we have proved that the natural stabilization map
  $ H_2 \( "E"_(m - 1) \( B \) \; bb(Z) \) arrow.r H_2 \( "E"_m \( B \) \; bb(Z) \) $
  is an isomorphism for $m gt.eq 13$. The natural identifications by universal central extensions turn this into
    the isomorphism $J_(m - 1) \( B \) arrow.r J_m \( B \)$.
  Finally, an element killed by $"St"_n \( B \) arrow.r "St" \( B \)$ already has identity matrix image,
    since coordinate embeddings of matrix groups are injective. It therefore lies in $J_n \( B \)$.
    If $n gt.eq 12$, the successive isomorphisms on these kernels show that it cannot become trivial at any later
    rank. The stable group is the direct limit, so this proves the injectivity asserted in Theorem 23. ◻
]

== 8 The finitely presented residually finite 2-group <sec:construction>

Stable detection and the fixed-rank injectivity just proved now yield finite quotients separating the group we
  will use. The ring $R$ throughout this section is the algebra of Proposition 2,
  with the hierarchy of Proposition 3. Its finite degree quotients will give actual finite groups separating the
  elements of $Gamma = "St"_12 \( R \)$.

#thm([Proposition 8.1.])[
  #emph[For every $d gt.eq 1$, the group $"St"_12 \( R \/ R_(gt.eq d) \)$ is finite. The homomorphisms
$ "St"_12 \( R \) arrow.r "St"_12 \( R \/ R_(gt.eq d) \) \, wide d gt.eq 1 \, $

 separate the elements of $"St"_12 \( R \)$.]
] <prop:finite-quotients>

#proof[
  Put $B_d = R \/ R_(gt.eq d)$. This ring is finite: it is the direct sum of finitely many finite-dimensional
    vector spaces over $bb(F)_2$. Moreover $B_d = bb(F)_2 xor I_d$ with $I_d^d = 0$,
    so every finite square matrix over $I_d$ is nilpotent. The centrality assertion in Proposition 22 therefore
    applies to $B_d$. The kernel of
  $ "St"_12 \( B_d \) arrow.r "E"_12 \( B_d \) $
  is central, and the matrix group on the right is finite. Hence the center of $"St"_12 \( B_d \)$ has finite
    index. Schur’s theorem states that a group with center of finite index has finite derived subgroup [15];
    see also [14] Theorem 10.1.4. Since $"St"_12 \( B_d \)$ is perfect, it is itself finite.
  Let $g eq.not 1$ in $"St"_12 \( R \)$. Theorem 23 makes its image in $"St" \( R \)$ nonidentity,
    and Theorem 21 detects that image in $"St" \( B_d \)$ for some $d$. The natural square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$"St"_12(R)$])
  content((4.166, 0), [$"St" (R)$])
  content((0, -2.002), [$"St"_12(B_d)$])
  content((4.29, -2.002), [$"St" (B_d)$])
  line((0.7949, 0), (3.495, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0, -0.301), (0, -1.701), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((4.185, -0.301), (4.271, -1.701), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((0.8566, -2.002), (3.557, -2.002), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
})
  commutes on each root generator. Thus the image of $g$ in $"St"_12 \( B_d \)$ is nonidentity.
    No injectivity assertion for the bottom arrow is needed. This proves separation by the finite groups just
    constructed. ◻
]

#proof[
  The algebra $R$ is infinite and finitely presented as a unital $bb(F)_2$-algebra.
    Accordingly $Gamma = "St"_12 \( R \)$ has an ordinary finite presentation by [13] Theorem 4.1;
    this is also a case of [8] Theorem 3. The group $Gamma$ is infinite,
    since its matrix image contains distinct matrices $e_12 \( a \)$ for all $a in R$.
    It is residually finite by Proposition 26.
  Define
  $ G = ker #scale(x: 120%, y: 120%)[\(] Gamma arrow.r "St"_12 \( bb(F)_2 \) #scale(x: 120%, y: 120%)[\)] \, $
  where the map is induced by the degree-zero projection of $R$.
    The case $d = 1$ of Proposition 26 shows that this target is finite. Thus $G$ has finite index in $Gamma$.
    It is infinite and has an ordinary finite presentation by the Reidemeister–Schreier theorem [9] Chapter II,
    Section 4. Restricting the separating finite-quotient maps of $Gamma$ proves residual finiteness of $G$.
  Fix $g in G$. Its matrix image is $I + A$ for some $A in M_12 \( I \)$.
    Proposition 2 gives an integer $r gt.eq 1$ with $A^r = 0$. Choose $a gt.eq 0$ with $2^a gt.eq r$.
    In characteristic two,
  $ \( I + A \)^(2^a) = I + A^(2^a) = I . $
  Consequently $g^(2^a) in J_12 \( R \)$, and its reduction to $"St"_12 \( bb(F)_2 \)$ is still trivial.
    Its stable image belongs to $J \( R \)$ and reduces to $1$ in $"St" \( bb(F)_2 \)$,
    so Proposition 14 kills that image by a 2-power $2^b$. The injectivity in Theorem 23 then yields
    $g^(2^(a + b)) = 1$ in $Gamma$, hence in $G$. This proves every assertion of Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[K.~S.~Brown, #emph[Cohomology of Groups], Graduate Texts in Mathematics, vol.~87, Springer-Verlag,
  New York, 1982.]
#bibitem([2])[W.~Burnside, On an unsettled question in the theory of discontinuous groups, #emph[Quart. J.
  Pure Appl. Math.] #strong[33] (1902), 230--238.]
#bibitem([3])[E.~S.~Golod, On nil-algebras and finitely approximable $p$-groups, #emph[Izv. Akad. Nauk SSSR Ser.
  Mat.] #strong[28] (1964), no.~2, 273--276 (Russian).]
#bibitem([4])[E.~S.~Golod and I.~R.~Shafarevich, On the class field tower, #emph[Izv. Akad. Nauk SSSR Ser.
  Mat.] #strong[28] (1964), no.~2, 261--272 (Russian).]
#bibitem([5])[R.~I.~Grigorchuk, On Burnside's problem on periodic groups, #emph[Funct. Anal.
  Appl.] #strong[14] (1980), no.~1, 41--43.]
#bibitem([6])[T.~Haettel and D.~Osajda, Locally elliptic actions, torsion groups, and nonpositively curved spaces,
  arXiv:2110.12431v3 (2025).]
#bibitem([7])[J.~Jonsson and V.~Welker, Complexes of injective words and their commutation classes,
  #emph[Pacific J. Math.] #strong[243] (2009), no.~2, 313--329.]
#bibitem([8])[S.~Krstić and J.~McCool, Presenting $upright(G L)_n \( k chevron.l T chevron.r \)$, #emph[J.
  Pure Appl. Algebra] #strong[141] (1999), no.~2, 175--183.]
#bibitem([9])[R.~C.~Lyndon and P.~E.~Schupp, #emph[Combinatorial Group Theory],
  Ergebnisse der Mathematik und ihrer Grenzgebiete, vol.~89, Springer-Verlag, Berlin, 1977.]
#bibitem([10])[J.~Milnor, #emph[Introduction to Algebraic $K$-Theory], Annals of Mathematics Studies, vol.~72,
  Princeton University Press, Princeton, NJ, 1971.]
#bibitem([11])[P.~S.~Novikov and S.~I.~Adian, Infinite periodic groups, I--III, #emph[Math.
  USSR-Izv.] #strong[2] (1968), 209--236, 241--479, 665--685.]
#bibitem([12])[A.~Yu.~Ol'shanskii and M.~V.~Sapir, Non-amenable finitely presented torsion-by-cyclic groups,
  #emph[Publ. Math. Inst. Hautes Études Sci.] #strong[96] (2003), 43--169.]
#bibitem([13])[OpenAI, #emph[An infinite finitely presented periodic group],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/An-infinite-finitely-presented-periodic-group-September-23-2026/paper.pdf")[OAI:An-infinite-finitely-presented-periodic-group-September-23-2026],
  2026.]
#bibitem([14])[D.~J.~S.~Robinson, #emph[A Course in the Theory of Groups], 2nd ed., Graduate Texts in Mathematics,
  vol.~80, Springer-Verlag, New York, 1996.]
#bibitem([15])[I.~Schur, Über die Darstellung der endlichen Gruppen durch gebrochen lineare Substitutionen,
  #emph[J. Reine Angew. Math.] #strong[127] (1904), 20--50.]
#bibitem([16])[A.~A.~Suslin and M.~S.~Tulenbaev, Stabilization theorem for the Milnor $K_2$-functor, #emph[Zap.
  Nauchn. Sem. Leningrad. Otdel. Mat. Inst. Steklov.] #strong[64] (1976), 131--152 (Russian);
  English translation in #emph[J. Soviet Math.] #strong[17] (1981), no.~2, 1804--1819.]
#bibitem([17])[W.~van der Kallen, Homology stability for linear groups, #emph[Invent.
  Math.] #strong[60] (1980), no.~3, 269--295.]
#bibitem([18])[C.~A.~Weibel, Module structures on the $K$-theory of graded rings, #emph[J.
  Algebra] #strong[105] (1987), no.~2, 465--483.]
#bibitem([19])[C.~A.~Weibel, #emph[The $K$-Book: An Introduction to Algebraic $K$-Theory],
  Graduate Studies in Mathematics, vol.~145, American Mathematical Society, Providence, RI, 2013.]
#bibitem([20])[E.~I.~Zel'manov, A solution of the restricted Burnside problem for $2$-groups, #emph[Math.
  USSR-Sb.] #strong[72] (1992), no.~2, 543--565.]
