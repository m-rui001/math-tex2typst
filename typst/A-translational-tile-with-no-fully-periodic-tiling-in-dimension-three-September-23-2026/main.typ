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

#align(center)[#text(size: 16pt, weight: "bold")[A translational tile with no fully periodic tiling \
in dimension three]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For subsets $A \, F$ of an abelian group $G$, write $A xor F = G$ when every element of $G$ has a unique expression $a + f$ with $a in A$ and $f in F$. A finite nonempty set $F$ is a #emph[translational tile] if such a set $A$ exists. A tiling is #emph[fully periodic] if $A$ is invariant under a subgroup of finite index in $G$. In $bb(R)^3$, a bounded measurable set of positive measure tiles by translations when its translates partition space up to null sets; full periodicity means that its translation set is invariant under a lattice of full rank. Throughout this paper, “periodic” means fully periodic.

The periodic tiling conjecture asks whether every translational tile admits a periodic tiling. An explicit Euclidean formulation appears in #cite(label("LagariasWang"), form: "prose") p. 346. Our conclusion in dimension three is the following.

#thm([Theorem 1.1.])[
  #emph[There is a finite nonempty set $T subset bb(Z)^3$ such that:]
  + #emph[$T$ tiles $bb(Z)^3$ by translations, but no translation set $A$ with $A xor T = bb(Z)^3$ is invariant under a subgroup of finite index in $bb(Z)^3$;]
  + #emph[the set $Omega = T + \[ 0 \, 1 \]^3$ tiles $bb(R)^3$ by translations up to null sets, but no such tiling has a translation set invariant under a lattice of full rank in $bb(R)^3$.]
] <thm:main>

The distinction between a tile and a particular tiling is essential: a tile may admit both periodic and nonperiodic translation sets. The theorem excludes every periodic translation set for the constructed tile. For lattice tilings, dimension three is the smallest possible dimension for this conclusion. Newman’s finite-state argument shows that the translation set of every tiling of $bb(Z)$ by a finite tile is periodic #cite(label("Newman")) proof of Theorem 2. Bhattacharya proved that every finite tile of $bb(Z)^2$ admits a periodic tiling #cite(label("Bhattacharya")) Theorem 1.1. Greenfeld and Tao subsequently gave a quantitative version of the planar result and proved that the translation set of every tiling of $bb(Z)^2$ by one finite tile is a disjoint union of finitely many sets, each invariant under some nonzero translation #cite(label("GTStructure")) Theorems 1.3(i) and 1.5. An earlier planar result of #cite(label("WijshoffVanLeeuwen"), form: "prose") Theorem 5.4 concerns polyominoes without holes and produces a tiling whose translation set is a single lattice. The unrestricted finite-tile theorem allows arbitrary disconnected sets and only asks for a finite-index period subgroup. For Euclidean tilings, #cite(label("RationalPolygons"), form: "prose") Theorem 1.1 prove periodic-tiling existence for rational polygonal sets, including disconnected sets and sets with holes. These positive planar results do not establish the conjecture for arbitrary bounded measurable Euclidean tiles. We use the lattice results only for the least-dimension conclusion above; the Euclidean assertion of 1 is proved directly below.

#cite(label("GTPeriodic"), form: "prose") disproved the periodic tiling conjecture in sufficiently large dimension. Their construction first produces a tile in $bb(Z)^2 times G_0$, with $G_0$ a finite abelian $2$-group, by encoding a Sudoku rule with an arithmetic obstruction to periodicity. The present proof follows this general strategy and the $p$-adic Sudoku formulation of #cite(label("GTUndecidable"), form: "prose") Section 4. We also use the idea of combining simultaneous tiling equations into one equation from #cite(label("GTPeriodic"), form: "prose") Section 3. The quotient-to-lattice reduction of #cite(label("MSSReduction"), form: "prose") Theorem 1.1 and Corollary 1.2 explains the relevance of controlling the finite factor: $bb(Z)^2$ times a finite cyclic group is a quotient of $bb(Z)^3$.

Here the Sudoku object is an array $W \( n \, m \)$ over a finite alphabet, with $n$ in a finite interval $I$ of columns and $m in bb(Z)$ indexing rows. A finite set of allowed words prescribes the possible samples $\( W \( n \, d n + e \) \)_(n in I)$ along every integer-slope line. The arithmetic word rule has two features: one such array exists with every column nonconstant, but no array with those properties has a vertical period. We turn these finite word constraints and column conditions into simultaneous tiling equations.

There are two requirements at each stage of this strategy. The encoding must admit at least one tiling, and every fully periodic tiling of the encoded object must yield a fully periodic solution of the preceding constraints. A system of tiling equations therefore means several equations with the #emph[same] unknown translation set. Separate solutions of the equations would not suffice. The finite group matters as well: a general finite abelian group needs several generators, whereas a cyclic group can be represented by just the third integer coordinate.

The central construction here encodes the Sudoku constraints while keeping that finite factor cyclic. For each word position, a finite-valued function has one input digit designated for each symbol. A symbol is called active when changing that digit can change the function’s value. An arbitrary solution may activate several symbols at one position; the constraints are imposed on every resulting choice of symbols. The explicit solution we construct activates just one. Cycle tests exclude forbidden simultaneous dependencies, and activation tests force at least one symbol at every ordinary position. Two seed channels force distinct values in every column of the resulting Sudoku array. The activation tests use a nonuniform list of output shifts with uniform coordinate counts on a product of two prime-order groups. These counts force activity, while suitable permutations of the remaining coordinates give an explicit common solution to all the equations. Both seed tests use the same auxiliary output function. All finite group factors have pairwise coprime orders, so their product remains cyclic. The horizontal residue pairs needed by the seed tests only index values of one cyclic output coordinate; they do not become an additional group factor.

A stacking construction using a fresh prime then gives one tile in $bb(Z)^2 times bb(Z) \/ Q bb(Z)$. We supply a direct rigidification argument that passes to $bb(Z)^3$ and also handles the unit-cube thickening in $bb(R)^3$. Integer vertices alone would not justify restricting an arbitrary Euclidean tiling to integer translations. Our construction uses two component shapes with the same large common part and one displaced marked cube. The common part forces the component centers in a hypothetical periodic tiling onto a translated grid. Coverage of the marked cubes then forces invariance in the quotient kernel, allowing that tiling to descend. Thus the Euclidean argument includes arbitrary real translation vectors. The result concerns full periodicity; neither connectedness of the tile nor absence of every individual nonzero period is asserted.

1 records the two directions maintained by these constructions. The proof is organized as follows. 2 proves the Sudoku obstruction and gives its last-nonzero-digit model. 3 constructs the cyclic group and the dependence tests; 4 forces activity and rules out periodic common solutions. 5 constructs one common solution explicitly. Section 6, Section 7 perform stacking and the passage to three dimensions. Every construction and nonperiodicity argument needed for 1 is proved in the paper.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Word arrays#linebreak()with nonconstant#linebreak()columns#linebreak()2]]])])
  content((3.932, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Common solution#linebreak()in $bb(Z)^2 times V$#linebreak()$V$ cyclic#linebreak()Section 3, Section 4, Section 5]]])])
  content((7.864, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One tile $F$#linebreak()in $bb(Z)^2 times bb(Z)"/"bb(Z) Q$#linebreak()6]]])])
  content((11.8, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One finite tile $T$#linebreak()and its thickening#linebreak()$T+[0,1]^3$#linebreak()7]]])])
  line((1.716, 0), (2.216, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((5.648, 0), (6.148, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((9.581, 0), (10.08, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-1.716, 1.275), (13.51, 1.275), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((5.898, 1.31), [#text(size: 9pt)[construct a solution, then a tiling]], anchor: "south", padding: 0.1176cm)
  line((13.51, -1.275), (-1.716, -1.275), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((5.898, -1.31), [#text(size: 9pt)[a fully periodic tiling would give a forbidden vertical period]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two directions of the proof. The construction proceeds to the right, starting from the explicit last-nonzero-digit array in 6. To exclude full periodicity, any hypothetical periodic tiling is decoded in the reverse direction, producing a line-rule array with nonconstant columns and a vertical period. Every tiling equation at the second stage uses the same translation set, and the last stage uses the same $T$ in both the discrete and Euclidean assertions. ],
) <fig:proof-route>

== 2 A word rule with no vertical period <sec:word>

We begin with a finite word constraint whose solutions on an infinite strip cannot have a vertical period if every column is nonconstant. The constraint is the two-digit $p$-adic Sudoku rule of #cite(label("GTUndecidable"), form: "prose") Definition 4.5. The affine-square and rescaling arguments below follow the framework of #cite(label("GTUndecidable"), form: "prose") Theorem 4.7, Lemma 4.8, and Section 4.2; we give the complete argument for the particular obstruction needed here.

Fix a prime $p > 200$, and set

$ N = p^2 \, #h(2em) Sigma = bb(F)_p^times \, #h(2em) I = { 0 \, 1 \, dots.h \, N - 1 } . $

When an integer occurs in an expression over $bb(F)_p$, its residue modulo $p$ is understood.

#prodef([Definition 2.1.])[
  (Allowed words and the line rule).  A word $w : I arrow.r Sigma$ is #emph[allowed] if there are integers $a \, b$, not both divisible by $p$, such that, for every $n in I$,
  $ w \( n \) = cases(delim: "{", a n + b med \( mod med p \) \, & p divides.not a n + b \,, \( a n + b \) \/ p med \( mod med p \) \, & p divides a n + b upright(" and ") p^2 divides.not a n + b .) $
  At indices with $p^2 divides a n + b$, the value may be any member of $Sigma$. An array $W : I times bb(Z) arrow.r Sigma$ satisfies the #emph[line rule] if
  $ n mapsto W \( n \, d n + e \) $
  is an allowed word for every $d \, e in bb(Z)$. A #emph[positive vertical period] of $W$ is an integer $M > 0$ such that $W \( n \, m + M \) = W \( n \, m \)$ for all $\( n \, m \) in I times bb(Z)$.
] <word:definition>

The allowed-word constraint depends only on the residues of $a \, b$ modulo $p^2$. Indeed, these residues determine the divisibility alternatives and each of the prescribed values. In particular, it is a finite constraint on words over the finite alphabet $Sigma$.

For every allowed word, reduction of a witnessing pair gives a nonzero affine form $ell \( n \) = macron(a) n + macron(b)$ over $bb(F)_p$. The word agrees with $ell$ wherever $ell eq.not 0$. A nonzero affine form has at most one zero residue class, so there are at most $N \/ p = p$ exceptional indices on $I$. Here and below, “nonzero affine form” means that its coefficients are not all zero; a nonzero constant form is permitted.

#thm([Lemma 2.2.])[
  (Global affine approximation).  #emph[If $W$ satisfies the line rule, there are $A \, B \, C in bb(F)_p$, not all zero, such that 
$ W \( n \, m \) = A n + B m + C quad upright("whenever ") A n + B m + C eq.not 0 . $

]
] <word:affine>

#proof[
  For each line $m = d n + e$ with $d in { - 1 \, 0 \, 1 }$, choose the nonzero affine form $ell_(d \, e) \( n \)$ supplied by an allowed-word witness. Call an index on that line exceptional when $ell_(d \, e) \( n \) = 0$.
  First we find a consecutive $4 times 4$ square containing no exceptional cell for any of these three line directions. In the rectangle $I times { 0 \, dots.h \, K - 1 }$ there are $\( N - 3 \) \( K - 3 \)$ such squares. The numbers of lines of slopes $0 \, 1 \, - 1$ meeting the rectangle are respectively $K \, K + N - 1 \, K + N - 1$. Each line has at most $p$ exceptional cells on the whole strip, and each cell belongs to at most $16$ candidate squares. Consequently at most
  $ 16 p \( 3 K + 2 N - 2 \) lt.eq 16 p \( 3 K + 2 N \) $
  squares are excluded. Since
  $ N - 3 - 48 p = p^2 - 48 p - 3 > 0 \, $
  we can choose an integer $K gt.eq 4$ with
  $ K > frac(3 \( N - 3 \) + 32 p N, N - 3 - 48 p) . $
  For this choice,
  $ \( N - 3 \) \( K - 3 \) - 16 p \( 3 K + 2 N \) = K \( N - 3 - 48 p \) - 3 \( N - 3 \) - 32 p N > 0 . $
  A square of the required kind therefore exists.
  Write its column indices as $r \, r + 1 \, r + 2 \, r + 3$ and its row indices as $q \, q + 1 \, q + 2 \, q + 3$. Each row agrees on the square with an affine function $U_m n + V_m$. For $m = q + 1 \, q + 2$ and $n = r + 1 \, r + 2$, the second difference along either diagonal vanishes. Thus, for each sign,
  $ 0 =  & n \( U_(m + 1) - 2 U_m + U_(m - 1) \) + \( V_(m + 1) - 2 V_m + V_(m - 1) \)\
 & #h(2em) #h(2em)  plus.minus \( U_(m + 1) - U_(m - 1) \) . $
  Subtracting the identities at the two consecutive values of $n$ gives $U_(m + 1) - 2 U_m + U_(m - 1) = 0$. Subtracting the two signs gives $U_(m + 1) = U_(m - 1)$, because $2 eq.not 0$ in $bb(F)_p$. Together these imply $U_(m - 1) = U_m = U_(m + 1)$. The two overlapping triples show that all four row slopes have a common value $A$. The remaining identities say that the four intercepts have zero second differences, so they have the form $V_m = B m + C$. Therefore the form
  $ H \( n \, m \) = A n + B m + C $
  agrees with $W$ on the square. It is not the zero form, because every entry of $W$ lies in $Sigma$.
  Call a cell #emph[good] if either $H \( n \, m \) = 0$ or $W \( n \, m \) = H \( n \, m \)$. We claim that four consecutive good cells on a line of slope $0 \, 1$, or $- 1$ make the entire line good. The restriction of $H$ to that line is an affine form in $n$. If it is identically zero, the claim follows from the definition of goodness. Otherwise, it and the chosen form $ell_(d \, e)$ each have at most one zero among the four indices, which are distinct modulo $p$. At least two of the four indices remain where both forms are nonzero. At these indices, goodness and the word rule identify both forms with $W$. Two distinct residues determine an affine form, so the two forms are equal. Wherever this common form is nonzero the word rule gives $W = H$, and its zeros are good by definition. This proves the claim.
  Applying the claim to the four square rows makes those entire rows good. To adjoin a row immediately above a block of four good rows, consider its cell in column $n$. At least one of
  $ n + 4 lt.eq N - 1 #h(2em) upright("or") #h(2em) n - 4 gt.eq 0 $
  holds, since $N gt.eq 8$. Choose $epsilon in { - 1 \, 1 }$ so that the four columns $n + epsilon \, n + 2 epsilon \, n + 3 epsilon \, n + 4 epsilon$ are in $I$. If the new row has index $m$, the cells
  $ \( n + j epsilon \, m - j \) \, #h(2em) 1 lt.eq j lt.eq 4 \, $
  are four consecutive good cells on a diagonal through $\( n \, m \)$. The claim makes $\( n \, m \)$ good. For a row immediately below a block of four good rows, use $\( n + j epsilon \, m + j \)$ instead. These formulas include both edge columns of the strip. Successively adjoining rows in both directions makes every cell good, proving the lemma. ◻
]

#thm([Lemma 2.3.])[
  (Vertical nondegeneracy).  #emph[Let $H \( n \, m \) = A n + B m + C$ be any affine form supplied by 3. Every column of $W$ is nonconstant if and only if $B eq.not 0$. In that case every positive vertical period of $W$ is divisible by $p$.]
] <word:vertical>

#proof[
  If $B = 0$, then $A n + C$ is not identically zero. Some $n in { 0 \, dots.h \, p - 1 }$ therefore has $A n + C eq.not 0$, and the entire column at that $n$ has the constant value $A n + C$. Conversely, if $B eq.not 0$, then for any fixed $n$ the form $A n + B m + C$ runs through $bb(F)_p$ as $m$ runs through a complete residue system modulo $p$. At its $p - 1$ nonzero values, the entries of $W$ equal those values. Thus every column takes every symbol of $Sigma$, and in particular is nonconstant.
  Suppose now that $M > 0$ satisfies $W \( n \, m + M \) = W \( n \, m \)$ for every $\( n \, m \)$. For a fixed $n$, choose $m$ so that both $H \( n \, m \)$ and $H \( n \, m + M \)$ are nonzero. There are at most two excluded residue classes, so this is possible. Equality of the two entries gives
  $ B M = H \( n \, m + M \) - H \( n \, m \) = 0 quad upright("in ") bb(F)_p . $
  Since $B eq.not 0$, this implies $p divides M$. ◻
]

#thm([Proposition 2.4.])[
  (The vertical-period obstruction).  #emph[There is no array $W : I times bb(Z) arrow.r Sigma$ satisfying the line rule, having every column nonconstant, and having a positive vertical period.]
] <word:obstruction>

#proof[
  Suppose otherwise, and choose the smallest positive integer $M$ that occurs as a vertical period of any such array. Choose an array with period $M$ and an affine approximation $A n + B m + C$. By 4, $B eq.not 0$ and $p divides M$.
  Choose integers $u \, v$ with $A + B u = C + B v = 0$ in $bb(F)_p$, and replace $W$ by
  $ tilde(W) \( n \, m \) = W \( n \, m + u n + v \) . $
  On a line of slope $d$ and intercept $e$, this samples the original line of slope $d + u$ and intercept $e + v$, so the line rule is preserved. Each column is simply translated in its row coordinate; hence column nonconstancy and the set of vertical periods are preserved. The new affine approximation is $B m$. Rename this normalized array $W$.
  Define
  $ W_1 \( n \, m \) = W \( n \, p m \) . $
  This array also satisfies the line rule: its line with slope $d$ and intercept $e$ is the old line with slope $p d$ and intercept $p e$. By 3, it has a nonzero affine approximation $H_1 \( n \, m \) = A_1 n + B_1 m + C_1$. We next prove $B_1 eq.not 0$, which is the step needed to retain column nonconstancy under this rescaling.
  If $B_1 = 0$, choose $0 lt.eq n_0 < p$ with $c = A_1 n_0 + C_1 eq.not 0$. Apply the word rule for $W$ to the line $m = n - n_0$, and let $a \, b$ be a witnessing pair. Away from the at most two zero residue classes of $macron(a) n + macron(b)$ and $B \( n - n_0 \)$, both forms equal the array entry on that line. Since $p - 2 gt.eq 2$, they agree at two distinct residues and therefore are the same affine form. In particular,
  $ a equiv B med \( mod med p \) \, #h(2em) b equiv - B n_0 med \( mod med p \) . $
  It follows that $p divides a n_0 + b$ and $p divides.not a$.
  For $0 lt.eq k < p$, put $n = n_0 + p k$; all these indices lie in $I$, including the largest possible value $p^2 - 1$. At the corresponding point of the line, the entry is
  $ W \( n_0 + p k \, p k \) = W_1 \( n_0 + p k \, k \) = c \, $
  where the last equality follows from the nonzero value $H_1 \( n_0 + p k \, k \) = c$. On the other hand,
  $ a \( n_0 + p k \) + b = p (frac(a n_0 + b, p) + a k) . $
  Whenever the parenthesized expression is nonzero modulo $p$, the second case of the allowed-word rule forces this entry to equal
  $ frac(a n_0 + b, p) + a k med \( mod med p \) . $
  As $k$ runs from $0$ to $p - 1$, these residues run through all of $bb(F)_p$, because $p divides.not a$. Thus $p - 1$ of the entries are forced to take the $p - 1$ distinct nonzero values, contradicting their common value $c$. The remaining index, where the rule prescribes no value, is not needed for this contradiction.
  We have proved $B_1 eq.not 0$, so every column of $W_1$ is nonconstant by 4. But $M \/ p$ is a positive vertical period of $W_1$, since
  $ W_1 \( n \, m + M \/ p \) = W \( n \, p m + M \) = W \( n \, p m \) = W_1 \( n \, m \) . $
  This contradicts the choice of $M$. ◻
]

#thm([Lemma 2.5.])[
  (A model for the line rule).  #emph[For $t in bb(Z) \\ { 0 }$, let $"ord"_p \( t \)$ be the largest nonnegative integer $r$ for which $p^r divides t$, and define 
$ f \( t \) = t / p^("ord"_p \( t \)) med \( mod med p \) \, #h(2em) f \( 0 \) = 1 . $

 Then $f : bb(Z) arrow.r Sigma$, and the array $W \( n \, m \) = f \( m \)$ satisfies the line rule and has every column nonconstant.]
] <word:model>

#proof[
  The definition gives a nonzero residue for every nonzero integer, including negative integers. For every $r gt.eq 0$ and $t in bb(Z)$ we have $f \( p^r t \) = f \( t \)$; this also holds at $t = 0$ by definition.
  Fix integers $d \, e$. If $\( d \, e \) eq.not \( 0 \, 0 \)$, let $r$ be the largest integer such that $p^r$ divides both coefficients, and write $d = p^r a$, $e = p^r b$. The pair $a \, b$ is not both divisible by $p$, and
  $ f \( d n + e \) = f \( a n + b \) #h(2em) \( n in I \) . $
  When $a n + b$ has $p$-adic order zero or one, this is exactly the respective value prescribed by the allowed-word rule. When $p^2 divides a n + b$, including $a n + b = 0$, the rule leaves the value unrestricted. Thus $a \, b$ witness that the word is allowed. If $\( d \, e \) = \( 0 \, 0 \)$, the word is constantly $1$ and has witness $a = 0 \, b = 1$. Finally $f \( 1 \) = 1$ and $f \( 2 \) = 2$, so every column is nonconstant. ◻
]

For the encoding that follows, parametrize the lines by $x = \( x_1 \, x_2 \) in bb(Z)^2$ and write

#[#set math.equation(numbering: n => "(2.1)")
 $ L_n \( x \) = x_2 + n x_1 \, #h(2em) u_n = \( 1 \, - n \) #h(2em) \( n in I \) . $ <word:line-maps>]

The map $L_n : bb(Z)^2 arrow.r bb(Z)$ is surjective and its kernel is generated by $u_n$: the equation $x_2 + n x_1 = 0$ is equivalent to $x = x_1 \( 1 \, - n \)$. The model supplies the allowed word $#scale(x: 120%, y: 120%)[\(] f \( L_n \( x \) \) #scale(x: 120%, y: 120%)[\)]_(n in I)$ at every $x$. Moreover, if $x_1 equiv 0$ and $x_2 equiv t med \( mod med p \)$ for $t in { 1 \, 2 }$, every entry of this word equals $t$. Indeed, every $L_n \( x \)$ then has the nonzero residue $t$, so its last nonzero digit is $t$.

== 3 Encoding symbols in a cyclic finite coordinate <sec:encoding>

We now express the word constraints by finitely many translational tiling equations on a common unknown set. A symbol will be represented by the dependence of a function on one of its input digits. The present section constructs tests forbidding specified simultaneous dependences; the next section will force enough dependence to obtain an array. Encoding functional constraints by tiling equations is developed in #cite(label("GTTwoTiles"), form: "prose") Sections 4–8 and #cite(label("GTPeriodic"), form: "prose") Theorem 4.1. The issue here is to carry out the required tests with a cyclic finite factor; the graph, dependence, and cycle constructions below supply their exact local forms.

=== 3.1 Channels and the ambient group <channels-and-the-ambient-group>

Retain the prime $p > 200$, the width $N = p^2$, and the alphabet $Sigma = bb(F)_p^times$ from the preceding section. Recall the line maps $L_n \( x \) = x_2 + n x_1$ and their kernel generators $u_n = \( 1 \, - n \)$ from (2.1). The set of #emph[channels] is

$ cal(I) = { 0 \, dots.h \, N - 1 } union.sq { eta_1 \, eta_2 } . $

The first $N$ channels are ordinary; the last two are seeds. Their input digit labels are $J_n = Sigma$ and $J_(eta_t) = { * }$, respectively. The seeds will eventually require the ordinary channels to display the constant words $1$ and $2$ at some points. Set

$ S = \( bb(Z) \/ p^2 bb(Z) \)^2 \, #h(2em) s \( x \) = x med mod med p^2 \, #h(2em) D = lr(|S|) = p^4 . $

Here $S$ records residues of the horizontal variable $x$.

For each $i in cal(I)$, choose primes $a_i \, b_i$ and put $P_i = bb(Z) \/ a_i bb(Z) times bb(Z) \/ b_i bb(Z)$. Require

$ a_(eta_1) = 2 \, #h(2em) a_(eta_2) = 3 \, #h(2em) b_(eta_1) \, b_(eta_2) > D \, $

and choose all the $a_i \, b_i$ to be distinct and different from $p$. For each $j in J_i$, choose a further prime $r_(i j)$, with all these primes distinct and disjoint from the previous choices, such that

#[#set math.equation(numbering: n => "(3.1)")
 $ r_(i j) = A_(i j) a_i + B_(i j) b_i \, #h(2em) A_(i j) \, B_(i j) in bb(Z)_(gt.eq 0) . $ <enc:digit-partition>]

These choices are possible using only finitely many primes. Indeed, if $a \, b$ are coprime and $r gt.eq \( a - 1 \) b$, choose $B in { 0 \, dots.h \, a - 1 }$ with $B b equiv r med \( mod med a \)$; then $A = \( r - B b \) \/ a$ is a nonnegative integer. There are arbitrarily large primes outside any prescribed finite set, so this argument applies successively to every required $r_(i j)$.

Write

$ r_i = product_(j in J_i) r_(i j) \, #h(2em) K_i = bb(Z) \/ r_i bb(Z) tilde.equiv product_(j in J_i) bb(Z) \/ r_(i j) bb(Z) \, #h(2em) K = product_(i in cal(I)) K_i \, #h(2em) P = product_(i in cal(I)) P_i . $

The displayed identification of $K_i$ is the Chinese remainder isomorphism, given by taking residues. Let $U_(i j) lt.eq K_i$ be the coordinate subgroup supported on the digit $j$ in this identification. We work in

#[#set math.equation(numbering: n => "(3.2)")
 $ G = bb(Z)^2 times V \, #h(2em) V = bb(Z) \/ bb(Z) D times product_(i in cal(I)) #scale(x: 120%, y: 120%)[\(] bb(Z) \/ r_i^2 bb(Z) times P_i #scale(x: 120%, y: 120%)[\)] . $ <enc:ambient>]

The group $V$ is cyclic. To see this, expand each $P_i$ into its two cyclic factors. The orders $D$, $r_i^2$, $a_i$, and $b_i$ of all the resulting factors are pairwise coprime. A tuple of generators therefore has order equal to their product, which is $lr(||) V$. The residue set $S$ is not an additional factor of $V$; the coordinate of order $D$ in (3.2) is the cyclic group $bb(Z) \/ bb(Z) D$.

=== 3.2 One graph and freely chosen high coordinates <one-graph-and-freely-chosen-high-coordinates>

Write an element of $G$ as

$ #scale(x: 120%, y: 120%)[\(] x \, z \, \( v_i \, c_i \)_(i in cal(I)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) z in bb(Z) \/ bb(Z) D \, quad v_i in bb(Z) \/ r_i^2 bb(Z) \, quad c_i in P_i . $

Its low coordinates are $k_i = v_i med mod med r_i in K_i$. Let $q_0 : G arrow.r bb(Z)^2 times K$ be the homomorphism retaining just $\( x \, k \)$, and let

$ H_0 = ker q_0 = { 0 } times bb(Z) \/ bb(Z) D times product_(i in cal(I)) #scale(x: 120%, y: 120%)[\(] r_i \( bb(Z) \/ r_i^2 bb(Z) \) times P_i #scale(x: 120%, y: 120%)[\)] . $

Include the tiling equation

#[#set math.equation(numbering: n => "(3.3)")
 $ A xor H_0 = G . $ <enc:graph>]

For a target point in any fibre of $q_0$, every element of $A$ in that fibre supplies exactly one representation with a summand in $H_0$. Consequently (3.3) says precisely that $A$ contains one point above each $\( x \, k \)$. We may thus denote its outputs by $c_i \( x \, k \)$, $z \( x \, k \)$, and $v_i \( x \, k \)$.

For subsequent constructions it is useful to describe $v_i$ by a sheared high coordinate $beta_i \( x \, k \) in K_i$, defined by

#[#set math.equation(numbering: n => "(3.4)")
 $ v_i \( x \, k \) = x_1 + \[ k_i - x_1 \]_(r_i) + r_i beta_i \( x \, k \) quad upright("in ") bb(Z) \/ r_i^2 bb(Z) . $ <enc:shear>]

Here $\[ dot.op \]_(r_i)$ is the least nonnegative representative modulo $r_i$. For fixed $x \, k_i$, the right side is a bijection from $K_i$ onto the elements of $bb(Z) \/ r_i^2 bb(Z)$ with residue $k_i$. Thus arbitrary functions $c_i$, $beta_i$, and $z$ specify exactly one graph satisfying (3.3). This is a choice of coordinates on each fibre; it does not assert a direct-product splitting of $bb(Z) \/ r_i^2 bb(Z)$ into two groups of order $r_i$.

If we add $h = \( h_1 \, h_2 \)$ to $x$ and $h_1$ to $v_i$, the new low coordinate is $k_i + h_1$. Since

$ \[ \( k_i + h_1 \) - \( x_1 + h_1 \) \]_(r_i) = \[ k_i - x_1 \]_(r_i) \, $

this operation preserves $beta_i$. The identity holds for every integer lift of $h_1$, including negative ones.

=== 3.3 Dependence constraints on the useful outputs <dependence-constraints-on-the-useful-outputs>

We require exactly the following restrictions on the functions $c_i$:

#[#set math.equation(numbering: n => "(3.5)")
 $ c_n \( x \, k \) & = tilde(c)_n \( L_n \( x \) \, k_n \) &  & \( 0 lt.eq n < N \) \,\
c_(eta_t) \( x \, k \) & = tilde(c)_(eta_t) \( s \( x \) \, k_(eta_t) \) &  & \( t = 1 \, 2 \) . $ <enc:dependence>]

The outputs $c_i$ will encode symbols; the other outputs will be used to satisfy the activation equations.

#thm([Lemma 3.1.])[
  #emph[Fix a channel $i$ and a shift $sigma in bb(Z)^2 times K$. There is a finite nonempty tile $F_(i \, sigma) subset G$ such that, for every graph satisfying (3.3), 
$ A xor F_(i \, sigma) = G quad arrow.l.r.double quad c_i \( b - sigma \) = c_i \( b \) upright(" for every ") b in bb(Z)^2 times K . $

 This equation imposes no restriction on the graph’s other outputs.]
] <enc:invariance>

#proof[
  Choose any lift $g in G$ of $sigma$ with $c_i$-coordinate zero, and partition $H_0$ into
  $ E_0^(\( i \)) = { h in H_0 : c_i \( h \) = 0 } \, #h(2em) E_(eq.not 0)^(\( i \)) = H_0 \\ E_0^(\( i \)) . $
  Set
  $ F_(i \, sigma) = E_(eq.not 0)^(\( i \)) union.sq \( g + E_0^(\( i \)) \) . $
  The union is disjoint because its two parts have, respectively, nonzero and zero $c_i$-coordinates. Fix a target base $b$. The unique graph point above $b$, together with $E_(eq.not 0)^(\( i \))$, covers exactly those points in that fibre whose $c_i$-coordinate differs from $c_i \( b \)$, once each. The graph point above $b - sigma$, together with $g + E_0^(\( i \))$, covers exactly the points whose $c_i$-coordinate is $c_i \( b - sigma \)$, once each. In both assertions, every choice of the other outputs and high coordinates is attained exactly once, since those offsets range freely in $E_0^(\( i \))$. The two contributions partition the target fibre precisely when the displayed equality of useful outputs holds. ◻
]

Apply 7, for each $i$, to a generator of every $K_ell$ with $ell eq.not i$, keeping all other base coordinates fixed. This removes dependence on the other low inputs. For an ordinary channel $n$, also apply it to the horizontal shift $u_n$ with zero low-coordinate shift. Since $ker L_n = bb(Z) u_n$, the remaining dependence on $x$ factors through $L_n \( x \)$. For each seed use instead the two horizontal shifts $\( p^2 \, 0 \)$ and $\( 0 \, p^2 \)$, again with zero low-coordinate shift. These give precisely dependence on $s \( x \)$. There are only finitely many such generators and tiles, and their equations are equivalent to (3.5). In particular, they leave all the functions $beta_i$ and $z$ unrestricted.

For a graph with these dependences, write $g_(i \, x) : K_i arrow.r P_i$ for its useful output at $x$. Define its #emph[active labels] by

$ cal(A)_i \( x \) = { j in J_i : upright("there exist ") w \, w' in K_i upright(" with ") w - w' in U_(i j) upright(" and ") g_(i \, x) \( w \) eq.not g_(i \, x) \( w' \) #scale(x: 120%, y: 120%)[}] . $

Thus a label is inactive exactly when changing that digit never changes the output. For ordinary $n$, the set $cal(A)_n \( x \)$ depends only on $L_n \( x \)$; for a seed it depends only on $s \( x \)$. A function independent of every digit is constant, since one can pass between any two inputs by changing one digit at a time. At this stage the active sets are allowed to be empty.

=== 3.4 A cycle test for simultaneous activity <a-cycle-test-for-simultaneous-activity>

#thm([Lemma 3.2.])[
  (Exclusion of simultaneous activity).  #emph[Let $C = \( i_1 \, dots.h \, i_t \)$ be a nonempty cyclically ordered list of distinct channels, and choose a label $j \( i \) in J_i$ for each $i in C$. There is a finite family of finite nonempty tiles such that a graph satisfying (3.5) tiles with every member of this family if and only if, at every $x in bb(Z)^2$, at least one of the chosen labels $j \( i \)$ is inactive.]
] <enc:exclusion>

#proof[
  For each $i in C$, let $"prev" \( i \)$ denote the preceding channel in the cycle. Choose arbitrary maps
  $ d_i : P_("prev" \( i \)) arrow.r U_(i \, j \( i \)) . $
  For $e = \( e_i \)_(i in cal(I)) in P$, put
  $ d_i \[ e \] = cases(delim: "{", d_i \( e_("prev" \( i \)) \) & i in C \,, 0 & i in.not C .) $
  Include a tile for every joint choice $d = \( d_i \)_(i in C)$, namely
  #[#set math.equation(numbering: n => "(3.6)")
   $ F_d = {#scale(x: 120%, y: 120%)[\(] 0 \, zeta \, \( upsilon_i \, e_i \)_(i in cal(I)) #scale(x: 120%, y: 120%)[\)] : e in P \, quad zeta in bb(Z) \/ bb(Z) D \,\
upsilon_i in bb(Z) \/ r_i^2 bb(Z) \, quad upsilon_i med mod med r_i = d_i \[ e \] quad \( i in cal(I) \)} . $ <enc:cycle-tile>]
  This is an ordinary set: distinct $e$ give distinct useful-output offsets, and every choice of $zeta$ and the lifts $upsilon_i$ occurs once. Both the tile and the family of all maps $d$ are finite.
  Fix a target base $\( x \, k \)$. For a fixed $e$, a representation using (3.6) must start at the graph point over $\( x \, \( k_i - d_i \[ e \] \)_i \)$. The useful outputs of the target are then
  #[#set math.equation(numbering: n => "(3.7)")
   $ Phi_(x \, k \, d) \( e \) = #scale(x: 120%, y: 120%)[\(] e_i + g_(i \, x) \( k_i - d_i \[ e \] \) #scale(x: 120%, y: 120%)[\)]_(i in cal(I)) . $ <enc:permutation>]
  For any prescribed remaining coordinates of the target, the offsets $zeta$ and $upsilon_i$ are uniquely determined: each low residue is already correct, and all its lifts occur in the tile. Hence $A xor F_d = G$ holds exactly when (3.7) is a permutation of $P$ for every $\( x \, k \)$. This criterion is independent of the graph’s high outputs and its $z$-output.
  Suppose some $j \( i_0 \)$ is inactive at $x$. Then the $i_0$-component of (3.7) is $e_(i_0) + g_(i_0 \, x) \( k_(i_0) \)$, independent of the preceding component of $e$. From any target useful-output tuple, we can therefore recover $e_(i_0)$ uniquely. The next equation around the cycle then recovers the next component, and continuing recovers all components on $C$. The starting equation remains satisfied because it never depended on the preceding component. Off the cycle, each equation is just a fixed translation and recovers its component separately. This gives a unique preimage for every target, for all $k$ and all maps $d$.
  Conversely, suppose every chosen label is active at some $x$. For each $i in C$ choose $w_i \, w'_i in K_i$ such that
  $ w_i - w'_i in U_(i \, j \( i \)) \, #h(2em) epsilon_i := g_(i \, x) \( w_i \) - g_(i \, x) \( w'_i \) eq.not 0 . $
  Set $k_i = w_i$ on the cycle, and choose the other $k_i$ arbitrarily. Extend $epsilon$ by zero off $C$ to an element of $P$. For each $i in C$, choose a map with
  $ d_i \( 0 \) = 0 \, #h(2em) d_i \( epsilon_("prev" \( i \)) \) = w_i - w'_i . $
  The two specified arguments are distinct, so these prescriptions extend to maps on the whole domain. They are among the maps tested in the finite family. At this base, the distinct inputs $0$ and $epsilon$ have the same image under (3.7): on $C$ their outputs are respectively $g_(i \, x) \( w_i \)$ and $epsilon_i + g_(i \, x) \( w'_i \)$, and off $C$ they coincide as well. The permutation condition fails. This proves both directions. ◻
]

Let $cal(W) subset.eq Sigma^N$ be the finite set of allowed words from the word rule. We impose the following specific instances of 8:

+ For every $w in Sigma^N \\ cal(W)$, use the cycle $\( 0 \, 1 \, dots.h \, N - 1 \)$ with label $j \( n \) = w \( n \)$.
+ For each $t in { 1 \, 2 }$, each ordinary channel $n$, and each $j in Sigma \\ { t }$, use the two-channel cycle $\( eta_t \, n \)$ with labels $*$ and $j$.

All these instances form a finite family. Their precise consequences are

#[#set math.equation(numbering: n => "(3.8)")
 $ product_(n = 0)^(N - 1) cal(A)_n \( x \) subset.eq cal(W) \, #h(2em) * in cal(A)_(eta_t) \( x \) med arrow.r.double med cal(A)_n \( x \) subset.eq { t } quad \( 0 lt.eq n < N \) . $ <enc:word-exclusions>]

The first product is identified with a set of words in the natural order of the channels. These statements also hold when some active sets are empty. The activation tiles constructed next will ensure that every ordinary active set is nonempty at every point and that each seed is active somewhere.

Every tile constructed in this section is a finite nonempty subset of $G$. As a check on the fibre counts, all have cardinality

$ lr(|H_0|) = D product_(i in cal(I)) r_i lr(|P_i|) : $

the dependence tiles partition a copy of $H_0$ into two shifted pieces, while each cycle tile has $lr(||) P$ choices of $e$, $D$ choices of $zeta$, and $r_i$ choices of each lift $upsilon_i$.

== 4 Forcing activity and excluding full periodicity <sec:activation>

The exclusion equations constrain which labels can be active together. We now add one finite tile for each channel to ensure that every ordinary channel is active at every point, and that each seed is active somewhere. Throughout this section, we retain the groups and coordinates of 3. In particular, the useful output of channel $i$ is $c_i in P_i = bb(Z) \/ a_i bb(Z) times bb(Z) \/ b_i bb(Z)$, its low input is $k_i in K_i$, and its sheared high coordinate is $beta_i in K_i$.

=== 4.1 A shift list with two fibre orderings <a-shift-list-with-two-fibre-orderings>

The shift list will serve two purposes: its nonuniform multiplicities will force activity, while its uniform counts in each coordinate will permit the explicit common solution in 5.

Fix a channel $i$. For $e in P_i$, let $upright(bold(1))_({ e })$ denote the indicator of the singleton ${ e }$, and define the integer-valued functions

$ omega_i = upright(bold(1))_({ \( 0 \, 0 \) }) - upright(bold(1))_({ \( 1 \, 0 \) }) - upright(bold(1))_({ \( 0 \, 1 \) }) + upright(bold(1))_({ \( 1 \, 1 \) }) \, #h(2em) mu_i = 1 + omega_i quad upright("on ") P_i . $

Here $1$ denotes the constant function. The function $mu_i$ has values two at $\( 0 \, 0 \)$ and $\( 1 \, 1 \)$, zero at $\( 1 \, 0 \)$ and $\( 0 \, 1 \)$, and one elsewhere. It is therefore a nonnegative, nonconstant multiplicity function. Its total mass is $a_i b_i$, and its marginals are uniform:

$ sum_(alpha in bb(Z) \/ a_i bb(Z)) mu_i \( alpha \, xi \) = a_i quad \( xi in bb(Z) \/ b_i bb(Z) \) \, #h(2em) sum_(xi in bb(Z) \/ b_i bb(Z)) mu_i \( alpha \, xi \) = b_i quad \( alpha in bb(Z) \/ a_i bb(Z) \) . $

Choose an index set $Delta_i$ of size $a_i b_i$ and a list $e_delta = \( e_delta^a \, e_delta^b \) in P_i$, $delta in Delta_i$, in which each $e in P_i$ occurs $mu_i \( e \)$ times. The following notation for the list and its orderings is local to channel $i$.

For each $xi$, order the $a_i$ indices with $e_delta^b = xi$ by an arbitrary bijection to $bb(Z) \/ a_i bb(Z)$, and define $rho^a \( delta \)$ by subtracting $e_delta^a$ from that assigned value. Independently, for each $alpha$, order the $b_i$ indices with $e_delta^a = alpha$ by a bijection to $bb(Z) \/ b_i bb(Z)$, and subtract $e_delta^b$ to define $rho^b \( delta \)$. Thus both maps in

#[#set math.equation(numbering: n => "(4.1)")
 $ { delta in Delta_i : e_delta^b = xi } & arrow.r bb(Z) \/ a_i bb(Z) \, & delta & mapsto e_delta^a + rho^a \( delta \) \,\
{ delta in Delta_i : e_delta^a = alpha } & arrow.r bb(Z) \/ b_i bb(Z) \, & delta & mapsto e_delta^b + rho^b \( delta \) $ <act:fibre-orderings>]

are bijections. Repeated values of $e_delta$ have distinct indices; the orderings act on these indices.

=== 4.2 The activation tiles <the-activation-tiles>

For a channel $ell$, write $R_ell = r_ell bb(Z) \/ r_ell^2 bb(Z)$ for the subgroup of offsets with low coordinate zero. It has $r_ell$ elements. Given $h in bb(Z)^2$, $e in P_i$, and $E subset.eq bb(Z) \/ D bb(Z)$, define a batch of offsets by

$ cal(B)_i \( h \, e \; E \) = { #scale(x: 120%, y: 120%)[\(] h \, zeta \, \( w_ell \, d_ell \)_(ell in cal(I)) #scale(x: 120%, y: 120%)[\)] : & med zeta in E \, quad w_i = h_1 med \( mod med r_i^2 \) \, quad d_i = e \,\
 & med w_ell in R_ell \, quad d_ell in P_ell upright(" for every ") ell eq.not i #scale(x: 120%, y: 120%)[}] . $

Every combination of the freely varied coordinates occurs once in this set.

For an ordinary channel $i in { 0 \, dots.h \, N - 1 }$ and each pair $\( l \, delta \) in K_i times Delta_i$, choose an integer multiple $h = h_(l \, delta)^(\( i \))$ of $u_i = \( 1 \, - i \)$ such that

#[#set math.equation(numbering: n => "(4.2)")
 $ h_1 equiv l med \( mod med r_i \) \, #h(2em) h_1 equiv rho^a \( delta \) med \( mod med a_i \) \, #h(2em) h_1 equiv rho^b \( delta \) med \( mod med b_i \) . $ <act:ordinary-crt>]

The moduli are pairwise coprime, so the Chinese remainder theorem gives infinitely many choices of $h_1$. Choose these horizontal offsets distinctly for the different pairs $\( l \, delta \)$, and set

$ F_i^(upright("act")) = union.big_(\( l \, delta \) in K_i times Delta_i) cal(B)_i #scale(x: 120%, y: 120%)[\(] h_(l \, delta)^(\( i \)) \, e_delta \; bb(Z) \/ D bb(Z) #scale(x: 120%, y: 120%)[\)] . $

The restriction $h in bb(Z) u_i$ gives $L_i \( x - h \) = L_i \( x \)$ for every $x$.

For a seed $i in { eta_1 \, eta_2 }$, let $i'$ denote the other seed. For every $\( l \, delta \, tau \) in K_i times Delta_i times S$, choose $h = h_(l \, delta \, tau)^(\( i \)) in bb(Z)^2$ satisfying (4.2) and the additional conditions

#[#set math.equation(numbering: n => "(4.3)")
 $ s \( h \) = tau \, #h(2em) h_1 equiv 0 med \( mod med a_(i') \) . $ <act:seed-crt>]

There is no slope restriction in this case. Writing $tau = \( tau_1 \, tau_2 \) in \( bb(Z) \/ p^2 bb(Z) \)^2$, the first coordinate is prescribed modulo the pairwise coprime integers $r_i \, a_i \, b_i \, p^2 \, a_(i')$, while the second coordinate only needs to satisfy $h_2 equiv tau_2 med \( mod med p^2 \)$. Again there are infinitely many choices, so take all horizontal offsets within this seed tile to be distinct. Define

$ F_i^(upright("act")) = union.big_(\( l \, delta \, tau \) in K_i times Delta_i times S) cal(B)_i #scale(x: 120%, y: 120%)[\(] h_(l \, delta \, tau)^(\( i \)) \, e_delta \; { 0 } #scale(x: 120%, y: 120%)[\)] . $

Thus an ordinary batch varies the $z$-offset freely, whereas a seed batch has $z$-offset zero. The congruence involving $a_(i')$ will allow both seed tests to hold with one common $z$-output in the construction of 14.

All unions just defined are disjoint unions of finite sets, because different batches have different horizontal offsets. In particular, the repeated entries of the auxiliary shift list do not introduce weighted tile elements. These tiles are nonempty, and direct counting gives, for every channel $i$,

$ lr(|F_i^(upright("act"))|) = D product_(ell in cal(I)) r_ell lr(|P_ell|) = lr(|H_0|) . $

We add the equations $A xor F_i^(upright("act")) = G$ to the graph, dependence, and exclusion equations.

=== 4.3 Exact coverage in a fibre <exact-coverage-in-a-fibre>

#thm([Lemma 4.1.])[
  (Activation fibre criterion).  #emph[Suppose $A xor H_0 = G$, so that $A$ is a graph over $\( x \, k \)$. For a target base point $\( x \, k \)$ and a batch with horizontal offset $h$, write 
#[#set math.equation(numbering: n => "(4.4)")
 $ x' = x - h \, #h(2em) k'_i = k_i - l \, #h(2em) k'_ell = k_ell quad \( ell eq.not i \) . $ <act:source-base>]

 For an ordinary channel $i$, the equation $A xor F_i^(upright("act")) = G$ holds if and only if, at every target base point, the map 
#[#set math.equation(numbering: n => "(4.5)")
 $ \( l \, delta \) mapsto #scale(x: 120%, y: 120%)[\(] c_i \( x' \, k' \) + e_delta \, thin beta_i \( x' \, k' \) #scale(x: 120%, y: 120%)[\)] $ <act:ordinary-map>]

 is a bijection from $K_i times Delta_i$ to $P_i times K_i$. For a seed $i$, the corresponding necessary and sufficient condition is that, at every target base point, 
#[#set math.equation(numbering: n => "(4.6)")
 $ \( l \, delta \, tau \) mapsto #scale(x: 120%, y: 120%)[\(] c_i \( x' \, k' \) + e_delta \, thin beta_i \( x' \, k' \) \, thin z \( x' \, k' \) #scale(x: 120%, y: 120%)[\)] $ <act:seed-map>]

 be a bijection from $K_i times Delta_i times S$ to $P_i times K_i times bb(Z) \/ D bb(Z)$.]
] <act:fibre-criterion>

#proof[
  Fix a target base point and a batch. Every offset in that batch has the same horizontal and low coordinates, so the graph equation supplies exactly one possible source point of $A$: the point above the base in (4.4). The $i$th low-coordinate shift is $l$ because $h_1 equiv l med \( mod med r_i \)$. Since $x'_1 = x_1 - h_1$, we have
  $ \[ k'_i - x'_1 \]_(r_i) = \[ k_i - x_1 \]_(r_i) . $
  Consequently the shear formula (3.4) gives
  $ v_i \( x' \, k' \) + h_1 = x_1 + \[ k_i - x_1 \]_(r_i) + r_i beta_i \( x' \, k' \) quad upright("in ") bb(Z) \/ r_i^2 bb(Z) . $
  Thus the offset preserves the sheared high coordinate $beta_i$ exactly, and the target useful output is $c_i \( x' \, k' \) + e_delta$.
  For every $ell eq.not i$, adding the freely chosen element of $R_ell$ fills the entire high-coordinate fibre with low coordinate $k_ell$ once. Independently, adding the freely chosen element of $P_ell$ fills that useful-output coordinate once. In an ordinary batch the $z$-coordinate is also filled once; in a seed batch it remains equal to $z \( x' \, k' \)$. Hence each batch covers exactly the part of the target fibre specified by its tuple in (4.5) or (4.6), with one representation for every choice of the remaining coordinates. Distinct batches correspond to distinct tile elements, so exact coverage by the whole tile is equivalent to every specified tuple occurring once. This is precisely the asserted bijection condition. ◻
]

In particular, exact coverage forces every value of the target $c_i$ to occur $r_i$ times among the ordinary batches, or $D r_i$ times among the seed batches. These necessary marginal counts already force the activity we need.

=== 4.4 Every required channel is active <every-required-channel-is-active>

#thm([Lemma 4.2.])[
  (Ordinary activation).  #emph[Every ordinary channel has at least one active label at every $x in bb(Z)^2$ in any common solution of the equations specified so far.]
] <act:ordinary>

#proof[
  Suppose channel $i$ has no active label at some $x$. A function on the finite product $K_i = product_(j in J_i) bb(Z) \/ r_(i j) bb(Z)$ that is independent of every digit is constant: any two inputs can be joined by changing one digit at a time. Thus $g_(i \, x)$ has a constant value $c_0 in P_i$. By the dependence condition (3.5) and the equality $L_i \( x - h \) = L_i \( x \)$, every source in the activation test at $\( x \, k \)$ has $c_i \( x' \, k' \) = c_0$. For each $delta$ there are $r_i$ choices of $l$. The number of batches giving any target value $c in P_i$ is therefore
  $ r_i mu_i \( c - c_0 \) . $
  The fibre criterion requires this number to be $r_i$ for every $c$. That is impossible because $mu_i$ is not constant. ◻
]

#thm([Lemma 4.3.])[
  (Seed activation).  #emph[Each of the two seeds has its label active at some point of $bb(Z)^2$ in any common solution of the equations specified so far.]
] <act:seed>

#proof[
  Fix a seed $i$ and suppose it is nowhere active. The dependence condition and the absence of activity give a function $q : S arrow.r P_i$ such that $c_i \( x \, k \) = q \( s \( x \) \)$ for every base point. Define its nonnegative integer histogram by
  $ Q \( alpha \, xi \) = lr(|{ s in S : q \( s \) = \( alpha \, xi \) }|) \, #h(2em) sum_(\( alpha \, xi \) in P_i) Q \( alpha \, xi \) = D . $
  At any target base point and for a fixed $delta$, the source pairs
  $ \( s \( x' \) \, k'_i \) = \( s \( x \) - tau \, k_i - l \) $
  run once through $S times K_i$ as $\( tau \, l \)$ varies. Thus the number of seed batches with useful output $c in P_i$ is $r_i sum_(delta in Delta_i) Q \( c - e_delta \)$. The necessary marginal count from 9, divided by $r_i$, yields
  $ \( Q * mu_i \) \( c \) = D #h(2em) \( c in P_i \) \, $
  where $\( Q * mu_i \) \( c \) = sum_(e in P_i) mu_i \( e \) Q \( c - e \)$ is convolution on the finite group $P_i$. Convolution with the constant function $1$ already equals $D$, so $Q * omega_i = 0$. Written out, this says
  #[#set math.equation(numbering: n => "(4.7)")
   $ Q \( alpha \, xi \) - Q \( alpha - 1 \, xi \) - Q \( alpha \, xi - 1 \) + Q \( alpha - 1 \, xi - 1 \) = 0 . $ <act:mixed-difference>]
  We spell out the integer and positivity consequences of this identity. For each $alpha$, the difference $Q \( alpha \, xi \) - Q \( alpha - 1 \, xi \)$ is independent of $xi$, because successive differences in the second coordinate vanish. Summing such differences along the cyclic first coordinate shows that, for any $alpha_0$,
  $ Q \( alpha \, xi \) - Q \( alpha_0 \, xi \) = Q \( alpha \, 0 \) - Q \( alpha_0 \, 0 \) . $
  Choose $alpha_0$ to minimize $Q \( alpha \, 0 \)$, and put
  $ u \( alpha \) = Q \( alpha \, 0 \) - Q \( alpha_0 \, 0 \) \, #h(2em) v \( xi \) = Q \( alpha_0 \, xi \) . $
  Both functions take nonnegative integer values, and $Q \( alpha \, xi \) = u \( alpha \) + v \( xi \)$. Summing gives
  $ D = b_i sum_(alpha in bb(Z) \/ a_i bb(Z)) u \( alpha \) + a_i sum_(xi in bb(Z) \/ b_i bb(Z)) v \( xi \) . $
  Since $b_i > D$ and both sums are nonnegative integers, the first sum must vanish. It follows that $a_i$ divides $D = p^4$. But the two seed values of $a_i$ are $2$ and $3$, whereas $p > 200$ is prime. This contradiction proves the claim. ◻
]

=== 4.5 Extraction of the line array <extraction-of-the-line-array>

The graph, dependence, exclusion, and activation equations now form a finite system of tiling equations in $G$. Its solvability will be proved in the next section. We can already exclude all fully periodic common solutions.

#thm([Proposition 4.4.])[
  #emph[No common solution of this finite system is invariant under a finite-index subgroup of $G$.]
] <act:nonperiodic>

#proof[
  Let $A$ be any common solution. Fix a total ordering of $Sigma$. For each ordinary channel $n$ and integer $m$, define
  $ W \( n \, m \) = min cal(A)_n \( \( 0 \, m \) \) \, $
  where the minimum is taken in that ordering. This is defined by 10. The dependence condition implies that $cal(A)_n \( x \)$ depends only on $L_n \( x \)$; since $L_n \( 0 \, m \) = m$, the selected symbol at any $x$ is exactly $W \( n \, L_n \( x \) \)$.
  For any integers $d \, e$, consider $x = \( d \, e \)$. If the word $\( W \( n \, d n + e \) \)_(0 lt.eq n < N)$ were forbidden, all its selected labels would be active at $x$. This contradicts the corresponding exclusion equations, by 8. Hence $W$ satisfies the line rule.
  By 11, for each $t in { 1 \, 2 }$ there is a point $x^(\( t \))$ where the label of $eta_t$ is active. The seed-pair exclusions imply that $cal(A)_n \( x^(\( t \)) \)$ contains no symbol other than $t$. Since this set is nonempty, it equals ${ t }$. Therefore
  $ W #scale(x: 120%, y: 120%)[\(] n \, L_n \( x^(\( 1 \)) \) #scale(x: 120%, y: 120%)[\)] = 1 \, #h(2em) W #scale(x: 120%, y: 120%)[\(] n \, L_n \( x^(\( 2 \)) \) #scale(x: 120%, y: 120%)[\)] = 2 quad upright("for every ") 0 lt.eq n < N . $
  The two arguments in each column must be distinct, and every column of $W$ is nonconstant.
  Suppose now that $A$ is invariant under a finite-index subgroup $Lambda lt.eq G$. Consider the actual group element
  $ e_(upright(v)) = #scale(x: 120%, y: 120%)[\(] \( 0 \, 1 \) \, 0_V #scale(x: 120%, y: 120%)[\)] in G . $
  Its coset has finite order in $G \/ Lambda$, so some integer $M > 0$ satisfies $M e_(upright(v)) in Lambda$. We thus obtain a period with #emph[zero finite-coordinate component]:
  $ A + #scale(x: 120%, y: 120%)[\(] \( 0 \, M \) \, 0_V #scale(x: 120%, y: 120%)[\)] = A . $
  Translation by this element takes the unique graph point above $\( x \, k \)$ to the unique graph point above $\( x + \( 0 \, M \) \, k \)$ and leaves all useful outputs unchanged. It follows that every active-label set is unchanged under $x mapsto x + \( 0 \, M \)$. At $x = \( 0 \, m \)$ this gives $W \( n \, m + M \) = W \( n \, m \)$ for all $n \, m$. The array is therefore vertically periodic, satisfies the line rule, and has every column nonconstant, contradicting 5. ◻
]

== 5 A common solution of the tiling equations <sec:model>

We now construct one graph satisfying all the equations of Section 3, Section 4. The useful output of each ordinary channel will activate exactly the symbol $f \( L_i \( x \) \)$ from 6. The high coordinates will record positions within labelled blocks. A further labelling of the horizontal residue set $S$ will let the two seed tests use a single common output $z$.

=== 5.1 Labelled blocks and their inverse map <labelled-blocks-and-their-inverse-map>

For every channel $i$ and digit $j in J_i$, fix a partition of $bb(Z) \/ r_(i j) bb(Z)$ into subsets of sizes $a_i$ and $b_i$, using the nonnegative representation of $r_(i j)$ chosen in 3. Label each subset of size $d in { a_i \, b_i }$ bijectively by $bb(Z) \/ bb(Z) d$. Copy this same partition and these same labels for every setting of the other digits in $K_i = product_(j' in J_i) bb(Z) \/ r_(i j') bb(Z)$. We obtain a partition $cal(B)_(i \, j)$ of $K_i$ into labelled blocks. A block fixes all digits except $j$; its label records a position in its $j$-digit subset. The blocks are subsets, not subgroups, and their labels need not respect addition in $K_i$.

Define a map $C_(i \, j) : K_i arrow.r P_i$ and, for each integer $t$, a permutation $T_(i \, j) \( t \)$ of $K_i$ as follows. If $k_i$ has label $y$ in a block of size $d$, put

$ C_(i \, j) \( k_i \) = cases(delim: "{", \( y \, 0 \) \, & d = a_i \,, \( 0 \, y \) \, & d = b_i .) $

The permutation $T_(i \, j) \( t \)$ sends this point to the point with label $y + t$ in the same block, with addition in $bb(Z) \/ bb(Z) d$. The map $C_(i \, j)$ is independent of every digit except $j$, since the partitions and labels were copied unchanged over the other digits. It is not independent of $j$: each block has at least two positions with different useful outputs.

The following inverse calculation is the reason for the fibre orderings in (4.1).

#thm([Lemma 5.1.])[
  (Block inverse).  #emph[Fix $i \, j$, a target horizontal coordinate $x_1 in bb(Z)$, and a target low coordinate $k_i in K_i$. For each $\( l \, delta \) in K_i times Delta_i$, choose an integer $h_1 \( l \, delta \)$ satisfying 
$ h_1 \( l \, delta \) equiv l med \( mod med r_i \) \, #h(2em) h_1 \( l \, delta \) equiv rho^a \( delta \) med \( mod med a_i \) \, #h(2em) h_1 \( l \, delta \) equiv rho^b \( delta \) med \( mod med b_i \) . $

 Then the map 
#[#set math.equation(numbering: n => "(5.1)")
 $ \( l \, delta \) mapsto (C_(i \, j) \( k_i - l \) + e_delta \, T_(i \, j) #scale(x: 120%, y: 120%)[\(] x_1 - h_1 \( l \, delta \) #scale(x: 120%, y: 120%)[\)] \( k_i - l \)) $ <model:block-map>]

 is a bijection from $K_i times Delta_i$ to $P_i times K_i$.]
] <model:block-inverse>

#proof[
  Fix a target $\( \( alpha^(*) \, xi^(*) \) \, beta_i^(*) \)$. The point $beta_i^(*)$ specifies one block $B in cal(B)_(i \, j)$ and its label $q$. As each $T_(i \, j) \( t \)$ preserves its block, any preimage must have its source $k'_i = k_i - l$ in $B$.
  Suppose first that $B$ has size $a_i$. Choose $delta$ by the two conditions
  #[#set math.equation(numbering: n => "(5.2)")
   $ e_delta^b & = xi^(*) &  & upright("in ") bb(Z) \/ b_i bb(Z) \,\
e_delta^a + rho^a \( delta \) & = alpha^(*) + x_1 - q &  & upright("in ") bb(Z) \/ a_i bb(Z) . $ <model:a-inverse>]
  The first fibre ordering makes this choice unique. Set $y = alpha^(*) - e_delta^a$, let $k'_i$ be the unique point of $B$ with label $y$, and set $l = k_i - k'_i$. The useful output in (5.1) is then $\( alpha^(*) \, xi^(*) \)$. The high output has label
  $ y + x_1 - h_1 \( l \, delta \) = alpha^(*) + x_1 - #scale(x: 120%, y: 120%)[\(] e_delta^a + rho^a \( delta \) #scale(x: 120%, y: 120%)[\)] = q quad upright("in ") bb(Z) \/ a_i bb(Z) \, $
  so it is $beta_i^(*)$. Conversely, both target coordinates force exactly these choices of $delta \, y \, k'_i$ and $l$.
  If $B$ has size $b_i$, use the second fibre ordering to choose the unique $delta$ satisfying
  #[#set math.equation(numbering: n => "(5.3)")
   $ e_delta^a & = alpha^(*) &  & upright("in ") bb(Z) \/ a_i bb(Z) \,\
e_delta^b + rho^b \( delta \) & = xi^(*) + x_1 - q &  & upright("in ") bb(Z) \/ b_i bb(Z) . $ <model:b-inverse>]
  Now $y = xi^(*) - e_delta^b$ specifies $k'_i$ in $B$, and again $l = k_i - k'_i$. The high label is $xi^(*) + x_1 - \( e_delta^b + rho^b \( delta \) \) = q$ in $bb(Z) \/ b_i bb(Z)$. These choices are necessary and sufficient, proving the bijection in both cases. ◻
]

For an ordinary channel $i$, put $j_i \( x \) = f \( L_i \( x \) \)$ and define

#[#set math.equation(numbering: n => "(5.4)")
 $ c_i \( x \, k \) = C_(i \, j_i \( x \)) \( k_i \) \, #h(2em) beta_i \( x \, k \) = T_(i \, j_i \( x \)) \( x_1 \) k_i . $ <model:ordinary-outputs>]

Thus its active set is exactly ${ j_i \( x \) }$, and $c_i$ has the required dependence on $\( L_i \( x \) \, k_i \)$.

Fix a target base point $\( x \, k \)$ in the activation test for this channel. Every batch has $h in bb(Z) u_i$, so its source $x' = x - h$ satisfies $L_i \( x' \) = L_i \( x \)$. Consequently all these sources use the same block partition. Their low coordinates are $k'_i = k_i - l$ and their high outputs are $T_(i \, j_i \( x \)) \( x_1 - h_1 \) k'_i$. The shear (3.4) preserves this high output when the batch adds $h_1$ to $v_i$. Hence the batch values $\( c_i \, beta_i \)$ are precisely (5.1). By Lemma 5.1, Lemma 4.1, the ordinary activation equation is satisfied. Its freely varied $z$-coordinate places no condition on the common output to be defined next.

=== 5.2 Seed regions and one common output <seed-regions-and-one-common-output>

Choose disjoint subsets $S_(eta_1) \, S_(eta_2) subset S$ such that

#[#set math.equation(numbering: n => "(5.5)")
 $ lr(|S_(eta_1)|) = 3 \, #h(2em) lr(|S_(eta_2)|) = 4 \,\
S_(eta_t) subset { \( s_1 \, s_2 \) in S : s_1 equiv 0 \, med s_2 equiv t med \( mod med p \) } #h(2em) \( t = 1 \, 2 \) . $ <model:seed-regions>]

Each of the two specified residue classes has $p^2$ points, so these choices are possible. Write $S_0 = S \\ \( S_(eta_1) union S_(eta_2) \)$. Since $p > 200$ is prime, $D = p^4 equiv 1 med \( mod med 6 \)$, and therefore $lr(|S_0|) = D - 7$ is divisible by $6$. Recall that $a_(eta_1) = 2$ and $a_(eta_2) = 3$.

Partition each of these three regions into label spaces according to the following table. A label space is simply a subset equipped with the displayed bijection; these are not assertions about subgroups of $S$.

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Region
], table.cell(rowspan: 1, colspan: 1)[Inactive seeds
], table.cell(rowspan: 1, colspan: 1)[Label space
], table.cell(rowspan: 1, colspan: 1)[Number of copies
]),
  table.cell(rowspan: 1, colspan: 1)[$S_(eta_1)$
], table.cell(rowspan: 1, colspan: 1)[$eta_2$
], table.cell(rowspan: 1, colspan: 1)[$bb(Z) \/ 3 bb(Z)$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[$S_(eta_2)$
], table.cell(rowspan: 1, colspan: 1)[$eta_1$
], table.cell(rowspan: 1, colspan: 1)[$bb(Z) \/ 2 bb(Z)$
], table.cell(rowspan: 1, colspan: 1)[$2$
],
  table.cell(rowspan: 1, colspan: 1)[$S_0$
], table.cell(rowspan: 1, colspan: 1)[$eta_1 \, eta_2$
], table.cell(rowspan: 1, colspan: 1)[$bb(Z) \/ 2 bb(Z) times bb(Z) \/ 3 bb(Z)$
], table.cell(rowspan: 1, colspan: 1)[$\( D - 7 \) \/ 6$
],
)
]

For a seed $i$ inactive at $s$, denote its label coordinate by $y_i \( s \) in bb(Z) \/ a_i bb(Z)$. Thus a point of $S$ is specified by its region, the particular copy of the label space in that region, and its inactive-seed labels.

For $t in bb(Z)$, define a permutation $R \( t \)$ of $S$ by preserving each label space and adding $t$ to each of its label coordinates. In particular, $R \( t \)$ preserves all three regions, and its inverse is $R \( - t \)$. Fix an arbitrary bijection $lambda : S arrow.r bb(Z) \/ bb(Z) D$ and set

#[#set math.equation(numbering: n => "(5.6)")
 $ z \( x \, k \) = lambda #scale(x: 120%, y: 120%)[\(] R \( x_1 \) s \( x \) #scale(x: 120%, y: 120%)[\)] . $ <model:shared-output>]

Neither $lambda$ nor $R \( t \)$ is required to be a homomorphism. The set $S$ only indexes the values of this one cyclic output coordinate.

For a seed $i$, its digit set is the singleton ${ * }$. Abbreviate $C_(i \, *)$ and $T_(i \, *)$ to $C_i$ and $T_i$. Define

#[#set math.equation(numbering: n => "(5.7)")
 $ \( c_i \( x \, k \) \, beta_i \( x \, k \) \) = cases(delim: "{", #scale(x: 120%, y: 120%)[\(] C_i \( k_i \) \, T_i \( x_1 \) k_i #scale(x: 120%, y: 120%)[\)] \, & s \( x \) in S_i \,, #scale(x: 120%, y: 120%)[\(] \( y_i \( s \( x \) \) \, 0 \) \, k_i #scale(x: 120%, y: 120%)[\)] \, & s \( x \) in.not S_i .) $ <model:seed-outputs>]

The useful output depends only on $\( s \( x \) \, k_i \)$, as required by (3.5). Its sole digit is active exactly when $s \( x \) in S_i$.

=== 5.3 The inverse for each seed test <the-inverse-for-each-seed-test>

We verify both seed equations using the same functions (5.6) and (5.7). Fix a seed $i$, write $i'$ for the other seed, and fix a target base $\( x \, k \)$. The batch indexed by $\( l \, delta \, tau \)$ has a predetermined offset $h = h \( l \, delta \, tau \)$. Its source satisfies

$ x' = x - h \, #h(2em) s' = s \( x' \) = s \( x \) - tau \, #h(2em) k'_i = k_i - l . $

In addition to the congruences used by 13, the seed offsets satisfy

#[#set math.equation(numbering: n => "(5.8)")
 $ h_1 equiv 0 med \( mod med a_(i') \) . $ <model:other-seed-congruence>]

We will recover a unique batch from every target

$ #scale(x: 120%, y: 120%)[\(] c_i^(*) \, beta_i^(*) \, z^(*) #scale(x: 120%, y: 120%)[\)] in P_i times K_i times bb(Z) \/ bb(Z) D \, #h(2em) c_i^(*) = \( alpha^(*) \, xi^(*) \) . $

By 9, this is exactly the required tiling property. Put $s'' = lambda^(- 1) \( z^(*) \)$. Because $R \( x'_1 \)$ preserves each label space, the points $s'$ and $s''$ must be in the same region and the same copy of its label space.

===== 5.3.1 The seed is active at the source. <the-seed-is-active-at-the-source.>

Suppose $s'' in S_i$. In this region the only label coordinate belongs to the other seed $i'$. Equation (5.8) gives

$ y_(i') \( s'' \) = y_(i') \( s' \) + x_1 - h_1 = y_(i') \( s' \) + x_1 quad upright("in ") bb(Z) \/ a_(i') bb(Z) . $

Thus $s'$ is uniquely determined by $s''$: preserve its label-space identity and subtract $x_1$ from its label. Equivalently, $s' = R \( - x_1 \) s''$ within this region. We now know $tau = s \( x \) - s'$. For this fixed $tau$, apply 13 to the offsets $h_1 \( l \, delta \, tau \)$ and the fixed seed partition. The appropriate formula (5.2) or (5.3) recovers $delta$; the source label then fixes $k'_i$ and $l$. The resulting source has the prescribed $s'$ and sends its $z$-coordinate to $z^(*)$. Every target in this case therefore has exactly one preimage.

===== 5.3.2 The seed is inactive at the source. <the-seed-is-inactive-at-the-source.>

Suppose $s'' in.not S_i$, and let $q = y_i \( s'' \)$. The source high coordinate equals its low coordinate, so necessarily

$ k'_i = beta_i^(*) \, #h(2em) l = k_i - beta_i^(*) . $

The target useful output and the rotated $i$-label impose

$ e_delta^b = xi^(*) \, #h(2em) y_i \( s' \) = alpha^(*) - e_delta^a \, #h(2em) q = y_i \( s' \) + x_1 - rho^a \( delta \) . $

Consequently $delta$ is the unique index satisfying (5.2). These equations then fix the source label $y_i \( s' \)$. If the other seed is also inactive in this region, its source label is uniquely fixed by

$ y_(i') \( s' \) = y_(i') \( s'' \) - x_1 quad upright("in ") bb(Z) \/ a_(i') bb(Z) \, $

using (5.8). If the other seed is active, there is no second label to recover. Keeping the already known label-space identity, these labels determine exactly one $s'$, and then $tau = s \( x \) - s'$ fixes the remaining batch index. The offset for this recovered batch satisfies all the congruences used in the calculation, so it produces exactly the desired target. The recovery uses only the prescribed residues of $h_1$, so the offset indexed by the recovered $\( l \, delta \, tau \)$ has exactly the label action used to determine those indices. There is no dependence on a later choice of an integer lift. The necessity of every recovery step proves uniqueness.

For emphasis, on $S_0$ both labels are recovered on the same label space. In the test of $i$ their forward values are

$ y_i \( s'' \) & = alpha^(*) + x_1 - #scale(x: 120%, y: 120%)[\(] e_delta^a + rho^a \( delta \) #scale(x: 120%, y: 120%)[\)] \,\
y_(i') \( s'' \) & = y_(i') \( s' \) + x_1 . $

The first line selects $delta$ by the fibre ordering and then fixes $y_i \( s' \)$; the second fixes $y_(i') \( s' \)$ directly. Interchanging $i$ and $i'$ proves the other seed equation with exactly the same shared output $z$. Each equation has its own unique representing batch for a target; there is no requirement that those two batches coincide.

=== 5.4 Compatibility of all the equations <compatibility-of-all-the-equations>

The definitions (5.4), (5.6), and (5.7) specify $c_i \( x \, k \)$ and $beta_i \( x \, k \)$ for every channel, as well as $z \( x \, k \)$, at every base point $\( x \, k \)$. By (3.4), each chosen $beta_i$ determines exactly one $v_i in bb(Z) \/ r_i^2 bb(Z)$ with low coordinate $k_i$. Taking these points for all $\( x \, k \)$ defines a single set $A subset G$ satisfying the graph equation $A xor H_0 = G$.

The inverse calculations hold for every integer $x_1$, including negative values, since all rotations use addition in the specified finite label groups. They use only the stated residues of $h_1$, together with $s \( h \) = tau$ in a seed test and $L_i \( h \) = 0$ in an ordinary test. Thus any choices of the permitted Chinese remainder lifts, including those made to separate distinct batches, give the same verification. The actual integer $x_1$ in the high outputs and in $z$ causes no extra constraint: the dependence equations (3.5) restrict only the useful outputs $c_i$, not $beta_i$ or $z$. The useful outputs have exactly those prescribed dependencies, and all activation equations have just been checked on this one graph.

It remains to check the exclusion equations. At every $x$, the unique active ordinary word is

$ #scale(x: 120%, y: 120%)[\(] f \( L_0 \( x \) \) \, dots.h \, f \( L_(N - 1) \( x \) \) #scale(x: 120%, y: 120%)[\)] \, $

which is allowed by 6. Hence no forbidden ordinary word has all its labels active. If the seed $eta_t$ is active at $x$, then (5.5) gives $L_n \( x \) equiv t med \( mod med p \)$ for every ordinary $n$. Since $t in { 1 \, 2 }$ is nonzero modulo $p$, we have $f \( L_n \( x \) \) = t$. No forbidden seed and ordinary-symbol pair is simultaneously active either. 8 now verifies every exclusion tile.

Combining this common solution with the obstruction already proved in 12 yields the required intermediate result.

#thm([Theorem 5.2.])[
  #emph[There are a finite cyclic group $V$ and finitely many nonempty finite sets $F_1 \, dots.h \, F_s subset G = bb(Z)^2 times V$ for which the simultaneous tiling equations 
$ A xor F_nu = G #h(2em) \( 1 lt.eq nu lt.eq s \) $

 have a common solution, but no common solution is invariant under a finite-index subgroup of $G$.]
] <model:system>

#proof[
  Use the graph, dependence, exclusion, and activation tiles constructed in Section 3, Section 4. They are finite nonempty sets, and their finite coordinate group $V$ is cyclic. The graph constructed in this section solves all their equations. 12 excludes every fully periodic common solution. ◻
]

== 6 Stacking the system into one tile <sec:stacking>

We now replace the finite system of 14 by one translational tiling equation. The extra finite coordinate must preserve cyclicity, so we use a fresh prime cyclic group. The argument is a version of the stacking construction in #cite(label("GTPeriodic"), form: "prose") Theorem 3.1 and Lemma 3.2, with earlier consolidation results in #cite(label("GTTwoTiles"), form: "prose") Theorem 1.15 and Section 3. We give the partition and uniqueness arguments in full, choosing a fresh prime to retain the cyclic finite factor.

#thm([Lemma 6.1.])[
  (A partition with full difference sets).  #emph[For every positive integer $s$ and every finite set of primes, there is a prime $q$ outside that set and a partition 
$ bb(Z) \/ q bb(Z) = E_1 union.sq dots.h.c union.sq E_s $

 into nonempty sets satisfying $E_nu - E_nu = bb(Z) \/ q bb(Z)$ for every $nu$.]
] <stack:partition>

#proof[
  Choose a sufficiently large odd prime $q$, and color the elements of $bb(Z) \/ q bb(Z)$ independently and uniformly with $s$ colors. Fix a nonzero $d in bb(Z) \/ q bb(Z)$ and a color $nu$. Since $q$ is prime, the elements $0 \, d \, 2 d \, dots.h \, \( q - 1 \) d$ form one cycle. The pairs
  $ \( 0 \, d \) \, med \( 2 d \, 3 d \) \, dots.h \, \( \( q - 3 \) d \, \( q - 2 \) d \) $
  are disjoint, and the second element minus the first is $d$ in every pair. The probability that a given pair has color $nu$ at both ends is $s^(- 2)$; these events are independent across the pairs. Therefore the probability that $d in.not E_nu - E_nu$ is at most
  $ \( 1 - s^(- 2) \)^(floor.l q \/ 2 floor.r) . $
  By the union bound, the probability that some color fails to realize some nonzero difference is at most
  $ s \( q - 1 \) \( 1 - s^(- 2) \)^(floor.l q \/ 2 floor.r) . $
  For $s = 1$ this is zero, and for fixed $s > 1$ it tends to zero as $q$ tends to infinity. Choose $q$ large enough that the bound is less than one, also avoiding the specified finite set of primes. A successful coloring gives every nonzero difference in every color. Each color class is consequently nonempty, which also gives the zero difference. ◻
]

#thm([Proposition 6.2.])[
  (Stacking and periodicity).  #emph[Let $H$ be an abelian group, let $F_1 \, dots.h \, F_s subset H$ be finite nonempty sets, and let $E_1 \, dots.h \, E_s$ be a partition as in 15. Define 
$ F^(upright("st")) = union.big_(nu = 1)^s \( F_nu times E_nu \) subset H times bb(Z) \/ q bb(Z) . $

 There is a common solution to $A xor F_nu = H$ for all $nu$ if and only if $F^(upright("st"))$ tiles $H times bb(Z) \/ q bb(Z)$. Moreover, a fully periodic tiling by $F^(upright("st"))$ gives a fully periodic common solution, and a fully periodic common solution gives a fully periodic tiling by $F^(upright("st"))$.]
] <stack:equivalence>

#proof[
  If $A$ is a common solution, then $A times { 0 }$ is a tiling set for $F^(upright("st"))$: for a target $\( g \, t \)$, the partition of $bb(Z) \/ q bb(Z)$ selects a unique $nu$ with $t in E_nu$, and the equation $A xor F_nu = H$ selects a unique $g = a + f$. If $A$ has a finite-index period subgroup $P lt.eq H$, then $P times { 0 }$ has finite index in $H times bb(Z) \/ q bb(Z)$ and preserves this tiling set.
  Conversely, suppose that $B xor F^(upright("st")) = H times bb(Z) \/ q bb(Z)$, and fix $g in H$. A contribution to the fibre ${ g } times bb(Z) \/ q bb(Z)$ of color $nu$ consists of a pair $\( \( a \, t \) \, f \)$ with $\( a \, t \) in B$, $f in F_nu$, and $a + f = g$. This contribution covers the vertical set $t + E_nu$. There are only finitely many contributions: $a$ is determined by $f$, and there are at most $q$ possible values of $t$. Two distinct contributions of the same color cannot occur. Indeed, the identity $E_nu - E_nu = bb(Z) \/ q bb(Z)$ makes any two translates of $E_nu$ intersect, contradicting uniqueness in the stacked tiling.
  Let $n_nu \( g \) in { 0 \, 1 }$ be the number of contributions of color $nu$. Exact coverage of the fibre gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ sum_(nu = 1)^s n_nu \( g \) \| E_nu \| = q = sum_(nu = 1)^s \| E_nu \| . $ <stack:fibre-count>]
  Every $\| E_nu \|$ is positive, so (6.1) forces $n_nu \( g \) = 1$ for all $nu$.
  Projection $"pr" : H times bb(Z) \/ q bb(Z) arrow.r H$ is injective on $B$. Otherwise, two distinct points $\( a \, t \) \, \( a \, t' \) in B$, together with any $f in F_1$, would give two color-$1$ contributions at $g = a + f$. Consequently $A = "pr" \( B \)$ is a set of projected translations without multiplicity. The equality $n_nu \( g \) = 1$ now says exactly that $g$ has one representation in $A + F_nu$. Thus $A xor F_nu = H$ for every $nu$.
  Finally, if $B + P = B$ for a finite-index subgroup $P lt.eq H times bb(Z) \/ q bb(Z)$, then $A + "pr" \( P \) = A$. The induced map
  $ \( H times bb(Z) \/ q bb(Z) \) \/ P arrow.r H \/ "pr" \( P \) $
  is surjective, so $"pr" \( P \)$ has finite index. This proves the periodicity assertion. ◻
]

#thm([Corollary 6.3.])[
  (One tile with a cyclic finite coordinate).  #emph[For some positive integer $Q$, there is a finite nonempty set $F subset Gamma = bb(Z)^2 times bb(Z) \/ Q bb(Z)$ which tiles $Gamma$ but admits no fully periodic tiling.]
] <stack:cyclic>

#proof[
  Apply 16 to the finite system from 14 in $G = bb(Z)^2 times V$. Choose the prime $q$ in 15 not to divide $\| V \|$. Since $V$ is cyclic, $V times bb(Z) \/ q bb(Z)$ is cyclic of order $Q = q \| V \|$: a pair of generators has order $Q$ by coprimality. The common solution gives a tiling by the stacked tile, and a fully periodic stacked tiling would give a fully periodic common solution, contrary to 14. Identify the finite product with $bb(Z) \/ Q bb(Z)$ and call the stacked tile $F$. Since every system tile has cardinality $M = \| H_0 \|$, the disjoint stacking gives $\| F \| = q M$. ◻
]

== 7 Passing to three-dimensional space <sec:geometry>

It remains to remove the finite coordinate in 17. We construct a finite tile in $bb(Z)^3$ whose unit-cube thickening also excludes periodic tilings with arbitrary real translation vectors. Quotient-to-lattice reductions are studied by #cite(label("MSSReduction"), form: "prose") Theorem 1.1, building on earlier rigid tile constructions such as #cite(label("GTTwoTiles"), form: "prose") Lemma 9.3. The need to constrain real translation vectors also appears in the Euclidean reduction of #cite(label("GTPeriodic"), form: "prose") Theorem 2.1 and Lemma 2.2. The argument below proves both required statements directly for the same finite tile and its unit-cube thickening.

Let

$ pi : bb(Z)^3 arrow.r Gamma \, #h(2em) pi \( a_1 \, a_2 \, a_3 \) = \( a_1 \, a_2 \, a_3 med mod med Q \) \, #h(2em) w = \( 0 \, 0 \, Q \) . $

Thus $ker pi = bb(Z) w$. Translate the tile $F$ of 17 so that $0 in F$, and choose a finite set $U subset bb(Z)^3$ containing $0$ on which $pi$ is a bijection onto $F$. In particular,

#[#set math.equation(numbering: n => "(7.1)")
 $ U ∩ ker pi = { 0 } \, #h(2em) w in.not U . $ <geom:representatives-U>]

Translating $F$ changes neither tileability nor the existence of a fully periodic tiling.

=== 7.1 A residue transversal with many differences <a-residue-transversal-with-many-differences>

#thm([Lemma 7.1.])[
  (Rigid representatives).  #emph[For a sufficiently large integer $m gt.eq 2$, one can choose 
$ T_0 = { t \( v \) : v in { 0 \, dots.h \, m - 1 }^3 } \, #h(2em) t \( v \) equiv v med \( mod med m \) \, $

 such that, with $T_(*) = T_0 \\ { t \( 0 \) }$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ T_(*) - T_(*) supset { d in bb(Z)^3 : ∥d∥_oo lt.eq m \, med d in.not m bb(Z)^3 } . $ <geom:difference-property>]

]
] <geom:random-representatives>

#proof[
  Choose independently, for each residue $v$,
  $ t \( v \) = v + m h_v \, #h(2em) h_v upright(" uniform in ") { - 2 \, - 1 \, 0 \, 1 \, 2 }^3 . $
  Fix a requested vector $d$ on the right-hand side of (7.2). Translation by $d med mod med m$ on $\( bb(Z) \/ m bb(Z) \)^3$ is a permutation without fixed points. A cycle of length $L gt.eq 2$ contains $floor.l L \/ 2 floor.r gt.eq L \/ 3$ disjoint successive pairs. Selecting these pairs in every cycle gives at least $m^3 \/ 3$ disjoint pairs of residues $\( u \, v \)$ with $v - u equiv d med \( mod med m \)$. Discard the pair containing residue $0$, if there is one. At least
  $ k_m = floor.l m^3 \/ 3 floor.r - 1 $
  pairs remain, all with both endpoints nonzero.
  For such a pair, the equality $t \( v \) - t \( u \) = d$ asks for
  $ h_v - h_u = frac(d - \( v - u \), m) . $
  This is an integer vector whose coordinates have absolute value at most $2$, since $∥d∥_oo lt.eq m$ and the coordinates of $u \, v$ lie between $0$ and $m - 1$. Two independent uniform variables on ${ - 2 \, - 1 \, 0 \, 1 \, 2 }$ have any specified difference of absolute value at most $2$ with probability at least $3 \/ 25$. Hence each chosen pair realizes $d$ with probability at least
  $ c = \( 3 \/ 25 \)^3 = 27 \/ 15625 . $
  These events are independent because the pairs have disjoint endpoints. Failure to realize this $d$ has probability at most $\( 1 - c \)^(k_m)$. There are at most $\( 2 m + 1 \)^3$ requested vectors, so the probability that (7.2) fails is at most
  $ \( 2 m + 1 \)^3 \( 1 - c \)^(k_m) . $
  This tends to zero as $m$ tends to infinity. Fix $m gt.eq 2$ for which it is less than one, and then fix a successful choice of the representatives. Every witnessing pair avoids residue $0$, as required. ◻
]

Define the second transversal by moving just the marked point:

$ T_1 = T_(*) union { t \( 0 \) + m w } . $

Both $T_0$ and $T_1$ have exactly one representative of each residue modulo $m$. The switch is illustrated schematically in 2.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0.8, 1.35), [#text(size: 9pt)[$T_0$]], anchor: "east", padding: 0.1176cm)
  content((0.8, -0.35), [#text(size: 9pt)[$T_1$]], anchor: "east", padding: 0.1176cm)
  rect((1.55, 1.19), (1.87, 1.51), fill: rgb("#d6d6d6"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10))
  rect((2.17, 1.19), (2.49, 1.51), fill: rgb("#d6d6d6"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10))
  content((2.94, 1.35), [#text(size: 9pt)[$dots.h$]])
  rect((3.4, 1.19), (3.72, 1.51), fill: rgb("#d6d6d6"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10))
  content((2.64, 0.84), [#text(size: 9pt)[$T_*$]])
  rect((1.55, -0.51), (1.87, -0.19), fill: rgb("#d6d6d6"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10))
  rect((2.17, -0.51), (2.49, -0.19), fill: rgb("#d6d6d6"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10))
  content((2.94, -0.35), [#text(size: 9pt)[$dots.h$]])
  rect((3.4, -0.51), (3.72, -0.19), fill: rgb("#d6d6d6"), stroke: (paint: rgb("#737373"), thickness: 0.5pt, miter-limit: 10))
  content((2.64, -0.86), [#text(size: 9pt)[$T_*$]])
  rect((4.84, 1.19), (5.16, 1.51), stroke: (thickness: 0.9pt, miter-limit: 10))
  content((5, 0.84), [#text(size: 9pt)[$t(0)$]])
  rect((4.84, -0.51), (5.16, -0.19), stroke: (paint: rgb("#8c8c8c"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  line((5.4, -0.35), (9.36, -0.35), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.22cm, fill: black)))
  content((7.38, -0.2442), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$"mw"$]]], anchor: "south", padding: 0.1176cm)
  rect((9.6, -0.51), (9.92, -0.19), stroke: (thickness: 0.9pt, miter-limit: 10))
  content((9.76, -0.86), [#text(size: 9pt)[$t(0)+"mw"$]])
})],
  caption: [Figure 2: Schematic of the marked-point switch, without depicting the actual positions or scale. The gray marks represent the same common set $T_(*)$ in both rows. The marked point moves from $t \( 0 \)$ to $t \( 0 \) + m w$; the dashed outline shows its former location. The marks may also denote unit-cube thickenings. In a grid assembly this switch gives the kernel-invariance identity (7.7). ],
) <geom:fig-switch>

Our final discrete tile is

#[#set math.equation(numbering: n => "(7.3)")
 $ T = T_1 union union.big_(u in U \\ { 0 }) \( m u + T_0 \) \, #h(2em) Omega = T + \[ 0 \, 1 \]^3 . $ <geom:large-tile>]

The finite union defining $T$ is disjoint. To see this, equality of two points first forces equality of their residue labels $v$ modulo $m$. For $v eq.not 0$, the points are $m u + t \( v \)$, and equality forces the same $u$. For $v = 0$, the unmarked points are $m u + t \( 0 \)$ with $u in U \\ { 0 }$, while the marked point is $m w + t \( 0 \)$. They are all distinct by (7.1). In particular, $\| T \| = \| U \| m^3$.

Write

$ Omega_i = T_i + \[ 0 \, 1 \]^3 quad \( i = 0 \, 1 \) \, #h(2em) Omega_(*) = T_(*) + \[ 0 \, 1 \]^3 . $

Each $Omega_i$ has volume $m^3$, and their common subset $Omega_(*)$ has positive volume $m^3 - 1$. Unit cubes with distinct integer lower corners have disjoint interiors, so the decomposition of $T$ in (7.3) gives the corresponding decomposition of $Omega$ up to null boundaries. We call the translation vector $c$ the center of the copy $c + T_i$ or $c + Omega_i$.

=== 7.2 Existence of a tiling <existence-of-a-tiling>

#thm([Proposition 7.2.])[
  #emph[The tile $T$ tiles $bb(Z)^3$, and $Omega$ tiles $bb(R)^3$ up to null sets.]
] <geom:existence>

#proof[
  Let $A xor F = Gamma$ be a tiling from 17, and put $B = pi^(- 1) \( A \)$. Then $B + w = B$. Also $B xor U = bb(Z)^3$: for any $g in bb(Z)^3$, the unique representation of $pi \( g \)$ in $A + F$ determines a unique $u in U$, and then $g - u in B$ is the unique possible other summand.
  Place copies of $T$ at all translations in $m B$. Their constituent copies of $T_0$ or $T_1$ have centers $m \( b + u \)$, for $b in B$ and $u in U$. Since $B xor U = bb(Z)^3$, there is exactly one such center at every point of $m bb(Z)^3$. Its type is $1$ precisely at the centers $m B$, because the type-$1$ piece corresponds to $u = 0$.
  The assembly with $T_0$ at every center in $m bb(Z)^3$ tiles $bb(Z)^3$ exactly: each integer vector has a unique residue label $v$ and a unique expression $m a + t \( v \)$. Switching to type $1$ at the centers $m B$ removes the marked points
  $ t \( 0 \) + m B $
  and inserts
  $ t \( 0 \) + m \( B + w \) = t \( 0 \) + m B . $
  The insertion is a bijective relocation, so all multiplicities remain one. This proves $m B xor T = bb(Z)^3$. Thickening by unit cubes gives an almost-everywhere tiling by $Omega$ with the same translation set: away from the integer coordinate planes, every point belongs to the interior of one integer unit cube. ◻
]

=== 7.3 Rigidity for real translation vectors <rigidity-for-real-translation-vectors>

We next show why arbitrary real translations cannot produce a periodic tiling. The marked-point modification has two roles. The common part forces the centers of the small pieces onto one grid, and the moved point then forces invariance under the kernel direction $w$.

#thm([Lemma 7.3.])[
  (Rounding in the closed box).  #emph[Let $m gt.eq 2$, and suppose that $delta in bb(R)^3$ satisfies $∥delta∥_oo lt.eq m$ and $delta in.not m bb(Z)^3$. There is $d in bb(Z)^3 \\ m bb(Z)^3$ such that 
$ ∥d∥_oo lt.eq m \, #h(2em) ∥delta - d∥_oo < 1 . $

]
] <geom:rounding>

#proof[
  If $delta$ is integral, use $d = delta$. Otherwise, keep every integer coordinate unchanged and round each noninteger coordinate either down or up. Both choices lie in $\[ - m \, m \]$, since the endpoints are integers, and both are at distance strictly less than one from the original coordinate. In at least one noninteger coordinate choose a rounding which is not a multiple of $m$. Such a choice exists because two consecutive integers cannot both be multiples of $m gt.eq 2$. The resulting $d$ is not in $m bb(Z)^3$. Coordinates of $delta$ equal to $m$ or $- m$ are left unchanged, so the strict distance estimate also holds on the boundary of the box. ◻
]

#thm([Lemma 7.4.])[
  (A periodic assembly has grid centers).  #emph[Suppose copies $c + Omega_(iota \( c \))$, with types $iota \( c \) in { 0 \, 1 }$, form an almost-everywhere tiling of $bb(R)^3$. Assume the assembly, including its types, is invariant under a full-rank lattice $Lambda subset bb(R)^3$. Then the set $C$ of centers is $c_0 + m bb(Z)^3$ for some $c_0 in bb(R)^3$.]
] <geom:grid>

#proof[
  First, two constituent copies cannot have the same center, because both contain the positive-volume common part $Omega_(*)$. Thus the centers and their types are unambiguous. We claim that distinct centers $c \, c'$ satisfy
  #[#set math.equation(numbering: n => "(7.4)")
   $ ∥c' - c∥_oo lt.eq m quad arrow.r.double quad c' - c in m bb(Z)^3 . $ <geom:nearby-centers>]
  If $delta = c' - c$ violated this assertion, 20 would give a vector $d$ in the difference set in (7.2) with $∥delta - d∥_oo < 1$. Write $d = t - t'$ for $t \, t' in T_(*)$. The two common-part unit cubes
  $ c + t + \[ 0 \, 1 \]^3 \, #h(2em) c' + t' + \[ 0 \, 1 \]^3 $
  have lower corners whose coordinate differences have absolute value strictly less than one. Their intersection therefore has positive volume, contradicting the tiling property. This proves (7.4).
  In particular, distinct centers have sup-norm distance at least $m$: a nonzero vector in $m bb(Z)^3$ cannot have smaller sup norm. The set $C$ is consequently uniformly separated and locally finite. The auxiliary closed cubes
  $ Q_c = c + \[ - m \/ 2 \, m \/ 2 \]^3 #h(2em) \( c in C \) $
  have disjoint interiors. Each has volume $m^3$, equal to the volume of either constituent type.
  We use periodicity to show that these auxiliary cubes cover. Let $P$ be a bounded half-open fundamental parallelepiped for $Lambda$. There are finitely many centers modulo $Lambda$, by local finiteness; choose representatives $c_1 \, dots.h \, c_r$. Their types $iota_1 \, dots.h \, iota_r$ are preserved under $Lambda$. Integrating the constituent tiling over $P$ gives
  $ \| P \| & = integral_P sum_(j = 1)^r sum_(lambda in Lambda) upright(bold(1))_(c_j + lambda + Omega_(iota_j)) \( x \) thin d x\
 & = sum_(j = 1)^r \| Omega_(iota_j) \| = r m^3 . $
  For the second equality, translate the integration domains by $- lambda$ and use that ${ P - lambda : lambda in Lambda }$ partitions $bb(R)^3$ up to boundaries. Nonnegative summands justify the exchange of summation and integration.
  The same calculation for the auxiliary cubes gives
  $ integral_P sum_(c in C) upright(bold(1))_(Q_c) \( x \) thin d x = r m^3 = \| P \| . $
  The integrand is at most one almost everywhere, because the cubes have disjoint interiors; their countably many boundaries are null. It is therefore one almost everywhere on $P$, and periodicity gives almost-everywhere coverage of $bb(R)^3$. The family of closed cubes ${ Q_c }_(c in C)$ is locally finite, so its union is closed. A point outside the union would have an open neighborhood of positive volume outside it, contradicting almost-everywhere coverage. Thus the cubes cover every point of $bb(R)^3$.
  Their intersection graph is connected. Indeed, if one graph component were separated from the remaining components, the unions of their respective cubes would be disjoint nonempty closed sets covering $bb(R)^3$. Both unions are closed because they are subfamilies of a locally finite family of closed sets. They would disconnect $bb(R)^3$, which is impossible. Whenever $Q_c$ and $Q_(c')$ intersect, $∥c' - c∥_oo lt.eq m$, so (7.4) puts their difference in $m bb(Z)^3$. Following paths in the intersection graph therefore puts every center in one coset $c_0 + m bb(Z)^3$.
  No point of that coset can be missing. The interior of the side-$m$ cube at a missing grid point is disjoint from all side-$m$ cubes at the other grid points and would be uncovered. Hence $C = c_0 + m bb(Z)^3$. ◻
]

=== 7.4 Kernel invariance and descent <kernel-invariance-and-descent>

#thm([Proposition 7.5.])[
  #emph[The Euclidean tile $Omega$ has no almost-everywhere translational tiling whose translation set is invariant under a full-rank lattice in $bb(R)^3$.]
] <geom:no-periodic>

#proof[
  Suppose, to the contrary, that $cal(A) subset bb(R)^3$ is such a translation set and that $cal(A) + Lambda = cal(A)$ for a full-rank lattice $Lambda$. Distinct vectors of $cal(A)$ have sup-norm distance at least one: otherwise their translates of a fixed unit cube in $Omega$ would overlap in positive volume. Hence $cal(A)$ is countable. Decompose every translated copy of $Omega$ using (7.3). A copy at $a in cal(A)$ has a type-$1$ constituent centered at $a$ and type-$0$ constituents centered at $a + m u$ for $u in U \\ { 0 }$. The constituents form an almost-everywhere tiling and inherit the lattice periods, including their types. No two constituents have the same center, as observed in the proof of 21. Consequently the map
  #[#set math.equation(numbering: n => "(7.5)")
   $ cal(A) times U arrow.r C \, #h(2em) \( a \, u \) mapsto a + m u $ <geom:center-decomposition>]
  is a bijection, and the type-$1$ centers are exactly $cal(A)$.
  By 21, $C = c_0 + m bb(Z)^3$. Translate the entire assembly by $- c_0$, which does not change its period lattice, and henceforth write $C = m bb(Z)^3$. There is a set $B' subset bb(Z)^3$ such that $cal(A) = m B'$. Let $b \( a \) = upright(bold(1))_(B') \( a \)$; this records the type at the center $m a$. The bijection (7.5), divided by $m$, gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ B' xor U = bb(Z)^3 . $ <geom:upstairs-tiling>]
  Consider the open unit cell with lower corner $t \( 0 \) + m a$, for any $a in bb(Z)^3$. Since all constituent centers and all voxel positions are integral, a unit cube can meet the interior of this cell only if it has the same lower corner. The residues modulo $m$ then exclude every common-part point $t \( v \)$ with $v eq.not 0$. There are exactly two possible sources: the unshifted marked point from type $0$ at $m a$, or the moved marked point from type $1$ at $m \( a - w \)$. The coverage multiplicity on this open cell is therefore
  $ 1 - b \( a \) + b \( a - w \) . $
  The almost-everywhere tiling makes it one. Thus $b \( a \) = b \( a - w \)$ for every $a$, or equivalently
  #[#set math.equation(numbering: n => "(7.7)")
   $ B' + w = B' . $ <geom:kernel-invariance>]
  This also gives invariance under every element of $ker pi = bb(Z) w$.
  The set $B'$ is fully periodic in the discrete sense. It is nonempty, and $cal(A) = m B' subset m bb(Z)^3$. For $a_0 in cal(A)$ and any $lambda in Lambda$, both $a_0$ and $a_0 + lambda$ belong to $m bb(Z)^3$, so $lambda in m bb(Z)^3$. Hence $L = m^(- 1) Lambda$ is a rank-three lattice contained in $bb(Z)^3$ and preserves $B'$. Such an integer lattice has finite index: the matrix formed by an integer basis has nonzero integer determinant, whose absolute value is its index. In particular, $L lt.eq bb(Z)^3$ is a finite-index period subgroup of $B'$.
  We finally descend the exact tiling (7.6) to the quotient. Fix $gamma in Gamma$ and any lift $g in bb(Z)^3$. For each $u in U$, there is a representation
  $ gamma = alpha + pi \( u \) \, #h(2em) alpha in pi \( B' \) \, $
  if and only if $g - u in B'$. One direction follows by applying $pi$. For the other, if $alpha = pi \( b_0 \)$ with $b_0 in B'$, then $g - u - b_0 in ker pi$; (7.7) therefore puts $g - u$ in $B'$. By (7.6), exactly one $u$ has this property, and $pi$ is injective on $U$. Thus
  $ pi \( B' \) xor pi \( U \) = Gamma . $
  This quotient tiling is fully periodic. Indeed, $pi \( L \)$ preserves $pi \( B' \)$, and the surjection $bb(Z)^3 \/ L arrow.r Gamma \/ pi \( L \)$ shows that $pi \( L \)$ has finite index. Since $pi \( U \) = F$, this contradicts 17. ◻
]

#proof[
  #emph[Completion of the proof of 1.] The finite nonempty tile $T$ from (7.3) and its closed unit-cube thickening $Omega$ admit the tilings in 19. The Euclidean tiling cannot be fully periodic by 22. If a discrete tiling of $T$ had a finite-index period subgroup in $bb(Z)^3$, thickening its unit cells would give an almost-everywhere tiling of $Omega$ invariant under the same subgroup, viewed as a full-rank lattice in $bb(R)^3$. This is also excluded by 22, proving both claims. ◻
]

#prodef([Remark 7.6.])[
  (Finite selection of the tile data).  The finite data in the construction can be selected by terminating finite searches. The primes can be selected successively by trial division. The tiling tests involve maps between finite sets. Lemmas 15 and 18 give explicit inequalities under which a suitable finite coloring or residue transversal exists; exhaustive search then selects one. This describes the finite tile itself. The infinite tiling that proves existence is instead specified by the last-nonzero-digit function. No practical bound on the size of the finite construction is required.
]


#bibliography("refs.bib", style: "ieee", title: [References])
