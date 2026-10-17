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

#align(center)[#text(size: 16pt, weight: "bold")[An infinite finitely presented simple amenable group]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A discrete group $G$ is #emph[amenable] if, for every finite $K subset.eq G$ and every $epsilon > 0$, there is a nonempty finite $D subset.eq G$ such that

#[#set math.equation(numbering: n => "(1)")
 $ \| g D triangle.stroked.t D \| < epsilon \| D \| #h(2em) \( g in K \) . $ <eq:folner-introduction>]

It is #emph[simple] if its only normal subgroups are the trivial group and $G$, and #emph[finitely presented] if $G tilde.equiv F \( S \) \/ chevron.l #h(-0.16667em) chevron.l R chevron.r #h(-0.16667em) chevron.r$ for finite sets of generators $S$ and relator words $R$. We address the existence problem asking whether these three properties can hold together in an infinite group.

#thm([Theorem 1.1.])[
  #emph[There exists an infinite finitely presented simple amenable group.]
] <thm:main>

The group will be an alternating subgroup of a polygon exchange group on a sufficiently large finite number of squares. Both the number of squares and the eventual sets of generators and relators are finite. No uniform bound on their sizes is needed for the existence statement.

=== 1.1 Context and the role of finite presentation <context-and-the-role-of-finite-presentation>

A topological full group records the finite local orbit rules of a dynamical system. For a homeomorphism $phi$ of a Cantor space, it consists of the homeomorphisms that agree with integer powers of $phi$ on the members of a finite clopen partition. Giordano, Putnam and Skau developed these groups as invariants of Cantor minimal systems and their orbit equivalence relations #cite(label("GiordanoPutnamSkau1999")). Matui proved simplicity of their derived groups and characterized finite generation by the minimal subshift condition #cite(label("Matui2006")) Theorems 4.9 and 5.4. Juschenko and Monod then proved amenability of the full group of every minimal homeomorphism of a Cantor space #cite(label("JuschenkoMonod2013")) Theorem A. Combined with this earlier structure theory, their Corollary B gives infinite finitely generated simple amenable groups.

Finite presentation is the obstruction left by those examples. The existence question predates them: Button records it in #cite(label("Button2010")) p. 729, and Juschenko and Monod raise it again on page 776 of #cite(label("JuschenkoMonod2013")). Matui proved that the derived groups arising from minimal subshifts are not finitely presented #cite(label("Matui2006")) Theorem 5.7. Grigorchuk and Medynets established a broader approximation property: the full group of every Cantor minimal system is locally embeddable into finite groups #cite(label("GrigorchukMedynets2014")) Theorem 2.6. This means that each finite subset admits an injective map into a finite group preserving all products that stay within that subset. The property passes to subgroups, and a finitely presented group with this property is residually finite. An infinite simple group cannot be residually finite, since a nontrivial homomorphism from it to a finite group would be injective. Thus this local finite approximation property also explains why the classical full-group examples cannot settle the finite-presentation question.

There is also a presentation theory for the classical examples. Grigorchuk and Medynets describe their derived groups using local $3$-cycles and relations expressing refinement and disjointness of clopen pieces #cite(label("GrigorchukMedynets2018")). For a minimal subshift, their presentation can use a finite generating set, but its relations remain infinitely indexed. Such presentations separate the task of finding finite generators from the harder task of deriving all local permutation laws from finitely many relations.

Subsequent constructions have strengthened the finitely generated existence theorem in other directions. Nekrashevych constructed infinite finitely generated simple torsion groups of intermediate growth #cite(label("Nekrashevych2018")) Theorem 1.2, and Kionke and Schesler obtained two-generated infinite simple amenable groups #cite(label("KionkeSchesler2024")). These advances do not give finite presentation. The latter requirement still appears in Zaremsky’s July 2026 problem list #cite(label("Zaremsky2026")) Problem 10; Theorem 1 answers the existence question positively.

Higher-dimensional piecewise translation groups offer a broader setting, but bring a separate amenability problem. Chornyi, Juschenko and Nekrashevych extended finite-generation methods to the derived subgroups of full groups of minimal faithful $bb(Z)^d$-actions conjugate to finite-alphabet subshifts #cite(label("ChornyiJuschenkoNekrashevych2020")) Theorem 1 in the author version. Nekrashevych’s alternating full groups organize the local even permutations through multisections, and their simplicity follows from minimality for effective étale groupoids with Cantor unit space #cite(label("Nekrashevych2019")) Section 3 and Theorem 4.1. Our local even permutations are an instance of that construction; we prove the needed comparison and simplicity statements directly. Amenability does not follow from the rank of the acting group: Elek and Monod constructed a free minimal Cantor $bb(Z)^2$-action whose full group contains a nonabelian free group #cite(label("ElekMonod2013")) Theorem 1.

The geometric construction has a particularly close predecessor in the Penrose model of Chornyi, Juschenko and Nekrashevych #cite(label("ChornyiJuschenkoNekrashevych2020")) Section 4 in the author version. They split the plane along five arithmetic families of lines, realize polygonal pieces as clopen sets, and describe the full group by piecewise translations on four pentagonal windows. The translation group has rank four over $bb(Z)$. Our model likewise combines a split plane with finitely many polygonal regions, but uses four directions over a real quadratic ring. Amenability requires a separate argument: the Penrose example in that source is not asserted to be amenable.

Cornulier and Lacourte study the unrestricted rectangle exchange group on $\[ 0 \, 1 \)^d$, for every $d gt.eq 1$, allowing arbitrary real endpoints and translation vectors #cite(label("CornulierLacourte2025")). They prove that its derived subgroup is simple and ask about amenability, second homology, and bounded relator length over the infinite generating set of all restricted shuffles. Our group restricts the arithmetic parameters and permits two inclined edge directions in addition to the coordinate directions. Finite unions of coordinate rectangles do not give these inclined boundaries. Moreover, bounded relator length over an infinite set of generators is a different requirement from the finite presentation sought here. The proof below propagates relations while keeping the generating set fixed and finite.

The amenability argument is related to the almost-invariant finite configurations of Juschenko and Monod #cite(label("JuschenkoMonod2013")) Theorem C and to the extensive-amenability methods of Juschenko, Matte Bon, Monod and de la Salle #cite(label("JuschenkoMatteBonMonodDeLaSalle2018")) Section 5. For interval-exchange groups whose translation increments modulo one generate an abelian group of rational rank at most two, recurrence gives an extensively amenable action on the circle. Comparing the two continuity conventions at discontinuities gives a cocycle into finitely supported permutations with amenable kernel. Polygonal boundaries are line segments, so this finite-discontinuity argument does not apply directly. Here correlated random fields produce polygonal partitions whose barriers respect every prescribed translation chart. Matching cells of the same shape then yields almost-invariant measures on the exchange group.

The homological argument follows the stability and symmetric monoidal category approach used by Szymik and Wahl for Higman–Thompson groups #cite(label("SzymikWahl2019")). Li’s general framework also reaches individual full groups and their derived groups: for minimal ample groupoids with locally compact Hausdorff unit space, no isolated units, and comparison, their homology is identified with that of an infinite loop space and its universal cover, respectively #cite(label("Li2025")) Theorem 5.18 and Corollary 5.20. We give a concrete low-degree implementation for the polygon algebra. An explicit resolution reduces the calculation to translation modules of polygonal step functions, and a fixed finite collection of square copies controls the passage to the alternating group’s multiplier. Polyhedral indicator modules and finite translation-orbit data also underlie the projection-pattern calculations recalled in #cite(label("GahlerHuntonKellendonk2013")) Section 3.1; our coefficient finiteness is proved directly by corner data. We use Segal’s bar and realization results and ordinary integral group completion, with the corrected proof of Miller and Palmer #cite(label("Segal1974")) #cite(label("McDuffSegal1976")) #cite(label("MillerPalmer2015")).

=== 1.2 The construction and the proof <the-construction-and-the-proof>

The polygons have edges on level lines of

$ x \, quad y \, quad y - lambda x \, quad x - lambda y \, $

at levels in $cal(O) = bb(Z) \[ tau \]$, where $tau = \( 1 + sqrt(5) \) \/ 2$ and $lambda$ is a sufficiently large power of $tau$. The other real embedding makes $lambda$ small. We identify polygonal sets that differ only on their edges, or equivalently use the compact Stone space $X$ of their Boolean algebra on a square. For a finite integer $m$, the group $F_m$ consists of all finite piecewise translations of $m$ disjoint copies of $X$. Its subgroup $A_m$ is generated by even permutations of disjoint translated polygonal pieces, with the pieces identified by their translations. These definitions are made precise in Section 2. We eventually choose one finite $m$ satisfying all homology and local-permutation requirements, and use that same $A_m$ for every property. The homological stabilization below is a tool for studying this fixed group; the example is not a union over increasing track numbers.

Strict area comparison supplies spare pieces. It implies that $A_m = \[ F_m \, F_m \]$ is infinite, perfect, and simple (Theorem 5). The remaining proof has three parts.

+ #emph[Amenability.] For a fixed finite collection of exchanges, we build partition boundaries from marked segments on allowable lines. One random field selects subdivision points on each line, and a second selects the segments between them. The fields are correlated over a range of scales in the conjugate embedding. The correlations make bounded translations inexpensive in total variation while keeping individual fluctuations small. Prescribed mean values force the chart-edge intersections to be marked and the chart boundaries to be barriers on an event of arbitrarily high probability. On that event every partition cell stays in a translation chart, so its image has the same shape. Uniform matchings between cells of the same shape convert the partition laws into finitely supported almost invariant group measures, and then into the Følner sets in (1) (Theorem 6).
+ #emph[Finite generation of the multiplier.] We prove that the Schur multiplier $H_2 \( A_m \; bb(Z) \)$ is finitely generated once $m$ is sufficiently large. An ordered-embedding complex gives homological stability for $F_m$ in the needed degrees. A symmetric monoidal category of polygons then reduces its stable homology to translation homology of integer-valued polygonal functions. Such functions are detected by finitely many translation types of corner data, giving the required algebraic finiteness. An argument using a fixed finite bank of reserved tracks transfers the result to $A_m$ (Theorem 12).
+ #emph[A finitely presented central cover.] We use permutations of the tracks applied only over specified polygonal sets, together with translations whose total shift over the tracks is zero. Finitely many such elements generate $A_m$. A finite collection of their true relations presents a group $hat(G)$ mapping onto $A_m$; the task is to prove that the kernel is central.
  Start with the permutation relations for coordinate cuts at $i tau$ modulo one, with $i$ ranging over a fixed finite interval of integers. To extend this range, the large ordinary slope of $lambda$ places an inclined line between two small coordinate rectangles. Its small conjugate value keeps the new transverse coordinate indices within ranges covered by the preceding induction step. Fixed overlap relations compare the permutation actions along that line, proving that permutations on the two rectangles commute. This enlarges the coordinate laws. The resulting rectangular decompositions then reduce arbitrary polygonal tests to finitely many configurations of concurrent lines. Finally, exact conjugation formulas for permutations of disjoint translated pieces show that a word acting trivially on the $m$ squares commutes with every generator of $hat(G)$ (Theorem 46).

The last two parts have different purposes. A finitely generated second homology group alone does not imply finite presentation. Together with the central extension

$ 1 arrow.r K arrow.r hat(G) arrow.r A_m arrow.r 1 \, $

the homological five-term sequence shows that $K$ is a finitely generated abelian group. Killing finitely many generators of $K$ then gives a finite presentation of $A_m$.

Sections 2–3 construct the group and establish simplicity. Sections 4 and 5 prove the first two main ingredients. Sections 6–8 construct the central cover, and Section 9 completes the proof of Theorem 1.

== 2 The polygon algebra and its translation groups <sec:geometry>

We first construct the group to which the three main arguments will apply. Four families of parallel cuts will be used. Two are coordinate cuts; the other two allow local relations to propagate between widely separated coordinate cuts.

=== 2.1 A quadratic ring and four directions <a-quadratic-ring-and-four-directions>

Put

$ tau = frac(1 + sqrt(5), 2) \, #h(2em) cal(O) = bb(Z) \[ tau \] . $

The conjugate embedding sends $tau$ to $macron(tau) = \( 1 - sqrt(5) \) \/ 2$; a bar on a vector means conjugation in each coordinate. The unit $tau$ satisfies $\| macron(tau) \| = tau^(- 1)$. Choose a positive integer $a$, to be fixed below, and put $lambda = tau^a$. Our four linear forms are

#[#set math.equation(numbering: n => "(2)")
 $ ell_1 \( x \, y \) = x \, quad ell_2 \( x \, y \) = y \, quad ell_3 \( x \, y \) = y - lambda x \, quad ell_4 \( x \, y \) = x - lambda y . $ <eq:four-forms>]

An #emph[allowable line] is $ell_i^(- 1) \( t \)$ with $t in cal(O)$. Translations by $cal(O)^2$ preserve these four line families.

#thm([Lemma 2.1.])[
  (Arithmetic of the cuts).  #emph[The following statements hold.]
  + #emph[There is a positive integer $D$, depending only on $lambda$, such that every intersection of nonparallel allowable lines lies in $D^(- 1) cal(O)^2$. There are finitely many such vertex types modulo $cal(O)^2$, including the set of allowable directions through the vertex. Each type has representatives arbitrarily close to the origin.]
  + #emph[In each allowable line direction, the group of translations in $cal(O)^2$ parallel to that line is dense in the line and has a pair of generators of arbitrarily small ordinary length.]
  + #emph[The image of $cal(O)$ under $z mapsto \( z \, macron(z) \)$ is a lattice in $bb(R)^2$. There are absolute constants $C \, c > 0$ such that, for every integer $n gt.eq 1$ and every interval $J$ of $n$ consecutive integers, the points ${ i tau med mod med 1 : i in J }$ have largest circular gap at most $C \/ n$; any two distinct points in this set have circular distance at least $c \/ n$.]
] <lem:arithmetic>

#proof[
  The coefficient determinants of pairs in (2) belong, up to sign, to ${ 1 \, lambda \, 1 - lambda^2 }$. The first two are units in $cal(O)$. Since the reciprocal of a nonzero algebraic integer $v$ is $macron(v) \/ N \( v \)$, a common positive integer denominator gives the asserted $D$. The group $D^(- 1) cal(O)^2 \/ cal(O)^2$ is finite. Moreover, whether $ell_i \( v \)$ belongs to $cal(O)$ depends only on this residue class, so the directions through a vertex introduce no additional infinite choice. Every coset has dense ordinary image because $cal(O)^2$ does.
  For the coordinate directions the tangent translation groups have bases $\( 1 \, 0 \) \, \( tau \, 0 \)$ and $\( 0 \, 1 \) \, \( 0 \, tau \)$. For the other directions they have bases
  $ \( 1 \, lambda \) \, med tau \( 1 \, lambda \) quad upright("and") quad \( lambda \, 1 \) \, med tau \( lambda \, 1 \) . $
  Multiplying both basis vectors by the unit $tau^(- b)$ leaves the group unchanged and makes their ordinary lengths as small as desired.
  The two vectors $\( 1 \, 1 \)$ and $\( tau \, macron(tau) \)$ generate the stated lattice, since their determinant is $- sqrt(5)$. Multiplication by $tau^k$ acts on the two factors with absolute scale factors $tau^k$ and $tau^(- k)$. A fixed lattice covering radius, followed by such a rescaling, therefore gives a constant $C_0$ with this property: every axis-parallel rectangle of sufficiently large fixed area and side lengths comparable to $L^(- 1) \, L$, for $L gt.eq 1$, meets the lattice. More explicitly, start with a square containing a translate of a fundamental parallelogram around every point, and rescale by a unit with $tau^k$ within a factor $tau$ of $L$; increasing one absolute constant absorbs this bounded factor.
  Apply this observation with $L$ a small fixed multiple of $n$. For any chosen ordinary coordinate $t in \[ 0 \, 1 \]$, center the long conjugate interval so that
  $ i = frac(z - macron(z), tau - macron(tau)) $
  falls in the middle half of $J$. A conjugate interval of length a fixed small multiple of $n$, and an ordinary interval of length $C_1 \/ n$ about $t$, then produce $z = k + i tau$ with $i in J$ and $\| z - t \| lt.eq C_1 \/ n$. Constants may be enlarged to cover the bounded small values of $n$. Thus these circular points form a $C_1 \/ n$-net, which proves the gap bound with $C = 2 C_1$.
  For separation, choose the representative $z = k + \( i - j \) tau$ of a nonzero circular difference with $\| z \| lt.eq 1 \/ 2$. It is a nonzero algebraic integer and $\| macron(z) \| = \| z - \( i - j \) sqrt(5) \| lt.eq sqrt(5) n + 1 \/ 2$. Consequently
  $ 1 lt.eq \| N \( z \) \| = \| z macron(z) \| lt.eq \| z \| \( sqrt(5) n + 1 \/ 2 \) . $
  Taking, for example, $c = \( sqrt(5) + 1 \)^(- 1)$ proves the claim. ◻
]

Fix $a$ sufficiently large that

#[#set math.equation(numbering: n => "(3)")
 $ lambda c > 1000 \( C + 1 \) \, #h(2em) \| macron(lambda) \| < 1 \/ 1000 . $ <eq:lambda-choice>]

This choice is possible because the two embeddings of $tau^a$ have reciprocal absolute values. All constants below may depend on this fixed choice. The two-dimensional version of the lattice statement is obtained by taking a product: $\( z \, macron(z) \)$ for $z in cal(O)^2$ is a lattice in $bb(R)^4$ with the same simultaneous rescaling property.

=== 2.2 Boolean polygons and the Stone space <boolean-polygons-and-the-stone-space>

Consider the Boolean algebra generated by the half-planes bounded by allowable lines, restricted to a unit square, with opposite sides identified when applying translations. Two polygonal descriptions are identified if they differ only on finitely many allowable line segments. Equivalently, evaluate all descriptions on points avoiding every allowable line. A nonzero element then has nonempty ordinary interior. We call its elements #emph[Boolean polygons]; they include finite unions and complements of ordinary polygonal pieces.

This convention avoids choosing a preferred value at a cut. It can also be made into an ordinary compact topological space. Let $X$ be the Stone space of this countable Boolean algebra: its points are ultrafilters and its clopen sets correspond exactly to Boolean polygons. The algebra has no atoms, since every region of nonempty interior can be split by an allowable coordinate cut. Hence $X$ is a compact metrizable space without isolated points. We continue to write a polygon $U$ for its associated clopen subset of $X$. Lebesgue area defines a finitely additive measure $mu$ on these sets, with $mu \( X \) = 1$ and $mu \( U \) > 0$ whenever $U eq.not diameter$.

An analogous cut-space realization appears in the Penrose-tiling full-group construction of #cite(label("ChornyiJuschenkoNekrashevych2020")) Section 4 in the author version: splitting along line families gives a zero-dimensional space with polygonal clopen sets. Here the four line families and their quadratic translation ring are the ones specified above.

The group

$ Gamma = \( cal(O) \/ bb(Z) \)^2 tilde.equiv bb(Z)^2 $

acts on $X$ by translation modulo one. To see explicitly that this action is free, use successively finer coordinate rectangles to associate to every ultrafilter its unique ordinary location in $bb(R)^2 \/ bb(Z)^2$. This gives a continuous equivariant map from $X$ to the ordinary torus. A nonzero element of $Gamma$ has no fixed point on that torus, and therefore has no fixed point on $X$. The density of $Gamma$ on the torus also shows that every orbit meets every nonempty Boolean polygon: move the ordinary location into its interior.

All partitions and maps used below have finite descriptions. In particular, compactness is invoked only to pass from a clopen cover to a finite clopen partition; it does not permit countably piecewise group elements.

=== 2.3 Tracks, translation tables, and slots <tracks-translation-tables-and-slots>

For a positive integer $m$, write $m X = { 1 \, dots.h \, m } times X$ and call its copies of $X$ #emph[tracks]. Extend $mu$ additively, so $mu \( m X \) = m$. Define $F_m$ to consist of all bijections of $m X$ that have a finite clopen partition on whose pieces they take the form

#[#set math.equation(numbering: n => "(4)")
 $ \( i \, x \) mapsto \( j \, x + gamma \) \, #h(2em) gamma in Gamma . $ <eq:translation-table>]

These maps form a countable group and preserve $mu$.

Let $U$ be a nonempty Boolean polygon. A #emph[slot with parameter set $U$] is an embedding $e : U arrow.r m X$ given by finitely many translations and track changes. These slots give the local multisections used to define alternating full groups in #cite(label("Nekrashevych2019")) Section 3. A collection $e_1 \, dots.h \, e_r$ of such embeddings with disjoint images realizes every $sigma in "Sym" \( r \)$ as a group element that sends $e_i \( x \)$ to $e_(sigma \( i \)) \( x \)$ and fixes the complement. The subgroup $A_m lt.eq F_m$ is generated by these elements for $sigma in "Alt" \( r \)$, over all finite disjoint slot collections. It suffices to use three slots and a $3$-cycle, since these generate each finite alternating group. It also suffices to require each individual slot to be an ordinary translated copy in a single track: refine $U$ until all the finitely many embeddings have the form (4), and multiply the resulting permutations on disjoint pieces.

The allowance of piecewise embeddings makes $A_m$ visibly normal in $F_m$: conjugation simply composes each slot embedding with an element of $F_m$. Section 3 proves that this alternating subgroup is the desired infinite simple group. The rest of the paper establishes its two harder properties, amenability and finite presentation, after a sufficiently large finite $m$ has been chosen.

== 3 Comparison, perfection, and simplicity <sec:simplicity>

The area measure supplies room for extra slots. The strict inequality in the following comparison statement is essential; no assertion about arbitrary equal-area polygons is needed.

#thm([Lemma 3.1.])[
  (Strict comparison).  #emph[If $U \, V subset.eq m X$ are Boolean polygons and $mu \( U \) < mu \( V \)$, then $U$ has a piecewise translation embedding into $V$.]
] <lem:comparison>

#proof[
  Use coordinate squares of side $epsilon = tau^(- b) in cal(O)$, with all grid lines allowable. Subdivide representatives of $U$ by this grid. The number of grid squares meeting their interiors is
  $ mu \( U \) epsilon^(- 2) + O \( epsilon^(- 1) \) \, $
  whereas the number of whole grid squares contained in the interiors of representatives of $V$ is
  $ mu \( V \) epsilon^(- 2) - O \( epsilon^(- 1) \) . $
  The error estimates follow by covering the finitely many polygonal boundary segments with $O \( epsilon^(- 1) \)$ grid squares. They are unchanged when summed over tracks. For sufficiently large $b$, the second number exceeds the first. Inject the source grid squares into the destination squares, translating the portion of $U$ in each source square into the assigned square. The translations are in $cal(O)^2$. Boundary ambiguities disappear in the Boolean algebra. ◻
]

#thm([Lemma 3.2.])[
  (Alternating extension).  #emph[Let $B \, U \, V subset.eq m X$ be Boolean polygons with $U \, V$ disjoint from $B$. Suppose $f : U arrow.r V$ is a piecewise translation bijection and 
$ 10 mu \( U \) < mu \( m X \\ B \) . $

 There is $a in A_m$ agreeing with $f$ on $U$ and fixing $B$ pointwise. The assertion includes the empty case $U = diameter$.]
] <lem:extension>

#proof[
  Assume $t = mu \( U \) > 0$. By Lemma 3, choose three pairwise disjoint copies $W_1 \, W_2 \, W_3$ of $U$ outside $B union U union V$. At each choice the remaining area is larger than $t$: even after removing $U \, V$ and two such copies, it exceeds $6 t$. Identify the three $W_i$ with $U$ by the chosen piecewise embeddings. The $3$-cycle on $\( U \, W_1 \, W_2 \)$ sends $U$ to $W_1$. The $3$-cycle on $\( W_1 \, V \, W_3 \)$, using $f$ for the identification with $V$, sends $W_1$ to $V$ with the prescribed parameters. Their product, with the first cycle applied first, agrees with $f$ on $U$. All participating slots avoid $B$. ◻
]

The same proof applies inside any permitted clopen region, with its area in place of $m$. In particular, if a piecewise bijection is specified on a bank of $q$ tracks, it extends to an element of $A_m$ whenever $m > 10 q$. This quantitative observation will be used for the finite-track homology argument.

The proof below uses the supported double-commutator method for alternating full groups #cite(label("Nekrashevych2019")) Theorem 4.1 and its proof. Strict area comparison supplies the small translated copies needed to carry that argument out in our polygon algebra.

#thm([Theorem 3.3.])[
  #emph[For every positive integer $m$, the group $A_m$ is infinite, perfect, and simple, and 
$ \[ F_m \, F_m \] = A_m . $

]
] <thm:simplicity>

#proof[
  We first show that every coset of $A_m$ in $F_m$ has a representative with arbitrarily small support. Fix $f in F_m$ and $delta > 0$. Subdivide $m X$ into finitely many pieces of area less than $delta \/ 20$. Suppose a representative of $f A_m$ has already been made the identity on a clopen union $B$. If its remaining region has area at least $delta$, choose one of the small pieces $U$ outside $B$. Its image $V$ also avoids $B$. Apply Lemma 4 to the inverse of its restriction from $U$ to $V$, keeping $B$ fixed. Composing on the left fixes $U$ as well as $B$. Because the partition is finite, this process either fixes the entire space or leaves a support of area below $delta$. Normality of $A_m$ ensures that all the representatives stay in the same coset.
  Given $f \, g in F_m$, choose small-support representatives $f_0 \, g_0$ of their cosets. Lemmas 3 and 4 allow the support of $g_0$ to be moved off the support of $f_0$ by conjugation in $A_m$. More explicitly, choose both supports of area less than $m \/ 100$, embed the second into the complement of the first, and extend that embedding. The resulting representatives commute. Therefore $F_m \/ A_m$ is abelian and $\[ F_m \, F_m \] subset.eq A_m$.
  For the reverse inclusion and perfection, consider an alternating slot permutation and subdivide its parameter set into sufficiently small pieces. Each resulting permutation can be included in a finite alternating slot group with at least five slots, by adding spare copies using strict comparison. The finite group $"Alt" \( r \)$ is perfect for $r gt.eq 5$: every $3$-cycle is a commutator of even permutations on five letters, since the commutator of $\( 1 thin 2 \) \( 4 thin 5 \)$ and $\( 2 thin 3 \) \( 4 thin 5 \)$ is a $3$-cycle (or its inverse, according to the commutator convention). Thus every generating slot permutation is a product of commutators within $A_m$. Consequently $A_m = \[ A_m \, A_m \] subset.eq \[ F_m \, F_m \]$.
  Arbitrarily many sufficiently small translated squares fit disjointly inside one track. Their alternating permutations embed $"Alt" \( r \)$ in $A_m$ for arbitrarily large $r$, so $A_m$ is infinite.
  Finally, let $N lt.closed A_m$ contain a nonidentity element $n$. There is a nonempty clopen $U$ with $U ∩ n U = diameter$: choose a point moved by $n$ and disjoint clopen neighborhoods of it and its image, then shrink the first neighborhood. For $a \, b in A_m$ supported in $U$, the element $n a n^(- 1)$ is supported in $n U$ and commutes with both. With $\[ s \, t \] = s t s^(- 1) t^(- 1)$ we obtain
  $ \[ \[ n \, a \] \, b \] = \[ a^(- 1) \, b \] in N . $
  It follows that $N$ contains the commutator subgroup of the subgroup of $A_m$ supported in $U$.
  Take any generating $3$-cycle of slots and subdivide its parameter set until the area of each piece is less than $min { mu \( U \) \/ 10 \, m \/ 100 }$. For each such piece add two spare slots, obtaining a five-slot alternating group whose total support has area less than $mu \( U \)$ and less than $m \/ 10$. Lemma 3 embeds this support into $U$, and Lemma 4 extends the embedding to conjugation by an element of $A_m$. The conjugate five-slot group is perfect and supported in $U$, so it lies in $N$ by the double commutator calculation. Normality of $N$ brings back the original $3$-cycle on that parameter piece. Multiplying over the subdivision shows that every generator of $A_m$ belongs to $N$. Hence $N = A_m$. ◻
]

== 4 Amenability from random polygonal partitions <sec:amenability>

The input to this section is the polygonal Boolean algebra and its translation arithmetic from Lemma 2. We prove amenability for every fixed finite number of tracks. The main construction is a random finite polygonal partition: with high probability its cells lie inside the translation charts of prescribed exchanges, and its law is almost unchanged when they move the cells. We state the precise coupling target below, before constructing the random fields that will supply its partition edges.

The use of almost-invariant finite configurations is related to #cite(label("JuschenkoMonod2013")) Theorem C and the extensive-amenability methods of #cite(label("JuschenkoMatteBonMonodDeLaSalle2018")). The proof here constructs the correlated partition law and its conversion to group measures directly. This is essential in dimension two, where even free minimal Cantor $bb(Z)^2$-actions can have nonamenable full groups #cite(label("ElekMonod2013")) Theorem 1.

#thm([Theorem 4.1.])[
  #emph[For every positive integer $m$, the discrete group $F_m$ is amenable. Every subgroup of $F_m$, in particular $A_m$, satisfies the finite-set Følner condition.]
] <thm:amenability>

Throughout the proof $m$ and a finite set $cal(K) subset F_m$ are fixed. Include inverses in $cal(K)$ if necessary. Choose finite polygonal continuity partitions for its elements, so that each piece is translated by one vector in $cal(O)^2$ to a specified track. Subdivide further along supporting lines to obtain convex pieces. All source and image boundaries are contained in a fixed finite collection of allowable line segments. Integer translations used to cross the edges of the square are included among the translation vectors. Consequently their coordinates and conjugate coordinates, and the levels and conjugate levels of all these supporting lines, are bounded by a constant depending only on $cal(K)$.

For each $delta > 0$ we will construct a law on finite polygonal partitions with the following property. For every $g in cal(K)$, two partitions $cal(P) \, cal(P)'$ with this law can be coupled so that, with probability greater than $1 - delta$, every cell of $cal(P)$ lies in one translation chart of $g$ and

$ cal(P)' = g cal(P) = { g C : C in cal(P) } . $

Each cell is contained in a single track. Two cells have the same shape if they differ by an ordinary $cal(O)^2$ translation, ignoring their tracks. On the displayed event, $g$ preserves the multiset of cell shapes. For each occurring multiset, fix a baseline partition. Uniformly matching its cells to the sampled cells of the same shape will lift this coupling to almost-invariant probability measures on $F_m$. The last subsection proves that lift and its conversion to finite Følner sets.

=== 4.1 Lattice counts and sites with a specified side <lattice-counts-and-sites-with-a-specified-side>

Let $D$ be as in Lemma 2, and set

$ L = D^(- 1) cal(O)^2 \, #h(2em) Lambda = { \( z \, macron(z) \) : z in L } subset bb(R)^2 times bb(R)^2 . $

Write $rho$ for the density of this four-dimensional lattice. Norms on the ordinary and conjugate planes may be taken to be the maximum norm; replacing them by Euclidean norms changes only constants.

We record the quantitative consequences of unit rescaling that will be used. For intervals $I \, J subset bb(R)$ of lengths $a \, b > 0$,

#[#set math.equation(numbering: n => "(5)")
 $ \# { u in D^(- 1) cal(O) : u in I \, med macron(u) in J } lt.eq C \( a b + 1 \) . $ <eq:am-one-count>]

To prove this when $a b gt.eq 1$, rescale by a power of the unit $tau$ so that the two side lengths become comparable to $sqrt(a b)$. A fixed fundamental parallelogram then gives the bound by counting tiles meeting the rectangle. When $a b < 1$, either the same argument applies after enlarging the rectangle to area one, or one uses $\| u macron(u) \| gt.eq D^(- 2)$ for a nonzero difference $u$ and subdivides the rectangle into a fixed number of smaller rectangles. This also proves that the constant is independent of the positions of $I \, J$.

There is a corresponding uniform Riemann-sum statement. For ordinary scale $s > 0$ and conjugate scale $t > 0$, the lattice in coordinates $\( z \/ s \, macron(z) \/ t \)$ has fundamental tiles of diameter at most

#[#set math.equation(numbering: n => "(6)")
 $ C \( s t \)^(- 1 \/ 2) . $ <eq:am-tile>]

Indeed, apply a unit with ordinary size comparable to $sqrt(s \/ t)$ to a fixed basis of $Lambda$ before scaling the two coordinates. Both parts of each resulting basis vector have size $O \( \( s t \)^(- 1 \/ 2) \)$. The tile volume is $1 \/ \( rho s^2 t^2 \)$. If $s t arrow.r oo$, integrating a compactly supported Lipschitz function over these tiles and replacing its value by the value at the lattice point changes the normalized sum by $O \( \( s t \)^(- 1 \/ 2) \)$, uniformly over translates of the lattice. Tiles meeting the boundary of a fixed box contribute the same order of error. Thus, in particular, a box of ordinary side lengths $O \( s \)$ and conjugate side lengths $O \( t \)$ contains $O \( s^2 t^2 \)$ sites once $s t gt.eq 1$.

At a point on a cut, a side must be specified. Fix vectors $v \, w in bb(R)^2$ such that $v eq.not 0$ and $ell_j \( w \) eq.not 0$ whenever $ell_j \( v \) = 0$. The #emph[flag] $\( v \, w \)$ assigns the sign of $ell_j - c$ at $z$ to be the lexicographic sign of

$ \( ell_j \( z \) - c \, ell_j \( v \) \, ell_j \( w \) \) . $

This is a formal convention, denoted $z + epsilon v + epsilon^2 w$; no common numerical choice of $epsilon$ for the infinitely many cuts is intended. Each Boolean polygon has a well-defined value at this flag. On the torus, represent a flagged point by the unique lift in the closed square whose flag enters the square. For a fixed flag type, let $cal(S)$ be the countable set of these representatives in the $m$ tracks with base point in $L$ modulo $bb(Z)^2$. Each exchange permutes $cal(S)$: use the translation belonging to the Boolean chart selected by the flag, and then choose the square representative again. The inverse exchange proves bijectivity. Translation leaves the two flag vectors unchanged.

All subsequent field estimates hold for any one fixed flag type, with constants allowed to depend on that type. A finite number of independent copies, also with different flag types, will be used for the four directions. Boundary representatives affect none of the counts: along a fixed allowable line in a bounded ordinary region and a conjugate ball of radius $N$, there are $O \( N \)$ sites, by (5) in a tangent coordinate.

The partitions will use two bit fields for each of the four line directions. On a finite collection of allowable line segments in the squares, the first field marks subdivision points. The second field decides whether the interval beginning at each marked point is a barrier. Together with the square edges, these barriers cut each track into polygonal cells. An interval uses the second bit at its initial endpoint, interpreted by a flag pointing along the interval into its chart. Its terminal endpoint will be forced independently when it lies on a chart edge. This is why we use tangent flags. The exact rule, including the square endpoints, and its covariance verification follow the field estimates.

The joint law of these fields must change little under each exchange in $cal(K)$. At the same time, they must force prescribed bits at all relevant sites: chart crossings are subdivision points, chart edges are complete barriers, and sufficiently distant sites in the conjugate plane are unmarked. We next construct general fields with these two properties; the specific fields for the partition will then be chosen from the fixed chart data.

=== 4.2 Positive averaging matrices <positive-averaging-matrices>

Let $theta : bb(R)^2 arrow.r bb(R)$ be smooth and constant outside a compact set. Choose $chi in C_c^oo \( bb(R)^2 \)$ with $0 lt.eq chi lt.eq 1$ that equals one on a fixed neighborhood of $"supp" nabla theta$. We can enlarge this neighborhood whenever finitely many signals are being treated. The mean field is

$ mu_N \( z \) = theta \( macron(z) \/ N \) \, $

with the same signal on every track. Fix small positive parameters $eta \, kappa$, with $4 eta$ less than the width of the neighborhood where $chi = 1$. Eventually $eta \, kappa$ will be chosen first and $N$ will then tend to infinity.

We will construct a positive semidefinite matrix $B_N$ with finitely many nonzero rows and columns. We add bounded independent centered noise $xi_z$ and a correlated perturbation $B_N xi$ to the mean, then take the sign of the resulting field. A bounded chart translation changes $mu_N$ by $O \( N^(- 1) \)$ on $O \( N^2 \)$ sites, so the $ell^2$ norm of the mean difference need not tend to zero. The matrix $B_N$ is designed to multiply this slowly varying difference approximately by a factor tending to infinity. Applying $\( I + B_N \)^(- 1)$ will therefore make the mean difference small in $ell^2$, as needed for the total-variation estimate below. Meanwhile, the $ell^2$ norms of the rows of $B_N$ will be sufficiently small that $parallel B_N xi parallel_oo lt.eq 1 \/ 2$ with probability tending to one. These are compatible demands: averaging preserves a slowly varying signal while cancelling independent centered noise.

Let $cal(R)_N$ be the powers of two between $N^(1 \/ 4)$ and $N^(1 \/ 2)$. For $r in cal(R)_N$ put $s = r \/ N$ and

$ K \( u \) = \( 1 - \| u_1 \| \)_(+) \( 1 - \| u_2 \| \)_(+) . $

The lines in the next definition are auxiliary separators for the averaging matrix. We average over their thresholds to obtain a deterministic matrix; the partition barriers will instead be sampled from the bit fields. The auxiliary separators suppress matrix entries across chart edges while retaining averaging at most sites.

Independently for each of the four direction families choose a threshold uniformly in $\[ kappa \/ s \, 2 kappa \/ s \]$, and cut the plane along all lines $ell_j = c$, $c in cal(O)$, with $\| macron(c) \|$ at most that threshold. There are only finitely many such lines in any bounded ordinary region, by (5). The flags determine on which side a site lies. Let $P_r \( z \, w \)$ be the probability that no chosen line separates the two flagged sites. This definition is used for sites on the same track.

Define a matrix, zero between different tracks, by

#[#set math.equation(numbering: n => "(7)")
 $ M_r \( z \, w \) = frac(chi \( macron(z) \/ N \) chi \( macron(w) \/ N \), rho \( r eta \)^2) K (frac(z - w, s)) K (frac(macron(z) - macron(w), N eta)) P_r \( z \, w \) . $ <eq:am-matrix>]

Only $O \( N^2 \)$ rows or columns can be nonzero. This follows by applying the box count to the bounded ordinary square and a conjugate ball of radius $O \( N \)$. Every $M_r$ is positive semidefinite. Indeed, $\( 1 - \| u \| \)_(+)$ is the overlap length of two translates of a unit interval, so its convolution kernel is positive semidefinite. Products give the two kernels in (7). For a fixed collection of separating lines, the matrix that is one exactly when two sites lie in the same chamber is positive semidefinite, since its quadratic form is the sum, over chambers, of the squares of the coordinate sums. Averaging gives positivity of $P_r$. Entrywise products preserve positivity: Gram representations turn them into inner products of tensor products. Finally multiplication by $chi$ on the two sides and the direct sum over tracks preserve positivity.

We use the finite matrix

#[#set math.equation(numbering: n => "(8)")
 $ B_N = \( log N \)^(- 3 \/ 4) sum_(r in cal(R)_N) M_r \, #h(2em) W_N = \( log N \)^(- 3 \/ 4) \| cal(R)_N \| . $ <eq:am-B>]

In particular $W_N asymp \( log N \)^(1 \/ 4) arrow.r oo$ and $I + B_N$ is positive definite with inverse of operator norm at most one.

#thm([Lemma 4.2.])[
  #emph[For each $g in cal(K)$, let $U_g$ be its permutation operator on $ell^2 \( cal(S) \)$ and put $h_N = U_g mu_N - mu_N$. With $eta \, kappa$ fixed, 
#[#set math.equation(numbering: n => "(9)")
 $ parallel U_g B_N U_g^(- 1) - B_N parallel_(upright("HS")) & arrow.r 0 \,\
Pr { parallel B_N xi parallel_oo > 1 \/ 2 } & arrow.r 0 \, $ <eq:am-covariance>]

 where the $xi_z$ are independent, centered random variables supported on $\[ - 1 \, 1 \]$. Moreover 
#[#set math.equation(numbering: n => "(10)")
 $ limsup_(N arrow.r oo) parallel \( I + B_N \)^(- 1) h_N parallel_2 lt.eq C \( eta + sqrt(kappa) \) \, $ <eq:am-signal-bound>]

 where $C$ is independent of sufficiently small $eta \, kappa$. All assertions hold uniformly over the fixed finite set $cal(K)$.]
] <lem:am-estimates>

#proof[
  We give separately the covariance, concentration, and signal estimates. The count following (6), now with $t = N eta$, shows that a row of $M_r$ has $O_eta \( r^2 \)$ nonzero entries, each $O_eta \( r^(- 2) \)$. Therefore
  #[#set math.equation(numbering: n => "(11)")
   $ parallel M_r \( z \, dot.op \) parallel_2 lt.eq C_eta \/ r . $ <eq:am-row-norms>]
  The row sums are bounded by an absolute constant for all sufficiently large $N$ at any fixed $eta$: omit $P_r$ and $chi$, and use the uniform Riemann sum for $K \( u \) K \( v \)$, whose integral is one. In particular this bound can be chosen independently of small $eta \, kappa$ once $N$ is large enough.
  Write $Delta_r = U_g M_r U_g^(- 1) - M_r$. Compare its entries by comparing $\( z \, w \)$ with $\( g z \, g w \)$. If $z \, w$ lie in different continuity pieces on the same source track, some supporting line of the fixed continuity partition separates their flags. To see this, assign to a point the signs of all the finitely many supporting lines; each sign chamber lies in one continuity piece. Thus different pieces have different sign assignments. Its conjugate level is bounded independently of $N$, so it is included for every threshold $kappa \/ s$ when $N$ is large. The original separator factor is zero. Their images lie in different image pieces; the same reasoning makes the image factor zero if they are on the same track, and otherwise the image matrix entry is zero by definition. This also deals with points on different source tracks whose images share a track. Hence only pairs in a common continuity piece need be considered.
  For such a pair, $g z = z + u$ and $g w = w + u$ in the chosen square charts, for a fixed $u in cal(O)^2$. Both difference kernels in (7) are unchanged. In one direction let $d$ be the least absolute conjugate level of a line separating $z \, w$, taking $d = + oo$ if there is none. The probability that the threshold is less than $d$ is a function of $d$ with Lipschitz constant $s \/ kappa$. Translation bijects the separating lines, changing their conjugate levels by $overline(ell_j \( u \))$. Either both minima are infinite, or they differ by a bounded amount. Taking the product over the four directions gives a change $O_kappa \( s \)$ in $P_r$. Each cutoff factor changes by $O \( N^(- 1) \)$. We have proved, on the union of the two entry supports,
  #[#set math.equation(numbering: n => "(12)")
   $ \| Delta_r \( z \, w \) \| lt.eq frac(C_(eta \, kappa), N r) . $ <eq:am-entry-change>]
  This union contains $O_eta \( N^2 r^2 \)$ pairs, also after permutation. For $r lt.eq r'$, the intersection of the two entry supports contains at most the number of pairs in the smaller support. It follows that
  $ \| chevron.l Delta_r \, Delta_(r') chevron.r_(upright("HS")) \| lt.eq C_(eta \, kappa) r / r' . $
  The scales are dyadic, so the sum of $r \/ r'$ over $r lt.eq r'$ is $O \( \| cal(R)_N \| \)$. Consequently
  $ parallel U_g B_N U_g^(- 1) - B_N parallel_(upright("HS"))^2 lt.eq C_(eta \, kappa) \( log N \)^(- 3 \/ 2) \| cal(R)_N \| = O_(eta \, kappa) \( \( log N \)^(- 1 \/ 2) \) \, $
  which proves (9).
  For concentration, (11) and the geometric sum over scales give
  $ parallel B_N \( z \, dot.op \) parallel_2 lt.eq C_eta \( log N \)^(- 3 \/ 4) N^(- 1 \/ 4) . $
  The rowwise bounded-independent-summand estimate is Hoeffding’s inequality #cite(label("Hoeffding1963")) Theorem 2, rederived here. If $xi$ is centered and $\| xi \| lt.eq 1$, convexity bounds its exponential moment by $cosh t lt.eq e^(t^2 \/ 2)$. Multiplication of the independent exponential moments and optimization in $t$ therefore give
  $ Pr { \| \( B_N xi \)_z \| > 1 \/ 2 } lt.eq 2 exp { - c_eta N^(1 \/ 2) \( log N \)^(3 \/ 2) } . $
  There are $O \( N^2 \)$ active rows; outside them $B_N xi = 0$. The union bound proves (9).
  It remains to explain why the matrices average the signal difference. On an image chart whose source translation is $u$, the exact formula is
  $ h_N \( z \) = theta (frac(macron(z) - macron(u), N)) - theta (macron(z) / N) . $
  Thus $\| h_N \| lt.eq C \/ N$, it is supported on $O \( N^2 \)$ sites, and $N h_N$, viewed as a function of $macron(z) \/ N$, has a uniformly bounded Lipschitz constant on each fixed chart. In particular $parallel h_N parallel_2 lt.eq C$. For large $N$ its support, together with its $2 eta$-neighborhood in scaled conjugate coordinates, lies where $chi = 1$ whenever $eta$ is sufficiently small. This guarantees that the cutoff introduces no error in averaging $h_N$.
  We bound the exceptional rows where a separator or a chart boundary can interfere with this averaging. For each direction $ell_j$ one may complete it to an $cal(O)$-unimodular coordinate system, using respectively
  $ \( x \, y \) \, quad \( y \, x \) \, quad \( y - lambda x \, x \) \, quad \( x - lambda y \, y \) . $
  In these coordinates the paired lattice is again a product of two one-dimensional quadratic lattices. In a bounded ordinary region and a conjugate ball of radius $O \( N \)$, the number of sites within ordinary distance $C s$ of a line $ell_j = c$ is, by (5), at most
  $ C \( s N + 1 \) \( N + 1 \) lt.eq C s N^2 \, $
  since $s N = r arrow.r oo$. The number of lines meeting that ordinary region with $\| macron(c) \| lt.eq 2 kappa \/ s$ is $O \( kappa \/ s + 1 \)$. The rows within distance $C s$ of any of them consequently number at most
  #[#set math.equation(numbering: n => "(13)")
   $ C \( kappa + s \) N^2 . $ <eq:am-bad-rows>]
  The same estimate with only finitely many lines gives $O \( s N^2 \)$ rows near the fixed chart boundaries and square edges. These estimates include rows exactly on a line, independently of the flag convention.
  Outside these exceptional rows, every contributing neighbor is in the same ordinary chart, and no line allowed in the definition of $P_r$ separates it from the row. Hence $P_r = 1$. The normalized Riemann-sum argument in (6), together with the Lipschitz bound on $N h_N$, gives
  $ \| \( M_r h_N \) \( z \) - h_N \( z \) \| lt.eq C / N (eta + \( r eta \)^(- 1 \/ 2)) . $
  The assertion also holds for rows where $h_N \( z \) = 0$: a contributing nonzero value of $h_N$ still lies in the cutoff-one neighborhood. On exceptional rows the bound $C \/ N$ suffices, since the row sums are bounded. Outside a conjugate ball of radius $R N$, with $R$ fixed, both terms vanish. Squaring and summing yields, uniformly over $r in cal(R)_N$,
  #[#set math.equation(numbering: n => "(14)")
   $ parallel M_r h_N - h_N parallel_2 lt.eq C (eta + sqrt(kappa) + sqrt(s) + \( r eta \)^(- 1 \/ 2)) = C \( eta + sqrt(kappa) \) + o \( 1 \) . $ <eq:am-approx-identity>]
  The constant $C$ in this estimate is independent of sufficiently small $eta \, kappa$; the $o \( 1 \)$ is taken with them fixed.
  Finally put $e_N = B_N h_N - W_N h_N$. Equation (14) implies $parallel e_N parallel_2 lt.eq W_N \( C \( eta + sqrt(kappa) \) + o \( 1 \) \)$. The identity
  $ \( I + B_N \) h_N = \( 1 + W_N \) h_N + e_N $
  and the contraction bound for $\( I + B_N \)^(- 1)$ give
  $ parallel \( I + B_N \)^(- 1) h_N parallel_2 lt.eq frac(parallel h_N parallel_2, 1 + W_N) + frac(W_N, 1 + W_N) #scale(x: 120%, y: 120%)[\(] C \( eta + sqrt(kappa) \) + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Since $W_N arrow.r oo$, this proves (10). ◻
]

The three estimates have different purposes. The matrix covariance controls a change of the noise law. The inverse signal estimate makes a bounded Euclidean displacement of the mean inexpensive in that law. Concentration will force marks on specified regions, simultaneously at every relevant site. We now put these statements together in total variation on the whole countable set of sites.

=== 4.3 Total variation of the entire field <total-variation-of-the-entire-field>

Choose a nonnegative even smooth function $f$ supported on $\[ - 1 \, 1 \]$, positive on $\( - 1 \, 1 \)$, with $integral f^2 = 1$. Give each $xi_z$ the density $f^2$ and make the coordinates independent. Define

#[#set math.equation(numbering: n => "(15)")
 $ Y_N = mu_N + \( I + B_N \) xi \, #h(2em) b_N \( z \) = upright(bold(1))_({ Y_N \( z \) > 0 }) . $ <eq:am-field>]

The next elementary finite-dimensional calculation supplies a bound whose constant does not grow with the number of sites.

#thm([Lemma 4.3.])[
  #emph[Let $xi in bb(R)^d$ have independent coordinates of density $f^2$. Suppose $T_t$ is a differentiable path of invertible real matrices of positive determinant and $mu_t in bb(R)^d$ is differentiable. If $p_t$ is the density of $mu_t + T_t xi$, then 
$ ∥frac(d, d t) sqrt(p_t)∥_(L^2) lt.eq C_f (parallel T_t^(- 1) dot(T)_t parallel_(upright("HS")) + parallel T_t^(- 1) dot(mu)_t parallel_2) \, $

 with $C_f$ independent of $d$.]
] <lem:am-density-speed>

#proof[
  Set $F \( x \) = product_(i = 1)^d f \( x_i \)$, $L = T_t^(- 1) dot(T)_t$ and $v = T_t^(- 1) dot(mu)_t$. Differentiate $\( det T_t \)^(- 1 \/ 2) F \( T_t^(- 1) \( y - mu_t \) \)$ and pull back by $y = mu_t + T_t x$. The $L^2$ norm of the derivative is the norm of
  $ \( L x + v \) dot.op nabla F + 1 / 2 "tr" \( L \) F . $
  Under the product probability density $F^2$, write $a \( x \) = f' \( x \) \/ f \( x \)$ on the interior of the support. This notation is legitimate in $L^2 \( f^2 thin d x \)$ because $integral \( f' \)^2 < oo$. Integration by parts gives
  $ bb(E) a \( xi_i \) = 0 \, quad bb(E) \[ xi_i a \( xi_i \) \] = - 1 / 2 \, quad bb(E) xi_i = 0 . $
  The diagonal summands are $L_(i i) \( xi_i a \( xi_i \) + 1 \/ 2 \)$ and the mean summands are $v_i a \( xi_i \)$. They have mean zero, uniformly bounded second moments, and different coordinates are orthogonal. The two types on the same coordinate are orthogonal as well, by parity. An off-diagonal summand is $L_(i j) xi_j a \( xi_i \)$; it has mean zero separately in each of its two coordinates. Therefore it is orthogonal to every single-coordinate summand and to off-diagonal summands with a different unordered coordinate pair. The two terms for $\( i \, j \)$ and $\( j \, i \)$ need not be orthogonal, but Cauchy–Schwarz bounds their combined second moment by $C_f \( L_(i j)^2 + L_(j i)^2 \)$. Summing over unordered pairs proves the estimate. ◻
]

#thm([Proposition 4.4.])[
  #emph[For any finite list of smooth signals constant outside compact sets, and any finite list of flag types, the laws of the independent fields in (15) can be chosen so that, for every $g in cal(K)$, the total variation distance between their joint law and its image under $g$ is arbitrarily small on all sites at once. With probability tending to one as $N arrow.r oo$, every bit is one wherever its signal is at least two, and zero wherever its signal is at most minus two.]
] <prop:am-field-covariance>

#proof[
  We first consider one signal and one flag type. The two noise matrices are $T_0 = I + B_N$ and $T_1 = I + U_g B_N U_g^(- 1)$, and the two means are $mu_N$ and $U_g mu_N$. There is a finite set $J_N$ of $O \( N^2 \)$ sites containing the row and column supports of both perturbation matrices and the supports of $mu_N - q$ and $U_g mu_N - q$, where $q$ is the constant value of $theta$ outside a compact set. Outside $J_N$ both laws have exactly the same independent background factor, namely the constant outside value of $theta$ plus independent noise with density $f^2$. Thus their total variation distance on the whole product space is exactly the total variation distance of their restrictions to $J_N$. This is the reason that the calculation below proves an assertion about all sites, rather than only about finitely many specified marginals.
  On $J_N$ interpolate linearly between the matrices and means. Write $Delta = T_1 - T_0$, $T_t = T_0 + t Delta$, and $h = h_N$. Each $T_t$ is the identity plus a positive semidefinite matrix, so $parallel T_t^(- 1) parallel_(upright("op")) lt.eq 1$. Also the resolvent identity gives
  #[#set math.equation(numbering: n => "(16)")
   $ T_t^(- 1) h = \( I - t T_t^(- 1) Delta \) T_0^(- 1) h . $ <eq:am-resolvent>]
  Consequently
  $ sup_(0 lt.eq t lt.eq 1) parallel T_t^(- 1) h parallel_2 lt.eq \( 1 + parallel Delta parallel_(upright("op")) \) parallel T_0^(- 1) h parallel_2 \, #h(2em) parallel T_t^(- 1) Delta parallel_(upright("HS")) lt.eq parallel Delta parallel_(upright("HS")) . $
  Lemma 8, integrated over $t$, bounds the $L^2$ distance between the square-root densities by
  $ C_f #scale(x: 120%, y: 120%)[\(] parallel Delta parallel_(upright("HS")) + \( 1 + parallel Delta parallel_(upright("op")) \) parallel T_0^(- 1) h parallel_2 #scale(x: 120%, y: 120%)[\)] . $
  For probability densities $p \, q$, Cauchy–Schwarz gives $1 / 2 parallel p - q parallel_1 lt.eq parallel sqrt(p) - sqrt(q) parallel_2$. Lemma 7 therefore proves that the limiting total variation error is at most $C \( eta + sqrt(kappa) \)$. Choose these two parameters small and then $N$ large. Thresholding the fields cannot increase total variation. For finitely many independent fields the joint error is bounded by the sum of their errors, using independent couplings.
  On the event $parallel B_N xi parallel_oo lt.eq 1 \/ 2$, the noise in each coordinate of $Y_N$ has absolute value at most $3 \/ 2$. Hence every signal value at least two gives bit one, and every value at most minus two gives bit zero, simultaneously. The event has probability tending to one by (9). Outside the finite matrix support the same statement holds deterministically because $\| xi_z \| lt.eq 1$. ◻
]

=== 4.4 Finite barriers and exact covariance at chart edges <finite-barriers-and-exact-covariance-at-chart-edges>

For each family $j$ choose a nonzero tangent vector $v_j$ and a transverse vector $w_j$, and use the flag $\( v_j \, w_j \)$. There will be two independent bit fields of this type: the first selects subdivision points on the lines, and the second selects which intervals between consecutive points become barriers. The constants and signals are chosen once from the fixed finite chart data, before choosing the small smoothing parameters.

Call a line $ell_j = c$, $c in cal(O)$, a #emph[candidate line] if it meets the interior of the square and

#[#set math.equation(numbering: n => "(17)")
 $ \| macron(c) \| lt.eq 4 N . $ <eq:am-candidate>]

There are $O \( N \)$ candidates in each track and direction. Indeed, their ordinary levels lie in a fixed bounded interval, and their conjugate levels lie in an interval of length $8 N$, so (5) applies. Let $Q$ bound $\| overline(ell_j \( u \)) \|$ for every translation vector in the source and image charts, including the square corrections.

We next choose a conjugate-coordinate core that contains every endpoint needed in comparing these candidates. If a candidate $ell_j = c$ meets a nonparallel chart edge on $ell_k = b$, then its intersection $p$ satisfies

#[#set math.equation(numbering: n => "(18)")
 $ macron(p) = vec(macron(ell)_j, macron(ell)_k)^(- 1) binom(macron(c), macron(b)) . $ <eq:am-core-equations>]

Here $macron(ell)_j$ denotes the row of conjugate coefficients of $ell_j$. The inverse matrices exist: their determinants are the conjugates of nonzero elements of $bb(Q) \( sqrt(5) \)$. There are finitely many matrices, and $b$ ranges over a fixed finite list. Thus one may fix $R_0$ so that $\| macron(p) \| lt.eq R_0 N$ for every such intersection, both in source and image charts and also for lines with $\| macron(c) \| lt.eq 4 N + Q$. Include intersections with square edges. Increase $R_0$ by a fixed amount to include square representatives of these points. The intersection arithmetic ensures $p in L$. A small conjugate determinant merely increases this fixed radius; it causes no change in the $O \( N^2 \)$ site count.

Choose $R_1 > R_0 + 1$. Take a smooth first signal $theta_(1 \, j)$ equal to $3$ on ${ \| v \| lt.eq R_0 }$ and equal to $- 3$ on ${ \| v \| gt.eq R_1 }$. The same radial choice would work for every $j$. Take a smooth second signal $theta_(2 \, j)$, constant $- 3$ off a compact set, such that

#[#set math.equation(numbering: n => "(19)")
 $ theta_(2 \, j) \( v \) & = 3 &  & upright("if ") \| v \| lt.eq R_1 upright(" and ") \| macron(ell)_j \( v \) \| lt.eq 1 \,\
theta_(2 \, j) \( v \) & = - 3 &  & upright("if ") \| macron(ell)_j \( v \) \| gt.eq 3 . $ <eq:am-positive-core>]

For example choose smooth cutoffs $alpha_j \, beta$ with $alpha_j = 1$ on ${ \| macron(ell)_j \| lt.eq 1 }$ and zero on ${ \| macron(ell)_j \| gt.eq 3 }$, and with $beta = 1$ on the radius-$R_1$ ball and compact support; then $6 alpha_j beta - 3$ has the stated properties. This choice gives a negative band of fixed scaled width between any possibly active line and the artificial cutoff $4 N$.

Apply Proposition 9 to these eight fields. Call a sample #emph[successful] when all the positive and negative signal requirements in that proposition hold simultaneously. Its failure probability $alpha_N$ tends to zero for fixed small $eta \, kappa$. In a successful sample, every required chart-edge intersection is marked by the first field, and every first mark lies in $\| macron(z) \| < R_1 N$.

Here is the partition algorithm. On each candidate line orient its intersection with the square by $v_j$. Subdivide at all interior sites whose first bit is one, and at the two geometric square endpoints. Its incoming square endpoint has the flag pointing into the segment, is a site with that square representative, and is a forced first mark. The outgoing square endpoint is just a geometric endpoint. Its positive flag may be represented on the opposite side of the square, so it is not used to start an interval in the current square. For every interval of the subdivision, use the second bit at its initial endpoint to decide whether the closed interval is a barrier. Add the square edges as barriers regardless of the bits. Lines lying along a square edge need no further rule. There are finitely many intervals, since every first mark is among the $O \( N^2 \)$ sites in a fixed conjugate ball.

The open connected components of the complement of the barriers give a finite Boolean polygonal partition, denoted $cal(P)_N$. To justify this assertion, take the finite arrangement of all the full lines supporting the barrier segments, together with the square edges. Each open chamber is connected and avoids all segments, hence lies in one component. Each component is therefore, modulo empty interior, a union of finitely many chambers. Such a union belongs to the given Boolean algebra. The components are disjoint and cover the square modulo the discarded boundaries. If the sample is unsuccessful, define $cal(P)_N$ instead to be the partition with one cell on each track. Thus the algorithm is defined for every sample, and its output always belongs to the countable set of finite polygonal partitions.

#thm([Lemma 4.5.])[
  #emph[The signals just chosen have the following property. Given $delta > 0$, one can choose $eta \, kappa$ and then $N$ so that, for each $g in cal(K)$, there is a coupling of two partitions $cal(P)$ and $cal(P)'$ having the law of $cal(P)_N$ for which, with probability greater than $1 - delta$, every cell of $cal(P)$ is contained in a translation chart of $g$ and 
$ cal(P)' = g cal(P) = { g C : C in cal(P) } . $

 The equality is as Boolean partitions, including track labels.]
] <lem:am-partition-coupling>

#proof[
  For the eight bit fields, Proposition 9 provides a coupling of an original sample $b$ and a sample $b'$ with the same law such that
  #[#set math.equation(numbering: n => "(20)")
   $ b' \( g z \) = b \( z \) $ <eq:am-bit-coupling>]
  for both bits in every direction and every site, except on an event of arbitrarily small probability $epsilon_N$. Such a coupling follows directly from the common part of the two probability measures: the mass of their pointwise minimum is one minus their total variation distance; on that mass make the samples identical, and couple the residual measures arbitrarily. This construction also applies to the countable product space, since the measures here differ only on a finite coordinate set. Intersect this coupling event with success of both samples. The resulting event has probability at least $1 - epsilon_N - 2 alpha_N$. We prove the required equality deterministically on it.
  First every fixed chart-edge supporting line meeting the square interior is a full barrier in both samples for large $N$. Its conjugate level is bounded, so it is a candidate and satisfies the positive condition (19). Every subdivision start lies in the first-mark support and hence in the radius-$R_1$ ball after scaling. Its second bit is therefore one. The incoming square endpoint is forced by the core, and the final endpoint is supplied geometrically, so all of this line’s segment in the square is covered by activated intervals. Square edges are barriers by definition. In particular the open cells of each sample stay in the corresponding source or image continuity charts.
  Fix one open source chart $U$, translated by $u$ onto the open image chart $V$. Consider a candidate line $L$ that meets $U$. Its image is the parallel allowable line $L + u$, with conjugate level shifted by $overline(ell_j \( u \))$. First suppose that both lines are candidates. Interior marked points of $L ∩ U$ correspond exactly to interior marked points of $\( L + u \) ∩ V$ by (20). At every transverse crossing of $L$ with $partial U$, the subdivision point was already forced by (18); the corresponding intersection with $partial V$ is likewise forced independently. Thus the subdivision intervals in these open charts have exactly corresponding interiors and endpoints under translation.
  The direction of the flag matters at the endpoints. If an interval starts at $p$ and then enters $U$, its positive tangent flag selects $U$. Its initial second bit consequently maps to the bit at $p + u$, which is the start of the corresponding interval in $V$. Hence the two intervals have the same activation decision. If the terminal endpoint is $q$, its positive tangent flag may enter a different source chart and use a translation different from $u$. No identity between its second bit and the bit at $q + u$ is needed: the preceding interval uses the bit at $p$. The point $q + u$ is instead an independently forced destination subdivision point when it lies on an interior chart edge, or a geometric truncation when it is a square exit. In particular, this comparison never inserts a new random subdivision into an already activated interval. Both source and destination were subdivided at all transverse chart crossings before the activation decisions were made. Figure 1 records the distinction.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 2), (3.4, 3.2), fill: rgb("#ededff"), stroke: none)
  rect((3.4, 2), (6.5, 3.2), fill: rgb("#fff2e6"), stroke: none)
  line((3.4, 2), (3.4, 3.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((1.7, 3), [#text(size: 9pt)[$U$]])
  content((4.95, 3), [#text(size: 9pt)[$U'$]])
  line((0.3, 2.45), (6.2, 2.45), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0.8, 2.45), (3.4, 2.45), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000b2"))))
  circle((0.8, 2.45), radius: 0.07056, fill: rgb("#0000b2"), stroke: none)
  circle((3.4, 2.45), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3.48, 2.58), (4.1, 2.58), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  content((0.8, 2.4), [#text(size: 9pt)[$p$]], anchor: "north", padding: 0.1176cm)
  content((3.4, 2.4), [#text(size: 9pt)[$q$]], anchor: "north-east", padding: 0.1176cm)
  content((5, 2.38), [#text(size: 7pt)[positive tangent flag]], anchor: "north", padding: 0.1176cm)
  rect((-0.4, -0.3), (3, 0.9), fill: rgb("#ededff"), stroke: none)
  rect((3.9, -0.3), (7, 0.9), fill: rgb("#fff2e6"), stroke: none)
  content((1.3, 0.65), [#text(size: 9pt)[$U+u$]])
  content((5.45, 0.65), [#text(size: 9pt)[$U'+u'$]])
  line((0.4, 0.15), (3, 0.15), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000b2"))))
  circle((0.4, 0.15), radius: 0.07056, fill: rgb("#0000b2"), stroke: none)
  circle((3, 0.15), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((3.9, 0.15), radius: 0.07056, fill: rgb("#cc6600"), stroke: none)
  line((3.9, 0.15), (5, 0.15), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  content((0.4, 0.1), [#text(size: 9pt)[$p+u$]], anchor: "north", padding: 0.1176cm)
  content((3, 0.1), [#text(size: 9pt)[$q+u$]], anchor: "north-east", padding: 0.1176cm)
  content((3.9, 0.1), [#text(size: 9pt)[$q+u'$]], anchor: "north-west", padding: 0.1176cm)
  line((3.2, 1.95), (3, 0.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((3.7, 1.95), (3.9, 0.95), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  content((2.8, 1.4), [#text(size: 7pt)[terminal endpoint]], anchor: "east", padding: 0.1176cm)
  content((4.15, 1.4), [#text(size: 7pt)[flag image]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: Endpoint transport across a chart edge. The interval starting at $p$ uses the activation bit transported to $p + u$. Its terminal endpoint $q + u$ is forced by the destination core. The positive flag based at $q$ uses the next chart translation $u'$; its image $q + u'$ need not coincide with $q + u$. ],
  ) <fig:am-endpoints>
  At a vertex where several chart edges meet, an interval entering an open chart still has its positive tangent flag in that chart. If an interval runs along a chart boundary, that boundary is already a full barrier and requires no activation comparison. Parallel lines either do not cross an edge or coincide with its supporting line; these alternatives have just been covered. Intersections that only touch at a point make no difference to Boolean cells.
  It remains to handle the finite line cutoff. If $L$ is a candidate but $L + u$ is not, then
  $ \| macron(c) \| gt.eq 4 N - Q > 3 N $
  for sufficiently large $N$. Every second bit at a start on $L$ is zero by (19), so the line contributes no active segment. The reverse mismatch is handled by the same inequality on the destination line. A line absent because it misses the square cannot produce a mismatch inside $U \, V$, since a line meeting one of these corresponding open charts translates to a line meeting the other. Square seam translations were included in the bound $Q$ and in the endpoint core. Thus active barriers inside $U$ translate exactly to the active barriers inside $V$ in every case.
  Since all chart edges are full barriers in both samples, this equality inside each pair of open charts identifies their connected complementary components. Each source cell therefore translates to precisely one destination cell, and all destination cells occur. It follows that $cal(P)' = g cal(P)$. Finally choose $eta \, kappa$ small enough and then $N$ large enough that $epsilon_N + 2 alpha_N < delta$, simultaneously for the finite set $cal(K)$. ◻
]

The field construction and the endpoint argument have now produced a partition law with the required covariance. The remaining step is a group-theoretic conversion. It uses uniform matchings of equal shapes to retain covariance, followed by an explicit passage from probability measures to the finite sets in the definition of amenability.

=== 4.5 Shape matchings, subgroup measures, and finite Følner sets <shape-matchings-subgroup-measures-and-finite-følner-sets>

Two nonempty polygonal cells have the same #emph[shape] if one is a translate of the other by an element of $cal(O)^2$ in ordinary square coordinates; their tracks may differ. The translation is unique. Indeed, a bounded set of positive area cannot be invariant modulo empty interior under a nonzero translation: a linear functional increasing in that direction has a finite essential supremum, which the translation would increase. A finite partition has a finite multiset of shapes, counting multiplicities.

For every multiset of shapes that occurs for a partition of $m X$, fix one baseline partition with that multiset. There are only countably many partitions, so these choices require no measurability qualification. Given a sampled partition $cal(P)$, choose uniformly a shape-preserving bijection from its baseline partition onto $cal(P)$. On each baseline cell use the unique translating identification to the assigned cell. Their union is a piecewise translation $a in F_m$. Denote its probability law by $nu$.

In the successful coupling of Lemma 10, the partitions $cal(P)$ and $g cal(P)$ have the same multiset of shapes, because each cell lies in one translation chart. They consequently have the same baseline. Composition by $g$ bijects the shape-preserving matchings to $cal(P)$ with the shape-preserving matchings to $g cal(P)$. Thus a uniform matching to the first, followed by $g$, is a uniform matching to the second. Extend this coupling by arbitrary uniform matchings on the exceptional event. Each marginal is still the law prescribed above, and the resulting group elements are related by left multiplication by $g$ on the successful event. Hence

#[#set math.equation(numbering: n => "(21)")
 $ parallel g nu - nu parallel_(upright("TV")) < delta #h(2em) \( g in cal(K) \) . $ <eq:am-reiter>]

Here $\( g nu \) \( a \) = nu \( g^(- 1) a \)$, and for measures on a countable set $parallel sigma - sigma' parallel_(upright("TV")) = 1 / 2 sum_a \| sigma \( a \) - sigma' \( a \) \|$. For the concrete construction at a fixed scale $N$ there are in fact only finitely many possible successful marked configurations and hence finitely many partitions and matchings. The following argument allows countable support as well and proves subgroup inheritance at the same time.

#thm([Lemma 4.6.])[
  #emph[Let $H$ be a subgroup of a countable group $J$. Suppose that for every finite $K subset H$ and every $epsilon > 0$ there is a probability measure $nu$ on $J$ such that 
$ sum_(k in K) parallel k nu - nu parallel_1 < epsilon . $

 Then for every finite $K subset H$ and every $epsilon > 0$ there is a nonempty finite $A subset H$ such that 
$ sum_(k in K) \| k A triangle.stroked.t A \| < epsilon \| A \| . $

]
] <lem:am-reiter-folner>

#proof[
  Choose one representative $t$ in every right coset $H t$ of $H$ in $J$, and write each $x in J$ uniquely as $x = h t$. Define $pi \( x \) = h$. Then $pi \( k x \) = k pi \( x \)$ for $k in H$. The pushforward $p = pi_(*) nu$ is a probability measure on $H$, and summing over fibers shows
  $ parallel k p - p parallel_1 lt.eq parallel k nu - nu parallel_1 . $
  Start with the sum on the right less than $epsilon \/ 2$. If $K$ is empty any singleton suffices, so assume $K$ is nonempty. Choose a finite $E subset H$ with $p \( E \) > 1 - epsilon \/ \( 8 \| K \| \)$, decreasing this error further if necessary to ensure $p \( E \) > 0$, and put $q = p upright(bold(1))_E \/ p \( E \)$. Direct calculation gives $parallel q - p parallel_1 = 2 \( 1 - p \( E \) \)$. Therefore
  $ sum_(k in K) parallel k q - q parallel_1 lt.eq sum_(k in K) parallel k p - p parallel_1 + 4 \| K \| \( 1 - p \( E \) \) < epsilon . $
  For $t > 0$ let $A_t = { h in H : q \( h \) > t }$. These sets are finite, and the identities for real numbers $a \, b gt.eq 0$,
  $ integral_0^oo upright(bold(1))_({ a > t }) thin d t = a \, #h(2em) integral_0^oo \| upright(bold(1))_({ a > t }) - upright(bold(1))_({ b > t }) \| thin d t = \| a - b \| \, $
  give, after finite summation,
  $ integral_0^oo \| A_t \| thin d t = 1 \, #h(2em) integral_0^oo sum_(k in K) \| k A_t triangle.stroked.t A_t \| thin d t = sum_(k in K) parallel k q - q parallel_1 < epsilon . $
  If every nonempty $A_t$ had its summed boundary at least $epsilon \| A_t \|$, integration would contradict these two formulas. For some $t$ the nonempty finite set $A = A_t$ therefore satisfies the asserted strict inequality. ◻
]

#proof[
  Fix a subgroup $H lt.eq F_m$, a finite $K subset H$, and $epsilon > 0$. For nonempty $K$, apply the construction with $cal(K) = K union K^(- 1)$ and with the total variation error in (21) less than $epsilon \/ \( 4 \| K \| \)$. It supplies a probability measure on $F_m$ whose summed $ell^1$ error for $K$ is less than $epsilon \/ 2$. Lemma 11 supplies a nonempty finite $A subset H$ with summed boundary less than $epsilon \| A \|$, and hence $\| k A triangle.stroked.t A \| < epsilon \| A \|$ for every $k in K$. The empty $K$ case is immediate. Taking $H = F_m$ proves amenability of $F_m$, and taking $H = A_m$ gives the assertion needed for the simple group. All choices were made with $m$ fixed; no passage to infinitely many tracks has occurred. ◻
]

== 5 Finite generation of the multiplier <sec:homology>

This section uses the arithmetic, strict-area comparison, and alternating extension results of Lemmas 2, 3, and 4. Its goal is the following finiteness statement. All homology groups in this Section have integer coefficients unless another coefficient group is displayed.

#thm([Theorem 5.1.])[
  #emph[There is an integer $m_(upright("hom"))$ such that $H_2 \( A_m \; bb(Z) \)$ is finitely generated for every finite $m gt.eq m_(upright("hom"))$.]
] <thm:multiplier>

The proof first establishes stability and finite generation for $H_1 \( F_m \)$ and $H_2 \( F_m \)$. Polygonal step functions enter through an explicit resolution of a symmetric monoidal groupoid. We then return to a fixed finite number of tracks, prove that $F_m$ acts trivially on $H_2 \( A_m \)$, and use the homology spectral sequence of $A_m lt.closed F_m$. No presentation or finite-generation assertion about $A_m$ is used in this Section.

This stability and group-completion strategy has precedents in the Higman–Thompson calculation of Szymik and Wahl #cite(label("SzymikWahl2019")) and in Li’s framework for ample groupoids and full groups #cite(label("Li2025")). Here the polygon category, its low-degree resolution, and the return to $A_m$ on finitely many tracks are constructed below. The external bar and group-completion results are cited at their individual applications.

=== 5.1 Configurations of embedded squares <configurations-of-embedded-squares>

An embedding $e : X arrow.r.hook m X$ means an injective partial piecewise translation, defined on the entire Boolean square $X$. Let $cal(E)_m$ be the semisimplicial set whose $p$-simplices are ordered tuples $\( e_0 \, dots.h \, e_p \)$ of embeddings with pairwise disjoint images. Faces delete entries. Write $C_p \( cal(E)_m \)$ for its integral chain group and augment it by $C_(- 1) \( cal(E)_m \) = bb(Z)$, sending every vertex to $1$.

#thm([Lemma 5.2.])[
  #emph[For each fixed integer $d gt.eq 0$, the augmented complex $C_(*) \( cal(E)_m \)$ has zero homology in degrees $- 1 \, 0 \, dots.h \, d$ when $m$ is sufficiently large. The required lower bound on $m$ depends only on $d$.]
] <lem:hom-configuration-acyclic>

#proof[
  Any $b$ vertices have a common disjoint vertex if $m > b + 1$: the union of their images has area at most $b$, so its complement has area greater than $1$; Lemma 3 embeds $X$ in that complement.
  We construct a chain contraction in the asserted degrees. Choose a vertex $v$ and put $h_(- 1) \( 1 \) = v$. Suppose $h_(- 1) \, dots.h \, h_(p - 1)$ have been constructed, satisfy $partial h + h partial = "id"$ in degrees below $p$, and the vertices appearing in $h_(p - 1) \( rho \)$ are bounded in number independently of the $\( p - 1 \)$-simplex $rho$. For a $p$-simplex $sigma$, the chain
  $ z_sigma = sigma - h_(p - 1) \( partial sigma \) $
  is a cycle. Its vertices have a bound depending only on $p$: if the bound for $h_(p - 1)$ is $b_(p - 1)$, a valid bound is $\( p + 1 \) + \( p + 1 \) b_(p - 1)$. Choose a vertex $w_sigma$ disjoint from all these vertices and define $h_p \( sigma \) = w_sigma * z_sigma$, where the cone prepends $w_sigma$ to each ordered simplex. The identity
  $ partial \( w_sigma * z \) = z - w_sigma * \( partial z \) $
  gives $partial h_p \( sigma \) + h_(p - 1) \( partial sigma \) = sigma$. Moreover, $b_p = 1 + \( p + 1 \) + \( p + 1 \) b_(p - 1)$ is a uniform bound for the vertices appearing in $h_p \( sigma \)$. Starting with $b_(- 1) = 1$, choose $m$ larger than all the finitely many bounds needed for $p lt.eq d$. Linear extension defines the required contraction. There is no requirement that the contraction be equivariant or that one vertex avoid an arbitrarily long cycle. ◻
]

The group $F_m$ acts on $cal(E)_m$ by postcomposition. For a fixed $p$ and sufficiently large $m$, this action is transitive, even under $A_m$. Indeed, the bijection from the first $p + 1$ standard tracks to any given configuration has area $p + 1$ and extends by Lemma 4 when $m > 10 \( p + 1 \)$. The stabilizer in $F_m$ of the standard configuration fixes those tracks pointwise and is therefore exactly $F_(m - p - 1)$. This avoids any assertion that arbitrary equal-area polygons are equidecomposable.

#thm([Lemma 5.3.])[
  #emph[For $q = 0 \, 1 \, 2$, adding an identity track induces an isomorphism 
$ H_q \( F_(m - 1) \) arrow.r H_q \( F_m \) $

 for all sufficiently large $m$. The same assertion holds with $F_m$ replaced by the finite symmetric group $"Sym" \( m \)$.]
] <lem:hom-full-stability>

#proof[
  Tensor the augmented configuration complex with a free right $bb(Z) \[ F_m \]$-resolution of $bb(Z)$ and take its total complex. One filtration, together with Lemma 13, shows that its homology vanishes in any prescribed bounded range when $m$ is large. The other filtration has, in columns $p gt.eq - 1$,
  #[#set math.equation(numbering: n => "(22)")
   $ E_(p \, q)^1 = H_q \( F_(m - p - 1) \) \, #h(2em) E_(- 1 \, q)^1 = H_q \( F_m \) . $ <eq:hom-configuration-ss>]
  Here and below only boundedly many columns are needed. The identification follows directly from the permutation module on simplices: restricting the free resolution to a stabilizer is still a free resolution.
  Every face inclusion of a standard stabilizer is a stabilization followed by conjugation in the target stabilizer. Inner conjugation induces the identity on homology. Thus $d^1$ is stabilization when $p$ is even and is zero when $p$ is odd. In particular, in row $q$ the entries at columns $- 1$ and $0$ of $E^2$ are respectively the cokernel and the kernel of $H_q \( F_(m - 1) \) arrow.r H_q \( F_m \)$.
  The row $q = 0$ is the alternating augmented row of copies of $bb(Z)$ and is exact. For $q = 1$, the only possible higher differentials into columns $- 1$ and $0$ come from row zero, so both entries vanish, as the total homology vanishes. This proves stability in degree one. For $q = 2$, the possible sources for the entry $\( - 1 \, 2 \)$ are $\( 1 \, 1 \)$ and $\( 2 \, 0 \)$, and those for $\( 0 \, 2 \)$ are $\( 2 \, 1 \)$ and $\( 3 \, 0 \)$. The degree-one stability just proved kills the indicated row-one entries when $m$ is increased by a fixed amount; row zero is exact. No higher differential has a nonnegative source row, and there are no outgoing higher differentials from columns $- 1$ or $0$. Hence the kernel and cokernel in degree two are zero. Transitivity through column four and augmented acyclicity through degree two suffice for this argument; all the requirements are finite.
  For $"Sym" \( m \)$ use ordered configurations of distinct points. The same bounded contraction works by choosing an unused point, the action is transitive, and its stabilizer is $"Sym" \( m - p - 1 \)$. The identical spectral sequence argument applies. ◻
]

=== 5.2 Group completion and three bars <group-completion-and-three-bars>

We now seek finite generation of the two stable homology groups in Lemma 14. Define $cal(B)$ to be the groupoid whose objects are finite lists $\( U_1 \, dots.h \, U_k \)$ of Boolean polygonal subsets of $X$. A morphism is a piecewise translation bijection between their disjoint unions, with the list entries serving as separate tracks. Tensor product is concatenation of lists; its symmetry reorders the tracks. The empty list is the unit. Thus $cal(B)$ is a strict symmetric monoidal groupoid. Let $cal(S)$ be the groupoid of finite sets and bijections, using its ordered skeleton with objects ${ 1 \, dots.h \, n }$, $n gt.eq 0$. Ordered disjoint union, with the second block relabeled, makes its tensor product strictly associative and unital.

The groupoid $cal(S)$ records the finite sets of track labels over points of $X$. By following these labels through strings of exchanges, we will resolve $cal(B)$ into levels built from finite products of $cal(S)$. To compute their homology, we use three bar constructions. Reduced homology then starts in degree three, so a product of two positive-degree classes first appears in degree six. The calculation through degree five is consequently additive in the fibers; it is this range that will give stable homology through degree two.

Here is a concrete bar convention, needed later for the resolution. For a symmetric monoidal groupoid $cal(C)$ and $p gt.eq 0$, let $D_p cal(C)$ have objects

$ \( C_(i j) \, alpha_(i j k) \)_(0 lt.eq i lt.eq j lt.eq k lt.eq p) \, #h(2em) alpha_(i j k) : C_(i j) union.sq C_(j k) arrow.r^(med tilde.equiv med) C_(i k) \, $

with $C_(i i)$ the unit, the evident unit maps, and the associativity condition at every four ordered indices. Morphisms are families of isomorphisms commuting with every $alpha_(i j k)$. Pullback along monotone maps of index sets defines faces and degeneracies. Tensor product is coordinatewise, using the symmetry to interchange the middle summands in the decomposition maps. Evaluation on the elementary intervals gives an equivalence

#[#set math.equation(numbering: n => "(23)")
 $ D_p cal(C) tilde.eq cal(C)^p . $ <eq:hom-bar-product>]

An inverse replaces every interval by the ordered sum of its elementary entries; coherence of the $alpha$’s supplies its comparison isomorphism.

Write $B^0 cal(C) = \| N cal(C) \|$ and let $B^d cal(C)$ be the realization of the nerve of $D_(p_1) dots.h.c D_(p_d) cal(C)$ over all $d$ bar indices. We use the usual realizations of these simplicial sets, or equivalently their fat realizations. Degeneracies are inclusions of simplicial subsets, so these models are well based and levelwise equivalences remain equivalences on realization. For $M = \| N cal(C) \|$, the first bar is the usual $B M$: inserting ordered sums gives the level equivalences with the ordinary simplicial bar. The interval convention preserves the symmetric product during iteration.

The coordinatewise tensor product and its symmetry make $B^1 cal(C)$ a connected homotopy-commutative $H$-space. We will use two standard bar facts, with their hypotheses visible in this model. The product equivalences (23), the contractible level zero, and the cofibration condition just noted satisfy the realization hypotheses in #cite(label("Segal1974")) Proposition 1.5 and its preceding Note; Proposition A.1 and Definition A.4. They imply that

#[#set math.equation(numbering: n => "(24)")
 $ B^(d - 1) cal(C) tilde.eq Omega B^d cal(C) #h(2em) \( d gt.eq 2 \) . $ <eq:hom-deloop>]

At these stages the preceding space is connected, so its component monoid is already a group, as required by the delooping criterion. The skeletal bar filtration also shows that

#[#set math.equation(numbering: n => "(25)")
 $ tilde(H)_i \( B^d cal(C) \) = 0 quad \( i < d \) \, #h(2em) pi_1 \( B^d cal(C) \) = 0 quad \( d gt.eq 2 \) . $ <eq:hom-connectivity>]

For example, after the first bar the spaces are connected. In the next bar the normalized level-zero row contributes only the base point, and the first possible positive homology in the other levels gains one in total degree. The same product model, or the fundamental-group calculation of the bar, gives simple connectivity from the second bar onward. This proves the displayed homological range inductively.

For $cal(C) = cal(B)$, our immediate target is therefore finite generation of $H_i \( B^3 cal(B) \)$ for $i lt.eq 5$. Delooping will lower this bound to degree four for $B^2 cal(B)$ and then to degree three for $B^1 cal(B)$. The spaces $B^3 cal(B)$ and $B^2 cal(B)$ are simply connected, whereas $B^1 cal(B)$ may have a nontrivial fundamental group. Its connected $H$-space structure will allow us to pass to its universal cover without losing finite generation; looping that cover gives the component $Omega_0 B^1 cal(B)$ of the constant loop, now through degree two. Group completion will identify this last homology with the stable homology of $F_m$. The following lemma supplies the finiteness implications in this chain.

#thm([Lemma 5.4.])[
  #emph[The following statements hold for spaces of CW homotopy type.]
  + #emph[If $Z$ is simply connected, then, for every $r gt.eq 0$, $H_i \( Z \)$ is finitely generated for $i lt.eq r + 1$ if and only if $H_i \( Omega Z \)$ is finitely generated for $i lt.eq r$.]
  + #emph[Let $Y$ be a connected $H$-space. If $H_i \( Y \)$ is finitely generated for $i lt.eq r$, then $pi_1 \( Y \)$ and $H_i \( tilde(Y) \)$ for $i lt.eq r$ are finitely generated, provided $r gt.eq 1$. Conversely, if $pi_1 \( Y \)$ and those cover homology groups are finitely generated, then $H_i \( Y \)$ is finitely generated for $i lt.eq r$.]
] <lem:hom-finiteness-transfers>

#proof[
  We use the Serre homology spectral sequence in the form of #cite(label("HatcherSpectralSequences")) Theorem 1.3, p. 8. For (i), apply it to the path-loop fibration, obtaining
  $ E_(a \, b)^2 = H_a \( Z \; H_b \( Omega Z \) \) arrow.r.double H_(a + b) \( P Z \) \, #h(2em) P Z tilde.eq * . $
  All coefficients are constant because $Z$ is simply connected. If the base homology is finitely generated through degree $r + 1$, induct on $b lt.eq r$. The term $E_(0 \, b)^2 = H_b \( Omega Z \)$ has no outgoing differential. Its incoming sources have strictly smaller fiber degree and base degree at most $b + 1$. They are finitely generated by induction and the universal coefficient theorem. The term at infinity is zero for $b > 0$, so finitely many finitely generated images exhaust $H_b \( Omega Z \)$. For the converse, induct on $a lt.eq r + 1$ in the row-zero term $E_(a \, 0)^2 = H_a \( Z \)$. It has no incoming differential, its outgoing targets have smaller base degree and fiber degree at most $a - 1$, and its limiting term is zero for $a > 0$. The successive quotients in this finite filtration are subgroups of finitely generated groups. This proves (i).
  For (ii), the two products on based loops, concatenation and the $H$-space product, give the same operation on $pi_1 \( Y \)$ and make it abelian. Thus $pi_1 \( Y \) = H_1 \( Y \)$. This fundamental group acts trivially on the homology of the universal cover. To see the latter claim, represent a deck transformation by a loop $alpha$ at the unit. Lift the family of maps $\( t \, y \) mapsto alpha \( t \) y$ to the universal cover, starting with the identity (using the unit homotopy if necessary). Its terminal map is the deck transformation represented by $alpha$. Consequently that map is homotopic to the identity.
  Put $Q = pi_1 \( Y \)$. The spectral sequence for the universal cover is
  $ E_(a \, b)^2 = H_a \( Q \; H_b \( tilde(Y) \) \) arrow.r.double H_(a + b) \( Y \) \, $
  with constant coefficients. A finitely generated abelian group has finitely generated homology in each degree with finitely generated constant coefficients: tensor the resolutions for an infinite cyclic group and for a finite cyclic group. Induction on $b$ in column zero now proves the forward implication, since all incoming sources have lower fiber degree and the limiting term is a subgroup of $H_b \( Y \)$. The reverse implication follows directly from the finitely many terms on each total-degree diagonal. ◻
]

#thm([Lemma 5.5.])[
  #emph[There are natural homology isomorphisms 
$ "colim"_m thin H_j \( F_m \) & tilde.equiv H_j \( Omega_0 B^1 cal(B) \) \,\
"colim"_m thin H_j \( "Sym" \( m \) \) & tilde.equiv H_j \( Omega_0 B^1 cal(S) \) . $

 Here $Omega_0$ denotes the component of the constant loop.]
] <lem:hom-cofinal-completion>

#proof[
  The monoid $M = \| N cal(B) \|$ is well based and has CW homotopy type. The symmetry supplies a homotopy between the two orders of multiplication, so $pi_0 \( M \)$ is central in the integral Pontryagin ring. The integral group-completion theorem #cite(label("McDuffSegal1976")) Proposition 1 therefore identifies the homology of $Omega B M$ with the localization of $H_(*) \( M \)$ at its components.
  There is one cofinal object here. The object $U = \( U_1 \, dots.h \, U_k \)$ has complement $U^c = \( X \\ U_1 \, dots.h \, X \\ U_k \)$ and $U union.sq U^c tilde.equiv k X$. Hence inverting $X$ inverts every component. Its localization is computed by the telescope
  $ T = "tel" \( M arrow.r^(X union.sq -) M arrow.r^(X union.sq -) dots.h.c \) . $
  Equivalently, every right translation on this telescope is a homology equivalence: translation by $X$ is invertible, tensor symmetry exchanges left and right translations, and a complement gives an inverse for translation by any object. This verifies the action hypothesis in the telescope form of group completion #cite(label("McDuffSegal1976")) Proposition 2 and p. 281; see also the corrected proof in #cite(label("MillerPalmer2015")) Theorem 4.1, applied with ordinary integral homology. In the nerve-realization model, $M$ is a Hausdorff, locally contractible CW complex and its telescope is Hausdorff, as required there.
  The bar two-skeleton identifies $pi_1 \( B M \)$ with the group completion of the commutative monoid of object-isomorphism classes: an object supplies a loop, and a pair supplies the relation that its sum represents the product. The component of an object $U$ at stage $r$ of $T$ is therefore $\[ U \] - r \[ X \]$. If this is zero, there is an object $V$ with $U union.sq V tilde.equiv r X union.sq V$. Choose $V'$ with $V union.sq V' tilde.equiv k X$. Then
  $ U union.sq k X tilde.equiv \( r + k \) X . $
  Thus every component occurring in the neutral telescope component eventually becomes a standard component $B F_(r + k)$. Choices of the identifying isomorphism differ by an inner automorphism and give the same map on homology. It follows that the neutral component has homology $"colim"_m H_j \( F_m \)$, with the usual stabilization maps. Group completion respects these component gradings, proving the first assertion. For $cal(S)$, use a singleton in place of $X$; the same argument gives the second assertion. ◻
]

#thm([Lemma 5.6.])[
  #emph[For $d = 1 \, 2 \, 3$, the groups $H_i \( B^d cal(S) \)$ are finitely generated for $i lt.eq d + 2$.]
] <lem:hom-finite-set-bars>

#proof[
  Finite groups have finitely generated integral homology in every degree, as their bar chain groups have finite rank in each degree. Lemma 14 therefore gives finite generation of the stable homology of $"Sym" \( m \)$ through degree two. By Lemma 16, this is the homology through degree two of $Omega_0 B^1 cal(S)$, or equivalently of $Omega accent(B^1 cal(S), ̃)$. Lemma 15(i) gives finite generation for the cover through degree three. The fundamental group of $B^1 cal(S)$ is the group completion of $bb(N)$, hence $bb(Z)$. Part (ii) gives finite generation for $B^1 cal(S)$ through degree three.
  Ascend the bars using their skeletal filtrations and the product models (23). In the normalized filtration for the next bar, column zero is a point, so a positive-degree term of total degree at most $d + 2$ has bar degree at least one and internal degree at most $d + 1$. The induction hypothesis and the integral Künneth theorem make the homology of every finite product in this range finitely generated. There are finitely many bidegrees on each relevant diagonal. This proves the assertion successively for $d = 2$ and $d = 3$. ◻
]

Consequently the three coefficient groups

#[#set math.equation(numbering: n => "(26)")
 $ K_j = H_j \( B^3 cal(S) \) \, #h(2em) j = 3 \, 4 \, 5 \, $ <eq:hom-Kj>]

are finitely generated. The remaining task is to obtain the same degree-five bound for $B^3 cal(B)$. We first describe its resolution completely, including the maps that identify it.

=== 5.3 Strings and the trajectory differential <strings-and-the-trajectory-differential>

We now construct the resolution whose levels have finite-set fibers. A string of exchanges records both the positions visited by a point and the track labels carried along that path. Keeping these two kinds of data separate will turn its low-degree homology into a translation-homology calculation.

A position-preserving isomorphism of objects of $cal(B)$ may change the track label, piecewise, but leaves the point of $X$ unchanged. Denote the subgroupoid of such isomorphisms, with all objects retained, by $cal(P)$. For $p gt.eq 0$ define $cal(C)_p$ as follows. Its objects are strings

$ U_0 arrow.r^(f_1) U_1 arrow.r^(f_2) dots.h.c arrow.r^(f_p) U_p $

of arbitrary morphisms of $cal(B)$. Its morphisms are commuting ladders whose maps $U_i arrow.r U'_i$ belong to $cal(P)$. Deleting a vertex and composing adjacent arrows defines the faces; inserting an identity defines the degeneracies. Concatenation gives a simplicial symmetric monoidal groupoid. A simplex of $N_q cal(C)_p$ is a commuting grid with $p$ horizontal arrows and $q$ vertical arrows: the horizontal arrows are arbitrary exchanges, and the vertical arrows preserve positions.

We first describe these strings by their trajectories and finite fibers. For $x in X$ and $gamma_1 \, dots.h \, gamma_p in Gamma$, a trajectory is the sequence of positions

$ x \, quad x + gamma_1 \, quad x + gamma_1 + gamma_2 \, quad dots.h \, quad x + gamma_1 + dots.h.c + gamma_p . $

Cut a string in $cal(C)_p$ according to its successive translation charts and the inverse images of later cuts. Each resulting strand has a fixed increment tuple $\( gamma_1 \, dots.h \, gamma_p \)$ and a Boolean set of initial points. The translation action on $X$ is free, so the increments are uniquely determined by the positions. Track multiplicities give a finite set over each initial point and increment tuple. Position-preserving ladders are exactly permutations of these fibers. Conversely, a Boolean locally constant family of finite sets on $X times Gamma^p$, supported on finitely many increment tuples, reconstructs a string by taking its strands as separate list entries and translating them successively. These constructions give an equivalence of symmetric monoidal groupoids.

More explicitly, restrict to a finite set of increment tuples and a finite Boolean partition on which all fiber sets and maps are constant. The corresponding groupoid is a finite product of copies of $cal(S)$. Enlarging the finite support inserts empty fibers; refining an atom duplicates its fiber. Every finite diagram of strings and isomorphisms occurs at one such stage. Thus nerves, bars, and their chain complexes are obtained by a filtered colimit of these finite stages.

The levels are now expressed in terms of finite sets. The next lemma shows that realizing the spaces $B^3 cal(C)_p$ in the string index $p$ recovers $B^3 cal(B)$. The commuting-grid description is the basis of its proof.

#thm([Lemma 5.7.])[
  #emph[There is a zigzag of natural realization equivalences between $B^3 cal(B)$ and the realization in $p$ of $B^3 cal(C)_p$.]
] <lem:hom-string-resolution>

#proof[
  Fix three bar indices $bold(n) = \( n_1 \, n_2 \, n_3 \)$, and put $cal(D) = D_(n_1) D_(n_2) D_(n_3) cal(B)$. Let $cal(D)^(upright("pos"))$ have those objects of $cal(D)$ whose decomposition isomorphisms at every bar level preserve positions in $X$, but retain #emph[all] horizontal diagram isomorphisms between them. The inclusion
  #[#set math.equation(numbering: n => "(27)")
   $ cal(D)^(upright("pos")) arrow.r cal(D) $ <eq:hom-pos-inclusion>]
  is full and essentially surjective. Indeed, replace every multi-interval object by the lexicographically ordered sum of its elementary entries, indexed by products of consecutive intervals $\[ i_1 - 1 \, i_1 \] times \[ i_2 - 1 \, i_2 \] times \[ i_3 - 1 \, i_3 \]$ in the three bar-index sets. Its decomposition maps are canonical reorderings and preserve positions. The original coherent decomposition maps identify each ordered sum with the corresponding original multi-interval. They form a diagram isomorphism because changing the order of the cuts only introduces the specified symmetric reordering. The comparison is allowed to translate pieces: it is a horizontal arrow. For example, in one bar at degree two, the long edge $U_02$ is replaced by $U_01 union.sq U_12$, and the comparison on that edge is the original map $alpha_012$, regardless of whether it preserves positions.
  The inclusions (27) commute with all bar operations. A face pulls back the existing interval diagram and its specified decomposition maps; it does not choose a new ordered-sum normalization. Composing position-preserving decompositions, inserting a unit, and reordering sums remain position-preserving. We use these inclusions as the natural maps; no strictly natural choice of an inverse normalization is required.
  Now take the double nerve whose horizontal strings use arbitrary arrows of $cal(D)^(upright("pos"))$ and whose vertical arrows preserve positions. Reading it horizontally first gives exactly the nerve of $D_(n_1) D_(n_2) D_(n_3) cal(C)_p$: its decomposition maps are position-preserving ladders, precisely the condition built into the morphisms of $cal(C)_p$.
  Read the same double nerve vertically first, fixing a vertical string length $q$. Its groupoid has objects strings $V_0 arrow.r^(v_1) dots.h.c arrow.r^(v_q) V_q$ of position-preserving arrows and has arbitrary horizontal commuting ladders. Evaluation at $V_0$ is an equivalence with $cal(D)^(upright("pos"))$. It is essentially surjective by constant strings. It is fully faithful because a horizontal arrow $a_0 : V_0 arrow.r W_0$ uniquely determines all its components:
  #[#set math.equation(numbering: n => "(28)")
   $ a_i = w_(0 i) thin a_0 thin v_(0 i)^(- 1) \, #h(2em) v_(0 i) = v_i dots.h.c v_1 \, quad w_(0 i) = w_i dots.h.c w_1 . $ <eq:hom-ladder-formula>]
  Every map in (28) is an allowed horizontal diagram map. Constant-string inclusions are natural in $q$ and in every bar index, and are levelwise equivalences. Thus the constant-string maps and (27) give the asserted zigzag after taking nerves and successive realizations. The levelwise-equivalence criterion applies to these simplicial-set models as explained before (24). ◻
]

We now apply this finite-fiber description to homology. Put $E = B^3 cal(S)$. By (25), $H_0 \( E \) = bb(Z)$ and $tilde(H)_i \( E \) = 0$ for $i < 3$. For a finite product $E^s$, the integral Künneth formula gives

#[#set math.equation(numbering: n => "(29)")
 $ H_j \( E^s \) = xor.big_(a = 1)^s H_j \( E \) #h(2em) \( j = 3 \, 4 \, 5 \) . $ <eq:hom-product-additivity>]

A tensor term using two positive-degree factors first has degree six; a corresponding $"Tor"$ term first has degree seven. Terms involving $H_0 \( E \) = bb(Z)$ have no such torsion term. The disjoint-union map on the fibers restricts to the identity on either factor when the other is empty. Hence under (29) it induces ordinary addition. Refinement induces the diagonal, since the same fiber is copied onto every new atom. Exactness of filtered colimits therefore identifies

#[#set math.equation(numbering: n => "(30)")
 $ H_j \( B^3 cal(C)_p \) = xor.big_(\( gamma_1 \, dots.h \, gamma_p \) in Gamma^p) C \( X \, bb(Z) \) ⊗ K_j #h(2em) \( j = 3 \, 4 \, 5 \) \, $ <eq:hom-trajectory-chains>]

where $C \( X \, bb(Z) \)$ denotes the Boolean step functions. There is no derived tensor hidden here: $C \( X \, bb(Z) \)$ is the filtered union of the free groups of functions on finite Boolean partitions.

For clarity, all the differential maps in (30) can be written on trajectories:

#[#set math.equation(numbering: n => "(31)")
 $ d_0 \( x \; gamma_1 \, dots.h \, gamma_p \) & = \( x + gamma_1 \; gamma_2 \, dots.h \, gamma_p \) \,\
d_i \( x \; gamma_1 \, dots.h \, gamma_p \) & = \( x \; gamma_1 \, dots.h \, gamma_i + gamma_(i + 1) \, dots.h \, gamma_p \) \, &  & 0 < i < p \,\
d_p \( x \; gamma_1 \, dots.h \, gamma_p \) & = \( x \; gamma_1 \, dots.h \, gamma_(p - 1) \) . $ <eq:hom-trajectory-faces>]

Fibers acquiring the same label are disjointly summed. In the coefficient convention $gamma_(*) f \( y \) = f \( y - gamma \)$, the first face therefore applies $gamma_(1 *)$ to the coefficient, each interior face adds two consecutive increments, and the last face leaves the coefficient unchanged. The alternating sum of these maps is the inhomogeneous group-homology bar differential for the translation module $C \( X \, bb(Z) \) ⊗ K_j$ (the group $Gamma$ is abelian, so the same pushforward convention also gives a right module).

The skeletal spectral sequence for the resolution in Lemma 18 consequently has, in the reduced rows relevant to total degree at most five,

#[#set math.equation(numbering: n => "(32)")
 $ E_(p \, j)^2 = H_p #scale(x: 120%, y: 120%)[\(] Gamma \; C \( X \, bb(Z) \) ⊗ K_j #scale(x: 120%, y: 120%)[\)] \, #h(2em) j = 3 \, 4 \, 5 . $ <eq:hom-trajectory-ss>]

Rows one and two are zero. Row zero is the constant simplicial group $bb(Z)$, since every $B^3 cal(C)_p$ is connected; its homology contributes only the degree-zero copy of $bb(Z)$. We now establish finite generation of the coefficient homology in (32).

=== 5.4 Corner symbols and polygonal coefficients <corner-symbols-and-polygonal-coefficients>

Let $H = cal(O)^2$, regarded as a discrete free abelian group of rank four, and let $L$ be the abelian group of compactly supported integer-valued step functions on the plane whose boundaries use finitely many allowable lines. Equalities are modulo sets with empty interior. Translations make $L$ a module over

$ R = bb(Z) \[ H \] tilde.equiv bb(Z) \[ t_1^(plus.minus 1) \, t_2^(plus.minus 1) \, t_3^(plus.minus 1) \, t_4^(plus.minus 1) \] \, $

a noetherian ring.

Translation modules of polyhedral step functions also occur in the homology of projection-method patterns #cite(label("GahlerHuntonKellendonk2013")) Section 3.1. Our immediate task is the integral finite-generation statement below. We prove it by an explicit corner map and the finite vertex types of Lemma 2, without a cut-and-project identification.

#thm([Lemma 5.8.])[
  #emph[The $R$-module $L$ is finitely generated.]
] <lem:hom-corner-module>

#proof[
  Let $V$ be the set of intersections of at least two nonparallel allowable lines. At $z in V$, let $r \( z \) in { 2 \, 3 \, 4 }$ be the number of allowable lines through $z$. Their $2 r \( z \)$ sectors give a free abelian group of sector germs. Quotient it by the constant germ and the indicator germs of either half-plane for each incident line; call the quotient $Q_z$.
  We spell out this integral quotient. Number the sectors cyclically, put $r = r \( z \)$, and write a germ as $\( a_0 \, dots.h \, a_(2 r - 1) \)$. With indices modulo $2 r$, let
  $ d_i = a_(i + 1) - a_i \, #h(2em) q_i = d_i + d_(i + r) quad \( 0 lt.eq i < r \) . $
  Then $sum_i q_i = 0$, and
  #[#set math.equation(numbering: n => "(33)")
   $ Q_z tilde.equiv { \( q_0 \, dots.h \, q_(r - 1) \) in bb(Z)^r : sum_i q_i = 0 } tilde.equiv bb(Z)^(r - 1) . $ <eq:hom-corner-quotient>]
  Indeed, cyclic differences identify germs modulo constants with ${ d in bb(Z)^(2 r) : sum_i d_i = 0 }$. A half-plane germ has difference vector $plus.minus \( e_i - e_(i + r) \)$. These vectors generate exactly the kernel of the pair-sum map $d mapsto q$; the map is onto, since $d = \( q \, 0 \)$ has zero total sum. This proves (33) over $bb(Z)$.
  For $f in L$, record its sector germ modulo this subgroup at every $z$. The result is a translation-equivariant map
  $ c : L arrow.r xor.big_(z in V) Q_z . $
  This has finite support. To define the germ, use the finite line family defining $f$ and take a small neighborhood excluding its nonincident lines; other allowable directions through $z$ merely refine sectors with equal values. A nonzero symbol can occur only where two of the finitely many defining lines cross. The density of the collection of all allowable lines causes no difficulty.
  The map $c$ is injective. If $c \( f \) = 0$, the equation $d_(i + r) = - d_i$ says that the jump across each incident oriented line is the same on both sides of the vertex. Fix a line in a finite defining family for $f$. Its jump is constant between successive intersections with that family and, by the preceding identity, continues unchanged across every intersection. It is therefore constant along the whole line. Compact support makes the jump zero far away, hence everywhere. All the line jumps vanish. Any two chambers of the finite line arrangement can be joined by a path crossing its lines away from vertices; their function values consequently agree. The common value is zero outside the compact support, so $f = 0$.
  Lemma 2 places $V$ inside $D^(- 1) cal(O)^2$ for a fixed integer $D > 0$. Thus $V$ has finitely many $H$-orbits; translation preserves the full set of incident directions, and a point has trivial translation stabilizer. After choosing one representative from each orbit,
  $ xor.big_(z in V) Q_z tilde.equiv xor.big_(alpha = 1)^s R^(thin r \( z_alpha \) - 1) . $
  This is a finite free $R$-module. Its submodule $c \( L \)$ is finitely generated because $R$ is noetherian, proving the Lemma. ◻
]

#thm([Lemma 5.9.])[
  #emph[For every finitely generated abelian group $K$ and every $i gt.eq 0$, 
$ H_i #scale(x: 120%, y: 120%)[\(] Gamma \; C \( X \, bb(Z) \) ⊗ K #scale(x: 120%, y: 120%)[\)] $

 is a finitely generated abelian group.]
] <lem:hom-coefficient-finiteness>

#proof[
  Put $N = bb(Z)^2$ and $J = tau bb(Z)^2$. Then $H = N xor J$ and $J tilde.equiv Gamma$. Cutting a compactly supported function along the integer square grid gives, as $N$-modules,
  #[#set math.equation(numbering: n => "(34)")
   $ L tilde.equiv bb(Z) \[ N \] ⊗ C \( X \, bb(Z) \) . $ <eq:hom-square-induction>]
  The second factor is represented by functions supported in one unit square, and $N$ shifts the square index. Only finitely many squares meet any given support. The Boolean convention makes the half-open choice on square edges immaterial.
  Tensor (34) with $K$. Induction from the trivial subgroup, or the two-generator free abelian resolution, gives
  $ H_q \( N \; L ⊗ K \) = cases(delim: "{", C \( X \, bb(Z) \) ⊗ K \, & q = 0 \,, 0 \, & q > 0 .) $
  On the coinvariants, a translation in $J$ cuts and moves pieces back to the chosen square, so its action is exactly translation modulo one. Taking the two successive free abelian resolutions for $N$ and $J$ therefore identifies
  #[#set math.equation(numbering: n => "(35)")
   $ H_i \( H \; L ⊗ K \) tilde.equiv H_i #scale(x: 120%, y: 120%)[\(] Gamma \; C \( X \, bb(Z) \) ⊗ K #scale(x: 120%, y: 120%)[\)] . $ <eq:hom-plane-torus>]
  By Lemma 19, $L ⊗ K$ is a finitely generated $R$-module: tensor a finite set of $R$-module generators of $L$ with a finite set of abelian generators of $K$. The Koszul resolution on $t_1 - 1 \, dots.h \, t_4 - 1$ computes the left side of (35). Its chain groups are finite sums of $L ⊗ K$, and its homology is finitely generated over $R$ by noetherianity. On this complex, exterior multiplication $epsilon_a$ by the $a$th basis vector satisfies
  $ d epsilon_a + epsilon_a d = \( t_a - 1 \) "id" . $
  Thus each $t_a - 1$ acts trivially on homology. The homology is therefore a finitely generated module over $R \/ \( t_1 - 1 \, dots.h \, t_4 - 1 \) = bb(Z)$, as required. We have proved finite generation of $L$ integrally before tensoring; no preservation of the corner-map injection under tensor product is being assumed. ◻
]

#thm([Proposition 5.10.])[
  #emph[For all sufficiently large finite $m$, the groups $H_1 \( F_m \)$ and $H_2 \( F_m \)$ are finitely generated.]
] <prop:hom-full-finiteness>

#proof[
  By Lemma 17, each $K_j$ in (26) is finitely generated. Lemma 20 makes every relevant term of (32) finitely generated. There are finitely many terms of total degree at most five, apart from the rows already shown to vanish. Hence Lemma 18 gives finite generation of $H_i \( B^3 cal(B) \)$ for $i lt.eq 5$.
  Apply (24) and Lemma 15(i) twice. First $H_i \( B^2 cal(B) \)$ is finitely generated for $i lt.eq 4$, and then $H_i \( B^1 cal(B) \)$ is finitely generated for $i lt.eq 3$. Both bases in these applications are simply connected by (25). The connected $H$-space $B^1 cal(B)$ has finitely generated abelian fundamental group, and part (ii) of the same Lemma gives finite generation of its universal-cover homology through degree three. Part (i) now gives finite generation of $H_i \( Omega_0 B^1 cal(B) \)$ for $i lt.eq 2$. Lemma 16 identifies these with the stable homology groups of $F_m$, and Lemma 14 transfers the conclusion to every sufficiently large finite $m$. ◻
]

=== 5.5 Returning to the alternating group on finitely many tracks <returning-to-the-alternating-group-on-finitely-many-tracks>

Only the passage from full-group homology to the multiplier remains. We must control the conjugation action on the whole group $H_2 \( A_m \)$, because a bound on its coinvariants alone would not prove Theorem 12.

#thm([Lemma 5.11.])[
  #emph[For all sufficiently large $m$, stabilization induces a surjection $H_2 \( A_(m - 1) \) arrow.r H_2 \( A_m \)$.]
] <lem:hom-alternating-surjection>

#proof[
  Use the action of $A_m$ on $cal(E)_m$. It is transitive in the bounded range of degrees needed here, by Lemma 4. For the standard $p$-simplex, its stabilizer is
  $ A_m ∩ F_(m - p - 1) = ker #scale(x: 120%, y: 120%)[\(] F_(m - p - 1) arrow.r F_m \/ A_m #scale(x: 120%, y: 120%)[\)] . $
  By Theorem 5, $A_t = \[ F_t \, F_t \]$. The degree-one stability from Lemma 14 identifies $H_1 \( F_(m - p - 1) \) arrow.r H_1 \( F_m \)$ as an isomorphism when $m$ is large and $p$ is bounded. The displayed kernel is therefore exactly $A_(m - p - 1)$.
  The augmented spectral sequence now has $E_(p \, q)^1 = H_q \( A_(m - p - 1) \)$ and augmented column $E_(- 1 \, q)^1 = H_q \( A_m \)$. Its $E_(- 1 \, 2)^2$ is the cokernel of the stabilization map in the statement. Every $A_t$ is perfect, so the row $q = 1$ vanishes; row zero is the exact alternating row of copies of $bb(Z)$. The only possible higher incoming differentials at $\( - 1 \, 2 \)$ have sources $\( 1 \, 1 \)$ for $d^2$ and $\( 2 \, 0 \)$ for $d^3$. They are zero on their respective pages. There is no outgoing differential from column $- 1$. The limiting term vanishes by Lemma 13, so the cokernel is zero. ◻
]

#thm([Lemma 5.12.])[
  #emph[For all sufficiently large finite $m$, conjugation by every element of $F_m$ induces the identity on $H_2 \( A_m \)$.]
] <lem:hom-trivial-action>

#proof[
  Choose one finite integer $b$ such that all the stabilization maps in Lemma 22 are surjective once the target index exceeds $b$. Composition gives
  $ H_2 \( A_b \) arrow.r.twohead H_2 \( A_m \) #h(2em) \( m gt.eq b \) . $
  Let $Y$ be the first $b$ tracks of $m X$, and take $m > 10 b$. For $f in F_m$, the restriction $f \|_Y : Y arrow.r f \( Y \)$ is a piecewise translation between sets of area $b$. Lemma 4 supplies $a in A_m$ that agrees with $f$ on $Y$. For every $h in A_b$, viewed as supported on $Y$, one has the exact equality
  $ f h f^(- 1) = a h a^(- 1) . $
  Conjugation by $a$ is inner in $A_m$ and acts trivially on its homology. The two induced maps agree on the image of $H_2 \( A_b \)$, which is all of $H_2 \( A_m \)$. This proves the claim. The bank $Y$ is fixed independently of both $f$ and the homology class; only the extending element $a$ depends on $f$. ◻
]

#proof[
  Fix a finite $m$ beyond the thresholds in Proposition 21 and Lemma 23. Put $Q = F_m \/ A_m$. Theorem 5 identifies $Q$ with $H_1 \( F_m \)$, so $Q$ is finitely generated abelian. Apply the integral Lyndon–Hochschild–Serre spectral sequence #cite(label("Weibel1994")) 6.8.2, pp. 195–196 to $1 arrow.r A_m arrow.r F_m arrow.r Q arrow.r 1$:
  $ E_(p \, q)^2 = H_p \( Q \; H_q \( A_m \) \) arrow.r.double H_(p + q) \( F_m \) . $
  By Lemma 23, $E_(0 \, 2)^2 = H_2 \( A_m \)$ itself. Perfection gives $H_1 \( A_m \) = 0$, so the possible incoming $d^2$ from $\( 2 \, 1 \)$ vanishes. The only remaining possible incoming differential is
  $ d^3 : E_(3 \, 0)^3 arrow.r E_(0 \, 2)^3 = H_2 \( A_m \) . $
  Its source is a subquotient of $H_3 \( Q \)$ and is finitely generated. Later incoming differentials have negative source row, and none can leave column zero. Consequently
  $ E_(0 \, 2)^oo = H_2 \( A_m \) \/ "im" \( d^3 \) . $
  This limiting term is the bottom filtration subgroup of $H_2 \( F_m \)$, which is finitely generated by Proposition 21. Both $"im" \( d^3 \)$ and the displayed quotient are finitely generated, so $H_2 \( A_m \)$ is finitely generated. All thresholds used in choosing $m$ are fixed finite integers, and the argument applies to every larger finite $m$. ◻
]

== 6 Finite relations and a calculus of conditional permutations <sec:lifting>

The input to this section is the polygon Boolean algebra, its translation action, and the identity $A_m = \[ F_m \, F_m \]$ proved in Theorem 5. We construct a finite presentation mapping onto $A_m$ and establish the algebraic rules used to propagate its relations. At this stage its kernel is not known to be central. The point is to identify precisely which local identities suffice for the geometric argument in Section 7 and the transport argument in Section 8.

Throughout the section an #emph[alphabet] is a subset of the $m$ track indices. A conditional permutation on a Boolean set $U subset.eq X$ permutes the tracks at the points of $U$ and fixes their complement. We call $U$ a #emph[test]. Coordinates of different tracks are aligned unless offsets are explicitly specified. We use $\[ g \, h \] = g h g^(- 1) h^(- 1)$ and write

$ B_m = { d = \( d_1 \, dots.h \, d_m \) in Gamma^m : sum_i d_i = 0 } . $

Its elements are the balanced translations. Since $cal(O) \/ bb(Z)$ is infinite cyclic, $B_m$ is free abelian of rank $2 \( m - 1 \)$.

=== 6.1 Generators and the finite initial choice <generators-and-the-finite-initial-choice>

Let $alpha = tau med mod med 1$. Choose a sufficiently small square $Q$ about the origin in a circular coordinate chart, with side levels in $cal(O)$. Our initial finite collection $cal(U)_0$ consists of $X$, the two coordinate interval tests with endpoints $0 \, alpha$, and the two tests

$ Q ∩ { y - lambda x > 0 } \, #h(2em) Q ∩ { x - lambda y > 0 } . $

Boundary conventions make no difference in the Boolean algebra. Complements are generated using the constant permutations, so they need not be additional basic tests.

For $U in cal(U)_0$ and every even permutation $sigma$ supported on at most five tracks, include a generator $c_(U \, sigma)$. Include also the balanced translations

#[#set math.equation(numbering: n => "(36)")
 $ t_(i \, r) = t \( epsilon_r e_i - epsilon_r e_m \) \, #h(2em) i < m \, quad r = 1 \, 2 \, #h(2em) epsilon_1 = \( alpha \, 0 \) \, quad epsilon_2 = \( 0 \, alpha \) . $ <eq:lifting-generators>]

Here $e_i$ designates a track, and the notation $t \( d \)$ denotes the corresponding piecewise translation. This is a finite list, denoted by $S_m$. The conditional permutations belong to $A_m$. The balanced translations do as well: if $i \, j \, k \, h$ are distinct, $v in Gamma$, and $sigma = \( i med j med k \)$, then in $F_m$

#[#set math.equation(numbering: n => "(37)")
 $ \[ sigma \, t \( v e_i - v e_h \) \] = t \( v e_j - v e_i \) . $ <eq:translation-commutator>]

The right side is a commutator in $F_m$, and these differences generate $B_m$.

#thm([Lemma 6.1.])[
  #emph[For sufficiently large finite $m$, the list $S_m$ generates $A_m$. Every polygonal test on a proper alphabet of at least five tracks is generated, in projection to $A_m$, using conditional permutations on translated basic tests on that alphabet and balanced translations.]
] <lem:lifting-generation>

#proof[
  First consider the Boolean algebra. Translate the coordinate interval test by $i alpha$, with $i$ in an integer interval. The endpoints of these tests form a connected path in the orbit-index graph: each test joins $i alpha$ to $\( i + 1 \) alpha$. Two different complementary arcs of the resulting endpoint set have different test assignments. Indeed, an arc between points with identical assignments contains either both endpoints of every such edge or neither; connectedness then says it contains all endpoints or none. The two points therefore belong to the same complementary arc. Enlarging the index interval consequently produces every circular interval whose endpoints lie in $cal(O) \/ bb(Z)$. The two coordinate families generate the rectangular Boolean algebra.
  Every allowed inclined line is a translate of its line through the origin. The allowable tangent translations are dense along the line by Lemma 2. Translated copies of $Q$ therefore cover each relevant compact segment of that line. In each of finitely many such charts the translated basic sign test gives its side decision; rectangular tests clip the decision to the chart. A finite cover of the finitely many edges in a polygonal description proves that all polygonal tests are Boolean combinations of translates of $cal(U)_0$.
  Fix an alphabet $I$ with $\| I \| gt.eq 5$. The group $"Alt" \( I \)$ is perfect. For completeness, it is generated by $3$-cycles, and the commutator of two $3$-cycles meeting in one letter is a $3$-cycle. Conjugating this identity gives all the generators. If copies of this group on $U$ and $V$ are available in $A_m$, then
  $ \[ g upright(" on ") U \, h upright(" on ") V \] = \[ g \, h \] upright(" on ") U ∩ V . $
  Perfection gives every conditional permutation on $U ∩ V$. The product of the constant $g$ and the inverse of $g$ on $U$ gives $g$ on $U^c$. This constructs all Boolean combinations in projection. A common translation on $I$ can be balanced on one track outside $I$. Hence it constructs all translated tests as well.
  An alternating permutation of slots is a product of permutations of three slots. Subdivide their common parameter piece if necessary and add two spare slots, so that each such permutation lies in an alternating group on five slots. When their tracks are distinct, a balanced translation aligns the five offsets; the conditional group on the parameter piece is already available. If tracks repeat, move each slot to a private track using a conditional $3$-cycle with two private auxiliary tracks. These operations do not interfere on a repeated original track because the slots there are disjoint. After this routing the preceding distinct-track construction applies, and conjugating back gives the original slot permutation. Five slots require only finitely many private tracks. Processing each generator and each subdivision piece separately proves the assertion for one fixed sufficiently large $m$. ◻
]

We describe carefully how finite relations will be chosen. If $cal(V)$ is any fixed finite list of polygonal tests and $I$ is a fixed proper alphabet, its pointwise conditional group is finite: it is

#[#set math.equation(numbering: n => "(38)")
 $ C_(cal(V) \, I) = product_(P in "At" \( cal(V) \)) "Alt" \( I \) \, $ <eq:pointwise-table>]

where $"At" \( cal(V) \)$ consists of the nonzero Boolean atoms. By Lemma 24, choose a word $w_g$ representing each $g$ in this finite group. Choose it as a product of conditional permutations on translated basic tests on $I$; the translations in these expressions are balanced outside $I$. Expanding gives a finite word on the original generators. Impose the finitely many true relations

#[#set math.equation(numbering: n => "(39)")
 $ w_1 = 1 \, #h(2em) w_g w_h = w_(g h) \, $ <eq:table-relations>]

and identify each specified input conditional permutation with its chosen representative. The resulting copy of the table is exact: the table relations give a homomorphism, and projection to $A_m$ is its left inverse. Several chosen descriptions of the same bounded configuration can also be identified by finitely many true relations.

Here and below #emph[bounded data] means data belonging to one fixed finite list before any propagation or arbitrary word is considered. There is no assertion that tests of arbitrarily large labels already have their tables. The initial list of required relations comprises:

+ the joint conditional alternating-group tables for $cal(U)_0$, their compatibility on subalphabets, disjoint-alphabet commutation, and their covariance under constant alternating track permutations;
+ commutation of the $t_(i \, r)$, giving the additive homomorphism $t : B_m arrow.r hat(G)$, and constant-permutation covariance $c_(X \, sigma) t \( d \) c_(X \, sigma)^(- 1) = t \( sigma d \)$, checked on the finite bases;
+ commutation of a basic conditional copy with translations vanishing on its alphabet, checked on a basis of those translations, and invariance of a coordinate test under translations in the other coordinate;
+ the finite tables, with their specified overlap identities, for the geometric configurations described below, on all alphabets needed for the support and conditional-move arguments;
+ the identities (37) for the basis differences in (36).

All these relations hold in $A_m$.

The finite geometric menu in (iv), including its initial coordinate window, is specified in Section 7. That section orders the choices and proves that common translates of this fixed menu suffice at every later stage. Each of its regions has a finite expression in translated basic tests by Lemma 24, so the table construction above applies. The menu is fixed before any propagation or later word is considered; the algebraic rules below apply to any such finite choice.

For the resulting fixed $m$ and menu, every relation above is a finite word on $S_m$. If $L$ is their maximum length, one possible single presentation is

#[#set math.equation(numbering: n => "(40)")
 $ hat(G) = chevron.l S_m divides R_L chevron.r \, #h(2em) R_L = { w : \| w \| lt.eq L \, med w = 1 upright(" in ") A_m } . $ <eq:finite-presented-cover>]

The set $R_L$ is finite and consists of true relations. Its use is existential; no decision procedure for membership in $R_L$ is needed. Lemma 24 supplies the epimorphism $pi : hat(G) arrow.r.twohead A_m$.

=== 6.2 Perfect covers and the meaning of a central law <perfect-covers-and-the-meaning-of-a-central-law>

The exact initial tables will eventually yield relations only up to central elements. Perfect covers make their conditional factors unambiguous even in this situation.

#thm([Lemma 6.2.])[
  #emph[Every perfect group $E$ has a canonical perfect central extension $E^(*) arrow.r.twohead E$. It is functorial in $E$. A map from $E$ into the quotient of any central extension has a unique lift from $E^(*)$. Moreover:]
  + #emph[two homomorphisms from a perfect group into a central extension that induce the same quotient map are equal;]
  + #emph[if two perfect subgroups commute modulo a central subgroup, they commute exactly;]
  + #emph[a perfect group $H$ has centerless quotient $H \/ Z \( H \)$.]
] <lem:perfect-covers>

#proof[
  Take a free presentation $E = P \/ R$ and put
  $ E^(*) = \[ P \, P \] \/ \[ P \, R \] . $
  Its map to $E$ is surjective because $E$ is perfect, and its kernel is central. In $P \/ \[ P \, R \]$, the image of $R$ is central and every element is a product of an element of the derived group and an element of that image. Taking commutators twice therefore shows that the derived group is perfect. This proves perfection of $E^(*)$. Given a central lifting problem, choose free lifts of the generators of $P$. They kill $\[ P \, R \]$, so their restriction to $\[ P \, P \]$ descends to the required homomorphism. Changing the free lifts multiplies them by central elements and hence does not change this restriction. Applying (a) to two lifts from the perfect group $E^(*)$ proves uniqueness. This gives independence of presentation and functoriality.
  For (a), the pointwise ratio of the two homomorphisms has central values and is consequently a homomorphism to an abelian group; it vanishes on a perfect group. For (b), when the relevant commutators are central, commutation with a fixed element is a homomorphism on the other subgroup. Perfection makes it trivial. Finally, if the image of $h in H$ is central in $H \/ Z \( H \)$, then $x mapsto \[ h \, x \]$ has central values and is a homomorphism. It is trivial because $H$ is perfect, so $h in Z \( H \)$, proving (c). ◻
]

This is the universal central-extension construction; compare #cite(label("Weibel1994")) Construction 6.9.3 and Theorem 6.9.5. We retain the construction here because its uniqueness is used repeatedly.

Fix tests $U_1 \, dots.h \, U_r$, an alphabet $I$ with $\| I \| gt.eq 5$, and a set $Omega subset.eq { 0 \, 1 }^r$ of allowed assignments. Initially $Omega$ may contain assignments not realized in $X$. It must contain every actual assignment, and we retain any exclusions already established for a subfamily. The #emph[assignment group] is

$ C_(Omega \, I) = product_(omega in Omega) "Alt" \( I \) . $

A permutation conditional on $U_j$ evaluates as that permutation in the factors with $omega_j = 1$ and as the identity elsewhere. The constant group evaluates diagonally. These groups generate $C_(Omega \, I)$: commutators construct intersections, complements follow using the diagonal, and perfection gives every factor.

Let $H$ be the subgroup of $hat(G)$ generated by the specified conditional copies. They may be exact copies of $"Alt" \( I \)$ or images of $"Alt" \( I \)^(*)$ already obtained. We say they have the #emph[central law for $Omega$] if every word that evaluates to $1$ in $C_(Omega \, I)$ belongs to $Z \( H \)$. When star groups are used, evaluation means evaluation of their underlying alternating permutations. Equivalently, the specified generator maps induce a surjection

#[#set math.equation(numbering: n => "(41)")
 $ C_(Omega \, I) arrow.r H \/ Z \( H \) . $ <eq:central-law-map>]

This definition does not presume a map from $H$ to the formal assignment group. In particular it remains meaningful before unrealizable assignments have been removed.

Applying Lemma 25 to (41) gives a canonical representation

#[#set math.equation(numbering: n => "(42)")
 $ rho_(P \, I) : "Alt" \( I \)^(*) arrow.r H subset.eq hat(G) $ <eq:sector-representation>]

for every sector $P$, and for every union of sectors. A formal sector is designated by its assignment, even if its geometric intersection is empty; its representation need not yet vanish. When the assignments are actual, $P$ denotes the corresponding Boolean region.

The images for disjoint sectors commute, and if $P$ is a disjoint union of sectors $P_a$, then

#[#set math.equation(numbering: n => "(43)")
 $ rho_(P \, I) \( s \) = product_a rho_(P_a \, I) \( s \) \, #h(2em) s in "Alt" \( I \)^(*) . $ <eq:canonical-splitting>]

Indeed the factors commute by Lemma 25(b), and the two homomorphisms in (43) have the same map to $H \/ Z \( H \)$, so (a) applies. These images generate $H$: their product $H_0$ maps onto $H \/ Z \( H \)$, whence $H = H_0 Z \( H \)$, and perfection of $H$ gives $H = H_0$. The same uniqueness proves compatibility with refinement and restriction to a subalphabet within this lawful family, and with any previously specified perfect copy in that family. An excluded factor is trivial because its perfect image is central.

Later we shall enlarge a lawful family and exclude some assignments that were previously allowed. The centers of the two generated groups need not agree, so this comparison requires a separate argument.

#thm([Lemma 6.3.])[
  (Compatibility under enlargement).  #emph[Fix an alphabet $I$ with $\| I \| gt.eq 5$. Suppose a finite test family $cal(T)_0$ is contained in a finite family $cal(T)_1$, with literally the same specified input copies on the old tests, including the constant copy. Let $H_0 lt.eq K$ be their generated subgroups. Suppose they have central laws for assignment sets $Omega_0$ and $Omega_1$, respectively, and restriction of assignments gives a map $r : Omega_1 arrow.r Omega_0$. Then their canonical representations satisfy 
$ rho_(omega \, I)^(thin 0) \( s \) = product_(omega' in Omega_1\
r \( omega' \) = omega) rho_(omega' \, I)^(thin 1) \( s \) \, #h(2em) omega in Omega_0 \, quad s in "Alt" \( I \)^(*) . $

 The factors on the right commute. An old assignment with no extension has trivial original representation.]
] <lem:law-enlargement>

#proof[
  Put $C_0 = C_(Omega_0 \, I)$ and $C_1 = C_(Omega_1 \, I)$. Restriction induces $d : C_0 arrow.r C_1$: an old factor is repeated on all assignments extending it, and is killed if there are none. Write $Lambda : C_0^(*) arrow.r H_0$ for the old canonical perfect-cover map, $p : C_0^(*) arrow.r C_0$ for its cover projection, and $q : K arrow.r K \/ Z \( K \)$. The new law gives $theta : C_1 arrow.r K \/ Z \( K \)$.
  The homomorphisms $q Lambda$ and $theta d p$ agree on the canonical lifts of every defining old input copy: those inputs are the same elements of $H_0$ and $K$. These lifts generate $C_0^(*)$. Indeed, their generated subgroup $M$ surjects onto $C_0$, because the defining conditional groups generate the assignment group. Thus $C_0^(*) = M ker p$; centrality of $ker p$ and perfection give $C_0^(*) = \[ M \, M \] lt.eq M$. Consequently
  $ q Lambda = theta d p . $
  For an old assignment with no extension, this equality puts its original perfect image in $Z \( K \)$, so that image is trivial. Otherwise it identifies the quotient maps of its old representation and the product of its extending new representations. The new factors commute, so their product is a homomorphism from $"Alt" \( I \)^(*)$. Uniqueness of lifts from a perfect source into $K arrow.r K \/ Z \( K \)$ identifies the two homomorphisms exactly. No inclusion $Z \( H_0 \) subset.eq Z \( K \)$ is needed. ◻
]

We will also use that $"Alt" \( I \)^(*)$ is generated by the images of $"Alt" \( J \)^(*)$ for five-element $J subset.eq I$. Those images generate a subgroup surjecting onto $"Alt" \( I \)$. It is invariant under conjugation, by functoriality and uniqueness; its product with the central kernel is all of $"Alt" \( I \)^(*)$. Perfection then gives the assertion. Thus every centrality or covariance test for a canonical representation can be made one five-track copy at a time.

=== 6.3 The four algebraic rules <the-four-algebraic-rules>

The following rules separate finite track bookkeeping from the geometric propagation. In particular, the length of a Boolean expression never measures the number of tracks it requires.

#thm([Lemma 6.4.])[
  (Small-support presentations).  #emph[There is an absolute integer $q$ with the following property. Suppose conditional perfect copies are specified coherently on the subalphabets of a finite track set, with a common assignment model $Omega$. If the central law holds on every alphabet of at most $q$ tracks, then it holds on the entire track set. It suffices to take $q = 15$ for this implication. Additional tracks used to prove its hypotheses are a separate fixed reserve. The conclusion concerns the subgroup generated by the indicated test family, not translations or other predicates outside that family.]
] <lem:small-support>

#proof[
  We give the support count, since it prevents reserves from growing under repeated refinement. Present $"Sym" \( I \)$ by transpositions $t_(a b)$, imposing their involution relations, disjoint commutation, and the conjugation relations
  $ t_(a b) t_(b c) t_(a b) = t_(a c) quad \( a \, b \, c upright(" distinct") \) . $
  These relations present the symmetric group: adjacent transpositions satisfy the usual braid and distant commutation relations, whose normal form moves the final letter to its prescribed position and then proceeds inductively; conversely the displayed relations express every transposition in adjacent ones. Each defining relation involves at most four letters.
  Fix a five-letter reserve $E subset.eq I$ and a transposition $a$ on two of its letters. Reidemeister–Schreier rewriting for the parity subgroup, with coset representatives $1 \, a$, gives generators $a t_(b c)$ and their inverses. Each is an even permutation on at most four letters. To see the support bound directly, insert the running representative, $1$ or $a$, between successive letters of a symmetric relator. The rewritten relations use only the original at most four letters and the two letters of $a$. Explicitly, using the equivalent symmetric relations $x_t x_s x_t = x_(t s t)$ indexed by transpositions, the rewritten presentation with $u_t = a t$ is
  $ u_a = 1 \, #h(2em) u_t^(- 1) u_s u_t^(- 1) u_(t s t) = 1 \, #h(2em) u_t u_s^(- 1) u_t u_(t s t)^(- 1) = 1 quad \( s \, t upright(" transpositions") \) . $
  The involution relations rewrite to cancellations. This also proves the subgroup presentation: insert the running representatives in a product of conjugates of symmetric relators representing a null word. No letter outside those in the relator and $a$ is introduced.
  For each $omega in Omega$, realize its conditional copy of $a t_(b c)$ by a word in the test copies on $E union { b \, c }$, an alphabet of size at most seven. Such a word exists by the intersection-and-complement argument preceding (41); its length can depend on $Omega$. Use the rewritten alternating presentation on each assignment, and cross commutators between distinct assignments. Every relator so lifted involves at most the five reserve letters and four other letters, hence at most nine tracks.
  An original generator on five tracks can be compared with the product of its assignment generators on the union of those tracks with $E$, of size at most ten. Include all these comparisons and the internal relations of the input perfect copies. The resulting relations present the assignment group: after the comparisons every input is expressed by assignment generators, and the preceding product presentation then applies. Equivalently, the kernel of evaluation from the free group on the specified input symbols is normally generated by null words supported on at most ten tracks. This argument also applies to star inputs: their internal words evaluate through the underlying alternating permutations, and remain supported on the same five tracks.
  Let $r$ be any one of these small null words and let $g$ belong to an original five-track perfect copy. Their combined alphabet has at most fifteen tracks. The central law there says $\[ r \, g \] = 1$. Thus every normal generator of the evaluation kernel is central in the full subgroup $H$. All its conjugates are therefore central, giving the global central law. For $\| I \| < 5$ one embeds in a five-letter alphabet; for $5 lt.eq \| I \| lt.eq 15$ the conclusion is already among the hypotheses. The proof never requires more tracks for longer atom words or for more assignments. ◻
]

This argument explains a convention used henceforth. Laws are proved simultaneously for small alphabets, including one extra five-track input whenever centrality is tested, and are then extended by Lemma 27. A central error in one small subgroup has not been declared central in a larger one without this additional test.

#thm([Lemma 6.5.])[
  (Translated primitives).  #emph[Let $U$ be a basic test and let $I$ be a proper alphabet. For $u in Gamma$, choose $d in B_m$ with $d_i = u$ for $i in I$. Then 
#[#set math.equation(numbering: n => "(44)")
 $ rho_(U + u \, I) \( s \) = t \( d \) rho_(U \, I) \( s \) t \( d \)^(- 1) $ <eq:translated-copy>]

 is independent of the balancing values off $I$. The same assertion holds for words and canonical perfect factors obtained from a lawful family on $I$. It has the following consequences.]
  + #emph[Conditional copies on disjoint small alphabets commute exactly, even when their tests have different translation offsets. Products of such translated input copies inherit this property.]
  + #emph[Translating all tests in a fixed finite table by a common $u$ preserves its exact law on a proper alphabet. Thus finite relations for bounded offsets give laws for those offsets relative to any common shift.]
  + #emph[A translation whose coordinates vanish on $I$ commutes with all such aligned words and perfect factors on $I$. Coordinate predicates are unchanged by a shift in the other coordinate.]
] <lem:translated-copies>

#proof[
  Two choices of $d$ differ by a balanced translation zero on $I$. The relations (ii)–(iii), first on a basis and then by additivity, make this difference commute with the basic copy. Since all translations commute, the same is true of any translate, then of every word on those translated copies. Canonical factors are represented by such words, so the assertion includes them.
  For disjoint alphabets $I \, J$, choose one balanced vector that equals $u$ on $I$ and $v$ on $J$, compensating on a track outside their union. Both translated groups are conjugates by this single vector of their unshifted groups, which commute by the finite initial tables. Balance independence identifies them with any other chosen descriptions. Conjugating a word or a table proves (b); uniqueness of perfect lifts identifies the conjugated canonical factors with those for the translated family. The preceding commutation proves (c). The last statement in (c) follows from its imposed generating-shift instances and additivity. ◻
]

An #emph[aligned word on $I$] will mean a word in these translated conditional copies whose indicated track supports are contained in $I$. The balancing words in the original finite generators may mention other tracks. Lemma 28 shows that this does not enlarge the support used in the disjoint-commutation rule. A newly obtained canonical factor on $I$ belongs to the subgroup of aligned words on $I$.

For example, an arbitrary translate of an $x$-coordinate basic test and an arbitrary translate of a $y$-coordinate basic test have their joint law: translate the fixed two-test table by the vector having the prescribed $x$ and $y$ coordinates, and use transverse invariance. This observation starts the rectangular propagation without requiring unbounded initial tables.

We next formalize containment. Let $J$ be a test with specified conditional representations on the relevant alphabets. A family of perfect fragments $rho_(P \, I)$ is #emph[controlled inside $J$] if conjugation by a conditional alternating permutation on $J$ agrees on those fragments with conjugation by the corresponding constant track permutation. The definition is tested on small alphabets and their common enlargements. Constant conjugation reindexes a fragment’s alphabet; this equivariance follows from the initial relations and the uniqueness in Lemma 25. The label $P$ can still be a formal sector. Thus control is an identity about representations, not just a containment after applying $pi$.

#thm([Lemma 6.6.])[
  (Control by containers).  #emph[Assume the relevant small-alphabet laws and the exact disjoint-alphabet commutation of Lemma 28. Assume also that each individual comparison leaves a fresh five-track bank and two parity-correction letters outside the alphabets involved, and one further track for balancing translations.]
  + #emph[If the allowed assignments of a central law imply $P subset.eq J$, they give control inside $J$; disjointness in that assignment model gives commuting perfect representations. In particular, geometric inclusion and disjointness suffice in an actual central law.]
  + #emph[If a fragment is controlled inside $J$ and an aligned word $u$ centralizes the conditional perfect copies on $J$ on the enlarged alphabets used below, then $u$ centralizes that fragment.]
  + #emph[Control is transitive. More generally, if two aligned words have the same conjugation action on the conditional copies on $J$, they have the same action on every fragment controlled inside $J$.]
  + #emph[If $J \, K$ have a joint central law and a fragment is controlled inside each, it is controlled inside $J ∩ K$. Fragments controlled on disjoint sides of a lawful decomposition commute, even if those fragments do not yet have a joint law with one another.]
] <lem:control>

#proof[
  Part (a) follows from the commuting sector factors and (43). A formal predicate side over an actual rectangular cell satisfies this hypothesis for that cell and its known rectangular containers: those implications already hold in the retained rectangular coordinates of the assignment model. Geometric emptiness of the formal predicate side alone is not sufficient. For (b), test one perfect copy on an alphabet $I$ of five tracks. Choose a fresh alphabet $I'$ disjoint from the track support of $u$ and an even permutation $sigma$ carrying $I$ onto $I'$. If necessary, two further unused letters correct its parity. Let $v$ be a lift of this permutation conditional on $J$, on the union of the relevant alphabets. By hypothesis $\[ u \, v \] = 1$. Control gives
  $ v rho_(P \, I) \( s \) v^(- 1) = rho_(P \, I') \( sigma_(*) s \) \, $
  where $sigma_(*)$ is induced reindexing of the star group. The right side commutes with $u$ by disjoint-alphabet commutation. Therefore
  #[#set math.equation(numbering: n => "(45)")
   $ \[ u \, rho_(P \, I) \( s \) \] = v^(- 1) \[ u \, v rho_(P \, I) \( s \) v^(- 1) \] v = 1 . $ <eq:conditional-move>]
  Only this one fragment is moved at a time.
  Apply (b) to the ratio of two words to obtain the comparison assertion in (c). To obtain transitivity, suppose $P$ is controlled inside $J$ and $J$ inside $K$. The ratio of a $K$-conditional permutation and its constant counterpart centralizes the $J$ copies; hence it centralizes $P$ by (b).
  For intersection control, write the four commuting factors of the joint $J \, K$ law as
  $ A = J ∩ K \, quad B = J ∩ K^c \, quad C = J^c ∩ K \, quad D = J^c ∩ K^c . $
  Use the same star source on an alphabet large enough for the test under consideration, and abbreviate its representations by $a \, b \, c \, d$. Control inside $J$ says that every $c \( s \) d \( s \)$ centralizes the fragment; control inside $K$ says that every $b \( t \) d \( t \)$ does. Taking commutators gives
  $ \[ c \( s \) d \( s \) \, b \( t \) d \( t \) \] = \[ d \( s \) \, d \( t \) \] . $
  The image of $d$ is perfect, so it centralizes the fragment. It follows that $b$ and $c$ do too. The $a$ factor therefore has the same action as $a b c d$, the constant permutation. This proves control inside $J ∩ K$ without a joint law involving the fragment.
  Finally, suppose one fragment is controlled on a side $J$ and another on $J^c$. Move the first to fresh tracks by a $J$-conditional permutation. This fixes the second by its own control and the $J \, J^c$ decomposition. The moved fragments commute by disjoint alphabets; conjugation back proves the assertion. Iterating handles disjoint unions of sectors. ◻
]

Here is the container comparison used later for overlapping charts. Suppose $U \, V \, J$ have a joint actual central law and $U ∩ J = V ∩ J$. For a fixed $s in "Alt" \( I \)^(*)$, the element $u = rho_(V \, I) \( s \)^(- 1) rho_(U \, I) \( s \)$ centralizes the conditional perfect copies on $J$, by their commuting sector decomposition on the required enlarged alphabets. If a fragment $rho_(P \, I')$ is controlled inside $J$, the lemma gives

$ "Ad" \( rho_(U \, I) \( s \) \) \|_(rho_(P \, I') \( "Alt" \( I' \)^(*) \)) = "Ad" \( rho_(V \, I) \( s \) \) \|_(rho_(P \, I') \( "Alt" \( I' \)^(*) \)) . $

The fragment need not have a joint law with $U \, V$ and may still be formal. The proof moves its five-track factors within $J$ to unused tracks, where disjoint-alphabet commutation is available, and then moves them back. Thus the known agreement on $J$ yields an equality of actions on the fragment, beyond an equality of projected supports.

#thm([Lemma 6.7.])[
  (Pair laws and simultaneous refinement).  #emph[Suppose a finite collection of partitions has a central law for each individual partition and each pair, coherently on subalphabets, and conditional copies on disjoint alphabets commute exactly. Assume the spare tracks specified in Lemma 29 are available for the individual comparisons. Then the whole collection has the central law for formal assignments, with all exclusions already known in any lawful subfamily retained. Its canonical representations refine all the pairwise decompositions simultaneously.]
] <lem:pair-laws>

#proof[
  It suffices first to work on an alphabet with fixed spare tracks and then apply Lemma 27. Let $H$ be generated by the conditional perfect groups. Choose a union $J$ of atoms of one partition. Each input copy has a separate joint law with $J \, J^c$ and therefore an exact decomposition into its $J$ and $J^c$ factors. Let $H_J$ and $H_(J^c)$ be generated by all those respective factors. They are perfect and generate $H$.
  They commute. To check this, take a five-track factor from each side. A permutation conditional on $J$ moves the first factor to fresh tracks, by its own pair law, and fixes the second, by the latter’s pair law. Their resulting disjoint alphabets commute. This calculation uses neither a triple law nor the desired simultaneous refinement. Thus
  $ H = H_J H_(J^c) \, #h(2em) \[ H_J \, H_(J^c) \] = 1 . $
  The images in $H \/ Z \( H \)$ form a direct product: an element in their intersection commutes with both images and hence is central in $H \/ Z \( H \)$, whose center is trivial by Lemma 25(c).
  We recall why different direct decompositions of a centerless group refine one another. Write $Q = A times B = C times D$. For $a in A$, its $C$ and $D$ components separately commute with $B$, since they do so after projecting the equality $\[ a \, B \] = 1$ into the two factors. The centralizer of $B$ in $A times B$ is $A$, because $B$ is centerless. Thus each component of $a$ belongs to $A$. The same applies to $B$, so the two decompositions refine into their four intersections. Repeat this argument for the finitely many partition decompositions.
  In every resulting factor $Q_omega$ of $H \/ Z \( H \)$ an input conditional permutation is the constant permutation if its assigned predicate is true, and the identity otherwise. The factor is generated by these images, so it is a quotient of the constant $"Alt" \( I \)$. For star inputs their central kernels vanish in this factor: their pair law with each input group makes those kernels central in $H$. The diagonal constant source is an exact alternating group by the initial tables. Consequently the simultaneous decomposition supplies the surjection $C_(Omega \, I) arrow.r.twohead H \/ Z \( H \)$, proving the formal central law.
  We verify separately that earlier exclusions survive. Suppose the restriction of $omega$ to a subfamily $cal(T)$ is already forbidden. The usual commutator and complement words select that assignment in the formal model of $cal(T)$, with any prescribed alternating permutation as value there. In the already known law for $cal(T)$ these words evaluate to identity, so their images are central in $H_(cal(T))$. In $Q_omega$, however, they give every image of the constant alternating group. The image of $H_(cal(T))$ is the whole of $Q_omega$, since it includes that constant group. It follows that $Q_omega$ is abelian. It is also perfect, as a quotient of $"Alt" \( I \)$, and is therefore trivial. This removes the forbidden assignment without assuming that a center of a subfamily is central in all of $H$.
  Finally, each new assignment restricts to an allowed assignment of every old lawful subfamily, by the exclusions just proved. The input copies in these subfamilies are the same copies generating $H$. Lemma 26 therefore identifies their canonical perfect factors with the corresponding products of new factors, including their unions. Applying Lemma 27 proves the asserted law on the full alphabet. ◻
]

=== 6.4 Patching actions on a rectangular partition <patching-actions-on-a-rectangular-partition>

The remaining algebraic issue is local verification of a relation when different predicates have only separate decompositions over the same rectangles. The subgroup defined next is deliberately formed before assuming any joint law among those predicates.

Let $cal(P)$ be a finite rectangular partition, with its actual central law. Suppose each input predicate $U_j$ separately has a joint law with $cal(P)$. The latter laws may allow both formal choices of $U_j$ over a cell. For $P in cal(P)$, define $H_P$ to be the subgroup generated by all restricted perfect copies over $P$: the $U_j ∩ P$ and $U_j^c ∩ P$ factors for every $j$, including their small subalphabet copies. Each of these factors is controlled inside the genuine rectangle $P$, even when its predicate side is formal. Write $H$ for the subgroup generated by the original input copies.

#thm([Lemma 6.8.])[
  (Invariant cell groups and patching).  #emph[In the preceding situation, with the spare tracks of Lemma 29 available for each individual comparison, the groups $H_P$ commute for distinct cells, generate a subgroup containing $H$, and are preserved by every original conditional generator. To prove that a word $w$ in those generators is central in $H$, it suffices to prove that it acts trivially on each $H_P$. The following verification is sufficient: for every letter of $w$ choose a replacement whose conjugation action on $H_P$ is the same; require that the replacement word acts trivially on $H_P$.]
  #emph[Equality of the actions can be established by a chain of container comparisons from Lemma 29. In particular, a relator central in a lawful template group acts trivially on $H_P$ if the template contains a controlling container $J$ for $H_P$ and its central law is available on the enlarged alphabets needed for the conditional move. This remains true when the individual $U_j$-sides over $P$ are only formal.]
] <lem:patching>

#proof[
  For different cells, take one generating perfect copy in each. A permutation conditional on the first cell moves that copy to fresh letters and fixes the other one, using their separate laws with $cal(P)$. Disjoint-alphabet commutation and conjugation back show that $H_P$ and $H_(P')$ commute. The exact splittings of the original copies show that the subgroup generated by the $H_P$ contains $H$.
  Fix an original generator $p \( s \)$ and one cell $P$. Its own separate law with $cal(P)$ gives
  #[#set math.equation(numbering: n => "(46)")
   $ p \( s \) = p_P \( s \) p_(P^c) \( s \) \, #h(2em) p_P \( s \) in H_P . $ <eq:cell-invariance-split>]
  For a generating five-track fragment $a_P$ of $H_P$, move its letters off the support of $p_(P^c) \( s \)$ by a permutation conditional on $P$. This is the ordinary reindexing on $a_P$, by $a_P$’s own $P$-law, and fixes $p_(P^c) \( s \)$, by $p$’s own $P$-law. Disjoint-alphabet commutation gives
  #[#set math.equation(numbering: n => "(47)")
   $ \[ p_(P^c) \( s \) \, a_P \] = 1 . $ <eq:cell-complement-commutes>]
  Thus $p$ acts on $H_P$ by its factor $p_P \( s \)$, an inner automorphism of $H_P$. This proves invariance using only two separate rectangular laws; no law relating the predicates of $p$ and $a_P$ was used.
  All original conjugations can now be composed as automorphisms of the same $H_P$. A replacement with the same action also preserves $H_P$. Equality of their individual actions therefore implies equality of the actions of the two words. If the replacement word acts trivially, then $w$ centralizes $H_P$. Doing this for every cell proves that $w$ centralizes the group they generate, and therefore $H$.
  For clarity, consider one container comparison. Let $u$ be the ratio of two proposed replacements, and suppose their known joint law says that $u$ centralizes every conditional perfect copy on $J$. The fragment $a_P$ is controlled inside $P$, and actual rectangular containment and Lemma 29 make it controlled inside $J$. Equation (45) gives $\[ u \, a_P \] = 1$. Intersections of controlling rectangles are permitted by the intersection part of that lemma, so the argument includes clipped containers.
  Finally let $r$ be a central relator in a template containing $J$. The central-law assertion is applied on the union of the alphabet of $r$, that of the particular fragment $a_P$, and a fresh bank for the move. In that template group $r$ commutes with the $J$-conditional mover. After the move, $a_P$ has disjoint alphabet from $r$, so they commute exactly; conjugating back proves $\[ r \, a_P \] = 1$. This applies one generator of $H_P$ at a time. It does not require $H_P$ to belong to the template group. Nor does it promote centrality in a smaller subgroup without testing the additional letters. The proof therefore also applies to formal wrong-side fragments, whose actual rectangular control was available from the start. ◻
]

We finish by collecting the finite-reserve implication. The support presentation uses a fixed reserve of five letters and one extra five-track test. A conditional move compares two such supports and uses a fresh copy of one of them, with at most two parity-correction letters. Translation balancing uses one further track whenever the indicated alphabet is proper. The later transport argument compares only a fixed number of five-slot routings at a time. Each of these is a fixed finite operation, so the maximum of their track requirements, together with the homology stability threshold, is finite. Choose $m$ once larger than this maximum. A large number of atoms, a long slide, successive refinements, and a long word are processed one comparison at a time and do not change $m$ or the initial relation list.

We have obtained all the algebraic rules needed for propagation. To complete the construction it remains to show that the fixed geometric tables force central laws for arbitrary polygonal tests; this is the task of the next section. The distinction maintained here will be essential there: a formal sector can already have exact rectangular control, while its vanishing is still to be proved from geometric containment.

== 7 Propagation of the polygon laws <sec:propagation>

We use the presented group $hat(G)$ and the lifting calculus of Section 6. The input consists of the true tables for a #emph[finite] collection of geometric configurations, together with their common translates. Our goal is the actual central law for every finite family of polygon tests. We first propagate the coordinate laws by an induction on the range of their integer labels. We then use these coordinate laws to compare sloping decisions on arbitrarily small rectangular cells. In both arguments, comparisons take place in $hat(G)$ itself.

We retain the notation $rho_(P \, I) : "Alt" \( I \)^(*) arrow.r hat(G)$ for a canonical perfect copy on a region $P$ and alphabet $I$. When $P$ denotes a formal sector, its rectangular coordinate will always be specified. Saying that this copy is #emph[controlled in] a rectangle $J$ has the meaning of Lemma 29: permutations conditional on $J$ act on the copy as their unconditional counterparts do. In particular, this is an assertion about conjugations in $hat(G)$, not just a containment of projected supports.

=== 7.1 The fixed geometric data <the-fixed-geometric-data>

Write $T = bb(R)^2 \/ bb(Z)^2$ for the ordinary coordinate torus used to discuss local geometry. For $z = p + q tau in cal(O)$, put

$ nu \( z \) = q = frac(z - macron(z), sqrt(5)) . $

The function $nu$ is unchanged by adding an integer, so it also labels an endpoint in $cal(O) \/ bb(Z)$. Let $c \, C > 0$ be the separation and mesh constants of Lemma 2. We use the choice

#[#set math.equation(numbering: n => "(48)")
 $ lambda c > 1000 \( C + 1 \) \, #h(2em) \| macron(lambda) \| < 10^(- 3) . $ <eq:prop-slope-choice>]

All constants below may depend on this fixed $lambda$.

Here is the finite geometric information required from the initial tables. A #emph[chart] consists of a small rectangle with sides at $cal(O)$ levels, one allowable line crossing it, and its two sign regions inside the rectangle. The sign regions are false outside the rectangle. Include the rectangle and its coordinate quadrants in its table. Choose an inner rectangle strictly inside the chart, leaving a positive ordinary margin. We use finitely many such sizes, with nested inner rectangles where a comparison needs a smaller margin. Denote by $delta > 0$ a lower bound on the margins used for comparisons in the coordinate induction.

For a line of slope $lambda$, its allowable tangent translations are

$ { \( u \, lambda u \) : u in cal(O) } . $

Choose a $bb(Z)$-basis $\( eta \, lambda eta \)$, $\( tau eta \, lambda tau eta \)$ with $eta = tau^(- b)$ so small in ordinary norm that each step is less than $delta \/ 100$. Include the joint tables for the two charts before and after each of these steps and its negative, and a fixed inner rectangle of their overlap. The same choices are made for the other sloping direction, with the coordinates interchanged. On the overlap, corresponding sign decisions agree. All these assertions are literal identities in the finite pointwise tables.

We also need finitely many charts for several concurrent lines. Lemma 2 supplies a positive integer $D$ such that an intersection of two nonparallel allowable lines belongs to $D^(- 1) cal(O)^2$. Choose representatives of the finite quotient $D^(- 1) cal(O)^2 \/ cal(O)^2$ in a small neighborhood of $0$. For each representative $r$ and each subset of directions whose lines through $r$ have allowable levels, include the true sector table of those lines in an $cal(O)$-sided rectangle containing $r$ with a fixed margin. The rectangle is chosen about $0$; its sides are not obtained by adding $cal(O)$ lengths to a possibly nonintegral coordinate of $r$. Include every coordinate clipping decision that occurs in this table. For each sloping line in it, choose an $cal(O)^2$ point on that line close to $r$, and include the comparison with a chart based at that point. Such a point exists by density of the tangent group. There are finitely many choices here. Single-line models use a nearby $cal(O)^2$ point on the line, and the model with no line is constant.

Two further finite additions handle chart boundaries. First, choose a finite set of tangent translations that brings an inner chart close to every point of the portion of a line meeting a fixed small enlargement of any of the finitely many chart boxes, using its chosen $cal(O)^2$ anchor for a concurrent template. The enlargement also covers the tangential projections of nearby points at a box edge or corner. One sufficiently short nonzero tangent translation and finitely many of its multiples suffice. Include the corresponding comparisons with the original chart; their overlap rectangles are intersected with the original box when necessary. Second, include a fixed sufficiently fine rectangular grid in each primitive chart. For any fixed positive distance from its line, this grid can be chosen so that each grid cell meeting the part at that distance lies entirely on its correct side. These are genuine individual tables for the chart and the grid. This last choice will be used only away from the line; close to the line we will use a quadrant with a vertex on the line.

Every object just described is a fixed polygon and is a Boolean expression in finitely many translated primitive tests. Thus the finite-table construction and Lemma 28 provide all these tables, first on the required bounded alphabets enlarged by the fixed spare banks, and then on every allowed subalphabet. Bounded integer changes of planar lift are included in the same finite list. We will also impose one finite coordinate window at the starting size $n_0$. The order in which $n_0$ and the remaining parameters are fixed is specified at the end of the proof; none of the tables depends on a later induction level or on a word being tested.

=== 7.2 An overlap bridge using only the old windows <an-overlap-bridge-using-only-the-old-windows>

For an interval $W$ of consecutive integers, let $cal(D) \( W \)$ be the circular partition with endpoints $i tau med mod med 1$, $i in W$. It is generated by the translated primitive interval tests whose two endpoints have consecutive labels in $W$. To see that these tests distinguish its cells, join two purportedly indistinguishable cells by an oriented arc. For each consecutive pair of labels, either both endpoints or neither must have been crossed. Connectedness of the integer interval $W$ says that either every endpoint or no endpoint was crossed. In either case the two circular cells coincide.

Write $cal(R) \( n \)$ for the actual central law for the coordinate tests with endpoint labels in arbitrary windows of at most $n$ consecutive integers, one window in each coordinate. The statement includes its canonical partitions, their unions of cells, and all subalphabets. Common translations allow the windows to start anywhere. For $W = \[ a \, b \] ∩ bb(Z)$, write

$ W^(+ B) = \[ a - B \, b + B \] ∩ bb(Z) . $

A #emph[label margin at most $B$] means that the auxiliary endpoint labels needed for a comparison lie in $W^(+ B)$. Thus adjoining those labels enlarges the source range to at most $\| W \| + 2 B$ labels. These fixed margins will be absorbed in the strict window inequalities below.

The following lemma gives the precise transfer needed when a chart has large labels. It is useful even if the original interval uses an extreme label of its source window.

#thm([Lemma 7.1.])[
  (Transfer between old windows).  #emph[Assume $cal(R) \( n \)$. Fix $A \, K \, delta > 0$ and an integer $B gt.eq 1$. Suppose a perfect copy is controlled in a rectangle $R = I_x times I_y$ whose side lengths are at most $A \/ n$. Each $I_alpha$ is a union of cells of $cal(D) \( W_alpha \)$, where 
$ floor.l n \/ 4 floor.r lt.eq \| W_alpha \| lt.eq floor.l 0.9 n floor.r \, $

 and the source control is available with a label margin at most $B$. Let $J = J_x times J_y$ be a chart rectangle whose coordinate endpoint labels each lie in an interval of at most $B$ integers. Suppose that these labels are at distance at most $K n + B$ from a label of the corresponding source window, and that $J$ contains the closed $delta$-neighborhood of $R$ in the chosen circular coordinate charts. For all sufficiently large $n$, depending only on $A \, K \, delta \, B$, the copy is controlled in $J$. The proof uses only $cal(R) \( n \)$.]
] <lem:window-bridge>

#proof[
  It suffices to transfer one coordinate at a time. Put
  $ L = floor.l n \/ 8 floor.r \, #h(2em) S = floor.l L \/ 2 floor.r . $
  For $n gt.eq max \( 160 \, 40 B \)$, we have $L gt.eq n \/ 9$ and $S gt.eq n \/ 20$. Choose an $L$-window $V_0 subset W$ and enclose $I$ by the cells of $cal(D) \( V_0 \)$ which meet it; call their union $E_0$. Each end of $I$ is enlarged by at most $C \/ L lt.eq 9 C \/ n$. The containment $I subset E_0$ is compared within $W^(+ B)$, whose cardinality is at most $floor.l 0.9 n floor.r + 2 B < n$. Consequently it gives control by $E_0$ using the old law. This first comparison discards the original endpoint labels: no later comparison needs to retain an extreme endpoint of $W$.
  Choose an $L$-window $V_T$ containing the endpoint labels of the target interval and their prescribed margin. Its starting label can be reached from that of $V_0$ in steps of at most $S$, with
  $ T lt.eq ceil.l 20 \( K + 2 \) ceil.r $
  after increasing $n$ to absorb the fixed $B$ terms. Write the successive windows as $V_0 \, dots.h \, V_T$. The integer interval spanned by consecutive windows has length at most $L + S$; even after adding the fixed margins its length is less than $n$. Having obtained $E_(j - 1)$, enclose it by cells from $cal(D) \( V_j \)$ to obtain $E_j$. Both enclosures occur in the old law on the interval spanned by $V_(j - 1) union V_j$. Thus they have their common canonical representations there, and $E_(j - 1) subset E_j$ transfers control. Each endpoint grows by at most $9 C \/ n$ at this step.
  It follows that $E_T$ enlarges $I$ at each end by at most
  #[#set math.equation(numbering: n => "(49)")
   $ frac(9 C \( T + 1 \), n) . $ <eq:bridge-error>]
  Choose $n$ so large that this quantity is less than $delta$. Then $E_T subset J_alpha$. The terminal comparison is in the old law on $V_T$ with its margin. Transitivity of control proves the claim for that coordinate. A circular interval crossing the chosen seam is simply a union of cells; the same argument is made in a coordinate lift and then projected to the circle. The estimate and the available old laws are unchanged.
  Apply this construction to the two coordinates. First change one coordinate window while keeping the other fixed, and then change the other. Every comparison uses an old window in each coordinate. Finally intersect the two coordinate controls using Lemma 29. This proves control in $J$. ◻
]

The important bound in Lemma 32 is the number $T = O \( K \)$ of transfers, not the size of the endpoint labels. We shall apply the lemma separately to every overlap rectangle encountered in a long chain of charts. In each application $I$ is the #emph[original] interval. The enclosure produced for one overlap is never used as the source interval for the next overlap.

=== 7.3 Growing the coordinate laws <growing-the-coordinate-laws>

#thm([Lemma 7.2.])[
  (Nested cuts).  #emph[Let $E$ be a perfect group, and suppose $f \, l_i \, h_i : E arrow.r H$ are homomorphisms satisfying $f \( s \) = l_i \( s \) h_i \( s \)$ and $\[ l_i \( E \) \, h_i \( E \) \] = 1$. Order the indices by increasing cuts, and suppose additionally that $\[ l_i \( E \) \, h_j \( E \) \] = 1$ whenever $i < j$. Then the successive differences $l_(i - 1) \( s \)^(- 1) l_i \( s \)$ are commuting homomorphisms, with the evident initial and final factors, and give a split representation of the consecutive intervals.]
] <lem:nested-cuts>

#proof[
  For $i < j$, conjugation by $l_j \( t \)$ on $l_i \( E \)$ is conjugation by $f \( t \)$, because $h_j \( E \)$ commutes with $l_i \( E \)$. The latter conjugation is conjugation by $l_i \( t \)$, because $h_i \( E \)$ commutes with $l_i \( E \)$. Therefore $l_i \( t \)^(- 1) l_j \( t \)$ centralizes $l_i \( E \)$. Writing $l_j = l_i \( l_i^(- 1) l_j \)$ now shows directly from the homomorphism identities that $s mapsto l_i \( s \)^(- 1) l_j \( s \)$ is a homomorphism. For successive indices its image centralizes every earlier prefix, since both relevant prefixes act there by the same conjugation $"Ad" f \( t \)$. It consequently centralizes every earlier difference. Set the first prefix equal to $1$ and the last equal to $f$ if they were not already listed. Multiplying the differences telescopes to $f$, as required. ◻
]

#thm([Proposition 7.3.])[
  (All rectangular laws).  #emph[For a sufficiently large fixed initial window $n_0$, its true table and the finite geometric tables described above imply $cal(R) \( n \)$ for every $n$. In particular every finite family of aligned rectangular tests has its actual central law in $hat(G)$.]
] <prop:rectangular-law>

#proof[
  We prove the implication
  $ cal(R) \( n \) med arrow.r.double med cal(R) \( floor.l 6 n \/ 5 floor.r \) $
  for every sufficiently large $n$; iteration from $n_0$ gives unbounded window lengths. Put $n' = floor.l 6 n \/ 5 floor.r$. In a window of length $n'$ on the $x$ axis take the two end subwindows $W_(-)$ and $W_(+)$, each of length $floor.l 0.9 n floor.r$. Their intersection has length at least $0.59 n$ for large $n$. Its circular cells form an anchor partition of mesh at most $2 C \/ n$.
  Fix an anchor cell $U$. Each of the two old laws decomposes its canonical copy into prefixes and suffixes at that subwindow’s cuts. Both give the same copy on $U$, since the common anchor partition already has its old law. Contributions on different anchor cells commute, including contributions obtained from different subwindows: move one small alphabet to unused letters conditionally on its anchor cell, as in Lemma 29. For a cut $a$ in $U$ write its prefix and suffix representations as $l_a \, h_a$; these have common star source $"Alt" \( I \)^(*)$. If the cut occurs in both subwindows it belongs to the anchor partition, and the two representations already agree. Lemma 33 shows that it remains to prove
  #[#set math.equation(numbering: n => "(50)")
   $ \[ l_a \( "Alt" \( I \)^(*) \) \, h_b \( "Alt" \( I' \)^(*) \) \] = 1 #h(2em) \( a < b \) $ <eq:prefix-suffix>]
  for arbitrary small alphabets, and then to apply Lemma 27. Pairs coming from one subwindow already commute by its old law.
  Suppose, then, that $a$ and $b$ come from different subwindows. The two embeddings of $lambda$ have complementary roles in this comparison: its large ordinary value separates two thin rectangles, and its small conjugate value keeps the new transverse label in an old window. Use an ordinary lift of $U$ to order them. The endpoint separation bound gives
  #[#set math.equation(numbering: n => "(51)")
   $ b - a gt.eq c \/ n' . $ <eq:gap-ab>]
  Split both copies by a $y$-grid from $floor.l n \/ 4 floor.r$ consecutive labels. This is permitted separately for each copy by the old rectangular law. Contributions on different $y$-cells commute by the conditional move on those cells. Thus fix one lifted $y$-cell $\[ t \, t + h \]$, where $h lt.eq 5 C \/ n$. The two rectangles to be compared are
  $ R_(-) = \( U ∩ { x < a } \) times \[ t \, t + h \] \, #h(2em) R_(+) = \( U ∩ { x > b } \) times \[ t \, t + h \] . $
  They have diameter $O \( 1 \/ n \)$. By (48) and (51),
  #[#set math.equation(numbering: n => "(52)")
   $ h < lambda \( b - a \) . $ <eq:slope-separation>]
  The allowable line
  #[#set math.equation(numbering: n => "(53)")
   $ y - t = lambda \( x - a \) $ <eq:separating-line>]
  therefore separates these rectangles: $R_(-)$ is above it and $R_(+)$ is below it.
  This geometric separation must now be proved at the level of controlled copies. Put
  $ z_(-) = \( a \, t \) \, #h(2em) z_(+) = \( b \, t + lambda \( b - a \) \) . $
  Both points lie in $cal(O)^2$ in the chosen planar lifts. In the chart at $z_(-)$, the northwest quadrant lies above (53); in the chart at $z_(+)$, the southeast quadrant lies below it. For large $n$, both rectangles lie in the inner chart boxes. The actual quadrant tables, followed by intersection control, show that the copy on $R_(-)$ is controlled in the first positive sign and the copy on $R_(+)$ in the second negative sign. To justify using these tables we check the old coordinate windows explicitly. At $z_(-)$ the cuts $a \, t$ are already available, and adding fixed chart sides to a window of length at most $0.9 n$ still leaves length less than $n$. At $z_(+)$ the new $y$-label is governed by
  #[#set math.equation(numbering: n => "(54)")
   $ nu \( lambda d \) = macron(lambda) nu \( d \) + nu \( lambda \) d \, #h(2em) d = b - a . $ <eq:label-contraction>]
  Here $\| nu \( d \) \| lt.eq n'$ and $\| d \| lt.eq 2 C \/ n$. Consequently $\| nu \( lambda d \) \| lt.eq \| macron(lambda) \| n' + O \( 1 \)$. Adding this displacement and the fixed chart margins to the transverse window of length $n \/ 4$ gives a window of length less than $n$. The $x$ coordinates use the second subwindow with a fixed margin. Every quadrant and box containment just invoked is thus a consequence of $cal(R) \( n \)$.
  It remains to identify the positive sign in the two charts on the copy on $R_(-)$. Write the tangent displacement as an integral combination of the fixed short tangent basis. Since its ordinary coordinates are $O \( 1 \/ n \)$ and its conjugate coordinates are $O \( n \)$, the sum of the absolute values of these two coefficients is $O \( n \)$. This follows by applying the fixed inverse of the two-embedding basis matrix. Order the signed increments so that the successive positions stay within one largest step of the segment from $z_(-)$ to $z_(+)$. Such an ordering exists: whenever a partial tangent coordinate is below the interval joining the endpoints, take a positive remaining increment; above the interval take a negative one. The required sign exists because the sum of the remaining increments leads to the final endpoint. Inside the interval take either available sign. Each crossing overshoots an endpoint by at most one increment.
  By the choice of the small basis, the successive charts therefore have overlap rectangles containing both $R_(-)$ and $R_(+)$ with one fixed positive margin, independent of $n$. The labels of all chart centers, relative to the starting labels, are bounded by $K n$ for a fixed $K$: there are $O \( n \)$ increments, each with fixed labels. Consecutive sign decisions and their overlap rectangle belong to one of the fixed tables after a common translation.
  Apply Lemma 32 to the original $R_(-)$ and #emph[each] overlap rectangle separately. The source windows have lengths $0.9 n$ and $n \/ 4$ as required, and the overlap has the fixed margin just obtained. Thus the copy on $R_(-)$ is controlled in that overlap. The two sign decisions agree there in the fixed table, so Lemma 29 says that their conjugations on the copy on $R_(-)$ agree exactly. Composing these equalities identifies the first positive sign’s action with the last one’s action.
  Although the chart chain has $O \( n \)$ steps, its geometric error does not grow with that number. The only enlargement is (49), separately for each overlap and always starting from $R_(-)$. The chart chain composes equalities of actions, rather than successively enlarged rectangles. Figure 2 summarizes the separation and the short-window transfer used for each overlap. The copy on $R_(-)$ is now controlled in the last positive sign, whereas the copy on $R_(+)$ is controlled in its negative sign. These two signs have a true split table. The disjoint-control part of Lemma 29 proves their commutation and hence (50).
  Lemma 33 now splits all the new cuts of $U$ into their actual consecutive intervals. Their perfect factor images commute. The central kernel of each source $"Alt" \( I \)^(*) arrow.r "Alt" \( I \)$ has central image in its own factor, and hence in the product of all factors. Every original input copy is the prescribed product of these interval copies. Quotienting their generated group by its center therefore gives a quotient of the product of ordinary alternating groups indexed by the actual intervals. Doing this in every anchor cell supplies exactly the assignment-group map for the new one-coordinate central law. The identical argument with $x - lambda y$ proves the $y$ law. Every pair of one primitive $x$ test and one primitive $y$ test has a joint true table at arbitrary offsets: a translation in the two coordinates changes the offsets independently. Apply Lemma 30 to assemble the new coordinate laws. Their already established one-coordinate exclusions leave exactly the products of actual interval cells, so no spurious rectangular assignment remains. Lemma 27 extends this law simultaneously to the required alphabets, completing the induction. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.2, 0.5), (2, 1.6), fill: rgb("#dedeff"), stroke: none)
  rect((3.1, 0.5), (4.9, 1.6), fill: rgb("#ffe6cc"), stroke: none)
  rect((0.2, 0.5), (4.9, 1.6), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2, 0.15), (2, 2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((3.1, 0.15), (3.1, 2.4), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.75, 0.1), (3.25, 2.5), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  circle((2, 0.5), radius: 0.04586, fill: black, stroke: none)
  circle((3.1, 2.26), radius: 0.04586, fill: black, stroke: none)
  content((2, 0.05), [$a$], anchor: "north", padding: 0.1176cm)
  content((3.1, 0.05), [$b$], anchor: "north", padding: 0.1176cm)
  content((1, 1.05), [$R_-$])
  content((4, 1.05), [$R_+$])
  content((0.2, 0.5), [$t$], anchor: "east", padding: 0.1176cm)
  content((0.2, 1.6), [$t+h$], anchor: "east", padding: 0.1176cm)
  content((3.1, 2.26), [$z_+$], anchor: "south-west", padding: 0.1176cm)
  content((2, 0.5), [$z_-$], anchor: "north-east", padding: 0.1176cm)
  line((5.6, 1.3), (6.3, 1.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.35, 2.6), [Integer-label windows#linebreak()for one chart overlap])
  line((6.5, 2.05), (10.2, 2.05), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((6.5, 2.05), [$bb(Z)$], anchor: "east", padding: 0.1176cm)
  line((7.1, 1.6), (8.15, 1.6), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  line((7.6, 1.15), (8.65, 1.15), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  line((8.1, 0.7), (9.15, 0.7), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  content((8.15, 1.6), [$V_0$], anchor: "west", padding: 0.1176cm)
  content((8.65, 1.15), [$V_1$], anchor: "west", padding: 0.1176cm)
  content((9.15, 0.7), [$V_2$], anchor: "west", padding: 0.1176cm)
  line((7.1, 0.3), (8.65, 0.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.875, 0.16), [$|V_0 union V_1|<n$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The sloping line separates a prefix from a later suffix. Each geometric overlap receives a separate application of Lemma 32, starting from the original rectangle. Within that transfer, short integer windows may leave the source window; the hull of each consecutive pair, with its fixed margins, has length less than $n$. The original extreme endpoint is discarded in the first enclosure. The drawing of the slope is schematic. ],
) <fig:propagation-bridge>

=== 7.4 Comparing sloping decisions on controlled cells <comparing-sloping-decisions-on-controlled-cells>

We have now established all rectangular laws, without assuming any joint law for arbitrarily translated sloping predicates. Consequently a rectangle and any of its rectangular containers can be compared exactly, with no restriction on labels. This removes the quantitative window issue from the rest of the proof.

#thm([Lemma 7.4.])[
  (Comparison along one line).  #emph[Let $p$ and $q$ be two chart decisions for the same oriented allowable sloping line, either primitive charts or charts in the fixed concurrent templates. Suppose a point $z$ is on this line, or within a fixed sufficiently small distance of it, and belongs to the closures of both chart boxes. On all sufficiently small rectangular cells $P$ near $z$ contained in both boxes, $p \( s \)$ and $q \( s \)$ have the same conjugation on every perfect copy controlled in $P$. The conclusion also holds when the copies are formal sloping sectors with actual rectangular control. Only the rectangular laws and the fixed geometric tables are used. At a clipping boundary the comparison is made on the common interior cells; on exterior cells the decision from that chart is zero. Thus a replacement used on both sides must retain the original clipping condition.]
] <lem:line-slide>

#proof[
  First suppose the two charts are primitive charts with $cal(O)^2$ vertices on their common line. At the first chart use one of the fixed recentering offsets to obtain an inner chart near $z$. The first overlap is intersected with the original clipping box. On a cell on its interior side this is a rectangular container of $P$. The fixed comparison table proves equality of the two decisions on that container. The same construction is made at the final chart. Exterior cells are not an assertion of equality of the unmasked signs: the original decision is zero by its actual box-complement law, and a replacement there is clipped by that same box.
  The two recentered $cal(O)^2$ vertices differ by an element of the tangent group. Express this difference in the fixed short basis and order the signed increments as in the proof of Proposition 34. The centers remain in a small neighborhood of the segment joining the vertices and hence near $z$. More precisely, choose a fixed $epsilon > 0$ much smaller than every inner chart margin. The finite recentering nets may be chosen to put both endpoints within $epsilon \/ 10$ of the tangential projection of $z$, and each basis step may be chosen shorter than $epsilon \/ 10$. The greedy ordering keeps every intermediate center within $epsilon \/ 2$ of that projection. If the distance of $z$ from the line and the diameter of $P union { z }$ are less than $epsilon \/ 10$, every middle overlap therefore has a fixed positive margin around $P$, independently of the number of steps and all labels. The first and last overlaps have the same margin in their uncut directions; they are simply clipped at the original box edges. This supplies a uniform smallness bound, without shrinking a cell once for each step of a long chain. All rectangular containers now have their laws by Proposition 34, irrespective of their labels. Every consecutive fixed table therefore gives equal actions on a controlled copy by Lemma 29. Their composition gives the desired equality.
  For a template with vertex $r + u$, where $u in cal(O)^2$, use the chosen $cal(O)^2$ anchor on each line of its representative at $r$, translated by $u$. The initial and terminal primitive anchors lie on the same labeled line; their difference is exactly in its tangent group. The fixed terminal comparison identifies the last primitive chart with the template chart. This accounts explicitly for vertices in $D^(- 1) cal(O)^2$ without pretending that the vertex itself is an allowable translation. A single line through an arbitrary ordinary point needs only an $cal(O)^2$ anchor on that line sufficiently close to the point.
  At either clipped endpoint every overlap is intersected with the appropriate inside coordinate half-planes of its box. These are rectangular conditions with their established law. Thus the argument applies separately to each actual rectangular side of the clipping boundary. It does not require the controlled copy to split by any intermediate sloping sign. Its sole use of the copy is its control in the rectangular overlap. ◻
]

#thm([Lemma 7.5.])[
  (One sloping predicate and rectangular partitions).  #emph[A translated primitive sloping predicate has a joint central law with every finite aligned rectangular partition. At this stage one may retain both formal sloping sides over each rectangular cell. Every resulting perfect copy has the actual rectangular control of that cell, and hence control in all its rectangular containers.]
] <lem:slope-rectangle>

#proof[
  We first compare one sloping predicate $p$ with one translated primitive coordinate predicate $v$. Around $p$ choose the fixed fine rectangular grid included in its initial table. Include its clipping edges and its planar chart seams in the grid. The mesh is chosen smaller than the gaps between the two boundaries of a primitive coordinate predicate, and sufficiently small compared with the fixed chart margins and the finitely many angles. Translate the whole grid with $p$.
  This partition has an actual joint law separately with $p$, by the fixed table, and with $v$, by the rectangular law. On one of its cells $P$, form $H_P$ from the restricted copies of these two predicates and their complements, as in Lemma 31. If either predicate is constant on $P$, its action on $H_P$ is the indicated constant action. This assertion follows from its #emph[individual actual] split with $P$, together with the conditional move on $P$; it does not use the pair law being proved. Only the other individual split is then needed to check a formal two-predicate relation.
  If both predicates vary, $P$ is inside the clipping box of $p$, one sloping line crosses it, and exactly one boundary line of $v$ crosses it. Their intersection is within a fixed multiple of the diameter of $P$: solve the two line equations, whose angle is one of a fixed finite list. It lies in $D^(- 1) cal(O)^2$. The grid was chosen fine enough that the appropriate translated concurrent template has a margin box containing $P$. The intersection itself can lie just outside the clipping box of $p$. In applying the line comparison choose instead a point $z_0$ of its sloping line in $overline(P)$. The template intersection is within $C_lambda "diam" P$ of $z_0$, and its chosen $cal(O)^2$ anchor is within a fixed arbitrarily small distance of that intersection. Choose the mesh once so that this distance and the recentering errors fit the uniform margin established in Lemma 35. The tangent walk then stays near $P$ regardless of its number of steps. No refinement depending on the relative label of $v$ is needed. Replace $p$ by its corresponding line decision in that template, using Lemma 35, and replace $v$ by the matching axis decision, using only rectangular control. The replacements have exactly the same actions on $H_P$ as the original generators.
  The true template has the four ordinary sectors of these two crossing lines. Extend it outside its margin box by any one of those four assignments. Therefore a word trivial on all formal assignments of $\( p \, v \)$ is trivial in this pointwise template model. Its lifted value is central in the template subgroup. Its rectangular margin box controls every generator of $H_P$, since it contains $P$ and all rectangular laws are available. Take the template law on the enlarged alphabets required by Lemma 31. The template-relator conclusion of that lemma now makes the replacement word act trivially on $H_P$.
  Thus every formal two-predicate relator acts trivially on each $H_P$. Lemma 31 and then Lemma 27 prove the pair law. Apply this to the coordinate predicates generating any desired rectangular partition, and apply Lemma 30. Retain all exclusions already supplied by the rectangular law. The resulting sectors have an actual rectangular cell coordinate, although their sloping side may still be formal. Refining by another rectangle and using the same pair laws proves that each sector is controlled in every rectangular container of its cell. No compatibility of two different sloping predicates has been used. ◻
]

For a finite family $p_1 \, dots.h \, p_k$ and a common rectangular partition $cal(P)$, the lemma supplies the separate laws needed to form the cell groups of Lemma 31: $H_P$ is generated by all the $p_j$-side factors over $P$. That lemma makes every $H_P$ invariant under each $p_j \( s \)$, so equalities of their actions can be composed before a joint sloping law is known. Every generator of $H_P$ is controlled in $P$ and its rectangular containers, including a generator assigned a geometrically impossible sloping side. These are the groups on which we will verify the actual polygon laws.

=== 7.5 Actual sectors and clipping boundaries <actual-sectors-and-clipping-boundaries>

The remaining task is to remove those formal extra sides and prove the joint law for arbitrarily many sloping predicates. The small rectangular cells are now allowed to depend on the finite family or word being considered. The available tables and the presented group remain fixed.

#thm([Lemma 7.6.])[
  (An inactive line gives a constant action).  #emph[Let $p$ be a translated primitive sloping predicate with clipping box $B$, and let $z$ be an ordinary point not on its sloping line $L$. For sufficiently small rectangular cells $P$ near $z$ respecting the edges of $B$, the action of $p \( s \)$ on any perfect copy controlled in $P$ is its actual constant-side action inside $B$, and is trivial outside $B$. The assertion holds for the formal sector copies of Lemma 36.]
] <lem:inactive-line>

#proof[
  Outside $B$ the actual law of $p$ with its own clipping box gives the assertion, by exterior rectangular control. Consider the interior side, allowing $z$ itself to be on an edge or corner of $B$. We give the argument for $L = { y - lambda x = c_0 }$; interchange coordinates for the other slope. Put $d = z_y - lambda z_x - c_0 eq.not 0$.
  Suppose first that $d > 0$. The point on $L$ with coordinates
  $ \( z_x + d \/ \( 2 lambda \) \, med z_y - d \/ 2 \) $
  has $z$ strictly northwest of it. By density choose $q_x in cal(O)$ within $d \/ \( 4 lambda \)$ of its first coordinate, and put $q_y = lambda q_x + c_0 in cal(O)$. Then
  #[#set math.equation(numbering: n => "(55)")
   $ q_x - z_x > d \/ \( 4 lambda \) \, #h(2em) z_y - q_y > d \/ 4 . $ <eq:strict-quadrant>]
  The northwest quadrant based at $q = \( q_x \, q_y \)$ lies wholly on the positive side of $L$. For $d < 0$, the same formula with $\| d \| \/ \( 4 lambda \)$ as the allowed perturbation puts $z$ strictly southeast of $q$; that quadrant lies wholly on the negative side. Thus the coordinate inequalities have positive room even when the inactive line is arbitrarily close to $z$.
  If $\| d \|$ is below a fixed small threshold, choose that threshold so that $q$ and $z$ fit in the inner margins of a line chart. Lemma 35 compares the original predicate with that chart near $z$, clipping the first overlap to $B$. By (55), all sufficiently small cells on the interior side of $B$ are controlled in the indicated quadrant and in the chart box. The genuine line–quadrant table says that its sign decision there is respectively the constant permutation or the identity. Intersection and transitivity of control give the claimed action on the controlled copy. No sign attached to a formal sector was used to infer its location.
  For $\| d \|$ above the fixed threshold, use the finite rectangular grid included with the primitive chart. Choose its mesh small enough that every cell meeting the part with this lower bound on $\| d \|$ lies strictly on the same side of the line. This is possible because the defining linear form has fixed norm. The individual actual table of $p$ with the grid gives its constant action there. Rectangular control transfers the assertion to any sufficiently small $P$ near $z$. Cells meeting a grid boundary may be further split by that fixed grid; this changes neither the conclusion nor the initial data.
  If a clipping edge is active at $z$, treat interior cells by the quadrant or grid just described and exterior cells by the first paragraph. At a corner there are four rectangular sides and the same procedure applies to each. Therefore the local action is exactly the Boolean combination of the constant sloping sign with the actual clipping decisions on all sides of the boundary. ◻
]

#thm([Theorem 7.7.])[
  (The polygon law).  #emph[There is one finite choice of true initial relations in $hat(G)$, for sufficiently large fixed finite $m$, such that every finite family of aligned polygon tests has its actual central law. The assertion holds simultaneously on subalphabets. Its canonical representations 
$ rho_(U \, I) : "Alt" \( I \)^(*) arrow.r hat(G) $

 are compatible with restriction of the alphabet, split exactly over finite disjoint polygon refinements, and are covariant under common translations on proper supports.]
] <thm:polygon-law>

#proof[
  First take a finite family of translated primitive predicates, including coordinate predicates if needed. By Lemma 27, we may fix an alphabet of its prescribed bounded size and a word $w$ entirely on that alphabet whose pointwise permutation is the identity on every actual assignment. It suffices to prove that $w$ acts trivially on the subgroups needed to test centrality. Include those additional small-support copies and their spare alphabets throughout; the geometric family is still finite.
  Fix $z in T$. Call a supporting boundary line #emph[active] at $z$ if it contains $z$; include the coordinate lines which form clipping edges. Inactive supporting lines have positive distance from $z$, and the family is finite. In a sufficiently small ordinary neighborhood of $z$ the only varying signs are therefore the active ones. There is at most one distinct active line of each of the four directions.
  Choose the corresponding translated concurrent template. If at least two directions are active, $z in D^(- 1) cal(O)^2$ and the template is provided by its coset representative and direction subset. With one active direction use a nearby $cal(O)^2$ anchor on that line, and with none use a constant model. Each original predicate becomes, in this model, the Boolean combination of its active sign and clipping decisions, with the other decisions replaced by their actual local constants. The allowed assignments are precisely the ordinary open sectors of the active lines, with these combinations evaluated on them. Each such sector occurs arbitrarily near $z$ in the original Boolean space. Hence the word $w$ is the identity on every assignment of this template model. Extend the model outside its margin box by any one allowed sector, so that it remains a finite pointwise test model on the whole square.
  We verify the equality of its actions with the original actions on $H_P$ for every sufficiently small cell near $z$. All cells will be cut by every original clipping edge and by any additional finite rectangular subdivisions needed in these comparisons.
  + Coordinate decisions compare with the template by the established rectangular law. An inactive coordinate decision is its actual constant on the relevant cells.
  + An active sloping line inside its clipping box compares with the same oriented line in the template by Lemma 35. If $z$ lies on a clipping edge, make that comparison only on the interior rectangular side. The template includes that active axis decision, and its true table identifies the resulting clipped sign there. On exterior cells the original predicate is trivial by control in the exterior of its own box. This treats all sides of a corner as well.
  + An inactive sloping line is replaced by its actual constant-side decision by Lemma 37. If some of its clipping edges are active, keep those coordinate decisions in the replacement. The interior and exterior arguments in that lemma establish precisely this clipped Boolean combination, even for a formal wrong-side copy over $P$.
  Every equality in this list follows from equal actions on a known rectangular container of $P$ and the conditional move of Lemma 29. Thus it holds on every generator of $H_P$, not just in projection. The original generators preserve $H_P$ by Lemma 31. Their actions can therefore be composed, and the action of $w$ on $H_P$ equals the action of its template replacement.
  The replacement is central in the true template table. Its margin box is a rectangular container of $P$, so it controls every generator of $H_P$. Apply the table on the enlarged alphabets required by Lemma 31. The template-relator conclusion of that lemma shows that the replacement, and hence $w$, centralizes $H_P$, including its possibly formal sloping factors.
  We finally choose one finite partition on which these local checks all apply. For every $z$ the preceding construction provides an ordinary neighborhood and an upper bound on the permitted cell diameter. A finite subcover exists by compactness of $T$. A sufficiently fine $cal(O)$ rectangular grid, refined by the finitely many clipping edges and auxiliary rectangular cuts of that subcover, has every cell in one of those neighborhoods and below its required diameter. This follows, for example, by applying the Lebesgue number property to the finite subcover and then using the coordinate mesh bound. Make the separate splits of every original predicate with this partition by Lemma 36. We have proved that $w$ centralizes every resulting $H_P$. The group generated by these subgroups contains the original test subgroup, so Lemma 31 proves its actual central law. Lemma 27 gives the assertion on all the required alphabets simultaneously.
  Apply this established law to a larger finite family containing translated primitive coordinate tests that generate the partition just used. Apply Lemma 26 first to the coordinate subfamily: its original partition copies agree with the corresponding coordinate factors of the enlarged actual law. We may therefore include those same copies among the inputs of that law. For each old formal law, the enlarged family now contains exactly its specified input copies, including the constant copy. Its subgroup $H_0$ is thus contained in the enlarged defining-copy subgroup $K$. Every new actual assignment restricts to an allowed old assignment, since the old law retained all actual assignments. Lemma 26 now identifies each #emph[original] formal factor with the product of its actual refinements and makes it trivial when it has no actual extension.
  Every polygon is a Boolean combination of finitely many translated primitive tests. Apply the law just proved to a common finite family realizing the polygons. The canonical perfect-cover construction supplies their representations. To compare two Boolean expressions, pass to their common finite family and apply Lemma 26; the resulting representations agree there. Within this lawful family, uniqueness of lifts from a perfect source gives exact multiplicative splitting over a finite disjoint refinement. Finally a common allowable translation on a proper alphabet is implemented by the balanced translations of Lemma 28; apply uniqueness to the translated test family. This proves the claimed translation covariance and alphabet compatibility. ◻
]

=== 7.6 Why one finite presentation suffices <why-one-finite-presentation-suffices>

For clarity, we finish by giving the order of the choices used in this section. First fix the arithmetic constants and choose $lambda$ satisfying (48). Next choose the finite concurrent representatives, chart boxes and margins, quadrant tables, and the fixed grids used away from a line. Choose the short tangent bases, finite recentering offsets, and comparison tables inside those margins. These choices determine a finite label bound $B$ for every fixed relative configuration, and a finite constant $K$ for the chart walks in the rectangular induction. They also determine all bounded support requirements. Choose the finite track number $m$ beyond these requirements, the spare banks of the lifting calculus, and the thresholds required elsewhere in the argument.

Only now choose $n_0$. It is large enough for every strict window inequality, for the rectangles and the separating segment to fit in the prescribed chart margins, and for

$ frac(9 C \( ceil.l 20 \( K + 2 \) ceil.r + 1 \), n_0) < delta . $

Enlarge it also for the fixed margins in (54). Finally impose the finite true tables for the coordinate window of length $n_0$ and for the finite geometric menu, with their specified representative words and bounded alphabet enlargements. After common translations these are exactly the tables used above.

Later induction levels add no initial relation. Nor does an arbitrarily close inactive line require a new small geometric template: its strict quadrant is a translate of a fixed line–quadrant table, and only the independently controlled rectangular cell becomes smaller. Likewise arbitrarily long words require more cells and more successive comparisons, but only finitely many tracks at any one comparison. Thus Theorem 38 is a statement inside a single finitely presented group $hat(G)$.

== 8 Transport of slots and a finitely presented central cover <sec:transport>

We use the fixed finitely presented group $hat(G)$ and its surjection $pi : hat(G) arrow.r A_m$ from Section 6. Theorem 38 has established the central law for every finite family of aligned polygon tests. Our remaining task is to pass from aligned tests to arbitrary parameterized slots, including several slots in the same track. We shall construct their perfect representations in $hat(G)$, prove exact conjugation formulas, and deduce that $ker pi$ is central. The first obstacle is that an aligned word can fix every point of a slot while still using its track. We handle this with private tracks, first for distinct-track configurations and then for repeated tracks by proving independence of the routing. Translation transport is proved after that independence is available.

We retain the notation

$ B_m = { d = \( d_1 \, dots.h \, d_m \) in Gamma^m : sum_i d_i = 0 } \, #h(2em) t \( d \) in hat(G) \, $

so that $t \( d \) t \( e \) = t \( d + e \)$ exactly. Write $rho_(P \, I) : "Alt" \( I \)^(*) arrow.r hat(G)$ for the canonical representation on an aligned polygon $P$ and a track set $I$, where $\| I \| gt.eq 5$. Its image is perfect. These maps split exactly over disjoint polygonal partitions, are compatible under inclusions of track sets, and obey common-translation covariance on proper track sets, by Theorem 38 and Lemma 28. We use function composition in which $a b$ applies $b$ first.

An #emph[aligned word on $J$] means a finite product of elements of the images of $rho_(P \, I)$, with $I subset.eq J$. Such words change track labels but preserve base coordinates after projection. Their track support is $J$: balancing tracks used to write translated predicates in the original generators are not included in $J$. This convention is legitimate because Lemma 28 proves exact commutation for disjoint track sets, independently of those choices of balancing words. In particular, $t \( d \)$ commutes with every aligned word on $J$ if $d_i = 0$ for all $i in J$.

For a finite family with its actual central law, the restriction of $pi$ to the subgroup $H$ of conditional copies maps onto the pointwise group on its nonempty Boolean atoms. That pointwise group is a product of alternating groups and acts faithfully on $m X$. Thus every word in the kernel evaluates to the identity in the actual assignment model, and the actual central law makes this kernel central. This supplies the central extensions used below.

Here is the elementary consequence of perfection that will repeatedly turn a central law into an exact identity. If $H arrow.r Q$ has central kernel, $K lt.eq H$ is perfect, and the image of $b in H$ centralizes the image of $K$, then $\[ b \, k \]$ is central for every $k in K$. The map $k mapsto \[ b \, k \]$ is therefore a homomorphism from $K$ to an abelian group, and is trivial. Thus $b$ centralizes $K$ exactly. Also, two homomorphisms from a perfect group to $H$ with the same composition into $Q$ are equal. Every application below takes place in a specified finite test subgroup with this central-extension property.

=== 8.1 Offset frames and distinct tracks <offset-frames-and-distinct-tracks>

A parameterized five-slot configuration is data

#[#set math.equation(numbering: n => "(56)")
 $ S = \( U \; \( i_1 \, u_1 \) \, dots.h \, \( i_5 \, u_5 \) \) \, #h(2em) U subset.eq X \, quad i_j in { 1 \, dots.h \, m } \, quad u_j in Gamma \, $ <eq:slot-configuration>]

where $U$ is a Boolean polygon and the five images of the maps

$ s_j : U arrow.r m X \, #h(2em) s_j \( x \) = \( i_j \, x + u_j \) $

are pairwise disjoint. Addition is modulo the coordinate periods, with the induced action on $X$. Thus equal track indices are allowed precisely when the corresponding translated pieces are disjoint. The ordering identifies slot permutations with $E = "Alt" \( { 1 \, dots.h \, 5 } \)$. All representations associated to five-slot configurations will have the same source $E^(*)$. For an empty $U$ the representation is the trivial one, and empty pieces in refinements will be omitted.

For a proper track set $J$ and offsets $a_i in Gamma$ for $i in J$, choose $f in B_m$ with $f_i = a_i$ on $J$. Such an $f$ exists by balancing the sum on one track outside $J$. Conjugating aligned representations on $J$ by $t \( f \)$ gives their representations in the #emph[offset frame] $a$. The choice of $f$ has no effect: if $f'$ is another choice, then $f' - f$ vanishes on $J$ and $t \( f' - f \)$ commutes with every aligned word there. Every finite central law on $J$ consequently gives the same central law in this frame.

Suppose first that the $i_j$ in (56) are distinct. Put $I = { i_1 \, dots.h \, i_5 }$, let $iota_(bold(i))^(*) : E^(*) arrow.r "Alt" \( I \)^(*)$ be the isomorphism induced by $j mapsto i_j$, and choose $f in B_m$ with $f_(i_j) = u_j$. Define

#[#set math.equation(numbering: n => "(57)")
 $ rho_S \( s \) = t \( f \) rho_(U \, I) \( iota_(bold(i))^(*) \( s \) \) t \( f \)^(- 1) \, #h(2em) s in E^(*) . $ <eq:distinct-slot-copy>]

This is independent of the balancing coordinates of $f$, and its projection is the indicated alternating slot permutation.

#thm([Lemma 8.1.])[
  (Compatibility of frames).  #emph[For distinct-track configurations, the representations (57) have the following properties.]
  + #emph[Replacing $U$ by $U + v$ and every $u_j$ by $u_j - v$ leaves the representation unchanged, with the corresponding reparameterization.]
  + #emph[If $U = union.sq.big_(alpha = 1)^r U_alpha$, then 
#[#set math.equation(numbering: n => "(58)")
 $ rho_S \( s \) = product_(alpha = 1)^r rho_(S \| U_alpha) \( s \) \, $ <eq:slot-refinement-distinct>]

 and the factor images commute pairwise.]
  + #emph[For a constant even track permutation $c$, conjugation by its fixed lift sends $rho_S$ to the representation of the tuple obtained by replacing $i_j$ by $c \( i_j \)$.]
  + #emph[For every $d in B_m$, 
#[#set math.equation(numbering: n => "(59)")
 $ t \( d \) rho_S \( s \) t \( d \)^(- 1) = rho_(d S) \( s \) \, #h(2em) d S = \( U \; \( i_j \, u_j + d_(i_j) \)_(j = 1)^5 \) . $ <eq:distinct-translation>]

]
  #emph[More generally, a representation on a subalphabet computed in an offset frame agrees with its own frame definition. Two frames giving the same offsets on that subalphabet, up to the common reparameterization in (i), give identical representations there.]
] <lem:slot-frames>

#proof[
  For (i), choose $h in B_m$ equal to $v$ on $I$. The common-translation identity for aligned copies is $t \( h \) rho_(U \, I) t \( h \)^(- 1) = rho_(U + v \, I)$. A balancing vector for the new offsets, added to $h$, agrees with $f$ on $I$. Independence of the balance then proves the assertion. Part (ii) is the aligned refinement identity conjugated by $t \( f \)$.
  For (iii), the initial relations give $c thin t \( f \) c^(- 1) = t \( c dot.op f \)$ and exact reindexing of the aligned representations. These are precisely the data defining the new frame. For (iv), additivity gives
  $ t \( d \) rho_S \( s \) t \( d \)^(- 1) = t \( d + f \) rho_(U \, I) \( iota_(bold(i))^(*) \( s \) \) t \( d + f \)^(- 1) \; $
  $d + f$ has the required offsets on $I$. Finally, compatibility under restriction follows from the corresponding compatibility of aligned canonical representations and from independence of balances. This also proves the assertion about two frames. ◻
]

We next prove transport by aligned words. Private track blocks move the entire representation away from a word fixing its slots without changing the commutator. The lemmas state the spare-track hypotheses for the indicated support of that word. Their later applications compare bounded unions of supports; the final kernel word is treated one generator at a time.

#thm([Lemma 8.2.])[
  (Fixing a distinct-track tuple).  #emph[Let $S$ be a five-slot configuration on distinct tracks, and let $b$ be an aligned word on a track set $J$. Suppose that $pi \( b \)$ fixes every point of every parameterized slot of $S$. Provided the fixed track reserve contains twenty tracks outside $J$ and the occupied tracks, together with the balancing tracks used below, $b$ centralizes $rho_S \( E^(*) \)$ exactly.]
] <lem:fixed-slot-centralizer>

#proof[
  For each leg $j$, choose four private tracks $p_(j \, 1) \, dots.h \, p_(j \, 4)$, all distinct and outside $J union I$, and put
  $ V_j = U + u_j \, #h(2em) L_j = { i_j \, p_(j \, 1) \, dots.h \, p_(j \, 4) } \, #h(2em) K_j = rho_(V_j \, L_j) \( "Alt" \( L_j \)^(*) \) . $
  The projected element $pi \( b \)$ fixes the source track pointwise on $V_j$ and fixes every private track. It therefore commutes with the projection of $K_j$. Take the finite family consisting of all tests occurring in a chosen aligned expression for $b$, the five tests $V_j$, and constants, on the union of the track sets involved. Theorem 38 gives a central extension of its pointwise group. Within that subgroup, $\[ b \, k \]$ is central for $k in K_j$. Since $K_j$ is perfect, the central-commutator argument above proves
  #[#set math.equation(numbering: n => "(60)")
   $ \[ b \, K_j \] = 1 #h(2em) \( 1 lt.eq j lt.eq 5 \) . $ <eq:fixer-private-commutation>]
  Choose $a_j in K_j$ projecting to the cycle $\( i_j med p_(j \, 1) med p_(j \, 2) \)$ on $V_j$, and set $a = a_5 dots.h.c a_1$. There is one common offset frame on the union of the $L_j$: assign offset $u_j$ to every track in $L_j$. In this frame, $K_j$ is the aligned conditional copy on $U$ with track set $L_j$. Thus $a$ and $rho_S$ lie in one conjugate of a subgroup with an aligned central law. In its pointwise model, $a$ sends the $j$th slot to $\( p_(j \, 1) \, U + u_j \)$. Uniqueness for homomorphisms from $E^(*)$ in this central extension gives the exact identity
  #[#set math.equation(numbering: n => "(61)")
   $ a rho_S \( s \) a^(- 1) = rho_T \( s \) \, #h(2em) T = \( U \; \( p_(j \, 1) \, u_j \)_(j = 1)^5 \) . $ <eq:private-evacuation>]
  Here compatibility of subframes in Lemma 39 identifies the two maps with their definitions in (57).
  The tracks occupied by $T$ are outside $J$. Write its representation using a balancing vector $f_T$ which is zero on $J$: prescribe $u_j$ on $p_(j \, 1)$ and balance on a further track outside both sets. The aligned base copy for $T$ commutes with $b$ by disjoint-track commutation, and $t \( f_T \)$ commutes with $b$ because $f_T$ vanishes on $J$. Consequently $\[ b \, rho_T \( E^(*) \) \] = 1$. Equation (60) also gives $\[ b \, a \] = 1$. Conjugating (61) back proves $\[ b \, rho_S \( E^(*) \) \] = 1$. ◻
]

#thm([Lemma 8.3.])[
  (Aligned transport between distinct-track tuples).  #emph[Let $S = \( U \; \( i_j \, u_j \)_(j = 1)^5 \)$ and $T = \( U \; \( k_j \, u_j \)_(j = 1)^5 \)$ be configurations, each with distinct track indices. If an aligned word $b$ sends the $j$th parameterized slot of $S$ to the $j$th slot of $T$, then 
#[#set math.equation(numbering: n => "(62)")
 $ b rho_S \( s \) b^(- 1) = rho_T \( s \) #h(2em) \( s in E^(*) \) \, $ <eq:distinct-aligned-transport>]

 whenever the fixed reserve supplies the tracks of Lemma 40 for $b$ and an even constant reindexing of the two tuples.]
] <lem:distinct-slot-transport>

#proof[
  Extend the bijection $i_j mapsto k_j$ to a permutation of the union of the two five-element sets. If it is odd, multiply by a transposition on two additional tracks. The resulting even constant permutation $c$ has support at most twelve and sends $S$ to $T$ parameterwise. The aligned word $c^(- 1) b$ fixes $S$ pointwise. Apply Lemma 40, and then the constant-reindexing identity of Lemma 39. ◻
]

=== 8.2 Repeated tracks and independence of routing <repeated-tracks-and-independence-of-routing>

We now construct the representation of (56) without a distinctness assumption on the $i_j$. An #emph[admissible routing] of $S$ is an aligned word $r$ on an alphabet of at most $25$ tracks containing all source and terminal track labels, whose projected action sends its five slots parameterwise to a tuple $T$ on distinct tracks. Since an aligned word preserves base coordinates, $T$ has the form $\( U \; \( k_j \, u_j \)_(j = 1)^5 \)$. A routing need not act trivially outside the specified slots; this is useful when the same routing is applied to a subdivision of $U$.

Such a routing always exists. Choose four private tracks for each leg, all outside the occupied source tracks and all different. On $V_j = U + u_j$ choose an element of the perfect aligned copy on

$ L_j = { i_j \, p_(j \, 1) \, p_(j \, 2) \, p_(j \, 3) \, p_(j \, 4) } $

projecting to $\( i_j med p_(j \, 1) med p_(j \, 2) \)$. Multiply these five elements to obtain $r$. Each factor sends its own slot to $p_(j \, 1)$. It fixes every other source slot: different source tracks are not in its private block, and slots sharing $i_j$ have disjoint Boolean regions by hypothesis. Private destinations of different legs are distinct. The total support is at most $5 + 5 dot.op 4 = 25$.

For an admissible routing $r : S arrow.r T$, define provisionally

#[#set math.equation(numbering: n => "(63)")
 $ rho_S^(thin r) \( s \) = r^(- 1) rho_T \( s \) r . $ <eq:routed-copy>]

The next lemma proves equality of these maps in $hat(G)$ itself.

#thm([Lemma 8.4.])[
  (Independence of routing).  #emph[For every five-slot configuration $S$, the homomorphism (63) is independent of its admissible routing. Denote it by $rho_S : E^(*) arrow.r hat(G)$. It agrees with (57) when the tracks are distinct. For every finite polygonal partition $U = union.sq.big_alpha U_alpha$, 
#[#set math.equation(numbering: n => "(64)")
 $ rho_S \( s \) = product_alpha rho_(S \| U_alpha) \( s \) \, $ <eq:slot-refinement>]

 with pairwise commuting factor images. Common reparameterization of $U$ and the $u_j$ leaves $rho_S$ unchanged.]
] <lem:routing-independence>

#proof[
  Let $r_1 : S arrow.r T_1$ and $r_2 : S arrow.r T_2$ be two admissible routings. The aligned word $b = r_2 r_1^(- 1)$ sends $T_1$ to $T_2$ parameterwise. Both terminal tuples have distinct tracks, so Lemma 41 applies and gives
  $ r_2 r_1^(- 1) rho_(T_1) \( s \) r_1 r_2^(- 1) = rho_(T_2) \( s \) . $
  After multiplying by $r_2^(- 1)$ and $r_2$, this is precisely $rho_S^(thin r_1) \( s \) = rho_S^(thin r_2) \( s \)$. A distinct-track tuple admits the identity routing, proving agreement with its earlier definition.
  Fix one routing $r : S arrow.r T$. It is also an admissible routing of every $S \| U_alpha$ to $T \| U_alpha$: its support bound has not changed. Apply Lemma 39(ii) to $T$, and conjugate the identity and its commutation assertions by $r^(- 1)$. This proves (64). For common reparameterization, use the same routing, which depends only on the actual parameterized slot maps after their domain identification, and apply Lemma 39(i) at its distinct-track target. ◻
]

Routing independence has now been established using aligned words only. In particular, it is available before any claim that a translation transports a repeated-track configuration.

#thm([Lemma 8.5.])[
  (Aligned transport of arbitrary tuples).  #emph[Let $b$ be an aligned word supported on at most five tracks. Suppose that it sends a five-slot configuration $S$ parameterwise to a configuration $T$ with constant track labels on each leg. Then 
#[#set math.equation(numbering: n => "(65)")
 $ b rho_S \( s \) b^(- 1) = rho_T \( s \) #h(2em) \( s in E^(*) \) . $ <eq:aligned-slot-transport>]

 If track labels vary within $U$, the same assertion holds piecewise on a finite polygonal partition of $U$, with the product interpretation of (64).]
] <lem:aligned-slot-transport>

#proof[
  Choose admissible routings $r_S : S arrow.r S'$ and $r_T : T arrow.r T'$. The word $r_T b r_S^(- 1)$ is aligned and sends the distinct-track tuple $S'$ to $T'$. Lemma 41 gives
  $ \( r_T b r_S^(- 1) \) rho_(S') \( s \) \( r_T b r_S^(- 1) \)^(- 1) = rho_(T') \( s \) . $
  Conjugate by $r_T^(- 1)$ and use the definitions of $rho_S$ and $rho_T$. The support of the transition word is at most $25 + 5 + 25 = 55$, so this application uses a fixed reserve.
  For the last assertion, the finitely many polygon tests in $b$ induce a finite partition on each map $x mapsto x + u_j$. Their common refinement makes all five terminal track labels constant. Apply the proved identity on every part and multiply, using (64). ◻
]

=== 8.3 Balanced translations <balanced-translations>

The representations on repeated tracks are now independent of routing. We next use that independence to prove translation covariance. The auxiliary translation below shifts each chosen routing block uniformly; a second routing handles the difference from the desired translation.

#thm([Lemma 8.6.])[
  (Translation transport).  #emph[For every $d in B_m$ and every five-slot configuration $S$, 
#[#set math.equation(numbering: n => "(66)")
 $ t \( d \) rho_S \( s \) t \( d \)^(- 1) = rho_(d S) \( s \) \, #h(2em) s in E^(*) \, $ <eq:translation-slot-transport>]

 where $d S = \( U \; \( i_j \, u_j + d_(i_j) \)_(j = 1)^5 \)$.]
] <lem:translation-slot-transport>

#proof[
  It suffices to treat the fixed generators of $B_m$, each supported on two tracks, and their inverses. The general statement then follows by composition and additivity of $t$.
  Choose the private-block routing $r : S arrow.r T$ used in the existence proof above. Its $j$th factor lies in $rho_(V_j \, L_j) \( "Alt" \( L_j \)^(*) \)$, where $V_j = U + u_j$. Choose $d' in B_m$ as follows:
  #[#set math.equation(numbering: n => "(67)")
   $ d'_i = d_i quad upright("on every occupied source track ") i \, #h(2em) d'_(p_(j \, a)) = d_(i_j) quad \( 1 lt.eq j lt.eq 5 \, med 1 lt.eq a lt.eq 4 \) . $ <eq:blockwise-translation>]
  Put $d' = 0$ on the other tracks except for one unused track, on which we balance the sum. Repeated source labels give consistent prescriptions because they prescribe the same $d_i$. Thus $d'$ is constant on each $L_j$, and has support at most $26$. Set
  $ delta = d - d' . $
  The translation $delta$ vanishes on all occupied source tracks and has bounded support (at most $28$ is sufficient).
  We first show
  #[#set math.equation(numbering: n => "(68)")
   $ \[ t \( delta \) \, rho_S \( E^(*) \) \] = 1 . $ <eq:delta-centralizes>]
  Choose another private-block routing $q : S arrow.r T_0$, with all its private tracks outside the support of $delta$. Every track in each of its five blocks then has $delta_i = 0$. Outside-support translation commutation, from Lemma 28, gives $\[ t \( delta \) \, q \] = 1$ factor by factor. The tuple $T_0$ has distinct tracks, all outside the support of $delta$. Write
  $ rho_(T_0) \( s \) = t \( f \) rho_(U \, I_0) \( iota_(bold(k))^(*) \( s \) \) t \( f \)^(- 1) . $
  The element $t \( delta \)$ commutes with $t \( f \)$ by additivity and with the aligned representation on $I_0$ because it is zero on $I_0$. It therefore centralizes $rho_(T_0) \( E^(*) \)$. By the already proved routing independence, $rho_S = q^(- 1) rho_(T_0) q$, proving (68). This argument uses only the distinct-track frame formula and outside-support commutation.
  Next conjugate the original routing by $t \( d' \)$. Since $d'$ is constant on $L_j$, the common-translation law for aligned polygon representations replaces its $j$th conditional factor on $V_j$ by the same factor on $V_j + d_(i_j)$. Hence
  $ r' = t \( d' \) r t \( d' \)^(- 1) $
  is an aligned word on the same at-most-$25$ tracks. It routes $d' S$ to $d' T$, preserving base coordinates at this new configuration. It is therefore an admissible routing. The distinct-track formula (59) gives
  $ t \( d' \) rho_S \( s \) t \( d' \)^(- 1) & = r' ""^(- 1) #scale(x: 120%, y: 120%)[\(] t \( d' \) rho_T \( s \) t \( d' \)^(- 1) #scale(x: 120%, y: 120%)[\)] r'\
 & = r' ""^(- 1) rho_(d' T) \( s \) r' = rho_(d' S) \( s \) . $
  Finally, $d' S = d S$ because $d' = d$ on the occupied source tracks, while $t \( d \) = t \( d' \) t \( delta \)$. Equation (68) now proves (66). ◻
]

===== 8.3.1 The fixed number of tracks. <the-fixed-number-of-tracks.>

We record why the preceding constructions fit the single choice of $m$ made before the presentation was fixed. One private routing uses at most $25$ tracks. Comparing two routings uses at most $50$, and inserting one five-track aligned generator uses at most $55$. The even constant reindexing in Lemma 41 uses at most twelve tracks. The fixing-slot argument adds twenty private tracks and finitely many balancing tracks. The translation argument uses the source tracks, two banks of twenty private tracks, the at-most-two-track support of its generator, and a balancing track; its temporary difference translation has support at most $28$. These are absolute finite bounds, independent of polygons, offsets, the number of refinement pieces, and word length. Let $M_(upright("tr"))$ be the maximum of the total track requirements of these finitely many operations, including the auxiliary tracks in each. Taking $m > M_(upright("tr"))$ in addition to the earlier support requirements makes every comparison available.

A refined piece uses the same routing as its parent. Different pieces are processed successively, and successive word letters may reuse the private banks because Lemma 42 identifies all choices exactly. No bank is assigned permanently to a predicate, a refinement level, or a letter of a later word. The only relations used here are the initial additive and reindexing relations, outside-support commutation, and the polygon laws already deduced in the fixed presented group. In particular, this reserve does not require any new relations depending on the configuration being transported.

=== 8.4 Generation and centrality of the kernel <generation-and-centrality-of-the-kernel>

Let $N lt.eq hat(G)$ be the subgroup generated by $rho_S \( E^(*) \)$ over all parameterized five-slot configurations $S$. We first check that these copies generate the presented group itself. This is stronger than their generation after projection and is necessary for the kernel argument.

#thm([Lemma 8.7.])[
  (Generation by slot copies).  #emph[The subgroup $N$ is all of $hat(G)$.]
] <lem:slot-generation>

#proof[
  Each of the initial conditional alternating track groups is generated by its subgroups on five tracks. The canonical representations on those five tracks agree exactly with their initially specified lifts, by the finite initial tables and uniqueness for perfect sources. Thus $N$ contains all conditional track-permutation generators, including the constant ones.
  It remains to include the balanced translation generators. Let $v$ be one of the two fixed generators of $Gamma$, and choose four distinct tracks $i \, j \, k \, h$. Put
  $ c = \( i med j med k \) \, #h(2em) a = v e_i - v e_h in B_m \, $
  where $e_i$ denotes placement in the $i$th track coordinate. We use the same symbol $c$ for the specified constant lift. The additive and constant-reindexing relations give
  #[#set math.equation(numbering: n => "(69)")
   $ \[ c \, t \( a \) \] = t \( c dot.op a - a \) = t \( v e_j - v e_i \) . $ <eq:translation-as-slot-product>]
  The commutator convention is $\[ x \, y \] = x y x^(- 1) y^(- 1)$. On the other hand,
  $ \[ c \, t \( a \) \] = c thin #scale(x: 120%, y: 120%)[\(] t \( a \) c^(- 1) t \( a \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  The first factor belongs to a constant five-track representation, after adjoining two track labels to the three moved by $c$. The second belongs to its offset-frame conjugate and hence, by (57), to another five-slot representation. Both factors are in $N$, so $t \( v e_j - v e_i \) in N$.
  Such differences generate $B_m$. Only the fixed basis differences are needed for the finite generator list, and the finitely many instances of (69) are among the initial relations of Section 6 (they also follow from its additive and reindexing relations). This proves $N = hat(G)$ without assuming that any conjugating translation already belongs to $N$. ◻
]

#thm([Theorem 8.8.])[
  (A finitely presented central cover).  #emph[For all sufficiently large fixed finite $m$, there is a finitely presented group $hat(G)$ and a surjective homomorphism $pi : hat(G) arrow.r A_m$ whose kernel is central.]
] <thm:central-cover>

#proof[
  Choose $m$ beyond the fixed track requirements of the lifting and propagation arguments and $M_(upright("tr"))$. Choose the finite initial relation menu in the order specified in Sections 6 and 7. This produces the finitely presented group $hat(G)$ and the surjection $pi$; the transport lemmas have all been proved inside this group.
  Take $w in ker pi$, and write it as a finite word in the chosen generators and their inverses. Each conditional permutation letter can be written, using its initial finite group table, as a product of letters supported on five tracks. Thus we may regard every letter as either a five-track aligned element or a fixed balanced translation generator or its inverse. Write the resulting word as $w = g_n dots.h.c g_1$ and put $w_k = g_k dots.h.c g_1$, so that the letters act in the order $g_1 \, dots.h \, g_n$. Fix a configuration $S = \( U \; \( i_j \, u_j \)_(j = 1)^5 \)$.
  There is a finite polygonal partition $U = union.sq.big_alpha U_alpha$ such that, along every $w_k$ and for each of the five legs, its image on $U_alpha$ has one fixed track label and one fixed translation offset. To construct the partition, pull back the finitely many continuity pieces of each next letter along the five current partial translations and intersect with the pieces already obtained. The Boolean algebra is closed under these operations. Induction on the finite word length therefore gives a finite partition; there is no claimed bound on its number of pieces.
  On a nonempty $U_alpha$, follow the resulting five-slot tuple through successive letters. The images remain disjoint because every projected letter is a bijection. Lemma 43 applies to aligned letters and Lemma 44 to translation letters. Composing their exact conjugation identities gives
  #[#set math.equation(numbering: n => "(70)")
   $ w rho_(S \| U_alpha) \( s \) w^(- 1) = rho_(pi \( w \) \( S \| U_alpha \)) \( s \) . $ <eq:word-slot-transport>]
  Since $pi \( w \) = 1$, the terminal tuple equals the initial tuple parameterwise. In particular the terminal track labels are the same; the terminal offsets are the same in $Gamma$, since the translation action on $X$ is free. The right side of (70) is consequently $rho_(S \| U_alpha) \( s \)$.
  Multiply these identities over $alpha$ and use the exact refinement formula (64). We obtain $\[ w \, rho_S \( E^(*) \) \] = 1$ for every configuration $S$. Lemma 45 says that these images generate $hat(G)$, so $w in Z \( hat(G) \)$. Since $w$ was arbitrary, $ker pi subset.eq Z \( hat(G) \)$, as required. ◻
]

== 9 Finite presentation and the main theorem <sec:conclusion>

We now combine the two finiteness statements. Their separation is useful: finite generation of a Schur multiplier alone would not give finite presentation.

#thm([Lemma 9.1.])[
  #emph[Let $G$ be a group with finitely generated $H_2 \( G \; bb(Z) \)$. If there is a central extension 
$ 1 arrow.r K arrow.r E arrow.r G arrow.r 1 $

 with $E$ finitely presented, then $G$ is finitely presented.]
] <lem:kill-central-kernel>

#proof[
  The five-term exact sequence in integral group homology for this extension #cite(label("Weibel1994")) 6.8.3, p. 196 gives
  $ H_2 \( E \; bb(Z) \) arrow.r H_2 \( G \; bb(Z) \) arrow.r K arrow.r E_(upright("ab")) arrow.r G_(upright("ab")) arrow.r 0 . $
  Here the usual coinvariant term $K \/ \[ E \, K \]$ is $K$ because the kernel is central. The image of $H_2 \( G \; bb(Z) \)$ is a finitely generated abelian subgroup of $K$. Its quotient in $K$ embeds in the finitely generated abelian group $E_(upright("ab"))$, and hence is finitely generated as well. Thus $K$ is finitely generated abelian. Choose generators $k_1 \, dots.h \, k_s$ and represent them by words in a finite presentation of $E$. Adding these $s$ words as relators presents $E \/ K tilde.equiv G$, since a central subgroup generated by these elements is also their normal closure. ◻
]

#proof[
  Choose $lambda$ as in (3). Then choose a finite number $m$ of tracks large enough for both Theorem 12 and Theorem 46, including the fixed reserves used in the latter. These are finitely many requirements on $m$; none depends on the length of a later word or the size of a later polygon partition.
  Set $G = A_m$. Theorem 5 makes $G$ infinite, perfect, and simple. Theorem 6 makes $F_m$ amenable, and the subgroup passage proved there makes $G$ amenable in the stated Følner sense. Theorem 12 gives finite generation of $H_2 \( G \; bb(Z) \)$, while Theorem 46 gives a finitely presented central extension of $G$. Lemma 47 now proves that $G$ is finitely presented. These are all the required properties. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
