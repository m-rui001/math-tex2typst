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

#align(center)[#text(size: 16pt, weight: "bold")[Finite-Circle Obstructions, Binary Codes, and \
Histogram Embeddings for Edit Distance]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

An insertion or deletion changes the positions of every later symbol. Yet cyclically shifting a nonempty word by one position costs at most two edits: delete its first symbol and insert it at the end. We use the difference between the length of a word and the cost of translating it to study how faithfully edit distance can be represented in $ell_1$.

===== 1.1 The metric and the question. <the-metric-and-the-question.>

For finite words $x \, y$, let $"ED" \( x \, y \)$ be the least number of single-symbol insertions, deletions, and substitutions taking $x$ to $y$, with each operation costing one. If $Sigma$ is a finite alphabet with at least two symbols and $d gt.eq 1$ is an integer, let $Sigma^(lt.eq d)$ contain all words of length at most $d$, including the empty word. This cap restricts only the endpoints of a comparison; intermediate words in an edit script are unrestricted. For an injective map $f : Sigma^(lt.eq d) arrow.r ell_1$, its distortion is

$ "dist" \( f \) = (max_(x eq.not y) frac(parallel f \( x \) - f \( y \) parallel_1, "ED" \( x \, y \))) (max_(x eq.not y) frac("ED" \( x \, y \), parallel f \( x \) - f \( y \) parallel_1)) \, #h(2em) E_Sigma \( d \) = inf_f "dist" \( f \) . $

Here $ell_1$ is the real space of absolutely summable sequences. There is no restriction on target dimension or on how the map is computed. The question asks for one map that represents every pair in the domain.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $c \, C > 0$ and an integer $d_0$ such that, for every integer $d gt.eq d_0$ and every finite alphabet $Sigma$ with $\| Sigma \| gt.eq 2$, 
#[#set math.equation(numbering: n => "(1)")
 $ exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] c sqrt(log d thin log log d) #scale(x: 120%, y: 120%)[\)] lt.eq E_Sigma \( d \) lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C sqrt(log d thin log log d) #scale(x: 120%, y: 120%)[\)] . $ <eq:main>]

 Each of our two lower constructions supplies a binary subset whose words have one common length at most $d$ and whose least $ell_1$ distortion satisfies the lower bound. The upper bound is realized by a deterministic finite-dimensional map.]
] <thm:main>

All logarithms are natural unless a base is displayed. The constants are independent of the finite alphabet, including alphabets whose size grows with $d$. Thus the same estimates hold for $sup_(2 lt.eq \| Sigma \| < oo) E_Sigma \( d \)$. Equation (1) determines the order of $log E_Sigma \( d \)$; the constants in its two exponents need not agree.

===== 1.2 Earlier bounds and the role of alignment. <earlier-bounds-and-the-role-of-alignment.>

The single-symbol error model has its roots in Levenshtein’s work on insertion and deletion codes [8]. Wagner and Fischer’s increasing traces describe the alignments available to two words [15]. In particular, if $"LCS" \( x \, y \)$ denotes the longest common subsequence length, the insertion–deletion distance is

$ Delta \( x \, y \) = \| x \| + \| y \| - 2 "LCS" \( x \, y \) \, #h(2em) "ED" \( x \, y \) lt.eq Delta \( x \, y \) lt.eq 2 "ED" \( x \, y \) . $

A lower bound must therefore control arbitrary increasing matchings, even when they cross many of the boundaries used to construct the words.

Ostrovsky and Rabani obtained the upper scale in Theorem 1 for fixed-length binary edit distance by recursively comparing multisets of overlapping substrings [12]. They also noted extensions to larger alphabets and varying lengths. Section 8 gives a complete finite histogram construction with alphabet-independent constants and all shorter words included. It can be read on its own.

For lower bounds, Andoni, Deza, Gupta, Indyk, and Raskhodnikova found binary sets whose $L_1$ distortion approaches $3 \/ 2$ [1]. Their construction uses several nearby word lengths. Khot and Naor obtained a $\( log d \)^(1 \/ 2 - o \( 1 \))$ bound using Fourier analysis of cuts and noisy shifts [6]; their insertion–deletion convention transfers to ours within a factor of two. Krauthgamer and Rabani strengthened the bound to $Omega \( log d \)$ on binary words of length $d$ [7] Theorem 1.3. Our constructions use the same broad cut and Fourier viewpoint, but impose translation constraints through distinct prime periods. Those constraints force large total leaf frequency and yield the exponent in (1). The resulting lower bound grows faster than every fixed power of $log d$, while remaining $d^(o \( 1 \))$. Thus it reaches the scale of the Ostrovsky–Rabani upper bound after taking logarithms.

===== 1.3 The lower constructions. <the-lower-constructions.>

A phase is a point of the circle $bb(R) \/ bb(Z)$. We work on a finite equally spaced grid containing the half-turn $1 \/ 2$. A state assigns one grid phase to each leaf of a finite rooted tree. At a leaf, a binary pattern records a translated half-circle on that grid. At an internal node, a row lists the child words, each with its own tag; a long word repeats rows at translated phases.

Both constructions compare three kinds of phase change. Translations in a specified subgroup move the row lists at low edit cost. Moving just one leaf changes only the fraction of the word occupied by that leaf, with edit cost at most twice the occupied length times the phase displacement. A simultaneous half-turn at every leaf must have a large edit cost. This last assertion requires control of arbitrary alignments: a matching may cross many of the rows used to define the words.

The row tags provide that control. A source row whose matches stay in one target row inherits the child separation. If its matches enter several target rows, they leave a long unmatched target interval. The intervals charged by distinct source rows are disjoint. Lemma 3 turns this observation into the separation estimate used by both constructions.

To compare these edit costs with an arbitrary $ell_1$ image, we express its distances on the finite phase space as nonnegative sums of cut distances and then use finite Fourier expansion. A character has one integer frequency at each leaf. Averaging over the cheap subgroup controls the total Fourier weight of characters nonconstant on it. Among the remaining characters, one that detects the half-turn must have large total absolute leaf frequency: if that total were small, the prime constraints would force nonzero frequency sums to branch through too many leaves. Weighted single-leaf shifts control the Fourier mass carried by these large frequencies. The common analytic step is Lemma 8; each construction proves its own arithmetic branching bound.

The two prime patterns also give different proofs of half-turn separation. The first construction groups children by primes and includes every residue of each prime. Its separation proof follows a nonzero phase down the tree while keeping track of the loss at each level. The complete residue lists allow the descent to restart at the reciprocal of a single prime; these resets keep the denominator factors acquired at other steps from accumulating without control. The accumulated losses and the final phase’s distance from zero give a quantitative lower bound for the half-turn. Section 3 constructs the words and carries out this descent.

The second construction uses one child per prime, with that prime’s translation acting on every child except its own. Two child phases of small cost would have a small difference involving at most two fresh prime denominators. The induction rules out every nonzero such difference, forcing most translation coordinates to vanish. Section 6 develops this separate argument.

===== 1.4 Binary transfer and the upper construction. <binary-transfer-and-the-upper-construction.>

The tags initially require a larger alphabet. Section 4 gives two direct binary substitutions of width $O \( log \( 2 A \) \)$ for an alphabet of size $A$. Each has absolute distortion on all equal-length words, simultaneously for every common length. One proof separates intervals of differently labelled codewords and uses a common offset to recover a letter matching. The other controls shifted self-overlaps and finds anchors at equal relative indices. The lower constructions use these bounds only at equal lengths.

The same existence order follows from the alphabet reduction of Bhattacharya, Dey, Goldenberg, and Koucký [2] Theorem 1.1 and Section 3.2.1 of the full version. Their stated theorem approximately preserves normalized insertion–deletion distance, with each distance divided by the sum of the lengths of its two arguments. The block substitution in its proof has logarithmic width for a fixed target alphabet. Composing that substitution with a fixed-width binary delimiter gives the claimed binary width and distortion, as we explain in Section 4. Our direct proofs expose two different local matching conditions. Long-interval separation is already present in Schulman and Zuckerman’s inner code [14] Section II-C, and self-matching control is a central feature of synchronization strings [5].

For either lower route, depth $h$ gives logarithmic distortion of order $h log h$ at lengths whose logarithms are $O \( h^2 log h \)$. The direct parameter choice in Section 7 supplies every sufficiently large cap. Finally, Section 8 develops the independent upper construction: divide words into blocks, list overlapping windows, partition their shorter-word images using cuts, and record the resulting histograms. After the power-length proof, a map at actual window lengths admits two expansion estimates, one from an arbitrary longest common subsequence and one from moves. A final variant uses total variation.

Theorem 8.1 supplies the upper embedding stated as Theorem 6.1 of the companion tree constructions [11], which is combined with their lower bounds in Corollary 6.2. Their lower proofs are independent of the present constructions. A shorter companion proof [10] uses marked rows and a prime-product displacement inequality, with no lower-proof dependence on the circle constructions.

== 2 Alignments and tagged rows <sec:preliminaries>

We first relate edit distance to increasing subsequence matchings, then transfer a separation estimate for tagged child words to an estimate for rows under arbitrary alignments. This is the only general tool needed before constructing the circle words.

=== 2.1 Subsequence deficit and tagged rows <subsequence-deficit-and-tagged-rows>

A common subsequence is a collection of equal-symbol pairs whose position indices increase strictly on both sides. Write $"LCS" \( x \, y \)$ for its maximum size. For equal-length words of length $n$, put

$ r_n \( x \, y \) = n - "LCS" \( x \, y \) . $

This is the number of unmatched positions on either side of a longest common subsequence. For arbitrary lengths put $q \( x \, y \) = max \( \| x \| \, \| y \| \) - "LCS" \( x \, y \)$.

#thm([Lemma 2.1.])[
  (Metric comparisons).  #emph[For all finite words $x \, y$, 
$ q \( x \, y \) lt.eq "ED" \( x \, y \) lt.eq 2 q \( x \, y \) \, #h(2em) "ED" \( x \, y \) lt.eq \| x \| + \| y \| - 2 "LCS" \( x \, y \) lt.eq 2 "ED" \( x \, y \) . $

 The middle expression in the second comparison is the insertion–deletion distance. In particular, $r_n lt.eq "ED" lt.eq 2 r_n$ at equal length.]
] <pre:metric>

#proof[
  A script of $k$ edits leaves at least $\| x \| - k$ original symbols unchanged and in order. Apply this observation to the script and its reverse to get $q lt.eq "ED"$. Deleting outside a longest common subsequence and inserting the missing symbols costs $\| x \| + \| y \| - 2 "LCS" \( x \, y \) lt.eq 2 q$. The survivor count shows that no insertion–deletion script can be shorter. Replacing every substitution by one deletion and one insertion proves the remaining factor-two comparison. These are the trace identities of Wagner and Fischer [15], with the metric convention made explicit here. ◻
]

Here is the alignment fact used by both constructions. A row consists of $t$ child blocks of equal length, in the same fixed child order in both words. Every letter carries its child tag, so a matched pair must preserve the child index. A source row is #emph[split] if its matched positions enter at least two target rows.

#thm([Lemma 2.2.])[
  (Charging split tagged rows).  #emph[Let $R \, L gt.eq 1$ and $t gt.eq 2$ be integers, and let $Gamma_1 \, dots.h \, Gamma_t$ be pairwise disjoint alphabets. Each of two words consists of $R$ rows, each containing in order a block in $Gamma_i^L$ for $i = 1 \, dots.h \, t$. Thus every matched pair preserves its child index. The common length is $N = R t L$. Fix an increasing matching with $E$ unmatched positions on each side. Suppose every nonsplit source row loses at least $A t L$ source positions, where $0 lt.eq A lt.eq 1$; rows with no matches are included in this hypothesis. Then 
#[#set math.equation(numbering: n => "(2)")
 $ E gt.eq A (N - frac(t E, t - 1)) \, #h(2em) E gt.eq frac(A N, 1 + t A \/ \( t - 1 \)) . $ <pre:row-bound>]

]
] <pre:tagged-rows>

#proof[
  In a split source row, choose consecutive matched positions at a transition between target rows. They are consecutive in the whole matching because all source positions between them remain in this same row. Let their child indices be $i lt.eq j$ and their target row indices be $a < a'$. Tags force the same $i \, j$ in the target. The open target interval between the two matches contains at least
  $ #scale(x: 120%, y: 120%)[\(] \( a' - a \) t + j - i - 1 #scale(x: 120%, y: 120%)[\)] L gt.eq \( t - 1 \) L $
  positions: within the endpoint blocks, the smallest possible gap occurs when the first match is last in its block and the second is first in its block. Every position of this interval is unmatched, by consecutiveness. The target intervals selected from different source rows are disjoint, by the order of the matching. There are at most $E \/ \( \( t - 1 \) L \)$ split rows, of total source length at most $t E \/ \( t - 1 \)$.
  Every remaining row loses at least the fraction $A$ of its own source positions. These losses are disjoint even when several source rows use one target row. Summing them gives the first inequality in (2); rearrangement gives the second. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.18, 1.5), [#text(size: 9pt)[source row]], anchor: "east", padding: 0.1176cm)
  content((-0.18, 0), [#text(size: 9pt)[target rows]], anchor: "east", padding: 0.1176cm)
  rect((0, 1.237), (0.72, 1.762), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.36, 1.5), [#text(size: 9pt)[$1$]])
  rect((0.72, 1.237), (1.44, 1.762), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.08, 1.5), [#text(size: 9pt)[$2$]])
  rect((1.44, 1.237), (2.16, 1.762), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.8, 1.5), [#text(size: 9pt)[$3$]])
  rect((2.16, 1.237), (2.88, 1.762), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.52, 1.5), [#text(size: 9pt)[$4$]])
  rect((2.88, 1.237), (3.6, 1.762), fill: rgb("#f2f2ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.24, 1.5), [#text(size: 9pt)[$5$]])
  rect((0, -0.2625), (0.72, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.36, 0), [#text(size: 9pt)[$1$]])
  rect((0.72, -0.2625), (1.44, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.08, 0), [#text(size: 9pt)[$2$]])
  rect((1.44, -0.2625), (2.16, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.8, 0), [#text(size: 9pt)[$3$]])
  rect((2.16, -0.2625), (2.88, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.52, 0), [#text(size: 9pt)[$4$]])
  rect((2.88, -0.2625), (3.6, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.24, 0), [#text(size: 9pt)[$5$]])
  rect((3.6, -0.2625), (4.32, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.96, 0), [#text(size: 9pt)[$1$]])
  rect((4.32, -0.2625), (5.04, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.68, 0), [#text(size: 9pt)[$2$]])
  rect((5.04, -0.2625), (5.76, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.4, 0), [#text(size: 9pt)[$3$]])
  rect((5.76, -0.2625), (6.48, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.12, 0), [#text(size: 9pt)[$4$]])
  rect((6.48, -0.2625), (7.2, 0.2625), fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.84, 0), [#text(size: 9pt)[$5$]])
  line((3.6, -0.375), (3.6, 0.375), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((0.36, 1.2), (0.36, 0.3), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  line((2.52, 1.2), (6.12, 0.3), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  line((0.36, -0.6), (6.12, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((3.24, -0.6), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[unmatched gap, length at least $(t-1)L$]]])])
  content((1.8, -1.05), [#text(size: 9pt)[one row]])
  content((5.4, -1.05), [#text(size: 9pt)[next row]])
})],
  caption: [Figure 1: Two consecutive matches from one source row enter different target rows. The labels are child tags. The open target interval between the arrows is unmatched and contains at least $\( t - 1 \) L$ positions. The drawing shows $t = 5$ schematically; only the two relevant matches are shown. ],
) <fig:split-row>

== 3 A circle construction with denominator resets <sec:masks>

We now construct the first family of words. A translation subgroup will move long lists of rows at low edit cost, while a simultaneous half-turn will remain separated under every alignment. After proving separation, we derive a common analytic comparison and verify its arithmetic hypothesis for these translations. The tags will then be replaced by binary blocks in the next section.

=== 3.1 Translated rows on a finite circle <translated-rows-on-a-finite-circle>

Fix a sufficiently large integer $h$. Choose $h^2$ distinct primes $p_(ell k) in \[ h^3 \, 2 h^3 \]$, for $1 lt.eq ell \, k lt.eq h$. Here $pi \( x \)$ denotes the number of primes at most $x$. The estimate $pi \( 2 x \) - pi \( x \) > 3 x \/ \( 5 log x \)$ for sufficiently large $x$ [13] Corollary 3 supplies this many primes for every sufficiently large $h$. Put

#[#set math.equation(numbering: n => "(3)")
 $ P_ell = product_(k = 1)^h p_(ell k) \, #h(2em) M = 2 product_(ell = 1)^h P_ell \, #h(2em) R = h^(2 h) \, #h(2em) G = \( M^(- 1) bb(Z) \) \/ bb(Z) . $ <mask:parameters>]

The factor two puts the half-turn in the finite grid $G$.

At level $ell$ the child set is

$ J_ell = { \( k \, b \) : 1 lt.eq k lt.eq h \, med 0 lt.eq b < p_(ell k) } \, #h(2em) t_ell = sum_k p_(ell k) \, $

with a fixed order. For a residue vector $z in product_k bb(Z) \/ p_(ell k) bb(Z)$, define the additive maps

#[#set math.equation(numbering: n => "(4)")
 $ sigma_ell \( z \) = sum_k z_k / p_(ell k) \, #h(2em) gamma_(ell \, \( k \, b \)) \( z \) = sigma_ell \( z \) + frac(b z_k, p_(ell k)) quad upright("in ") G . $ <mask:gamma>]

For an integer $a$, write $z \( a \)$ for its vector of residues at this level. By the Chinese remainder theorem, $a med mod med P_ell$ runs through every $z$.

Set $r_0 = 1$ and $r_ell = t_ell r_(ell - 1)$. A state $v in G^(r_ell)$ is a tuple $\( v_j \)_(j in J_ell)$ with $v_j in G^(r_(ell - 1))$. For $theta in G$, write $theta upright(bold(1))$ for the vector whose every coordinate is $theta$. At level zero, $S_0 \( v \)$ is the length-$M$ binary word with bit at position $b in { 0 \, dots.h \, M - 1 }$ equal to

$ upright(bold(1))_(\[ 0 \, 1 \/ 2 \)) \( b \/ M - v \) \, $

where the interval is read modulo one. Thus $S_0 \( v \)$ records $M \/ 2$ consecutive sites of the circle.

For $ell gt.eq 1$, define $S_ell \( v \)$ by concatenating, for $a = 0 \, dots.h \, R P_ell - 1$, the row

#[#set math.equation(numbering: n => "(5)")
 $ bar.v.double_(j in J_ell) \[ j \, S_(ell - 1) \( v_j + gamma_(ell \, j) \( z \( a \) \) upright(bold(1)) \) \] . $ <mask:word>]

Here $bar.v.double$ means concatenation in the fixed order, and $\[ j \, U \]$ attaches the tag $j$ to every letter of $U$. The tags are part of the alphabet, so a match must preserve the child index. All level-$ell$ words have length

#[#set math.equation(numbering: n => "(6)")
 $ L_0 = M \, #h(2em) L_ell = R P_ell t_ell L_(ell - 1) . $ <mask:length>]

At level $h$ the alphabet has size $A = 2 r_h$. Injectivity of the map from states to words is not required.

The following subgroup records the translations that move row indices:

#[#set math.equation(numbering: n => "(7)")
 $ C_0 = { 0 } \, #h(2em) C_ell = C_(ell - 1)^(J_ell) + { \( gamma_(ell \, j) \( z \) upright(bold(1)) \)_(j in J_ell) : z in product_k bb(Z) \/ p_(ell k) bb(Z) } . $ <mask:subgroup>]

For a leaf coordinate $i$, let $e_i \( theta \)$ have value $theta$ there and zero in the other coordinates.

#thm([Lemma 3.1.])[
  (Cheap translations).  #emph[For every $0 lt.eq ell lt.eq h$, every $v in G^(r_ell)$, and every $c in C_ell$, 
#[#set math.equation(numbering: n => "(8)")
 $ "ED" \( S_ell \( v \) \, S_ell \( v + c \) \) lt.eq frac(2 ell L_ell, R) . $ <mask:cheap-subgroup>]

 At the top level, for every leaf $i$ and $1 lt.eq a lt.eq M \/ 2$, 
#[#set math.equation(numbering: n => "(9)")
 $ "ED" \( S_h \( v \) \, S_h \( v + e_i \( a \/ M \) \) \) lt.eq frac(2 a L_h, M r_h) . $ <mask:cheap-leaf>]

 Both estimates hold at every base state $v$.]
] <mask:cheap>

#proof[
  For a translation from the second summand of (7), choose its row shift $q in { 0 \, dots.h \, P_ell - 1 }$ by the Chinese remainder theorem. Additivity of (4) identifies the rows after this shift. Deleting $q$ rows at one end and inserting $q$ at the other costs at most $2 L_ell \/ R$. For a translation in the first summand, apply the previous-level bound inside each child block of each row. Its total cost is at most $2 \( ell - 1 \) L_ell \/ R$. These bounds hold at every state, so the triangle inequality combines them at the intermediate state and proves (8) by induction.
  A leaf occupies exactly the fraction $1 \/ r_h$ of the root word, in copies of $S_0$. Shifting its half-circle by $a \/ M$, for $a lt.eq M \/ 2$, changes exactly $2 a$ bits in each copy. Substituting those bits, with every tag unchanged, proves (9). ◻
]

=== 3.2 A scalar cost and separation under arbitrary alignments <a-scalar-cost-and-separation-under-arbitrary-alignments>

The subgroup can choose different row translations at successive levels. To measure how much of a uniform phase survives those choices, define

#[#set math.equation(numbering: n => "(10)")
 $ D_0 \( theta \) = parallel theta parallel_(bb(R) \/ bb(Z)) \, #h(2em) D_ell \( theta \) = min_z 1 / t_ell sum_(j in J_ell) D_(ell - 1) \( theta + gamma_(ell \, j) \( z \) \) . $ <mask:phase-cost>]

The minimum exists because its set is finite. These functions are symmetric and subadditive: negate a minimizing residue vector for symmetry, and add two minimizing vectors before using the preceding subadditivity inequality. The zero vector also shows $0 lt.eq D_ell lt.eq 1 \/ 2$.

#thm([Lemma 3.2.])[
  (Word separation).  #emph[For every $0 lt.eq ell lt.eq h$, $v in G^(r_ell)$, and $theta in G$, 
#[#set math.equation(numbering: n => "(11)")
 $ r_(L_ell) \( S_ell \( v \) \, S_ell \( v + theta upright(bold(1)) \) \) gt.eq 2^(- ell) / 4 L_ell D_ell \( theta \) . $ <mask:separation-bound>]

]
] <mask:separation>

#proof[
  At level zero let $E$ be the deficit. In a matching of $M - E$ pairs, the $k$th selected position on either side lies between $k$ and $k + E$, so each matched pair has displacement at most $E$. The Hamming distance of the two half-circle words is $2 M parallel theta parallel_(bb(R) \/ bb(Z))$. A position where their bits disagree is either unmatched in the source or matched across a transition of the target word. The target has at most two transitions in its linear ordering, and at most $4 E$ positions lie within distance $E$ of them. Thus the Hamming distance is at most $E + 4 E$. It follows that $E gt.eq 2 M D_0 \( theta \) \/ 5 gt.eq M D_0 \( theta \) \/ 4$.
  Suppose the assertion holds at level $ell - 1$. Fix a longest common subsequence matching of the level-$ell$ words. Let $t = t_ell$ and $L = L_(ell - 1)$. If a source row has all its matches in a target row with indices $a \, a'$, respectively, its child $j$ can match only child $j$ in that target row. Their phase difference is $\( theta + gamma_(ell \, j) \( z \( a' - a \) \) \) upright(bold(1))$. By induction, the number of source positions lost in this row is at least
  $ 2^(- \( ell - 1 \)) / 4 L sum_j D_(ell - 1) \( theta + gamma_(ell \, j) \( z \( a' - a \) \) \) gt.eq 2^(- \( ell - 1 \)) / 4 t L D_ell \( theta \) . $
  A row with no matches loses every source position and satisfies the same bound. Hence Lemma 3 applies with $A = 2^(- \( ell - 1 \)) D_ell \( theta \) \/ 4 lt.eq 1 \/ 8$. Since $t gt.eq 4$, its denominator $1 + t A \/ \( t - 1 \)$ is less than two. We obtain a deficit at least $A L_ell \/ 2$, which is (11). ◻
]

The remaining geometric question is now one-dimensional: how small can $D_h \( 1 \/ 2 \)$ be? The next descent gives the quantitative answer. It is here that the prime groups and their complete residue lists enter the proof.

=== 3.3 Keeping a nonzero phase through the descent <keeping-a-nonzero-phase-through-the-descent>

#thm([Lemma 3.3.])[
  (Denominator resets).  #emph[For all sufficiently large $h$, 
#[#set math.equation(numbering: n => "(12)")
 $ D_h \( 1 \/ 2 \) gt.eq 4^(- h) h^(- h \/ 2 - O \( sqrt(h) \) - 4 h \/ 100) \, $ <mask:reset-bound>]

 with an absolute implicit constant.]
] <mask:reset>

#proof[
  At a level $ell$, choose a minimizing residue vector $z$ in (10) and let $s = \| { k : z_k eq.not 0 } \|$. If $z_k eq.not 0$, multiplication by $z_k$ permutes the $p_(ell k)$ grid points. For every translate of that grid, symmetry and subadditivity give
  $ D_(ell - 1) \( 1 \/ p_(ell k) \) lt.eq D_(ell - 1) \( x + b \/ p_(ell k) \) + D_(ell - 1) \( x + \( b + 1 \) \/ p_(ell k) \) . $
  Averaging over $b$ says that the average cost in this child group is at least $D_(ell - 1) \( 1 \/ p_(ell k) \) \/ 2$. Its weight in the row is $p_(ell k) \/ t_ell gt.eq 1 \/ \( 2 h \)$. Summing over active groups proves, when $s > 0$, the reset option
  #[#set math.equation(numbering: n => "(13)")
   $ D_ell \( theta \) gt.eq frac(s, 4 h) min_(k : z_k eq.not 0) D_(ell - 1) \( 1 \/ p_(ell k) \) . $ <mask:reset-option>]
  If $s < sqrt(h)$, the inactive groups have total weight at least $\( h - s \) \/ \( 2 h \) gt.eq 1 \/ 4$ for large $h$. They all have phase $theta + sigma_ell \( z \)$, so there is also the option
  #[#set math.equation(numbering: n => "(14)")
   $ D_ell \( theta \) gt.eq 1 / 4 D_(ell - 1) \( theta + sigma_ell \( z \) \) . $ <mask:inactive-option>]
  Set $K = floor.l h \/ 100 floor.r$ and start at level $h$ with phase $1 \/ 2$. At entry to level $ell$, maintain a nonzero phase whose reduced denominator is a product of at most $K$ distinct primes, all equal to two or belonging to levels strictly above $ell$. The initial phase has this property.
  Use (13) whenever $s gt.eq sqrt(h)$. Use it also when $s < sqrt(h)$ but the current denominator count plus $s$ exceeds $K$. In the latter case $s > 0$, so the option is available. Continue at a prime reciprocal attaining its minimum. A reset restores the count to one and leaves a nonzero phase with a prime from the current level.
  In every other case use (14). If the current phase is $a \/ Q$ in lowest terms, then $Q > 1$. The new summand has denominator dividing a product $P$ of active current-level primes, with $gcd \( Q \, P \) = 1$. If $a \/ Q + b \/ P$ were an integer, reduction of $a P + b Q$ modulo $Q$ would give $a P equiv 0 med \( mod med Q \)$, impossible. The resulting nonzero phase has at most the old denominator count plus $s$ factors. Thus the invariant is preserved.
  Only $O \( sqrt(h) \)$ resets have $s < sqrt(h)$. For each such reset, take the interval of steps since the preceding reset of either kind, or since the start. Its initial count is one. Overflow implies that the sum of its small supports, including the last one, exceeds $K - 1$. These intervals are disjoint, and their total support sum is at most $h sqrt(h)$. The number $q$ of small resets therefore satisfies
  $ q lt.eq frac(h sqrt(h), K - 1) = O \( sqrt(h) \) . $
  This count remains valid when large resets occur between small ones.
  A large reset costs a factor at least $1 \/ \( 4 sqrt(h) \)$, an inactive step at least $1 \/ 4$, and a small reset at least $1 \/ \( 4 h \)$. Their product is at least $4^(- h) h^(- h \/ 2 - q \/ 2)$. At level zero the nonzero phase has at most $K$ denominator primes, each at most $2 h^3 lt.eq h^4$. Its distance to zero is therefore at least $h^(- 4 K)$. Multiplying the factors and using $K lt.eq h \/ 100$ gives (12). ◻
]

Lemmas 5 and 6 give a pointwise half-turn deficit at least $L_h h^(- \( 0.54 + o \( 1 \) \) h)$. The exponential factors $8^(- h)$ are absorbed by the $o \( 1 \) h$ term on this logarithmic scale. We next check that the cheap subgroup forces the large frequency size needed to compare this separation with an $ell_1$ image.

=== 3.4 A common analytic comparison for circle shifts <a-common-analytic-comparison-for-circle-shifts>

The word construction has supplied cheap translations and an expensive half-turn. We now derive the inequality that compares those costs in an arbitrary $ell_1$ image. The proof is stated for any finite circle product; the next subsection will verify its arithmetic hypothesis for the translation subgroup $C_h$.

For a finite set $X$ and $A subset X$, write $delta_A \( x \, y \) = \| upright(bold(1))_A \( x \) - upright(bold(1))_A \( y \) \|$. The finite cut representation of $ell_1$ distances is standard [9] Section 4. We include the summability argument because an $ell_1$ target may have infinitely many coordinates.

#thm([Lemma 3.4.])[
  (Finite cut representation).  #emph[For $f : X arrow.r ell_1$ with $X$ finite, there are nonnegative coefficients $a_A$ on the nonempty proper subsets of $X$ such that 
$ parallel f \( x \) - f \( y \) parallel_1 = sum_A a_A delta_A \( x \, y \) \, #h(2em) sum_A a_A lt.eq sum_({ x \, y } subset X) parallel f \( x \) - f \( y \) parallel_1 . $

]
] <pre:cuts>

#proof[
  For real $s \, t$, $\| s - t \| = integral_(bb(R)) \| upright(bold(1))_(s > u) - upright(bold(1))_(t > u) \| thin d u$. Apply this to each coordinate of $f$ and group threshold sets that define the same subset of $X$. Empty and full cuts contribute zero. Every other cut separates some unordered pair, so its weight is counted at least once in the displayed pair sum, which is finite. Nonnegative sums and integrals may be interchanged, giving the representation and the bound. ◻
]

For this common lemma, let $M gt.eq 2$ be any even integer, $G = \( M^(- 1) bb(Z) \) \/ bb(Z)$, and $V = G^r$ for $r gt.eq 1$. For a map $F : V arrow.r ell_1$ define its averaged displacement by

$ Delta_F \( a \) = bb(E)_(v in V) parallel F \( v + a \) - F \( v \) parallel_1 . $

All averages on finite groups in this paper are uniform. Represent a character of $V$ as $chi_alpha \( v \) = exp \( 2 pi upright(i) sum_i alpha_i v_i \)$, choosing each integer $alpha_i$ with $\| alpha_i \| lt.eq M \/ 2$. Either representative at an endpoint gives the same absolute value. Put $T \( alpha \) = sum_i \| alpha_i \|$ and $cal(D)_M = { 1 \, 2 \, 4 \, dots.h } ∩ \[ 1 \, M \/ 2 \]$. For $theta in G$, write $theta e_i$ for the vector in $V$ with value $theta$ in coordinate $i$ and zero elsewhere.

#thm([Lemma 3.5.])[
  (Weighted finite-circle inequality).  #emph[Let $H lt.eq V$, let $w = \( 1 \/ 2 \, dots.h \, 1 \/ 2 \) in V$, and suppose $B > 0$ satisfies 
#[#set math.equation(numbering: n => "(15)")
 $ chi_alpha \|_H = 1 \, quad chi_alpha \( w \) eq.not 1 quad arrow.r.double quad T \( alpha \) gt.eq B . $ <pre:branching-premise>]

 For every $F : V arrow.r ell_1$ there are nonnegative weights $omega_alpha$ with 
#[#set math.equation(numbering: n => "(16)")
 $ Delta_F \( a \) = sum_alpha omega_alpha \| 1 - chi_alpha \( a \) \|^2 #h(2em) \( a in V \) . $ <pre:fourier>]

 Writing $H^perp = { alpha : chi_alpha \|_H = 1 }$, these weights satisfy 
#[#set math.equation(numbering: n => "(17)")
 $ sum_(alpha in.not H^perp) omega_alpha & = 1 / 2 bb(E)_(u in H) Delta_F \( u \) \,\
4 sum_alpha omega_alpha T \( alpha \) & lt.eq sum_(i = 1)^r sum_(a in cal(D)_M) M / a Delta_F \( \( a \/ M \) e_i \) . $ <pre:off-mass>]

 Consequently 
#[#set math.equation(numbering: n => "(18)")
 $ Delta_F \( w \) lt.eq 2 bb(E)_(u in H) Delta_F \( u \) + 1 / B sum_(i = 1)^r sum_(a in cal(D)_M) M / a Delta_F \( \( a \/ M \) e_i \) . $ <pre:displacement>]

]
] <pre:weighted-circle>

#proof[
  For a scalar function $g$ on $V$, normalized Fourier coefficients and Parseval give
  $ bb(E)_v \| g \( v + a \) - g \( v \) \|^2 = sum_alpha \| hat(g) \( alpha \) \|^2 \| 1 - chi_alpha \( a \) \|^2 . $
  For $g = upright(bold(1))_A$ its squared difference is the cut distance. Multiply by the coefficients of Lemma 7 and sum over cuts. This gives (16) with $omega_alpha = sum_A a_A \| hat(upright(bold(1))_A) \( alpha \) \|^2 gt.eq 0$. The sums are finite after grouping cuts. Since a nontrivial character has mean zero on a finite subgroup, the mean of $\| 1 - chi_alpha \( u \) \|^2$ on $H$ is two off $H^perp$ and zero on it. This proves (17).
  For each nonzero coordinate, take the largest power of two $a lt.eq M \/ \( 2 \| alpha_i \| \)$. It belongs to $cal(D)_M$ and obeys
  $ 1 / 4 < frac(a \| alpha_i \|, M) lt.eq 1 / 2 \, #h(2em) \| 1 - e^(2 pi upright(i) a alpha_i \/ M) \|^2 gt.eq 2 \, #h(2em) M / a gt.eq 2 \| alpha_i \| . $
  That single scale contributes at least $4 \| alpha_i \|$. Sum over coordinates and then against the nonnegative Fourier weights to obtain (17).
  The half-turn multiplier is zero or four. Its detecting frequencies off $H^perp$ contribute at most $4 sum_(alpha in.not H^perp) omega_alpha$. By (15), the remaining ones contribute at most $\( 4 \/ B \) sum_alpha omega_alpha T \( alpha \)$. The two preceding bounds give (18). Equivalently, the same estimates prove that inequality for each character multiplier separately and then sum it with nonnegative weights. Thus the lemma supplies both the weighted-mass and the termwise-displacement forms of the comparison. ◻
]

The hypothesis (15) is the only arithmetic input to this lemma. We shall prove it from the prime translations of each construction. The inequalities themselves concern averages over all base states; they impose no pointwise condition on individual Fourier weights.

=== 3.5 Prime groups force leaf frequency <prime-groups-force-leaf-frequency>

Return to the value of $M$ and the grid $G$ in (3). Put $r = r_h$, $V = G^r$, $w = 1 / 2 upright(bold(1))$, and $B = \( h \/ 2 \)^h$. For a character $chi_alpha$ choose the centered integer representatives used in Lemma 8.

#thm([Lemma 3.6.])[
  (Frequency branching).  #emph[If $chi_alpha \|_(C_h) = 1$ and $chi_alpha \( w \) eq.not 1$, then 
#[#set math.equation(numbering: n => "(19)")
 $ sum_(i = 1)^r \| alpha_i \| gt.eq B . $ <mask:weight>]

]
] <mask:branching>

#proof[
  View the state coordinates as the leaves of the tree in (5). At a node let $beta$ be the sum of the integer leaf frequencies below it, and at a level-$ell$ node let $beta_(\( k \, b \))$ be its child sums. At this node, the translation defined by a residue vector through the maps $gamma_(ell \, j)$, and set to zero outside the node, belongs to $C_h$ by the independent child summands in (7). Choosing $z_k = 1$ and all other coordinates zero gives the congruences
  #[#set math.equation(numbering: n => "(20)")
   $ beta + sum_(b = 0)^(p_(ell k) - 1) b beta_(\( k \, b \)) equiv 0 med \( mod med p_(ell k) \) #h(2em) \( 1 lt.eq k lt.eq h \) . $ <mask:congruence>]
  They are unchanged if a frequency representative is altered by $M$.
  Suppose the sum in (19) were less than $B$. Every nonzero node sum would have absolute value less than $B$. If $q$ distinct current-level primes divide such a sum, then
  $ h^(3 q) lt.eq \| beta \| < \( h \/ 2 \)^h < h^h \, $
  so $q < h \/ 3$. For every other prime group, (20) forces a nonzero child sum in that group. Each nonzero internal node therefore has at least $h \/ 2$ nonzero children in distinct groups. At the root, the sum is odd because $chi_alpha \( w \) eq.not 1$; parity is well defined since $M$ is even. Iteration gives at least $\( h \/ 2 \)^h$ nonzero integer leaf frequencies, contradicting the assumed total absolute sum. ◻
]

The lemma verifies (15) with $H = C_h$ and $B = \( h \/ 2 \)^h$. Thus every $F : V arrow.r ell_1$ satisfies

#[#set math.equation(numbering: n => "(21)")
 $ Delta_F \( w \) lt.eq 2 bb(E)_(c in C_h) Delta_F \( c \) + 1 / B sum_(i = 1)^r sum_(a in cal(D)_M) M / a Delta_F \( e_i \( a \/ M \) \) . $ <mask:fourier-bound>]

We now have all three ingredients: the pointwise half-turn separation, the pointwise cheap translations, and the averaged $ell_1$ comparison. The tags still use $2 r_h$ letters. The next section supplies the binary substitution, after which Section 5 completes the numerical distortion estimate.

== 4 Two logarithmic-width binary substitutions <p2:sec:binary-coding>

The circle words use tags to prevent matches between different children. We now replace each tagged letter by a binary block. The needed property is a lower bound for the deficit of every pair of equal-length words, with the same block-width factor as the elementary upper bound. This makes the loss in distortion absolute, even as the alphabet grows.

#thm([Theorem 4.1.])[
  (Two binary substitutions).  #emph[Let $cal(A)$ be a finite alphabet with $A gt.eq 2$ letters. Each of the two constructions below gives an integer width $w gt.eq 1$ with $w = O \( log \( 2 A \) \)$, an absolute constant $a > 0$, and a map $c : cal(A) arrow.r { 0 \, 1 }^w$ such that, simultaneously for every integer $L gt.eq 0$ and all $x \, y in cal(A)^L$, 
#[#set math.equation(numbering: n => "(22)")
 $ a w r_L \( x \, y \) lt.eq r_(w L) \( c \( x \) \, c \( y \) \) lt.eq w r_L \( x \, y \) . $ <p2:eq:log-code-deficit>]

 Here $c$ extends to words by concatenation. For arbitrary finite words, 
#[#set math.equation(numbering: n => "(23)")
 $ "ED" \( c \( x \) \, c \( y \) \) lt.eq w "ED" \( x \, y \) . $ <p2:eq:log-code-upper>]

 The code and its width depend only on $cal(A)$, not on $L$.]
] <code:two-proofs>

The two constructions need not give the same code, width, or constant. Either substitution may be used in either circle construction. Their lower bounds imply $\( a \/ 2 \) w "ED" \( x \, y \) lt.eq "ED" \( c \( x \) \, c \( y \) \)$ at equal length, by Lemma 2. The lower assertion is made only at equal input lengths; the upper assertion holds for arbitrary lengths. The case $L = 0$ is immediate. For the upper deficit bound, concatenate the code blocks of a common subsequence. For (23), simulate each letter insertion, deletion, or substitution by at most $w$ bit edits. It remains to prove the lower deficit bound twice.

=== 4.1 What an arbitrary bit matching tells us <what-an-arbitrary-bit-matching-tells-us>

Both proofs use the same elementary loss accounting. Fix an increasing matching between two encoded words of common length $w L$, numbering positions inside each block from $1$ to $w$, and let $E$ be its number of unmatched positions on either side. In source block $i$, let $U_i$ count unmatched positions. If the block has any matches, its target span is the closed interval from its first partner to its last partner; let $V_i$ count the globally unmatched target positions in that interval. For a block without matches put $V_i = 0$.

The target spans of different source blocks are disjoint, since their matches occur in strict order. Also, a matched target position inside one span has its partner in that source block, by monotonicity. Consequently

#[#set math.equation(numbering: n => "(24)")
 $ sum_i U_i = E \, #h(2em) sum_i V_i lt.eq E \, #h(2em) \| upright("target span of ") i \| = w - U_i + V_i $ <p2:eq:code-loss-sums>]

when the span is nonempty. For a threshold $0 < theta < 1$, call block $i$ good if $U_i \, V_i lt.eq theta w$. At most $2 E \/ \( theta w \)$ blocks fail this condition. A good block has a nonempty target span of length at most $\( 1 + theta \) w < 2 w$, so its matches meet at most three target blocks.

For the probabilistic choices below, write $H_2 \( t \) = - t log_2 t - \( 1 - t \) log_2 \( 1 - t \)$ for binary entropy. We use

#[#set math.equation(numbering: n => "(25)")
 $ sum_(j lt.eq t m) binom(m, j) lt.eq 2^(H_2 \( t \) m) #h(2em) \( 0 < t < 1 \/ 2 \) . $ <p2:eq:entropy>]

Indeed, with $z = t \/ \( 1 - t \) < 1$, $\( 1 + z \)^m gt.eq z^(t m) sum_(j lt.eq t m) binom(m, j)$, which rearranges to the display. The indices in the sum are integers.

=== 4.2 Different-label intervals and a common offset <p2:sec:code-offset>

The first code separates sufficiently long intervals of differently labelled codewords. This kind of interval separation already appears in the inner code of Schulman and Zuckerman [14] Section II-C, Condition 2 and Lemma 2. We prove the particular binary property needed here, then use one common offset in every source block to recover a matching of letters.

Choose an integer $m$ and independent uniform binary words of length $m$, one for each letter, and put $u = floor.l m \/ 8 floor.r$. We seek an absolute $delta > 0$ such that every pair of length-$u$ intervals from differently labelled codewords has longest common subsequence at most $\( 1 - delta \) u$.

Choose an absolute $0 < alpha < 1 \/ 2$ with $gamma = 1 - alpha - 2 H_2 \( alpha \) > 0$. For a fixed pair of intervals with different labels, the probability of a common subsequence of length $u - floor.l alpha u floor.r$ is at most

$ binom(u, floor.l alpha u floor.r)^(#h(-0.16667em) 2) 2^(- u + floor.l alpha u floor.r) lt.eq 2^(- gamma u) . $

For fixed index lists the involved bits are independent, giving the probability factor; (25) bounds their number. There are at most $A^2 m^2$ interval pairs. Taking $m$ to be a sufficiently large absolute multiple of $log \( 2 A \)$ makes the total failure probability less than one. For sufficiently large $u$, $u - floor.l alpha u floor.r lt.eq \( 1 - alpha \/ 2 \) u$; absence of a subsequence of the former length therefore permits $delta = alpha \/ 2$. Fix a code with this property. It makes no assertion about two intervals of the same codeword.

Choose a positive absolute $eta < 1$ small enough that, for every permitted width,

#[#set math.equation(numbering: n => "(26)")
 $ 2 eta m < delta floor.l m \/ 8 floor.r . $ <p2:eq:code-offset-parameters>]

For instance choose $eta < delta \/ 100$ first and then increase the minimum width. Fix $x \, y in cal(A)^L$, $L gt.eq 1$, and an optimal encoded matching with deficit $E$. Apply (24) with $w = m$ and call a source block good at threshold $eta$. At most $2 E \/ \( eta m \)$ blocks are not good.

Let $I = { ceil.l m \/ 3 ceil.r \, dots.h \, floor.l 2 m \/ 3 floor.r }$ be the integer middle-third positions. We claim that a matched position in a good block whose relative index lies in $I$ lands in a target block with the same letter label. Let $p$ be its relative source index and $q$ the relative index of its target partner. A length-$u$ interval from $p$ fits in either direction inside the source block. At least one of those directions fits from $q$ inside its target block. Choose that direction on both sides. Put $U = U_i$ and $V = V_i$ for this good source block, and trim the last $V$ source positions from the interval, measured away from the anchor. For any remaining matched position at source distance $k lt.eq u - 1 - V$ from the anchor, its partner is at target distance at most $k + V lt.eq u - 1$. The difference of the two distances is the number of intervening unmatched target positions minus the corresponding source number, and the former is at most $V$. Monotonicity puts the partner on the chosen side. At most $U$ retained source positions are unmatched. Hence the two intervals share a subsequence of length at least

$ u - U - V gt.eq u - 2 eta m > \( 1 - delta \) u . $

The interval property forces equal labels. This argument also applies when $q$ is at an endpoint of the target block.

Choose one offset $p$ uniformly from $I$, using this same $p$ in every source block. The minimum width ensures $\| I \| gt.eq m \/ 4$. Retain each good source block whose position at offset $p$ is matched, and assign it the index of the target block containing that partner. If $B \( p \)$ blocks are omitted, then

#[#set math.equation(numbering: n => "(27)")
 $ bb(E)_p B \( p \) lt.eq frac(2 E, eta m) + frac(E, \| I \|) lt.eq (2 / eta + 4) E / m . $ <p2:eq:code-offset-omissions>]

All retained assignments identify equal labels, and their target indices are nondecreasing. We must count the duplicates before turning them into a strictly increasing letter matching.

For two consecutive retained blocks that were not originally adjacent, charge a duplicate target index to an omitted source block strictly between them. The open source-index gaps of consecutive retained pairs are disjoint, so these duplicates number at most $B \( p \)$.

For originally adjacent blocks $i \, i + 1$, put $d_i = U_i + U_(i + 1)$. Their two positions at a common offset are exactly $m$ apart. If both are matched, their target partners are at least $m - d_i$ apart. If those partners lie in one target block, the first is therefore in its first $d_i$ positions. A good block $i$ meets at most three target blocks, and its distinct source positions have distinct partners. This duplicate event can thus occur for at most $3 d_i$ offsets; it is impossible when $d_i = 0$. Since $sum_(i = 1)^(L - 1) d_i lt.eq 2 E$, the number $D_(upright("adj")) \( p \)$ of these adjacent duplicates satisfies

#[#set math.equation(numbering: n => "(28)")
 $ bb(E)_p D_(upright("adj")) \( p \) lt.eq frac(6 E, \| I \|) lt.eq frac(24 E, m) . $ <p2:eq:code-offset-duplicates>]

Only linearity of expectation is used; duplicate events need not be independent.

In a nondecreasing list, removing one item for each consecutive equality leaves one item for every distinct index. The retained assignments therefore give an increasing equal-letter subsequence after at most $B \( p \) + D_(upright("adj")) \( p \)$ further deletions. Thus $r_L \( x \, y \) lt.eq 2 B \( p \) + D_(upright("adj")) \( p \)$. Taking expectations gives

$ r_L \( x \, y \) lt.eq (4 / eta + 32) E / m . $

This proves the first construction in Theorem 10 with $w = m$ and $a = \( 4 \/ eta + 32 \)^(- 1)$. All constants were chosen before $L$, and the estimate has no additive error depending on $L$.

=== 4.3 Self-overlaps and an anchor at equal relative indices <p2:sec:code-anchor>

The second code controls a different local event. It rules out a long, nearly complete matching between two codeword intervals unless their labels agree and one matched pair has the same index relative to its two block starts. That anchor will put a strict majority of one source block into a single target block, making the recovered letter assignments distinct.

Choose an absolute $epsilon.alt > 0$ with

#[#set math.equation(numbering: n => "(29)")
 $ 2 H_2 \( epsilon.alt \) < 1 / 8 \, #h(2em) epsilon.alt < 1 / 10 . $ <p2:eq:code-anchor-parameters>]

We seek binary codewords of width $M$ with this precise property: every increasing matching of at least $M \/ 4$ pairs between two codewords, omitting at most $epsilon.alt M$ positions in each of its two spanned intervals, has equal labels and contains a pair at equal relative indices. The two codewords may have the same label, so this condition controls shifted self-overlaps as well.

Self-matching is central to synchronization strings [5] Sections 6.1–6.2 of the full version; related local conditions occur in the Hamming-to-edit construction of Bhattacharya et al. [3] Section 2.2. The property just stated is the particular one we need, and the following argument proves it directly.

Choose all code bits independently and uniformly. For a fixed pair of labels, there are at most

$ M^4 (sum_(j lt.eq epsilon.alt M) binom(M, j))^2 lt.eq M^4 2^(2 H_2 \( epsilon.alt \) M) $

candidate index-list pairs: choose four span endpoints and the omitted positions; the remaining increasing lists determine the matching. Counting choices of different list lengths only enlarges the bound.

For different labels, a fixed matching of $q gt.eq M \/ 4$ pairs has equality probability $2^(- q)$. For the same label and no equal-index pair, form a graph on the $M$ independent code bits with one edge for each required equality. It has no loops. Every index occurs at most once in either list, so the degree, counting incidences, is at most two. A repeated unordered edge would require reversed index pairs and violate strict increase; even if double edges were allowed, a nontrivial connected component with $v$ vertices and $e$ edges has $v gt.eq 2$, $e lt.eq v$, and $v - 1 gt.eq e \/ 2$. Equality of all bits in that component imposes $v - 1$ independent binary constraints. The full equality system therefore has rank at least $q \/ 2$, so its probability is at most $2^(- q \/ 2) lt.eq 2^(- M \/ 8)$.

The probability of any violation of the local property is at most

$ A^2 M^4 2^(\( 2 H_2 \( epsilon.alt \) - 1 \/ 8 \) M) . $

By (29), this is less than one for $M$ a sufficiently large absolute multiple of $log \( A + 1 \)$. Fix such codewords.

Now take an optimal matching of $c \( x \) \, c \( y \)$ with deficit $E$, and use (24) with $w = M$ and threshold $epsilon.alt$. At most $2 E \/ \( epsilon.alt M \)$ source blocks are not good. A good block has at least $\( 1 - epsilon.alt \) M$ matches in a span meeting at most three target blocks. One target block receives at least $\( 1 - epsilon.alt \) M \/ 3 gt.eq M \/ 4$ of them. Restrict to matches between this source and target block. A position between the first and last restricted matches on either side, if globally matched, is still in the restricted matching: monotonicity places its partner between the opposite endpoints. Hence the omissions in the two restricted spans are bounded by $U_i \, V_i$. The local property gives equal labels and an anchor at equal relative indices.

Put $b = floor.l epsilon.alt M floor.r$. Both losses of the good block are at most $b$. Measure target indices relative to the fixed start of the chosen target block, even for matches outside it. Relative to the anchor, the displacement of any match from equal relative indices is the difference between the intervening unmatched counts. Its absolute value is at most $2 b$. Every matched source index in ${ 2 b + 1 \, dots.h \, M - 2 b }$ therefore still lands in the chosen target block. At most $b$ of these $M - 4 b$ positions are unmatched. The chosen block receives at least

$ M - 5 b gt.eq \( 1 - 5 epsilon.alt \) M > M \/ 2 $

matches. Two good source blocks cannot choose the same target block, since their matched target positions are disjoint. Their chosen target indices are increasing by monotonicity. The good blocks thus give an equal-letter subsequence, proving

$ r_L \( x \, y \) lt.eq frac(2 E, epsilon.alt M) . $

This is the second construction with $w = M$ and $a = epsilon.alt \/ 2$, completing Theorem 10.

=== 4.4 Relation to the earlier alphabet reduction <relation-to-the-earlier-alphabet-reduction>

The existence order in Theorem 10 has a close predecessor. Theorem 1.1 of the full version of Bhattacharya, Dey, Goldenberg, and Koucký [2] states an alphabet reduction for normalized insertion–deletion distance, with each distance divided by the sum of the lengths of its two arguments. The construction used to prove that theorem is a fixed block substitution $C : cal(A) arrow.r Q^k$ in Section 3.2.1 and Lemma 3.3. With approximation parameter $1 \/ 8$, the target alphabet $Q$ has absolute size $q gt.eq 2$, and $k = O \( log \( 2 A \) \)$. Their stated normalized bounds, applied to that construction, give

#[#set math.equation(numbering: n => "(30)")
 $ 7 / 8 k Delta \( x \, y \) lt.eq Delta \( C \( x \) \, C \( y \) \) lt.eq k Delta \( x \, y \) . $ <code:prior-indel>]

Indeed, the total encoded length is $k \( \| x \| + \| y \| \)$, so the normalizing factor cancels. When both words are empty, the unnormalized inequalities are immediate.

For clarity, here is the elementary binary step in this comparison. Give the $q$ target letters distinct $t = ceil.l log_2 q ceil.r$ bit labels and encode a letter $a$ by $j \( a \) = 11 thin 0 thin a_1 thin 0 dots.h.c a_t thin 0$, of fixed width $v = 2 t + 3$. The string $11$ occurs exactly at a block start. In any increasing bit matching, let $e$ count unmatched positions in the two words together. Then at most $e$ source blocks fail to be fully matched to consecutive target positions: charge a block either to one of its unmatched source bits or, if all its bits are matched, to an unmatched target position skipped between consecutive partners. The charged gaps of different source blocks are disjoint. The same bound holds on the target side. A fully and consecutively matched block begins at a genuine target block start, by the unique $11$, so it matches an entire equal block that is itself good on the target side. Conversely, every good target block is paired this way. The good blocks therefore give a letter matching with total loss at most $2 e$. Minimizing over bit matchings proves

$ 1 / 2 Delta \( u \, z \) lt.eq Delta \( j \( u \) \, j \( z \) \) lt.eq v Delta \( u \, z \) $

for arbitrary finite words; the upper bound simulates letter edits.

The composite $j compose C$ is a single binary substitution of width $w = v k$. Combining this inequality with (30) gives $Delta \( j C \( x \) \, j C \( y \) \) gt.eq \( 7 \/ \( 16 v \) \) w Delta \( x \, y \)$. At equal lengths this is the deficit lower factor $7 \/ \( 16 v \)$, and for ordinary edit distance it gives the lower factor $7 \/ \( 32 v \)$; bitwise simulation gives the upper factor one. This deduction uses the earlier stated theorem and its block construction. The two proofs above establish the stated binary bounds directly and exhibit distinct ways to recover a letter matching.

== 5 The first binary obstruction <sec:mask-binary>

We return to the words $S_h$ and parameters $M \, R \, C_h$ from Section 3; here $w = 1 / 2 upright(bold(1))$ again denotes the half-turn in $G^(r_h)$. The words use an alphabet of size $A = 2 r_h$. Apply the first construction of Theorem 10, with width $b_h lt.eq C log \( 2 A \)$ and lower deficit factor $a_(upright("off")) b_h$, where $a_(upright("off")) > 0$ is absolute. Let $X_h \( v \) = c \( S_h \( v \) \)$ and $n_h = b_h L_h$. The code is fixed for this alphabet and applies at the common length $L_h$.

The code lower bound, word separation, and denominator reset estimate give, for all sufficiently large $h$ and every state $v$,

#[#set math.equation(numbering: n => "(31)")
 $ "ED" \( X_h \( v \) \, X_h \( v + w \) \) gt.eq n_h h^(- 0.75 h) . $ <mask:binary-far>]

Indeed, the normalized deficit before coding is at least $h^(- \( 0.54 + o \( 1 \) \) h)$, and the fixed factor $a_(upright("off"))$ is absorbed by the slack to $0.75$. Simulating each letter edit with at most $b_h$ bit edits in Lemma 4 also gives

#[#set math.equation(numbering: n => "(32)")
 $ "ED" \( X_h \( v \) \, X_h \( v + c \) \) & lt.eq n_h frac(2 h, R) &  & \( c in C_h \) \,\
"ED" \( X_h \( v \) \, X_h \( v + e_i \( a \/ M \) \) \) & lt.eq n_h frac(2 a, M r_h) &  & \( 1 lt.eq a lt.eq M \/ 2 \) . $ <mask:binary-subgroup>]

These bounds hold at every base state. The state map need not be injective; (31) guarantees precisely the distinct pairs needed.

Let $f$ be any embedding of the finite image of $X_h$ into $ell_1$, with distortion $D$. Scale it so that

$ "ED" \( x \, y \) \/ D lt.eq parallel f \( x \) - f \( y \) parallel_1 lt.eq "ED" \( x \, y \) . $

This uses the maximum expansion on the finite image and does not assume that the infimum of distortions is attained. Apply (21) to $F = f compose X_h$. Each coordinate-scale term, after multiplication by $M \/ a$, is at most $2 n_h \/ r_h$. The pointwise edit bounds therefore imply

#[#set math.equation(numbering: n => "(33)")
 $ h^(- 0.75 h) / D lt.eq frac(4 h, R) + frac(2 \| cal(D)_M \|, B) . $ <mask:distortion-estimate>]

Here $\| cal(D)_M \| = O \( log M \)$ and $log M = O \( h^2 log h \)$. Since $R = h^(2 h)$ and $B = \( h \/ 2 \)^h$, the right side is at most $C 2^h h^(- h) h^2 log h$ for large $h$. Hence

#[#set math.equation(numbering: n => "(34)")
 $ D gt.eq c thin 2^(- h) frac(h^(h \/ 4), h^2 log h) gt.eq h^(0.1 h) . $ <mask:distortion>]

Finally $t_ell lt.eq 2 h^4$ gives $log r_h = O \( h log h \)$ and $b_h = O \( h log h \)$. The exact recurrence (6) yields

#[#set math.equation(numbering: n => "(35)")
 $ log n_h = log b_h + log M + sum_(ell = 1)^h \( log R + log P_ell + log t_ell \) lt.eq C_(upright("len")) h^2 log h $ <mask:length-bound>]

with an absolute constant $C_(upright("len"))$. Thus every sufficiently large integer $h$ supplies a binary same-length obstruction with distortion at least $h^(0.1 h)$ and logarithmic length at most $C_(upright("len")) h^2 log h$. After the second construction, Section 7 will convert each such family into witnesses for every sufficiently large cap.

== 6 Excluded-coordinate translations on a finite circle <sec:excluded-coordinate>

We now construct a second family of hard binary words. The parameter is a sufficiently large integer $m$; the eventual distortion is at least $m^(m \/ 4)$, while the logarithm of the word length is $O \( m^2 log m \)$. At each level there is one prime for each of the $m$ child indices. The translation associated with that prime acts on every child except its own. This omission has two uses. A small phase cost will force most translation coordinates to vanish, whereas a frequency annihilating all the translations and detecting the half-turn must have large total absolute leaf frequency. The proof of this frequency bound assumes the total is small and forces branching through too many children. We first prove the phase assertion, then realize it by words and compare it with the frequency assertion.

=== 6.1 The translation pattern and its phase cost <the-translation-pattern-and-its-phase-cost>

Write $bb(T) = bb(R) \/ bb(Z)$ for the circle of circumference one, and let $parallel z parallel_(bb(T))$ denote the distance of $z$ from zero. Set $h = m$. We need $h m = m^2$ primes, all distinct across all levels, satisfying

#[#set math.equation(numbering: n => "(36)")
 $ m^3 < p_(ell \, i) lt.eq m^5 \, #h(2em) 1 lt.eq ell lt.eq h \, quad 1 lt.eq i lt.eq m . $ <eq:exc-primes>]

The following count uses the central binomial coefficient and Legendre’s factorial valuation formula in the manner of Erdős [4], who attributes the underlying ideas to Landau. The central term is the largest of the $2 n + 1$ binomial coefficients summing to $4^n$, so

$ binom(2 n, n) gt.eq frac(4^n, 2 n + 1) . $

In the valuation formula for $binom(2 n, n)$, each term $floor.l 2 n \/ p^j floor.r - 2 floor.l n \/ p^j floor.r$ is zero or one. Thus the exponent of $p$ is at most $floor.l log_p \( 2 n \) floor.r$, and each prime contributes a factor at most $2 n$. Writing $pi \( x \)$ for the number of primes at most $x$, we obtain

$ binom(2 n, n) lt.eq \( 2 n \)^(pi \( 2 n \)) . $

Taking logarithms and then $n = floor.l m^5 \/ 2 floor.r$ gives $pi \( m^5 \) gt.eq c m^5 \/ log m$ for an absolute $c > 0$ and all sufficiently large $m$. Since $pi \( m^3 \) lt.eq m^3$, the interval $\( m^3 \, m^5 \]$ contains at least $m^2$ primes once $m$ is large enough. Fix such a choice.

For each level put

#[#set math.equation(numbering: n => "(37)")
 $ P_ell = product_(i = 1)^m p_(ell \, i) \, #h(2em) u_(ell \, i) \( s \) = s / p_(ell \, i) med \( mod med 1 \) \, #h(2em) c_(ell \, i) \( s \) = sum_(j eq.not i) u_(ell \, j) \( s \) . $ <eq:exc-translations>]

The parameter $s$ is taken modulo $P_ell$. By the Chinese remainder theorem, $\( u_(ell \, i) \( s \) \)_(i = 1)^m$ runs through the full product of the prime-order subgroups. In particular, one coordinate can be prescribed while all the others are set to zero. Each $c_(ell \, i)$ is a homomorphism. If only $u_(ell \, i)$ is nonzero, its value is added to all children except child $i$.

The scalar cost of a phase after $ell$ levels is

#[#set math.equation(numbering: n => "(38)")
 $ rho_0 \( z \) = parallel z parallel_(bb(T)) \, #h(2em) rho_ell \( z \) = min_(s med mod med P_ell) 1 / m sum_(i = 1)^m rho_(ell - 1) #scale(x: 120%, y: 120%)[\(] z + c_(ell \, i) \( s \) #scale(x: 120%, y: 120%)[\)] quad \( 1 lt.eq ell lt.eq h \) . $ <eq:exc-rho>]

These functions are defined on all of $bb(T)$. Each minimum is over a finite set. They are symmetric and subadditive: negate a minimizing parameter for symmetry, and add minimizing parameters for two inputs and use the preceding subadditivity term by term. The zero parameter shows inductively that, for $1 lt.eq ell lt.eq h$,

$ rho_ell \( 0 \) = 0 \, #h(2em) 0 lt.eq rho_ell \( z \) lt.eq rho_(ell - 1) \( z \) lt.eq parallel z parallel_(bb(T)) lt.eq 1 / 2 . $

The next lemma quantifies what the omitted coordinate prevents. Its input phase has a small order relatively prime to the primes still available in the recurrence. The phases followed during the proof can have much larger orders.

#thm([Lemma 6.1.])[
  (Small-order phases remain costly).  #emph[For $0 lt.eq ell lt.eq h$, put 
$ F_ell = m^(- ell \/ 4 - 100 m^(3 \/ 4)) . $

 For all sufficiently large $m$, the following holds for every $0 lt.eq ell lt.eq h$. If $z in bb(T)$ is nonzero, has finite order $q lt.eq m^10$, and satisfies $gcd \( q \, product_(a = 1)^ell P_a \) = 1$, then 
#[#set math.equation(numbering: n => "(39)")
 $ rho_ell \( z \) gt.eq F_ell . $ <eq:exc-phase-lower>]

 The empty product in the case $ell = 0$ is one.]
] <lem:exc-small-cost>

#proof[
  At height zero a nonzero point of order $q$ has distance at least $1 \/ q gt.eq m^(- 10) gt.eq F_0$ for large $m$. Suppose the lemma is known at all heights below $ell gt.eq 1$, and suppose, for a contradiction, that an input as in the statement satisfies $rho_ell \( z \) < F_ell$.
  We record the bounds that will keep a descent through the recurrence under control. Let $a = m^(- 1 \/ 4)$ and $b_t = 4 a^(t + 1)$ for $t gt.eq 0$. For $m gt.eq 32^4$, all $b_t < 1$ and
  #[#set math.equation(numbering: n => "(40)")
   $ log product_(t gt.eq 0) \( 1 - b_t \)^(- 1) & lt.eq sum_(t gt.eq 0) frac(b_t, 1 - b_t) lt.eq frac(4 a, \( 1 - a \) \( 1 - 4 a \)) < log 2 \,\
m sum_(t gt.eq 0) b_t & = frac(4 m^(3 \/ 4), 1 - m^(- 1 \/ 4)) lt.eq 5 m^(3 \/ 4) . $ <eq:exc-product-cost>]
  We will choose phases $z_0 = z \, z_1 \, dots.h \, z_ell$ so that, at time $t$,
  #[#set math.equation(numbering: n => "(41)")
   $ rho_(ell - t) \( z_t \) < F_ell product_(j < t) \( 1 - b_j \)^(- 1) < 2 F_ell . $ <eq:exc-path-invariant>]
  The first inequality holds at $t = 0$ by assumption.
  Suppose $t < ell$ and write $r = ell - t$ for the remaining height. Choose a parameter attaining the minimum in $rho_r \( z_t \)$, abbreviate $u_i = u_(r \, i) \( s \)$, and put $U = sum_i u_i$. Call an index $i$ small when
  $ rho_(r - 1) \( z_t + U - u_i \) < F_(r - 1) \/ 2 . $
  The average of these $m$ costs is less than $2 F_ell$ by (41). Hence the number of indices that are not small is at most
  #[#set math.equation(numbering: n => "(42)")
   $ frac(4 m F_ell, F_(r - 1)) = 4 m^(1 - \( t + 1 \) \/ 4) = m b_t . $ <eq:exc-exception-count>]
  This is at most $4 m^(3 \/ 4)$, so there are at least two small indices for all large $m$.
  If two small indices $i \, j$ had $u_i eq.not u_j$, symmetry and subadditivity would give
  $ rho_(r - 1) \( u_i - u_j \) lt.eq rho_(r - 1) \( z_t + U - u_i \) + rho_(r - 1) \( z_t + U - u_j \) < F_(r - 1) . $
  The difference is nonzero and its order divides $p_(r \, i) p_(r \, j) lt.eq m^10$. That order is relatively prime to $product_(a < r) P_a$, since all level primes are distinct. The induction hypothesis at height $r - 1$ rules out the displayed inequality. Therefore all small indices have the same $u_i$. Two distinct prime-order subgroups of $bb(T)$ intersect only at zero; the presence of two small indices then implies that every small index has $u_i = 0$.
  Let $k_t = \# { i : u_i eq.not 0 }$. We have $k_t lt.eq m b_t < m$. Every zero coordinate gives the same child phase $z_t + U$; choose $z_(t + 1) = z_t + U$. The other costs are nonnegative, so
  #[#set math.equation(numbering: n => "(43)")
   $ rho_(r - 1) \( z_(t + 1) \) lt.eq frac(rho_r \( z_t \), 1 - k_t \/ m) lt.eq frac(rho_r \( z_t \), 1 - b_t) . $ <eq:exc-path-cost>]
  This proves the first inequality of (41) at $t + 1$; its second inequality follows from (40). Thus the descent is justified at every step. It uses fractions from at most
  #[#set math.equation(numbering: n => "(44)")
   $ sum_(t = 0)^(ell - 1) k_t lt.eq m sum_(t gt.eq 0) b_t lt.eq 5 m^(3 \/ 4) $ <eq:exc-denominator-count>]
  distinct level primes, by (40).
  It remains to compare the terminal phase with its cost. Let $Q$ be the product of the primes actually used in the descent. Then $z_ell - z$ has order dividing $Q$, and
  $ q Q lt.eq m^(10 + 25 m^(3 \/ 4)) . $
  The phase $z_ell$ is nonzero. Otherwise the order $q > 1$ of $z$ would divide $Q$, contradicting $gcd \( q \, Q \) = 1$. Since the order of $z_ell$ divides $q Q$, we conclude that
  $ rho_0 \( z_ell \) = parallel z_ell parallel_(bb(T)) gt.eq m^(- 10 - 25 m^(3 \/ 4)) . $
  But (41) gives
  $ rho_0 \( z_ell \) < 2 F_ell = 2 m^(- ell \/ 4 - 100 m^(3 \/ 4)) < m^(- 10 - 25 m^(3 \/ 4)) $
  for sufficiently large $m$, a contradiction. The induction hypothesis was used only for the differences $u_i - u_j$. The selected phases $z_t$ were controlled by their accumulated denominators, without a small-order assumption on them. ◻
]

=== 6.2 Words whose tags preserve the child index <words-whose-tags-preserve-the-child-index>

We now turn the scalar cost into edit separation. Put

#[#set math.equation(numbering: n => "(45)")
 $ L = 2 product_(ell = 1)^h P_ell \, #h(2em) R = m^(2 h) \, #h(2em) Lambda = \[ m \]^h \, #h(2em) G = \( L^(- 1) bb(Z) \/ bb(Z) \)^Lambda . $ <eq:exc-size-parameters>]

The set $Lambda$ indexes the leaves of an $m$-ary tree of height $h$: a node at height $ell$ is a prefix $a in \[ m \]^(h - ell)$, and $a i$ denotes its child obtained by appending $i$. The alphabet is

$ cal(A) = Lambda times { 0 \, dots.h \, L - 1 } times { 0 \, 1 } \, #h(2em) J = \| cal(A) \| = 2 L m^h . $

The first two coordinates are symbol tags. The factor two in $L$ places the half-turn in the phase group, and every translation $c_(ell \, i) \( s \)$ also belongs to this group.

For a state $v in G$ and an auxiliary phase $theta in L^(- 1) bb(Z) \/ bb(Z)$, define $W_a \( v \, theta \)$ recursively. At a leaf $a$, it is the length-$L$ word

#[#set math.equation(numbering: n => "(46)")
 $ W_a \( v \, theta \) = #scale(x: 120%, y: 120%)[\(] a \, b \, upright(bold(1))_(\[ 0 \, 1 \/ 2 \)) \( b \/ L - v_a - theta \) #scale(x: 120%, y: 120%)[\)]_(b = 0)^(L - 1) \, $ <eq:exc-leaf-word>]

where the half-open interval is interpreted on $bb(T)$. At height $ell gt.eq 1$, concatenate the following rows, each consisting of $m$ child words:

#[#set math.equation(numbering: n => "(47)")
 $ W_a \( v \, theta \) = bar.v.double_(s = 0)^(R P_ell - 1) bar.v.double_(i = 1)^m W_(a i) #scale(x: 120%, y: 120%)[\(] v \, theta + c_(ell \, i) \( s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:exc-internal-word>]

The symbol $bar.v.double$ denotes concatenation in the displayed order. All height-$ell$ words have the same length

#[#set math.equation(numbering: n => "(48)")
 $ N_0 = L \, #h(2em) N_ell = m R P_ell N_(ell - 1) . $ <eq:exc-length-recurrence>]

Write $N = N_h$ and $W \( v \) = W_diameter \( v \, 0 \)$. Adding a phase $z$ to every state coordinate below a node has the same effect on its word as replacing $theta$ by $theta + z$: this follows at a leaf from (46), and then at every height from the concatenation.

#thm([Lemma 6.2.])[
  (Separation under arbitrary alignments).  #emph[For every node $a$ at height $0 lt.eq ell lt.eq h$, every $v in G$, and every $theta \, z in L^(- 1) bb(Z) \/ bb(Z)$, 
#[#set math.equation(numbering: n => "(49)")
 $ r_(N_ell) #scale(x: 120%, y: 120%)[\(] W_a \( v \, theta \) \, W_a \( v \, theta + z \) #scale(x: 120%, y: 120%)[\)] gt.eq N_ell 3^(- ell) rho_ell \( z \) . $ <eq:exc-word-separation>]

]
] <lem:exc-alignment>

#proof[
  At a leaf, the position tag $b$ forces a matched symbol to use the same position on both sides. The two half-circle indicators disagree at exactly $2 L parallel z parallel_(bb(T))$ positions. Their deficit is therefore exactly that number, which is at least $L rho_0 \( z \)$.
  Suppose the lemma holds at height $ell - 1$ and fix a longest common subsequence at height $ell$, with deficit $E$. A row in (47) has $m$ children of length $N_(ell - 1)$. Because every symbol carries its leaf tag, a match between these two node words preserves the child index $i$. We verify the nonsplit-row hypothesis of Lemma 3.
  Suppose all matches from a source row with parameter $s$ lie in a target row with parameter $s'$. Within child $i$ they form a matching of two full child words whose phase difference is $z + c_(ell \, i) \( s' - s \)$. By induction, the number of unmatched source positions in that child is at least
  $ N_(ell - 1) 3^(- \( ell - 1 \)) rho_(ell - 1) #scale(x: 120%, y: 120%)[\(] z + c_(ell \, i) \( s' - s \) #scale(x: 120%, y: 120%)[\)] . $
  Summing over $i$ and using (38), the source row loses at least the fraction
  $ A = 3^(- \( ell - 1 \)) rho_ell \( z \) $
  of its positions. A row with no matches loses every position and satisfies the same estimate. Here $0 lt.eq A lt.eq 1 \/ 2$. Lemma 3, with $t = m$ and child length $N_(ell - 1)$, now gives
  $ E gt.eq frac(A N_ell, 1 + m A \/ \( m - 1 \)) gt.eq frac(A N_ell, 3) . $
  For the last inequality we used $m \/ \( m - 1 \) lt.eq 2$ and $A lt.eq 1$. This is (49). Lemma 3 applies to the chosen arbitrary matching; in particular it permits different nonsplit source rows to use the same target row. ◻
]

Let $w_(*) in G$ have every coordinate equal to $1 \/ 2$. All primes in (36) are odd. The phase $1 \/ 2$ has order two, so Lemmas 11 and 12, together with the phase identity for node words, give the pointwise bound

#[#set math.equation(numbering: n => "(50)")
 $ r_N #scale(x: 120%, y: 120%)[\(] W \( v \) \, W \( v + w_(*) \) #scale(x: 120%, y: 120%)[\)] gt.eq N 3^(- h) F_h #h(2em) \( v in G \) . $ <eq:exc-halfturn>]

=== 6.3 Cheap translations and the binary transfer <cheap-translations-and-the-binary-transfer>

For a node $a$ at height $ell gt.eq 1$ and $s med mod med P_ell$, define $tau_(a \, s) in G$ by

$ \( tau_(a \, s) \)_b = cases(delim: "{", c_(ell \, i) \( s \) \, & upright("if the leaf ") b upright(" has prefix ") a i \,, 0 \, & upright("if ") b upright(" is outside the subtree below ") a .) $

Let $H lt.eq G$ be the subgroup generated by these vectors over all internal nodes. At each fixed node, $s mapsto tau_(a \, s)$ is a homomorphism.

Fix one height $ell$ and choose one translation at each node of that height. In an occurrence of $W_a \( v \, theta \)$, adding $tau_(a \, s)$ replaces row parameter $t$ by $t + s$ in (47). The row list has period $P_ell$ and repeats it $R$ times. Choose $0 lt.eq s < P_ell$. Deleting the first $s$ rows from the unshifted list and the last $s$ rows from the shifted list leaves identical words. The edit cost in this occurrence is at most

$ 2 s thin m N_(ell - 1) lt.eq frac(2 N_ell, R) . $

At a fixed height the node occurrences partition the root word. The combined cost for all nodes at that height is therefore at most $2 N \/ R$. Every element of $H$ is a sum of at most $h$ such single-height translations: $G$ is abelian, sums at one node combine to one parameter, and the nodes can then be grouped by height. The edit estimate holds for every state and every ancestor phase. Applying it at each intermediate state and using the triangle inequality gives

#[#set math.equation(numbering: n => "(51)")
 $ "ED" #scale(x: 120%, y: 120%)[\(] W \( v \) \, W \( v + u \) #scale(x: 120%, y: 120%)[\)] lt.eq frac(2 h N, R) #h(2em) \( v in G \, med u in H \) . $ <eq:exc-cheap-subgroup>]

For a leaf $a in Lambda$, write $z e_a$ for the state vector with value $z$ at $a$ and zero elsewhere. This shift changes exactly $2 L parallel z parallel_(bb(T))$ symbols in every occurrence of that leaf word. Each branching has $m$ equally long children, so the occurrences of a fixed leaf occupy the fraction $m^(- h)$ of the root word. Substituting only the changed symbols yields

#[#set math.equation(numbering: n => "(52)")
 $ "ED" #scale(x: 120%, y: 120%)[\(] W \( v \) \, W \( v + z e_a \) #scale(x: 120%, y: 120%)[\)] lt.eq frac(2 N, m^h) parallel z parallel_(bb(T)) . $ <eq:exc-cheap-coordinate>]

This holds for every $v in G$, $z in L^(- 1) bb(Z) \/ bb(Z)$, and $a in Lambda$.

Apply the second construction of Theorem 10, proved using anchors at equal relative indices in Section 4.3, to $cal(A)$. It gives one code $cal(C) : cal(A) arrow.r { 0 \, 1 }^w$ with $w lt.eq C_(upright("code")) log \( 2 J \)$ and an absolute $eta > 0$. Its exact estimates are

#[#set math.equation(numbering: n => "(53)")
 $ r_(w q) \( cal(C) x \, cal(C) y \) & gt.eq eta w r_q \( x \, y \) &  & \( x \, y in cal(A)^q \) \,\
"ED" \( cal(C) x \, cal(C) y \) & lt.eq w "ED" \( x \, y \) . $ <eq:exc-code-interface>]

The lower estimate holds simultaneously at every common length $q gt.eq 0$, with the code fixed before $q$ is chosen; the upper estimate holds for arbitrary finite words. Here we use the lower estimate at the common length $N$.

Set $X \( v \) = cal(C) W \( v \)$ and $n_(*) = w N$. The metric comparison $r_(n_(*)) lt.eq "ED"$ from Lemma 2, the code estimates, and (50)–(52) give

#[#set math.equation(numbering: n => "(54)")
 $ frac("ED" \( X \( v \) \, X \( v + w_(*) \) \), n_(*)) & gt.eq eta 3^(- h) F_h \,\
frac("ED" \( X \( v \) \, X \( v + u \) \), n_(*)) & lt.eq frac(2 h, R) \,\
frac("ED" \( X \( v \) \, X \( v + z e_a \) \), n_(*)) & lt.eq 2 / m^h parallel z parallel_(bb(T)) . $ <eq:exc-binary-far>]

All three inequalities hold for every $v in G$. The second holds for every $u in H$, and the third for every $z in L^(- 1) bb(Z) \/ bb(Z)$ and $a in Lambda$. In particular, each half-turn pair consists of distinct words; other repetitions among the state images are allowed.

=== 6.4 Large total leaf frequency <large-total-leaf-frequency>

It remains to show that the cheap translations prevent an $ell_1$ map from preserving the half-turn distance. Write characters of $G$ as

$ chi_xi \( v \) = exp #h(-0.16667em) (2 pi upright(i) sum_(a in Lambda) xi_a v_a) \, #h(2em) xi in \( bb(Z) \/ L bb(Z) \)^Lambda . $

For each coordinate choose an integer representative of minimum absolute value, with either sign allowed in a tie, and put

#[#set math.equation(numbering: n => "(55)")
 $ T \( xi \) = sum_(a in Lambda) \| xi_a \| . $ <eq:exc-frequency-size>]

Thus $T$ records the total magnitude of the leaf frequencies. Let $H^perp = { xi : chi_xi \( u \) = 1 upright(" for every ") u in H }$.

#thm([Lemma 6.3.])[
  (Annihilating frequencies that detect the half-turn).  #emph[If $xi in H^perp$ and $chi_xi \( w_(*) \) eq.not 1$, then 
#[#set math.equation(numbering: n => "(56)")
 $ T \( xi \) gt.eq K \, #h(2em) K = m^(3 h \/ 4) . $ <eq:exc-annihilator-threshold>]

]
] <lem:exc-annihilator>

#proof[
  For each node $a$, let $t_a$ be the sum of the chosen integer representatives over all leaves below $a$. Thus $t_a = xi_a$ at a leaf, and $t_a = sum_i t_(a i)$ at an internal node. At height $ell$, the Chinese remainder theorem permits a parameter with $u_(ell \, i) = 1 \/ p_(ell \, i)$ and all other $u_(ell \, j) = 0$. Its node translation adds $1 \/ p_(ell \, i)$ to every child other than $i$. Since $xi$ annihilates this translation,
  #[#set math.equation(numbering: n => "(57)")
   $ t_a - t_(a i) equiv 0 med \( mod med p_(ell \, i) \) #h(2em) \( 1 lt.eq i lt.eq m \) . $ <eq:exc-annihilator-congruence>]
  This congruence is independent of the integer lifts because every $p_(ell \, i)$ divides $L$.
  The half-turn satisfies $chi_xi \( w_(*) \) = \( - 1 \)^(t_diameter)$. Consequently the root sum is odd and is nonzero. Suppose that $T \( xi \) < K$. Every node sum has absolute value at most $T \( xi \)$, hence less than $K$. At a node with $t_a eq.not 0$, let $q$ be the number of its level primes dividing $t_a$. If $q > 0$, distinctness and (36) give
  $ m^(3 q) < product_(p_(ell \, i) divides t_a) p_(ell \, i) lt.eq \| t_a \| < m^(3 h \/ 4) . $
  Thus $q < h \/ 4$; the same inequality is immediate when $q = 0$. For every other child, (57) forces $t_(a i) eq.not 0$. Since $h = m$, each nonzero internal node has at least $3 m \/ 4$ nonzero children. Starting with the root, this gives at least $\( 3 m \/ 4 \)^h$ nonzero leaf coefficients. These are nonzero integers, so
  $ T \( xi \) gt.eq \( 3 m \/ 4 \)^h gt.eq m^(3 h \/ 4) = K $
  for all sufficiently large $m$, a contradiction. ◻
]

=== 6.5 The distortion and length estimates <the-distortion-and-length-estimates>

Let $f$ be any injection of the finite set $X \( G \)$ into $ell_1$, with distortion $D$. Rescale it by its contraction factor so that

#[#set math.equation(numbering: n => "(58)")
 $ "ED" \( x \, y \) lt.eq parallel f \( x \) - f \( y \) parallel_1 lt.eq D "ED" \( x \, y \) #h(2em) \( x \, y in X \( G \) \) . $ <eq:exc-normalization>]

This applies to each injection individually. Put $g \( v \) = f \( X \( v \) \) \/ n_(*)$ and, using uniform measure on $G$, define

$ cal(E) \( u \) = bb(E)_(v in G) parallel g \( v + u \) - g \( v \) parallel_1 . $

The cut–Fourier representation in Lemma 8 provides nonnegative weights $omega_xi$ such that

#[#set math.equation(numbering: n => "(59)")
 $ cal(E) \( u \) = sum_xi omega_xi \| 1 - chi_xi \( u \) \|^2 . $ <eq:exc-fourier-energy>]

The lemma applies with period $L$, $m^h$ coordinates, subgroup $H$, and threshold $K$ by Lemma 13. Its representation and intermediate weight estimates use normalized counting measure and also apply when the target $ell_1$ has infinitely many coordinates.

We spell out the two resulting bounds on frequency mass. Let $cal(D)_L = { 1 \, 2 \, 4 \, dots.h } ∩ \[ 1 \, L \/ 2 \]$. For every $s in cal(D)_L$, (58) and (54) imply

$ L / s sum_(a in Lambda) cal(E) \( \( s \/ L \) e_a \) lt.eq L / s thin m^h frac(2 D, m^h) s / L = 2 D . $

The weighted estimate in Lemma 8 therefore gives

#[#set math.equation(numbering: n => "(60)")
 $ 4 sum_xi omega_xi T \( xi \) & lt.eq sum_(s in cal(D)_L) L / s sum_(a in Lambda) cal(E) \( \( s \/ L \) e_a \)\
 & lt.eq 2 D \| cal(D)_L \| lt.eq C D log \( L + 1 \) . $ <eq:exc-weighted-mass>]

In particular $sum_xi omega_xi T \( xi \) lt.eq C D log \( L + 1 \)$ after adjusting the absolute constant. The subgroup identity in that lemma, together with (54), gives

#[#set math.equation(numbering: n => "(61)")
 $ sum_(xi in.not H^perp) omega_xi = 1 / 2 bb(E)_(u in H) cal(E) \( u \) lt.eq frac(D h, R) . $ <eq:exc-off-annihilator>]

This is the uniform average on the finite subgroup $H$ itself.

The half-turn multiplier in (59) equals four when $t_diameter$ is odd and zero otherwise. A detecting frequency inside $H^perp$ has $T \( xi \) gt.eq K$, whereas (61) controls all frequencies outside $H^perp$. Using also the noncontracting half-turn bound from (54), we obtain

#[#set math.equation(numbering: n => "(62)")
 $ eta 3^(- h) F_h & lt.eq cal(E) \( w_(*) \)\
 & lt.eq 4 sum_(xi in.not H^perp) omega_xi + 4 / K sum_xi omega_xi T \( xi \)\
 & lt.eq C D (h / R + frac(log \( L + 1 \), K)) . $ <eq:exc-final-energy>]

Thus the separation in the word metric and the branching of frequencies have now been compared using the same finite subgroup.

The prime bounds give

#[#set math.equation(numbering: n => "(63)")
 $ log L lt.eq log 2 + 5 h m log m . $ <eq:exc-logL>]

With $h = m$, $R = m^(2 h)$, and $K = m^(3 h \/ 4)$, the term $h \/ R$ in (62) is bounded by $log \( L + 1 \) \/ K$ for all large $m$. Since $F_h = m^(- h \/ 4 - 100 m^(3 \/ 4))$, it follows that

#[#set math.equation(numbering: n => "(64)")
 $ D gt.eq c eta thin frac(3^(- m) m^(m \/ 2 - 100 m^(3 \/ 4)), log \( L + 1 \)) $ <eq:exc-distortion-explicit>]

for an absolute $c > 0$. The logarithm of the right side, divided by $m log m$, tends to $1 \/ 2$: the losses contribute $100 m^(- 1 \/ 4)$, $log 3 \/ log m$, and a term tending to zero by (63). Therefore, after increasing an absolute threshold,

#[#set math.equation(numbering: n => "(65)")
 $ D gt.eq m^(m \/ 4) #h(2em) \( m gt.eq m_0 \) . $ <eq:exc-distortion-power>]

Because $f$ was arbitrary, this is a distortion lower bound for the finite set $X \( G \)$.

Finally, (45) and (48) give the exact root length

$ N = L product_(ell = 1)^h \( m R P_ell \) = L^2 / 2 \( m R \)^h . $

Consequently

$ log N lt.eq 12 m^2 log m + m log m + log 2 . $

Also $J = 2 L m^h$ and $w lt.eq C_(upright("code")) log \( 2 J \)$, so $log w = O \( log m \)$. Hence, for an absolute $C_0$,

#[#set math.equation(numbering: n => "(66)")
 $ log n_(*) = log \( w N \) lt.eq C_0 m^2 log m #h(2em) \( m gt.eq m_0 \) . $ <eq:exc-binary-length>]

We have obtained these binary same-length witnesses for every sufficiently large integer $m$. Section 7 applies its direct all-length inversion to (65) and (66), yielding a witness of one length at most each sufficiently large cap.

== 7 Every length cap and every finite alphabet <sec:assembly>

Each lower construction supplies binary words of one common length for every sufficiently large integer value of its parameter. We now choose that parameter directly from an arbitrary length cap. This avoids any need to compare successive witness lengths.

#thm([Lemma 7.1.])[
  (All-length inversion).  #emph[Let $c_0 \, C_0 > 0$ be fixed. Suppose that for every sufficiently large integer $k$ there is an integer $n_k gt.eq 1$ and a finite subset of ${ 0 \, 1 }^(n_k)$ whose least $ell_1$ distortion is at least $exp \( c_0 k log k \)$, where $log n_k lt.eq C_0 k^2 log k$. Then there are constants $c > 0$ and $d_0$, depending only on $c_0 \, C_0$ and the starting threshold, such that for every integer $d gt.eq d_0$ a binary subset of one length at most $d$ has distortion at least $exp \( c sqrt(log d thin log log d) \)$.]
] <assembly:inversion>

#proof[
  Put $t = log d$ and choose a fixed $a > 0$ with $C_0 a^2 lt.eq 1 \/ 2$. Set $k = floor.l a sqrt(t \/ log t) floor.r$. For sufficiently large $t$, this is above the construction threshold and satisfies $k gt.eq \( a \/ 2 \) sqrt(t \/ log t)$, $log k gt.eq \( 1 \/ 3 \) log t$, and $k lt.eq t$. Therefore
  $ log n_k lt.eq C_0 k^2 log k lt.eq C_0 a^2 t lt.eq t \/ 2 < t \, #h(2em) k log k gt.eq \( a \/ 6 \) sqrt(t log t) . $
  The first inequality puts the witness below the cap; the second gives the asserted distortion. ◻
]

For the reset construction, use (34) and (35) with $k = h$. For the excluded-coordinate construction, use (65) and (66) with $k = m$. Each separately satisfies the lemma. Restricting a map on ${ 0 \, 1 }^(lt.eq d)$ to either hard subset proves the binary lower bound for every sufficiently large $d$.

A binary subalphabet is isometric for ordinary edit distance inside any larger alphabet. One inequality follows by using a binary edit script. For the reverse one, project all extra alphabet symbols to either binary symbol and apply this projection to an ambient edit script. Each edit projects to one edit or no change, while the binary endpoints remain fixed. Thus the same lower bound holds for every finite alphabet with at least two letters, with constants independent of its size.

Theorem 8.1 in the next section supplies the upper bound on the whole length-capped space, completing Theorem 1. Its fresh-symbol padding serves a different purpose from the binary code transfers: the latter are applied only at equal lengths, while the upper map must compare every pair of shorter words simultaneously.

== 8 An alphabet-uniform embedding by substring histograms <upper:section>

We now construct an embedding on the whole set of words of bounded length. For a finite alphabet $Sigma$, let $Sigma^(lt.eq d)$ include all words of length at most $d$, including the empty word. Write $"ED" \( x \, y \)$ for the minimum number of single-symbol insertions, deletions, and substitutions taking $x$ to $y$, each at unit cost. Intermediate words may have arbitrary length. All logarithms in this section are natural.

#thm([Theorem 8.1.])[
  (Uniform upper bound).  #emph[ There are absolute constants $C > 0$ and $d_0 gt.eq 3$ such that, for every finite alphabet $Sigma$ with $\| Sigma \| gt.eq 2$ and every integer $d gt.eq d_0$, there are an integer $M gt.eq 1$ and a deterministic map $F : Sigma^(lt.eq d) arrow.r ell_1^M$ satisfying 
$ "ED" \( x \, y \) lt.eq parallel F \( x \) - F \( y \) parallel_1 lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C sqrt(log d thin log log d) #scale(x: 120%, y: 120%)[\)] "ED" \( x \, y \) #h(2em) \( x \, y in Sigma^(lt.eq d) \) . $

 Here $ell_1^M$ is real, and both $C$ and $d_0$ are independent of $Sigma$.]
] <upper:uniform>

The construction develops the block-and-shift recursion of Ostrovsky and Rabani [12]. They compare multisets of overlapping shifted substrings using embeddings of shorter strings, and their introduction also identifies extensions to larger alphabets and varying lengths. We give the estimates for these extensions explicitly.

The recursive step represents a block by lists of overlapping windows. After embedding the shorter windows, we record how many of them fall in each part of a random partition. Averaging over every partition outcome gives one deterministic $ell_1$ map. A pair of distant blocks has a scale at which every cross-pair of windows is distant, so their histograms are often disjoint. For expansion, a deletion followed by an insertion shifts most blocks by one position, allowing most windows to be paired identically. These observations prove the theorem first at power lengths. We then construct a map using the actual window lengths and analyze its expansion both through an arbitrary longest common subsequence and through moves. A final variant uses total variation in the power-length recursion.

=== 8.1 Subsequence deficits and local moves <subsequence-deficits-and-local-moves>

A common subsequence is an increasing matching of equal symbols; its maximum size is $"LCS" \( x \, y \)$. For arbitrary words put

$ q \( x \, y \) = max \( \| x \| \, \| y \| \) - "LCS" \( x \, y \) \, $

and for words of the same length $n$ put $r_n \( x \, y \) = n - "LCS" \( x \, y \)$. Thus $r_n$ counts the unmatched positions on either one side of a longest common subsequence.

#thm([Lemma 8.2.])[
  (Metric comparisons).  #emph[Let $Delta \( x \, y \)$ be the minimum number of insertions and deletions when substitutions are forbidden. For all finite words, 
$ Delta \( x \, y \) = \| x \| + \| y \| - 2 "LCS" \( x \, y \) \, #h(2em) "ED" \( x \, y \) lt.eq Delta \( x \, y \) lt.eq 2 "ED" \( x \, y \) \, $

 and 
#[#set math.equation(numbering: n => "(67)")
 $ q \( x \, y \) lt.eq "ED" \( x \, y \) lt.eq 2 q \( x \, y \) . $ <upper:unequal-comparison>]

 In particular, for $\| x \| = \| y \| = n$, 
#[#set math.equation(numbering: n => "(68)")
 $ r_n \( x \, y \) = 1 / 2 Delta \( x \, y \) \, #h(2em) r_n \( x \, y \) lt.eq "ED" \( x \, y \) lt.eq 2 r_n \( x \, y \) . $ <upper:deficit-comparison>]

]
] <upper:metric>

#proof[
  In a script of $k$ edits, at least $\| x \| - k$ original symbols survive unchanged and in order. Applying this also to the reverse script gives $q \( x \, y \) lt.eq k$. Deleting the letters outside a longest common subsequence and inserting the missing target letters uses $\| x \| + \| y \| - 2 "LCS" \( x \, y \) lt.eq 2 q \( x \, y \)$ edits. Conversely, the survivors of any insertion–deletion script form a common subsequence, so that script has at least this many edits. This proves the formula for $Delta$. Ordinary edits allow insertions and deletions, while replacing each substitution by one deletion and one insertion proves the factor-two comparison. These alignment identities are the insertion–deletion specialization of the trace formulation of Wagner and Fischer [15] Sections 3 and 5. ◻
]

#thm([Lemma 8.3.])[
  (Moves and their restrictions).  #emph[Two words of length $n gt.eq 0$ can be joined by exactly $r_n \( x \, y \)$ moves, each deleting one symbol and inserting one symbol while preserving length $n$. For a single move, restrictions to any common interval of $a$ positions have deficit at most one, and hence edit distance at most two.]
  #emph[For a fixed partition of the positions into nonempty consecutive blocks, at most two blocks contain a deletion or insertion endpoint. In any other block of length $m$, the two subwords agree, or the prefix of length $m - 1$ of one agrees with the suffix of length $m - 1$ of the other.]
] <upper:move>

#proof[
  Protect the occurrences of a longest common subsequence in $x$, labeling them by their positions in $y$. Delete an unprotected symbol and insert a missing target symbol in its prescribed order among the protected ones, then protect it. After $r_n \( x \, y \)$ repetitions every target position is protected, and the word is $y$.
  For one move, let $p$ be its deleted position in $x$ and $q$ its inserted position in $y$. If $p < q$, positions outside $\[ p \, q \]$ match identically, while positions $p + 1 \, dots.h \, q$ of $x$ match positions $p \, dots.h \, q - 1$ of $y$. Restricting this matching to the same interval on both sides loses at most one position on each side, so its size is at least $a - 1$. Interchanging the words handles $p > q$; when $p = q$ only one position changes. The same description shows that a block avoiding both endpoints is unchanged or shifted by one position, in the precise sense stated. ◻
]

#thm([Lemma 8.4.])[
  (Common and fresh suffixes).  #emph[For equal-length words $u \, v$ of length $m$ and any common suffix $z$, 
#[#set math.equation(numbering: n => "(69)")
 $ r_(m + \| z \|) \( u z \, v z \) = r_m \( u \, v \) . $ <upper:common-suffix>]

 If $*$ occurs in neither $x$ nor $y$, and $N gt.eq max \( \| x \| \, \| y \| \)$, then, writing $hat(x) = x *^(N - \| x \|)$ and $hat(y) = y *^(N - \| y \|)$, 
#[#set math.equation(numbering: n => "(70)")
 $ "LCS" \( hat(x) \, hat(y) \) = "LCS" \( x \, y \) + N - max \( \| x \| \, \| y \| \) \, #h(2em) r_N \( hat(x) \, hat(y) \) = q \( x \, y \) . $ <upper:fresh-padding>]

 The second identity includes empty inputs.]
] <upper:padding>

#proof[
  An optimal subsequence matching of two words ending in the same symbol can be chosen to match their last positions. If an optimal matching uses either last position, its last such pair can be replaced by the pair of last positions; if it uses neither, that pair can be appended. Removing the final pair shows $"LCS" \( u a \, v a \) lt.eq 1 + "LCS" \( u \, v \)$. Appending the pair to an optimal matching of the prefixes proves the reverse inequality. Iteration over $z$ proves (69).
  For fresh-symbol padding, matched original symbols form a common subsequence of $x \, y$, and matched $*$ symbols form a final part of size at most $min \( N - \| x \| \, N - \| y \| \)$. These two maxima are attained consecutively. Their sum gives (70). ◻
]

The recursion at equal lengths will use a common suffix with arbitrary symbols. The final passage to varying lengths will use the fresh symbol in (70).

=== 8.2 A finite histogram component <a-finite-histogram-component>

The next construction turns a distance between shorter words into a distance between lists of such words. We use the standard cut representation of finite $ell_1$ metrics [9] Section 4. The proof below includes the summability needed when the original target has infinitely many coordinates.

#thm([Lemma 8.5.])[
  (Finite random partitions).  #emph[Let $X$ be finite and $rho \( u \, v \) = parallel f \( u \) - f \( v \) parallel_1$ for a map $f : X arrow.r ell_1$ into real sequence space. For every $alpha > 0$ there is a probability distribution with finite support on partitions $pi$ of $X$ such that 
#[#set math.equation(numbering: n => "(71)")
 $ Pr \[ pi \( u \) = pi \( v \) \] = e^(- alpha rho \( u \, v \)) . $ <upper:collision>]

 Here $pi \( u \)$ denotes the part containing $u$. For a finite list $L$ in $X$, let $H_L^pi$ be its count vector on the parts of $pi$, with repetitions counted. Then 
#[#set math.equation(numbering: n => "(72)")
 $ cal(H)_alpha \( L \) = xor.big_pi Pr \[ pi \] thin H_L^pi $ <upper:histogram-map>]

 is a deterministic finite-dimensional map whose distance equals $bb(E) parallel H_L^pi - H_(L')^pi parallel_1$.]
] <upper:partitions>

#proof[
  For real $a \, b$, $\| a - b \| = integral_(bb(R)) \| upright(bold(1))_(a > t) - upright(bold(1))_(b > t) \| thin d t$. Apply this to every coordinate of $f$ and group the threshold cuts by the subset of $X$ they select. After discarding the empty and full cuts,
  $ rho \( u \, v \) = sum_(diameter eq.not A subset.neq X) a_A \| upright(bold(1))_A \( u \) - upright(bold(1))_A \( v \) \| \, #h(2em) a_A gt.eq 0 . $
  Every nontrivial cut separates some unordered pair. Consequently $sum_A a_A lt.eq sum_({ u \, v } subset X) rho \( u \, v \) < oo$. This also justifies the grouping when $f$ has infinitely many coordinates; all sums and integrals are nonnegative, and there are only finitely many subsets of $X$.
  Select each cut $A$ independently with probability $1 - e^(- alpha a_A)$, and partition $X$ by the membership bits in the selected cuts. Points $u \, v$ share a part exactly when no separating cut is selected. Taking the product of these probabilities gives (71). There are finitely many cut selections. Finally, additivity of the $ell_1$ norm on disjoint coordinates proves the distance identity for (72). ◻
]

#thm([Lemma 8.6.])[
  (Histogram estimates).  #emph[Let $s gt.eq 1$ be an integer and let $L \, L'$ be lists of size $s$ in the set of Lemma 19, and set $T = bb(E) parallel H_L^pi - H_(L')^pi parallel_1$. If every cross-pair has $rho$-distance at least $a$, then 
#[#set math.equation(numbering: n => "(73)")
 $ T gt.eq 2 s \( 1 - s^2 e^(- alpha a) \) . $ <upper:histogram-lower>]

 If a pairing of list occurrences leaves $t$ occurrences unpaired on each side, then 
#[#set math.equation(numbering: n => "(74)")
 $ T lt.eq 2 t + 2 sum_(\( u \, v \) med upright("paired")) \( 1 - e^(- alpha rho \( u \, v \)) \) lt.eq 2 t + 2 alpha sum_(\( u \, v \) med upright("paired")) rho \( u \, v \) . $ <upper:coupling>]

 Writing $P_L^pi = H_L^pi \/ s$ and $"TV" \( P \, Q \) = 1 / 2 parallel P - Q parallel_1$, the exact normalizations are 
#[#set math.equation(numbering: n => "(75)")
 $ parallel H_L^pi - H_(L')^pi parallel_1 = s parallel P_L^pi - P_(L')^pi parallel_1 = 2 s thin "TV" \( P_L^pi \, P_(L')^pi \) . $ <upper:normalizations>]

]
] <upper:histogram>

#proof[
  The probability of any cross-collision is at most $s^2 e^(- alpha a)$ by a union bound. With no cross-collision the two count vectors have disjoint supports and mass $s$ each, hence distance $2 s$. This proves (73). For the upper bound, each unpaired occurrence costs one in the triangle inequality. A paired pair costs two if its parts differ and zero otherwise. Take expectations using (71) and then use $1 - e^(- z) lt.eq z$ for $z gt.eq 0$. The normalization identities follow from the definitions. ◻
]

Thus a lower estimate for one component follows from separation of all cross-pairs, while an upper estimate follows from a pairing of occurrences. Both estimates concern the same map (72), whose partition distribution is fixed on the full finite domain before any pair of input words is considered.

=== 8.3 Power lengths and count histograms <upper:powers>

#proof[
  Fix integers $b gt.eq 2$ and $H gt.eq 1$, put $n = b^H$, and fix a nonempty finite alphabet $Gamma$. We construct maps $F_k$ at lengths $b^k$, $0 lt.eq k lt.eq H$, with
  #[#set math.equation(numbering: n => "(76)")
   $ r_(b^k) \( x \, y \) lt.eq parallel F_k \( x \) - F_k \( y \) parallel_1 lt.eq Lambda_k r_(b^k) \( x \, y \) . $ <upper:power-normalization>]
  At length one, $a mapsto 1 / 2 e_a$ has distance exactly $r_1$, so $Lambda_0 = 1$.
  Index positions from zero and write $x_(\[ a \, b \))$ for the subword in positions $a \, dots.h \, b - 1$. Suppose $1 lt.eq k lt.eq H$, set $m = b^(k - 1)$ and $N = b m$, and assume (76) at level $k - 1$. Split each length-$N$ word into $b$ consecutive blocks of length $m$. At each dyadic scale $s lt.eq m$, block $j$ supplies the list
  $ W_(j \, s) \( x \) = #scale(x: 120%, y: 120%)[\(] x_(\[ j m + r \, thin j m + r + m - s + 1 \)) #scale(x: 120%, y: 120%)[\)]_(r = 0)^(s - 1) \, #h(2em) 0 lt.eq j < b . $
  These are its $s$ windows of length $m - s + 1$, counted with multiplicity. Choose one fixed suffix $z_s in Gamma^(s - 1)$ and embed a window $u$ by $F_(k - 1) \( u z_s \)$. By (69), the resulting distance $rho_s$ satisfies
  $ r_(m - s + 1) \( u \, v \) lt.eq rho_s \( u \, v \) lt.eq Lambda_(k - 1) r_(m - s + 1) \( u \, v \) . $
  Apply Lemma 19 on the full domain $Gamma^(m - s + 1)$ at rate
  #[#set math.equation(numbering: n => "(77)")
   $ alpha_s = frac(4 log \( s + 1 \), s) . $ <upper:lambda-local>]
  Let $T_(j \, s) \( x \, y \)$ be the expected count-histogram distance of the two lists, and let $T_(k \, s) = sum_j T_(j \, s)$. Define $F_k$ as four times the direct sum of these histogram maps over $j$ and $s$. Thus
  $ parallel F_k \( x \) - F_k \( y \) parallel_1 = 4 sum_s T_(k \, s) \( x \, y \) . $
  Every map in this construction is finite-dimensional, since each level takes a finite direct sum of the maps in Lemma 19.
  ===== 8.3.1 Separation. <separation.>
  Suppose corresponding blocks have deficit $q > 0$. The largest dyadic integer $s lt.eq \( q + 1 \) \/ 2$ is available and satisfies
  #[#set math.equation(numbering: n => "(78)")
   $ frac(q + 1, 4) < s lt.eq frac(q + 1, 2) \, #h(2em) s gt.eq q / 4 . $ <upper:power-scale>]
  Every cross-pair $u \, v$ of their windows satisfies
  $ r_(m - s + 1) \( u \, v \) gt.eq \( m - s + 1 \) - "LCS" \( upright("the two full blocks") \) = q - s + 1 gt.eq s . $
  The union bound in (73) is therefore at most $s^2 \/ \( s + 1 \)^4 lt.eq 1 \/ 2$, and this component is at least $s gt.eq q \/ 4$. Common subsequences chosen separately in the blocks concatenate, so the sum of their deficits is at least $r_N \( x \, y \)$. It follows that $parallel F_k \( x \) - F_k \( y \) parallel_1 gt.eq r_N \( x \, y \)$.
  ===== 8.3.2 Expansion along a move. <expansion-along-a-move.>
  In a nonexceptional block from Lemma 17, the two window lists have at least $s - 1$ identical occurrences. For a shifted block, pair starts displaced by one; for an unchanged block, pair equal starts. Equation (74) bounds its contribution by $2$. In an exceptional block, pair windows at the same starts. Their deficits are at most one by Lemma 17, including after the common suffix is appended, so one such block costs at most $2 s alpha_s Lambda_(k - 1) = 8 log \( s + 1 \) Lambda_(k - 1)$. There are at most two exceptional blocks. At every scale,
  #[#set math.equation(numbering: n => "(79)")
   $ T_(k \, s) \( x \, y \) lt.eq 2 b + 16 log \( s + 1 \) Lambda_(k - 1) quad upright("for one move.") $ <upper:power-move>]
  There are at most $1 + floor.l log_2 m floor.r$ scales. Summing this estimate, applying the factor $4$, and following the $r_N \( x \, y \)$-move path gives
  #[#set math.equation(numbering: n => "(80)")
   $ Lambda_k lt.eq C_1 log^2 \( n + 2 \) \( b + Lambda_(k - 1) \) \, #h(2em) Lambda_H lt.eq b #scale(x: 120%, y: 120%)[\(] C_2 log^2 \( n + 2 \) #scale(x: 120%, y: 120%)[\)]^H $ <upper:power-recurrence>]
  with absolute constants. Indeed, after enlarging $A = C_1 log^2 \( n + 2 \)$ so that $A gt.eq 2$, induction gives $Lambda_k lt.eq b \( 2 A \)^k$.
  ===== 8.3.3 Parameters and varying lengths. <parameters-and-varying-lengths.>
  For sufficiently large $d$, take
  #[#set math.equation(numbering: n => "(81)")
   $ H = ⌊sqrt(frac(log d, log log d))⌋ \, #h(2em) b = ⌈d^(1 \/ H)⌉ \, #h(2em) n = b^H . $ <upper:parameters>]
  Here $d lt.eq n$ and, since $b lt.eq 2 d^(1 \/ H)$, $log n lt.eq log d + H log 2 = O \( log d \)$. Also $H$ has order $sqrt(log d \/ log log d)$, so
  $ log Lambda_H lt.eq log b + H log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C_2 log^2 \( n + 2 \) #scale(x: 120%, y: 120%)[\)] = O #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] sqrt(log d thin log log d) #scale(x: 120%, y: 120%)[\)] . $
  All constants are absolute. Work over $Gamma = Sigma union { * }$ with $* in.not Sigma$ and append $*$ to every input until its length is $n$. By (67) and (70), $F \( x \) = 2 F_H \( hat(x) \)$ satisfies
  $ "ED" \( x \, y \) lt.eq parallel F \( x \) - F \( y \) parallel_1 lt.eq 2 Lambda_H "ED" \( x \, y \) . $
  Absorbing the factor two into the absolute exponential constant proves the theorem, including the empty word. ◻
]

=== 8.4 Actual window lengths and two expansion estimates <upper:variants>

The power-length construction padded each window to the preceding power. We now use maps at the actual window lengths. This gives one recursion whose expansion can be proved in two ways: directly from an arbitrary longest common subsequence, or from the move estimate already used above. Both arguments analyze the same deterministic histogram map.

Fix an integer cap $d gt.eq 2$, an integer $B gt.eq 2$, and a nonempty finite alphabet $Gamma$. Construct maps $Phi_n$ on $Gamma^n$, $1 lt.eq n lt.eq d$, whose distances lie between $"ED"$ and $E_n "ED"$, starting with $Phi_1 \( a \) = 1 / 2 e_a$ and $E_1 = 1$. For $n > 1$, partition the positions into $b_n = min \( B \, n \)$ nonempty blocks of nearly equal lengths, with boundaries

$ 0 = p_0 < p_1 < dots.h.c < p_(b_n) = n \, #h(2em) ell_j = p_(j + 1) - p_j lt.eq ceil.l n \/ B ceil.r . $

For each dyadic $s lt.eq ell_j$, use the list of $s$ windows $x_(\[ p_j + r \, thin p_j + r + ell_j - s + 1 \))$, $0 lt.eq r < s$. Embed each window by the map at its actual length. Writing

$ D' = max_(1 lt.eq t lt.eq ceil.l n \/ B ceil.r) E_t \, $

its embedded distance satisfies $"ED" lt.eq rho lt.eq D' "ED"$. Every child length is strictly less than $n$. Use count histograms at rate

#[#set math.equation(numbering: n => "(82)")
 $ alpha_s = lambda \/ s \, #h(2em) lambda = 4 log \( 2 d \) \, $ <upper:aligned-rate>]

and define $Phi_n$ as six times their direct sum. Write $T_(j \, s)$ for the expected count distance. Equivalently, each component before the factor six is $s$ times the expected $ell_1$ distance of probability histograms, by (75).

===== 8.4.1 Separation. <separation.-1>

If corresponding blocks have edit distance $k_j > 0$, then $k_j lt.eq ell_j$ by substitution. The largest dyadic $s lt.eq \( k_j + 2 \) \/ 3$ is available and satisfies $s gt.eq k_j \/ 6$ and $k_j - 2 \( s - 1 \) gt.eq s$. Deleting the positions omitted from the two windows shows that every cross-window edit distance is at least $k_j - 2 \( s - 1 \)$. The probability of any cross-collision is at most $d^2 e^(- lambda) lt.eq 1 \/ 2$, so $T_(j \, s) gt.eq s gt.eq k_j \/ 6$. Blockwise edit scripts concatenate; hence the sum of the block distances dominates the whole-word distance. The factor six makes $Phi_n$ noncontracting.

===== 8.4.2 Corresponding segments in an arbitrary alignment. <corresponding-segments-in-an-arbitrary-alignment.>

Fix an arbitrary longest common subsequence matching of $x \, y$, of size $n - k$, where $k = r_n \( x \, y \)$. Let $t_j$ be the number of matched source positions strictly before $p_j$. Choose target boundaries

$ 0 = q_0 lt.eq q_1 lt.eq dots.h.c lt.eq q_(b_n) = n $

so that exactly $t_j$ matched target positions precede $q_j$. For an internal boundary, take $q_j$ to be the position of target match number $t_j + 1$ if it exists, and take $q_j = n$ otherwise. This gives nondecreasing boundaries and permits repeated boundaries and empty target segments. The matching pairs exactly the matched positions of $\[ p_j \, p_(j + 1) \)$ with those of $\[ q_j \, q_(j + 1) \)$.

Let $A_j \, B_j$ be the numbers of unmatched source and target positions in the prefixes ending at these boundaries. Since $p_j = t_j + A_j$, $q_j = t_j + B_j$, and $0 lt.eq A_j \, B_j lt.eq k$,

#[#set math.equation(numbering: n => "(83)")
 $ \| q_j - p_j \| lt.eq k . $ <upper:boundary-shift>]

Let $a_j \, b_j$ count unmatched positions in the source block and its aligned target segment, and put $e_j = a_j + b_j$. These segments partition the two words, so

#[#set math.equation(numbering: n => "(84)")
 $ sum_j e_j = 2 k . $ <upper:unmatched-total>]

In a matched pair belonging to these segments, the relative indices measured from $p_j \, q_j$ differ by at most $e_j$: their numbers of preceding matched positions agree, and their preceding unmatched counts are bounded by $a_j \, b_j$.

===== 8.4.3 Pairing the original window lists. <pairing-the-original-window-lists.>

Put $L = ell_j - s + 1$. Pair the source window starting at $p_j + r$ with the target window starting at $q_j + r$ precisely when both belong to the original fixed-block lists. Thus

$ 0 lt.eq r < s \, #h(2em) p_j lt.eq q_j + r < p_j + s . $

The two intervals of allowed starts overlap in $max \( 0 \, s - \| q_j - p_j \| \)$ positions. Exactly $min \( s \, \| q_j - p_j \| \)$ windows on each side remain unpaired.

Consider a paired window. At most $a_j lt.eq e_j$ of its source positions are unmatched. For any other source position, its partner’s relative index differs by at most $e_j$. Therefore only matched source positions within $e_j$ positions of an endpoint can have partners outside the target window; there are at most $2 e_j$ of them. The windows have a common subsequence of length at least $max \( 0 \, L - 3 e_j \)$, and (68) gives

#[#set math.equation(numbering: n => "(85)")
 $ "ED" \( upright("paired windows") \) lt.eq 6 e_j . $ <upper:aligned-window>]

This reasoning also covers a target window extending outside its aligned segment. Every partner of a matched source-block position lies in that segment, and the argument counts precisely those partners that remain inside the target window. It requires no condition on the other target positions.

Using the partial pairing in (74), the shorter-map expansion, and (82), we obtain

#[#set math.equation(numbering: n => "(86)")
 $ T_(j \, s) \( x \, y \) lt.eq 2 \| q_j - p_j \| + 2 s lambda / s D' \( 6 e_j \) = 2 \| q_j - p_j \| + 12 lambda D' e_j . $ <upper:aligned-component>]

Each block has at most $L_d = 1 + floor.l log_2 d floor.r$ scales. Summing (86), using (83) and (84), and applying the factor six gives

$ parallel Phi_n \( x \) - Phi_n \( y \) parallel_1 lt.eq 6 L_d \( 2 B k + 24 lambda D' k \) lt.eq C_6 log^2 \( d + 1 \) \( B + D' \) "ED" \( x \, y \) . $

The last inequality uses $k = r_n \( x \, y \) lt.eq "ED" \( x \, y \)$. The chosen alignment serves only to analyze two images; every partition and coordinate of $Phi_n$ was fixed on the entire domain beforehand.

===== 8.4.4 An alternative expansion estimate from moves. <an-alternative-expansion-estimate-from-moves.>

For a single move, a nonexceptional block has $s - 1$ identical windows and therefore contributes at most two. In either of the at most two exceptional blocks, windows at equal starts have edit distance at most two. Their embedded distance is at most $2 D'$, so (74) gives a block cost at most $4 s alpha_s D' = 4 lambda D'$. Thus, at each scale,

#[#set math.equation(numbering: n => "(87)")
 $ sum_j T_(j \, s) \( x \, y \) lt.eq 2 B + 8 lambda D' = 2 B + 32 log \( 2 d \) D' . $ <upper:ed-move>]

Summing scales, multiplying by six, and following the $r_n \( x \, y \) lt.eq "ED" \( x \, y \)$ moves gives the alternative expansion estimate

#[#set math.equation(numbering: n => "(88)")
 $ E_n lt.eq C_3 log \( 2 d \) #scale(x: 120%, y: 120%)[\(] B + log \( 2 d \) D' #scale(x: 120%, y: 120%)[\)] . $ <upper:ed-move-recurrence>]

The arbitrary-alignment argument established this order of expansion without decomposing the comparison into moves.

===== 8.4.5 Depth and varying lengths. <depth-and-varying-lengths.>

Both estimates have the form $E_n lt.eq A \( B + D' \)$ with $A = C log^2 \( 2 d \)$ for an absolute $C$. The identity

#[#set math.equation(numbering: n => "(89)")
 $ ⌈frac(ceil.l n \/ B ceil.r, B)⌉ = ⌈n / B^2⌉ $ <upper:ceiling-identity>]

follows because both sides are the least integer $t$ with $n lt.eq B^2 t$. It bounds the recursion depth by $h = ceil.l log_B d ceil.r$. The induction used in (80) gives expansion at most

#[#set math.equation(numbering: n => "(90)")
 $ B #scale(x: 120%, y: 120%)[\(] C_7 log^2 \( 2 d \) #scale(x: 120%, y: 120%)[\)]^h . $ <upper:ceiling-recurrence>]

For sufficiently large $d$, take $B = ceil.l exp \( sqrt(log d thin log log d) \) ceil.r$. The logarithm of this bound is then $O \( sqrt(log d thin log log d) \)$.

Finally, work over $Gamma = Sigma union { * }$ and append the fresh symbol to length $d$. Erasing $*$ from a padded edit script projects each operation to at most one edit, and (68) and (70) give

$ "ED" \( x \, y \) lt.eq "ED" \( hat(x) \, hat(y) \) lt.eq 2 r_d \( hat(x) \, hat(y) \) = 2 q \( x \, y \) lt.eq 2 "ED" \( x \, y \) . $

Thus $Phi_d \( hat(x) \)$ proves Theorem 15 on all shorter words, including the empty word, with an additional expansion factor two.

=== 8.5 Total-variation normalization <upper:tv>

A final variant retains the power lengths $n_i = b^i$ and the common-suffix window embeddings of Section 8.3. Construct $V_i$ with distances between $r_(n_i)$ and $D_i r_(n_i)$, starting with $V_0 \( a \) = 1 / 2 e_a$ and $D_0 = 1$. At scale $s$, use rate

#[#set math.equation(numbering: n => "(91)")
 $ alpha_s = frac(log \( 2 s^2 \), s) $ <upper:tv-rate>]

and $s$ times expected total variation of probability histograms. This component is half the count distance. For block deficit $q > 0$, choose $s$ as in (78). Every cross-window deficit is at least $s$, so the probability of any cross-collision is at most $s^2 e^(- log \( 2 s^2 \)) = 1 \/ 2$. The component is at least $s \/ 2 > q \/ 8$; eight times the summed map is therefore noncontracting for $r_(n_i)$.

Along a move, a nonexceptional block costs at most one, while an exceptional block costs at most $s alpha_s D_(i - 1)$. Consequently the unscaled cost at each scale is at most

#[#set math.equation(numbering: n => "(92)")
 $ b + 2 log \( 2 s^2 \) D_(i - 1) \, $ <upper:tv-move>]

and the move path gives

#[#set math.equation(numbering: n => "(93)")
 $ D_i lt.eq C_5 log \( 2 n_i \) #scale(x: 120%, y: 120%)[\(] b + log \( 2 n_i \) D_(i - 1) #scale(x: 120%, y: 120%)[\)] . $ <upper:tv-recurrence>]

Choose $b \, H \, n$ as in (81). Bounding the logarithmic factors by those at $n = b^H$ and using (80) yields $D_H lt.eq b \( C log^2 \( 2 n \) \)^H$ for an absolute $C$. The parameter calculation in the power-length proof gives the required exponent. Its fresh-symbol padding and final multiplication by two apply to $V_H$, proving the same theorem on all shorter words.

#heading(level: 1)[References]
#bibitem([1])[Alexandr Andoni, Michel Deza, Anupam Gupta, Piotr Indyk, and Sofya Raskhodnikova. Lower bounds for embedding edit distance into normed spaces. In #emph[Proceedings of the Fourteenth Annual ACM--SIAM Symposium on Discrete Algorithms], pages 523--526, 2003. #link("https://www.cs.columbia.edu/~andoni/papers/k2n2.pdf").]
#bibitem([2])[Sudatta Bhattacharya, Sanjana Dey, Elazar Goldenberg, and Michal Koucký. Many flavors of edit distance. In #emph[44th IARCS Annual Conference on Foundations of Software Technology and Theoretical Computer Science (FSTTCS 2024)], volume 323 of #emph[Leibniz International Proceedings in Informatics], pages 11:1--11:16. Schloss Dagstuhl--Leibniz-Zentrum für Informatik, 2024. #link("https://doi.org/10.4230/LIPIcs.FSTTCS.2024.11"). Full version: arXiv:2410.09877v1, October 13, 2024, #link("https://arxiv.org/abs/2410.09877v1").]
#bibitem([3])[Sudatta Bhattacharya, Sanjana Dey, Elazar Goldenberg, Mursalin Habib, Bernhard Haeupler, Karthik C.~S., and Michal Koucký. Constant rate isometric embeddings of Hamming metric into edit metric. In #emph[53rd International Colloquium on Automata, Languages, and Programming], volume 374 of #emph[Leibniz International Proceedings in Informatics], pages 32:1--32:19. Schloss Dagstuhl--Leibniz-Zentrum für Informatik, 2026. #link("https://doi.org/10.4230/LIPIcs.ICALP.2026.32"). Full version: #link("https://arxiv.org/abs/2504.03605v2").]
#bibitem([4])[Paul Erdős. Beweis eines Satzes von Tschebyschef. #emph[Acta litterarum ac scientiarum Regiae Universitatis Hungaricae Francisco-Josephinae: Sectio scientiarum mathematicarum], 5:194--198, 1932. #link("https://acta.bibl.u-szeged.hu/13396/").]
#bibitem([5])[Bernhard Haeupler and Amirbehshad Shahrasbi. Synchronization strings: Codes for insertions and deletions approaching the Singleton bound. In #emph[Proceedings of the 49th Annual ACM SIGACT Symposium on Theory of Computing], pages 33--46, 2017. #link("https://doi.org/10.1145/3055399.3055498"). Full-version locators refer to arXiv:1704.00807v1, April 3, 2017, #link("https://arxiv.org/abs/1704.00807v1").]
#bibitem([6])[Subhash Khot and Assaf Naor. Nonembeddability theorems via Fourier analysis. #emph[Mathematische Annalen], 334(4):821--852, 2006. #link("https://doi.org/10.1007/s00208-005-0745-0"). Full version: #link("https://arxiv.org/abs/math/0510547v1").]
#bibitem([7])[Robert Krauthgamer and Yuval Rabani. Improved lower bounds for embeddings into $L_1$. #emph[SIAM Journal on Computing], 38(6):2487--2498, 2009. #link("https://doi.org/10.1137/060660126").]
#bibitem([8])[Vladimir I. Levenshtein. Binary codes capable of correcting deletions, insertions, and reversals. #emph[Soviet Physics Doklady], 10(8):707--710, 1966. Translation of #emph[Doklady Akademii Nauk SSSR], 163(4):845--848, 1965. Original record: #link("https://www.mathnet.ru/eng/dan31411").]
#bibitem([9])[Nathan Linial, Eran London, and Yuri Rabinovich. The geometry of graphs and some of its algorithmic applications. #emph[Combinatorica], 15(2):215--245, 1995. #link("https://doi.org/10.1007/BF01200757").]
#bibitem([10])[OpenAI. Edit Distance in $ell_1$: Matching Bounds up to Constants in the Exponent. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Edit-Distance-in-l1-Matching-Bounds-up-to-Constants-in-the-Exponent-September-27-2026/paper.pdf")[OAI:Edit-Distance-in-l1-Matching-Bounds-up-to-Constants-in-the-Exponent-September-27-2026], 2026.]
#bibitem([11])[OpenAI. Tree Constructions for the $ell_1$ Distortion of Binary Edit Distance. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Tree-Constructions-for-the-l1-Distortion-of-Binary-Edit-Distance-September-27-2026/paper.pdf")[OAI:Tree-Constructions-for-the-l1-Distortion-of-Binary-Edit-Distance-September-27-2026], 2026.]
#bibitem([12])[Rafail Ostrovsky and Yuval Rabani. Low distortion embeddings for edit distance. #emph[Journal of the ACM], 54(5):Article 23, 2007. #link("https://doi.org/10.1145/1284320.1284322"). Preliminary author version dated August 19, 2005: #link("https://web.cs.ucla.edu/~rafail/PUBLIC/68.pdf").]
#bibitem([13])[J. Barkley Rosser and Lowell Schoenfeld. Approximate formulas for some functions of prime numbers. #emph[Illinois Journal of Mathematics], 6(1):64--94, 1962. #link("https://doi.org/10.1215/ijm/1255631807").]
#bibitem([14])[Leonard J. Schulman and David Zuckerman. Asymptotically good codes correcting insertions, deletions, and transpositions. #emph[IEEE Transactions on Information Theory], 45(7):2552--2557, 1999. #link("https://doi.org/10.1109/18.796406").]
#bibitem([15])[Robert A. Wagner and Michael J. Fischer. The string-to-string correction problem. #emph[Journal of the ACM], 21(1):168--173, 1974. #link("https://doi.org/10.1145/321796.321811").]


