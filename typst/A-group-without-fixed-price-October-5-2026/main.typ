#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A group without fixed price]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

The cost of an action measures how many edges, on average, are needed to connect its orbits. More precisely, let a countable group $Gamma$ act by measure-preserving Borel automorphisms on a standard probability space $\( X \, mu \)$. We use right actions, so $\( x g \) h = x \( g h \)$. Its orbit relation is

$ cal(R) = { \( x \, x g \) : x in X \, med g in Gamma } . $

A #emph[graphing] $cal(E)$ of $cal(R)$ is a countable family of measure-preserving Borel bijections between Borel subsets of $X$, with graphs contained in $cal(R)$. It generates $cal(R)$ if finite paths in these maps and their inverses connect all related points on a conull set. Its cost $C \( cal(E) \)$ is the sum of its domain measures; $"Cost" \( cal(R) \)$ is the infimum of these sums over generating graphings. An action is #emph[essentially free] if each nonidentity group element fixes a null set. A group has #emph[fixed price] if all its essentially free probability-measure-preserving (p.m.p.) actions have the same cost.

Levitt introduced cost #cite(label("levitt-1995")). Gaboriau developed its connections with group theory and the fixed-price problem #cite(label("gaboriau-2000")). His work shows, in particular, that free groups have fixed price equal to their rank, and establishes fixed price one for many groups with commuting or amenable structure. Recent results include the fixed-price-one theorem for products of two infinite countable groups #cite(label("khezeli-2026-v4")), metric and infinite-measure action criteria #cite(label("bevilacqua-bowen-2025-v1")), and a criterion based on small product neighborhoods of finite subsets #cite(label("slutsky-2026-v1")). We give a group for which fixed price fails.

=== 1.1 The group and the two actions <the-group-and-the-two-actions>

Let

$ A = F \( a \, b_1 \, dots.h \, b_99 \) \, #h(2em) w = a b_1 a b_2 dots.h.c a b_99 a \, #h(2em) J = chevron.l b_1 \, dots.h \, b_99 \, w chevron.r lt.eq A . $

Let $chevron.l t chevron.r$ be infinite cyclic and set

#[#set math.equation(numbering: n => "(1)")
 $ Gamma = A *_J \( J times chevron.l t chevron.r \) . $ <intro:group>]

The homomorphism $chi : Gamma arrow.r bb(Z)$ given by $chi \( a \) = 1$ and $chi \( b_i \) = chi \( t \) = 0$ is well defined; note that $chi \( w \) = 100$. On the Bernoulli probability space $X_0 = \[ 0 \, 1 \]^Gamma$ with product Lebesgue measure, let

$ \( x g \) \( h \) = x \( g h \) . $

Let $X subset.eq X_0$ be the invariant conull set of points with trivial stabilizer, equipped with the restricted probability measure. For an integer $M > 100$, give $Y_M = X times bb(Z) \/ M bb(Z)$ product measure with uniform height coordinate, and define

$ \( x \, r \) g = \( x g \, r + chi \( g \) med mod med M \) . $

Both actions are free; restriction from $X_0$ to $X$ preserves cost. Their elementary group-theoretic and measure-theoretic properties are proved in Section 2.

#thm([Theorem 1.1.])[
  #emph[Put $K = e^96 96^99 \/ 95^95$, choose 
$ 0 < alpha < 1 \/ 200 \, #h(2em) K alpha^3 < 1 \/ 2 \, #h(2em) eta = alpha \/ 100 . $

 For the group and actions just defined, 
$ "Cost" \( cal(R)_(Gamma arrow.cw.half X) \) gt.eq 1 + eta \, #h(2em) "Cost" \( cal(R)_(Gamma arrow.cw.half Y_M) \) lt.eq 1 + 99 / M quad \( M > 100 \) . $

 In particular, choosing an integer $M > max { 100 \, 99 \/ eta }$ gives two essentially free p.m.p. actions of the same finitely generated group with strictly different costs. Thus the general fixed-price assertion is false.]
] <intro:main>

=== 1.2 How the proof works <how-the-proof-works>

The upper bound uses the finite height coordinate. All $t$-edges, together with the generators of $J$ on a small set meeting every $t$-orbit, generate the $J times chevron.l t chevron.r$ relation at cost arbitrarily close to one. It remains to add $a$-edges. The relation $w = a b_1 dots.h.c a b_99 a$ propagates $a$-edges from any $99$ consecutive heights to the next height, so an initial cost $99 \/ M$ is enough.

For the lower bound, write $cal(R)_A$ and $cal(R)_J$ for the restricted orbit relations on $X$, and define the relative quantity

$ delta_X = inf { C \( cal(E) \) : cal(R)_J or cal(E) = cal(R)_A \, med cal(E) subset.eq cal(R)_A } . $

Here $C \( cal(E) \)$ is the graphing cost, and the join denotes the relation generated by the supplied $cal(R)_J$-steps and the edges of $cal(E)$. Three steps give the desired bound:

+ #emph[Deploy and compress graphings.] Subdivide a nearly optimal $Gamma$-graphing into factor edges on a larger finite-measure space. Repeated compression makes more of the $J$-relation available and recovers its exact saved cost. Amalgam normal form then gives $"Cost" \( cal(R)_Gamma \) gt.eq 1 + delta_X$. The construction follows Gaboriau’s deployment method #cite(label("gaboriau-2000")) § IV.28–IV.32 and Proposition IV.35; Sections 3–4 prove the required relative estimate directly.
+ #emph[Pass to finite permutation models.] Put $u_0 = 1$ and $u_i = u_(i - 1) a b_i$ for $1 lt.eq i lt.eq 99$. A finite set $V$ with a right $A$-action by permutations defines a group whose symbols record $a$-steps, while all $J$-steps are assigned the identity:
  $ D_V = chevron.l x_v med \( v in V \) divides x_v x_(v u_1) dots.h.c x_(v u_99) = 1 med \( v in V \) chevron.r . $
  Write $"rk" \( D_V \)$ for its minimum number of generators. Local approximation of Bernoulli graphings gives $delta_X gt.eq limsup "rk" \( D_V \) \/ \| V \|$ along any asymptotically free sequence of such models, meaning that each fixed nonidentity element of $A$ fixes a fraction of points tending to zero. The displayed row makes $w$ trivial in this encoding. In Section 5, random permutations supply models with strong expansion and few overlapping relators.
+ #emph[Bound the rank by shortening a labelled graph.] The expansion property forces $"rk" \( D_V \) > eta \| V \|$ for large models. A minimal labelled graph representing a generating set would otherwise contain a long relator segment that could be replaced by a shorter path. This uses the Arzhantseva–Ol’shanskii method #cite(label("arzhantseva-olshanskii-1996")) #cite(label("kapovich-schupp-2002")). The additional ingredients are a saturation procedure for exceptional letters and a planar word lemma over an arbitrary coefficient group, proved in Sections 6 and 7.

The proof isolates three estimates beyond this example: compression relative to a supplied equivalence relation, a transfer from Bernoulli graphings to ranks of finitely presented groups, and a deterministic rank bound from expansion with sparse overlaps. Their statements specify their own inputs and conclusions. The coefficient group is the actual subgroup generated by the letters absorbed during saturation. It need not be finitely presented: all relations true in that subgroup are retained, so its injection into the presented group is part of the construction. The planar lemma keeps track of these coefficient values while counting only the remaining letters.

== 2 The group and an action of small cost <actions:section>

We construct the group and two free probability-measure-preserving actions that will be compared. The purpose of this section is to prove the upper bound for the action with an additional finite height coordinate. All actions are right actions: $\( z g \) h = z \( g h \)$.

=== 2.1 The amalgam <the-amalgam>

Let $A = F \( a \, b_1 \, dots.h \, b_99 \)$ be the free group on the displayed generators. Define words in $A$ by

$ u_0 = 1 \, #h(2em) u_i = u_(i - 1) a b_i quad \( 1 lt.eq i lt.eq 99 \) \, #h(2em) w = u_99 a . $

Let

#[#set math.equation(numbering: n => "(2)")
 $ J = chevron.l b_1 \, dots.h \, b_99 \, w chevron.r lt.eq A \, #h(2em) B = J times chevron.l t chevron.r \, #h(2em) Gamma = A *_J B \, $ <actions:group>]

where $chevron.l t chevron.r$ is infinite cyclic and the embedding of $J$ in $B$ is $j mapsto \( j \, 1 \)$.

#thm([Lemma 2.1.])[
  #emph[The factors $A$ and $B$ embed in $Gamma$ with intersection $J$. If $g_1 \, dots.h \, g_n$ lie alternately in $A \\ J$ and $B \\ J$, then $g_1 dots.h.c g_n in.not J$ for $n gt.eq 1$, and $g_1 dots.h.c g_n$ belongs to neither factor for $n gt.eq 2$. The group $J$ is free on $b_1 \, dots.h \, b_99 \, w$; in particular it is infinite. The group $Gamma$ is countably infinite and generated by $a \, b_1 \, dots.h \, b_99 \, t$.]
] <actions:normal-form>

#proof[
  Choose, in each factor, representatives for the cosets $g J$, with $1$ representing $J$. Consider formal strings
  $ r_1 dots.h.c r_n j \, #h(2em) j in J \, $
  where the $r_i$ are nonidentity representatives, alternately from the two factors; the case $n = 0$ is allowed. Define right multiplication by $g$ in one factor as follows. If the last representative is from that factor, combine it with the final $j$ and $g$, and write their product uniquely as $r j'$ in that factor. Otherwise write $j g = r j'$ and append $r$. Omit $r$ when $r = 1$.
  This gives a right action of each factor on the strings. To check the action law for two successive multipliers in the same factor, retain the prefix ending in the other factor and simply multiply the remaining suffix in the chosen factor. This description continues to apply when the suffix representative becomes $1$. The two actions agree for multipliers in $J$, which only multiply the final $J$-entry. They therefore define an action of the amalgam on the strings.
  Acting on the identity string by a factor element recovers its coset decomposition, so the factors embed. Their possible strings intersect exactly in the strings with no representatives, proving $A ∩ B = J$. Successively multiplying by an alternating sequence outside $J$ adds one nonidentity representative at every step: for $j in J$ and $g in.not J$, one has $j g in.not J$. The resulting string has length $n$, whereas elements of $J$ have length zero and factor elements have length at most one. This proves the stated normal-form assertions.
  For $J$, expand any reduced nonempty word in the abstract generators $b_1 \, dots.h \, b_99 \, w$ in the free basis of $A$. The word $w = a b_1 a b_2 dots.h.c a b_99 a$ starts and ends with $a$; $w^(- 1)$ starts and ends with $a^(- 1)$. No boundary between a $b_i^(plus.minus 1)$ and $w^(plus.minus 1)$ cancels. Two successive $w$-symbols either have equal signs, in which case their boundary does not cancel, or would be inverse symbols, which reducedness excludes. Boundaries between $b$-symbols do not cancel either. Thus the expansion is a nonempty reduced word in $A$, proving that the displayed generators of $J$ are a free basis.
  Finally, the displayed generators of $Gamma$ generate both factors; the embedded copy of $A$ makes $Gamma$ infinite, and finite generation makes it countable. The embedded copy of $B$ also shows that $t$ has infinite order in $Gamma$. ◻
]

=== 2.2 Probability spaces and the two actions <probability-spaces-and-the-two-actions>

We use the definitions of graphing, cost, and p.m.p. action from the introduction. A standard Borel space is a measurable space isomorphic to a Borel subset of a complete separable metric space. For a subgroup $L lt.eq Gamma$, write $cal(R)_L$ for its orbit relation on the space being considered.

For an essentially free action of a countable group, the set of points with trivial stabilizer is a Borel invariant conull set. Restricting to this set makes the action pointwise free and preserves the measure and orbit-relation cost. More generally, a Borel conull set can be made invariant by intersecting its countably many translates. To see that an invariant conull restriction preserves cost, restrict any orbit graphing to that set; invariance keeps its edges inside the set, and domain measures do not change. Conversely, a graphing on the restricted set generates the original relation on a conull set and has the same cost when viewed on the original space.

Let

$ X_0 = \[ 0 \, 1 \]^Gamma \, #h(2em) mu_0 = "Leb"^Gamma \, #h(2em) \( x g \) \( h \) = x \( g h \) quad \( g \, h in Gamma \) . $

This is a standard Borel probability space, since it is a countable product of compact metrizable spaces, with its product measure. Coordinate permutations are Borel automorphisms preserving $mu_0$, and the displayed formula satisfies the right-action law. For $g eq.not 1$, the equality $x g = x$ implies $x \( g \) = x \( 1 \)$. These are two independent uniform coordinates, so this equality has probability zero. Consequently

$ X = { x in X_0 : x g eq.not x upright(" for every ") g eq.not 1 } $

is an invariant Borel conull set. Write $mu$ for the restricted probability measure. We henceforth use the free Bernoulli action on $\( X \, mu \)$; it has the same orbit-relation cost as the original action on $\( X_0 \, mu_0 \)$.

#thm([Lemma 2.2.])[
  #emph[There is a homomorphism $chi : Gamma arrow.r bb(Z)$ with 
$ chi \( a \) = 1 \, #h(2em) chi \( b_i \) = chi \( t \) = 0 . $

 It satisfies $chi \( u_i \) = i$ and $chi \( w \) = 100$. For every positive integer $M$, the action on 
$ Y_M = X times bb(Z) \/ M bb(Z) \, #h(2em) nu_M = mu times upright("uniform measure") \, $

 defined by 
#[#set math.equation(numbering: n => "(3)")
 $ \( x \, r \) g = \( x g \, r + chi \( g \) med mod med M \) $ <actions:product-action>]

 is free and p.m.p. on a standard Borel probability space.]
] <actions:height>

#proof[
  The exponent sum of $a$ defines a homomorphism $chi_A : A arrow.r bb(Z)$. Define $chi_B \( j t^n \) = chi_A \( j \)$ on $B = J times chevron.l t chevron.r$. This is a homomorphism and agrees with $chi_A$ on $J$, so the amalgam’s universal property gives $chi$. The formulas for $u_i$ and $w$ follow by their definitions. In particular, the restriction of $chi$ to $J$ need not be zero: it sends $w$ to $100$. The homomorphism law verifies the right-action law in (3). Both coordinate actions preserve their measures. Freeness follows from freeness on the first coordinate, and the finite product remains standard Borel. ◻
]

=== 2.3 A graphing on the height extension <a-graphing-on-the-height-extension>

The direct-product factor $B$ can be generated at arbitrarily small cost above one by retaining all $t$-edges and using the generators of $J$ on a small set meeting every $t$-orbit. This is the product construction in Gaboriau’s Proposition VI.23 #cite(label("gaboriau-2000")) Proposition VI.23. For our Bernoulli action the small set has the following explicit description.

#thm([Lemma 2.3.])[
  #emph[For every $0 < p < 1$ and every positive integer $M$, there is a Borel set $C_p subset.eq Y_M$ of measure $p$ meeting every $chevron.l t chevron.r$-orbit. The graphing consisting of $t$ on all of $Y_M$ and $b_1 \, dots.h \, b_99 \, w$ restricted to $C_p$ generates $cal(R)_B$ and has cost $1 + 100 p$.]
] <actions:small-marker>

#proof[
  In $X$, put
  $ N_p = { x in X : x \( t^n \) gt.eq p upright(" for every ") n in bb(Z) } \, #h(2em) C_p = \( { x in X : x \( 1 \) < p } union N_p \) times bb(Z) \/ M bb(Z) . $
  The set $N_p$ is Borel, invariant under $t$, and null: the coordinates $x \( t^n \)$ are independent, and the group elements $t^n$ are distinct. Indeed, the probability that the condition holds for $0 lt.eq n < N$ is $\( 1 - p \)^N$. Thus $nu_M \( C_p \) = p$. If a $t$-orbit does not meet the first part of $C_p$, all its points belong to $N_p times bb(Z) \/ M bb(Z)$. Hence $C_p$ meets every $t$-orbit, including the exceptional ones.
  Let $j$ be one of $b_1 \, dots.h \, b_99 \, w$, and let $z in Y_M$. Choose $n in bb(Z)$ with $z t^n in C_p$. The graphing contains the path
  $ z arrow.r z t^n arrow.r z t^n j arrow.r z t^n j t^(- n) = z j \, $
  where the first and last portions use $t$ or $t^(- 1)$. The final identity uses $j t = t j$ in $B$. Thus every generator of $B$ is available everywhere in the generated relation. Conversely, all the graphing’s maps are restrictions of elements of $B$. Each of the $100$ restricted generators costs $p$, and the full $t$-map costs one. ◻
]

#thm([Proposition 2.4.])[
  #emph[For every integer $M > 100$, the free p.m.p. action $Gamma arrow.cw.half \( Y_M \, nu_M \)$ of (3) satisfies 
$ "Cost" \( cal(R)_(Gamma arrow.cw.half Y_M) \) lt.eq 1 + 99 / M . $

]
] <actions:low>

#proof[
  Fix $0 < p < 1$ and use the graphing of Lemma 4. Add the restriction of $a$ to the union of the height fibers $0 \, 1 \, dots.h \, 98$. Its domain has measure $99 \/ M$, so the resulting graphing has cost
  $ 1 + 100 p + 99 / M . $
  Let $E$ be the equivalence relation it generates. It contains $cal(R)_B$, and we will prove that it contains every $a$-edge.
  Suppose that $\( z \, z a \) in E$ whenever the height of $z$ is one of $k \, k + 1 \, dots.h \, k + 98$, interpreted modulo $M$. Given $z$ at height $k + 99$, set $y = z u_99^(- 1)$, which has height $k$. The sequence
  $ y = y u_0 \, quad y u_1 \, quad dots.h \, quad y u_99 = z $
  is connected by $E$: at its $i$th step apply $a$ to $y u_(i - 1)$, of height $k + i - 1$, and then apply $b_i$. The $a$-edge is among those assumed available, and the $b_i$-edge belongs to $cal(R)_B$. The $w$-edge also belongs to $cal(R)_B$, and
  $ y w = y u_99 a = z a . $
  Thus $z$ and $z a$ are $E$-equivalent, proving the implication from $99$ consecutive known source heights to the next one.
  The heights $0 \, dots.h \, 98$ are known initially. Apply this implication for the ordinary integers $k = 0 \, 1 \, dots.h \, M - 100$. It successively supplies source heights $99 \, 100 \, dots.h \, M - 1$; the last $a$-edges end at height $0$ modulo $M$, as required. Hence all $a$-edges lie in $E$. Since $B$ and $a$ generate $Gamma$, this graphing generates $cal(R)_Gamma$. Taking the infimum over graphings and then letting $p arrow.b 0$ proves the bound. ◻
]

== 3 Compressing a graphing after enlarging a supplied relation <compression:section>

This section proves a cost estimate for replacing part of a graphing by a larger relation whose edges are supplied without charge. The measure on the underlying space is finite and need not be a probability measure.

Let $\( Z \, lambda \)$ be a standard Borel space with a finite Borel measure. Let $cal(R)$ be a Borel equivalence relation covered by the graphs of countably many measure-preserving Borel partial isomorphisms $\( psi_j \)_(j gt.eq 1)$. A partial isomorphism means a Borel bijection between Borel subsets with Borel inverse. For a Borel subrelation $cal(U)$ of $cal(R)$ and a Borel set $W subset.eq Z$, put

$ kappa \( cal(U) \; W \) = integral_W frac(1, \| \[ z \]_(cal(U)) \|) thin d lambda \( z \) \, #h(2em) kappa \( cal(U) \) = kappa \( cal(U) \; Z \) \, $

where the reciprocal of an infinite class size is zero. A set is $cal(U)$-complete if it meets every $cal(U)$-class. All relations in this section are pointwise Borel relations. When an application starts with identities holding almost everywhere, it may first remove the $cal(R)$-saturation of the exceptional null set. That saturation is Borel and null because the maps $psi_j$ are measure-preserving.

=== 3.1 Borel selections and small complete sets <borel-selections-and-small-complete-sets>

We record the elementary measurability facts used in the construction. Restricting $psi_j$ to the set where $\( z \, psi_j \( z \) \) in cal(U)$ gives an enumeration of any Borel subrelation $cal(U)$. Its saturations of Borel sets are therefore countable unions of Borel images and are Borel. Its class-size function is Borel as well: having at least $k$ class members is a countable union over $k$-tuples of enumeration values that are defined and pairwise distinct.

Every Borel partial isomorphism $h$ with graph in $cal(R)$ preserves measure. Indeed, partition its domain according to the first index $j$ for which $h \( z \) = psi_j \( z \)$. Each restriction preserves measure, and the images of the pieces are disjoint because $h$ is injective.

Fix a Borel linear order on $Z$, obtained from a Borel injection into the real line. Nonempty finite subsets have least points. For a Borel relation with finite classes, selecting this least point is Borel: among the countably enumerated candidates, the condition that none is smaller is Borel. The same observation applies to nonempty Borel subsets of finite classes and to the successive points in their ordered lists.

#thm([Lemma 3.1.])[
  (Finite-class counting).  #emph[Let $W subset.eq Z$ be a Borel $cal(U)$-invariant set all of whose $cal(U)$-classes are finite. If $B subset.eq W$ is Borel and meets each such class exactly once, then 
$ lambda \( B \) = kappa \( cal(U) \; W \) . $

]
] <compression:counting>

#proof[
  On the part $W_k$ consisting of classes of size $k$, order each class into $k$ Borel sheets. The map from $B ∩ W_k$ to any one sheet that stays within each class is a Borel partial isomorphism inside $cal(R)$, so all $k$ sheets have measure $lambda \( B ∩ W_k \)$. Thus $lambda \( W_k \) = k lambda \( B ∩ W_k \)$. Summing over $k$ proves the identity. ◻
]

#thm([Lemma 3.2.])[
  (Small complete sets).  #emph[For every Borel subrelation $cal(T) subset.eq cal(R)$ and every $epsilon > 0$, there is a Borel $cal(T)$-complete set $M subset.eq Z$ such that 
$ lambda \( M \) lt.eq kappa \( cal(T) \) + epsilon . $

]
] <compression:complete-set>

#proof[
  On the union $Z_(upright("fin"))$ of finite $cal(T)$-classes, choose the least point of each class. The resulting Borel set $M_(upright("fin"))$ has measure $kappa \( cal(T) \)$ by Lemma 6.
  On $Z_(upright("inf")) = Z \\ Z_(upright("fin"))$, choose increasing finite Borel partitions $cal(P)_n$ that separate all points, for example those generated by the first $n$ members of a countable separating Borel family. Let $k_n \( z \)$ be the number of atoms of $cal(P)_n$ meeting $\[ z \]_(cal(T))$. This function is Borel, and $k_n \( z \) arrow.r oo$: any prescribed finite collection of distinct points in the infinite class is separated by some partition.
  Fix $0 < p < 1$ with $p lambda \( Z_(upright("inf")) \) < epsilon \/ 2$. At a fixed level $n$, mark each atom independently with probability $p$, and let $A$ be the union of the marked atoms. The Borel set
  $ M_(upright("inf")) = A union #scale(x: 120%, y: 120%)[\(] Z_(upright("inf")) \\ \[ A \]_(cal(T)) #scale(x: 120%, y: 120%)[\)] $
  meets every infinite $cal(T)$-class for every marking. The displayed union is disjoint, and
  $ bb(E) lambda \( M_(upright("inf")) \) = p lambda \( Z_(upright("inf")) \) + integral_(Z_(upright("inf"))) \( 1 - p \)^(k_n \( z \)) thin d lambda \( z \) . $
  The integral tends to zero by dominated convergence. For sufficiently large $n$ the expectation is less than $epsilon$, so one of the finitely many markings has measure less than $epsilon$. Fix that marking and set $M = M_(upright("fin")) union M_(upright("inf"))$. ◻
]

=== 3.2 Compression and its cost <compression-and-its-cost>

For a countable family $cal(E) = \( phi_i : D_i arrow.r E_i \)$ of measure-preserving Borel partial isomorphisms, write $C \( cal(E) \) = sum_i lambda \( D_i \)$. The join $cal(S) or cal(E)$ denotes the equivalence relation generated by $cal(S)$ and all pairs $\( x \, phi_i \( x \) \)$.

#thm([Lemma 3.3.])[
  (Compression).  #emph[ On the finite-measure space $\( Z \, lambda \)$ with the ambient relation $cal(R)$ described above, suppose $cal(S) subset.eq cal(T) subset.eq cal(Q) subset.eq cal(R)$ are Borel equivalence relations and $cal(Q) = cal(S) or cal(E)$, where $cal(E)$ is a countable family of measure-preserving Borel partial isomorphisms with finite total cost. For every $epsilon > 0$ there is a countable family $cal(F)$ of measure-preserving Borel partial isomorphisms inside $cal(Q)$ such that 
#[#set math.equation(numbering: n => "(4)")
 $ cal(Q) = cal(T) or cal(F) \, #h(2em) C \( cal(F) \) lt.eq C \( cal(E) \) - kappa \( cal(S) \) + kappa \( cal(T) \) + epsilon . $ <compression:bound>]

]
] <compression:main>

#proof[
  Choose a Borel $cal(T)$-complete set $M$ from Lemma 7, and put
  $ Y = \[ M \]_(cal(S)) union { z : \| \[ z \]_(cal(S)) \| = oo } . $
  This set is Borel and $cal(S)$-invariant. It is $cal(T)$-complete and hence $cal(Q)$-complete, since it contains $M$. Every $cal(S)$-class outside $Y$ is finite. In each finite $cal(S)$-class in $Y$, choose a point of its intersection with $M$. Lemma 6 gives
  #[#set math.equation(numbering: n => "(5)")
   $ kappa \( cal(S) \; Y \) lt.eq lambda \( M \) . $ <compression:retained-classes>]
  ===== 3.2.1 Choosing and deleting one edge per class outside $Y$. <choosing-and-deleting-one-edge-per-class-outside-y.>
  Let $d \( z \)$ be the least number of edges from $cal(E)$, in either direction, needed to reach $Y$, allowing $cal(S)$-steps for free. This distance is finite because $Y$ is $cal(Q)$-complete. Its sublevel sets are Borel: starting with $Y$, successively take images under the maps of $cal(E)$ and their inverses, and take $cal(S)$-saturations. It is constant on $cal(S)$-classes and vanishes precisely on $Y$.
  For every $cal(S)$-class $K$ outside $Y$, choose an oriented edge instance from $y_K in K$ to $y'_K$ with $d \( y'_K \) = d \( K \) - 1$. Such an instance exists by a shortest path. To make the choice Borel, first choose the least eligible pair consisting of a map index and a direction, then choose the least eligible point in the finite class $K$. Eligibility of a map index and direction is detected by the $cal(S)$-saturation of a Borel set. Thus all these choices are Borel. The set $V = { y_K }$ is a Borel transversal of $cal(S)$ on $Z \\ Y$, so
  #[#set math.equation(numbering: n => "(6)")
   $ lambda \( V \) = kappa \( cal(S) \; Z \\ Y \) . $ <compression:selector-cost>]
  For each original map $phi_i : D_i arrow.r E_i$, let $V_i^(+)$ be the chosen origins whose edge is traversed forward under $phi_i$, and let $V_i^(-)$ be those whose edge is traversed under $phi_i^(- 1)$. Delete the domain set
  $ H_i = V_i^(+) union phi_i^(- 1) \( V_i^(-) \) $
  from $D_i$. The union is disjoint: a labeled edge instance chosen in both directions would make each endpoint class have smaller distance than the other. The sets $V_i^(+) \, V_i^(-)$ partition $V$, and inverse images under $phi_i$ preserve measure. Consequently the residual family $cal(E)' = \( phi_i \|_(D_i \\ H_i) \)$ satisfies the exact identity
  #[#set math.equation(numbering: n => "(7)")
   $ C \( cal(E)' \) = C \( cal(E) \) - sum_i lambda \( H_i \) = C \( cal(E) \) - kappa \( cal(S) \; Z \\ Y \) . $ <compression:deleted-cost>]
  Different original indices count as different edge instances, even when their geometric edges coincide. Thus this accounting also covers graphings with repetitions.
  ===== 3.2.2 Moving the remaining edges into $Y$. <moving-the-remaining-edges-into-y.>
  Define $f : Z arrow.r Y$ by $f \( x \) = x$ for $x in Y$, and, for $x$ in an $cal(S)$-class $K$ outside $Y$, by
  $ f \( x \) = f \( y'_K \) . $
  The recursion decreases the integer distance at every step. Defining $f$ successively on the distance levels proves it is Borel. Each $\( x \, f \( x \) \)$ lies in $cal(Q)$. Because $Y$ is $cal(S)$-invariant, $f$ fixes each class inside $Y$ pointwise and is constant on each class outside $Y$. It therefore sends $cal(S)$-steps to $cal(S)$-steps. Each deleted edge has equal images at its two endpoints.
  The map $f$ can be many-to-one. To obtain partial isomorphisms after moving the remaining edges, we must split their domains at both endpoints. Fix a residual edge map $phi_i$ with domain $D'_i$. Partition $D'_i$ into Borel pieces $P_(i \, r \, s)$ according to the least indices $r \, s$ for which
  $ f \( x \) = psi_r \( x \) \, #h(2em) f \( phi_i \( x \) \) = psi_s \( phi_i \( x \) \) . $
  These indices exist because the graph of $f$ is contained in $cal(Q) subset.eq cal(R)$. On this piece the pushed edge is the partial isomorphism
  $ hat(phi)_(i \, r \, s) = psi_s compose phi_i compose psi_r^(- 1) : psi_r \( P_(i \, r \, s) \) arrow.r psi_s \( phi_i \( P_(i \, r \, s) \) \) . $
  Its domain and range are Borel, it preserves measure, and its graph is contained in $cal(Q) \| Y$. Its cost equals $lambda \( P_(i \, r \, s) \)$. Let $cal(F)$ consist of all these maps. Although the images of distinct pieces may overlap, graphing cost is the sum over the indexed family, and the original pieces partition each $D'_i$. Hence
  #[#set math.equation(numbering: n => "(8)")
   $ C \( cal(F) \) = sum_(i \, r \, s) lambda \( P_(i \, r \, s) \) = C \( cal(E)' \) . $ <compression:pushed-cost>]
  One may discard identity maps or redundant instances, in which case the equality becomes an inequality in the needed direction.
  ===== 3.2.3 Recovering the relation. <recovering-the-relation.>
  For two $cal(Q)$-related points in $Y$, take a finite path with steps in $cal(S)$ and $cal(E)$ and apply $f$ to its vertices. The endpoints remain fixed. Each $cal(S)$-step remains such a step, each deleted edge becomes stationary, and each surviving edge becomes an edge of $cal(F)$. Therefore
  $ cal(Q) \| Y = \( cal(S) \| Y \) or cal(F) . $
  For arbitrary $x cal(Q) x'$, choose $y in \[ x \]_(cal(T)) ∩ Y$ and $y' in \[ x' \]_(cal(T)) ∩ Y$ using completeness of $Y$. Then $y cal(Q) y'$, so the preceding identity joins them using $cal(S) subset.eq cal(T)$ and $cal(F)$. Together with the first and last $cal(T)$-steps this proves $cal(Q) = cal(T) or cal(F)$.
  Finally, by (5), (7), and (8),
  $ C \( cal(F) \) & lt.eq C \( cal(E) \) - kappa \( cal(S) \; Z \\ Y \)\
 & = C \( cal(E) \) - kappa \( cal(S) \) + kappa \( cal(S) \; Y \)\
 & lt.eq C \( cal(E) \) - kappa \( cal(S) \) + lambda \( M \)\
 & lt.eq C \( cal(E) \) - kappa \( cal(S) \) + kappa \( cal(T) \) + epsilon . $
  This is (4). ◻
]

#thm([Corollary 3.4.])[
  #emph[A countable p.m.p. Borel equivalence relation on a standard probability space, all of whose classes are infinite, has cost at least one.]
] <compression:cost-one>

#proof[
  Let $cal(E)$ be a finite-cost generating graphing of the relation $cal(Q)$. Apply Lemma 8 with $cal(S) = upright("id")$ and $cal(T) = cal(Q)$. Since $kappa \( cal(S) \) = 1$ and $kappa \( cal(Q) \) = 0$, it gives $0 lt.eq C \( cal(F) \) lt.eq C \( cal(E) \) - 1 + epsilon$ for every $epsilon > 0$. Thus $C \( cal(E) \) gt.eq 1$. Infinite-cost graphings satisfy this bound as well; taking the infimum proves the assertion. ◻
]

#prodef([Remark 3.5.])[
  The estimate uses the original finite measure throughout; in particular $kappa \( upright("id")_Z \) = lambda \( Z \)$. The output graphing stays inside the same relation $cal(Q)$, but no inclusion between the original and replacement edge families is asserted. These are the two features needed when applying the lemma repeatedly on an enlarged space.
] <compression:normalization>

== 4 Deployment and a relative cost lower bound <deployment:section>

We next turn a graphing of an amalgamated product action into a graphing of one factor with the amalgamating relation supplied for free. The construction is Gaboriau’s deployment of a graphing #cite(label("gaboriau-2000")) § IV.28–IV.32, specialized to finitely many sheets. The compression lemma accounts for its cost. Throughout this section, $Gamma = A *_J B$ is finitely generated, $J$ is infinite, and $Gamma$ acts essentially freely by measure-preserving Borel automorphisms on a standard probability space $\( X \, mu \)$. We use right actions and write $cal(R)_L$ for the orbit relation of a subgroup $L lt.eq Gamma$. Define

$ delta_X = inf { C \( cal(E) \) : cal(E) upright(" is a graphing in ") cal(R)_A \, quad cal(R)_J or cal(E) = cal(R)_A #scale(x: 120%, y: 120%)[}] . $

Thus only the edges added to $cal(R)_J$ are charged in $delta_X$.

#thm([Proposition 4.1.])[
  #emph[Let $Gamma = A *_J B$ be finitely generated, let $J$ be infinite, and let $Gamma$ act essentially freely and p.m.p. on a standard probability space $\( X \, mu \)$. If $delta_X$ is the infimum cost of graphings that generate $cal(R)_A$ together with the supplied relation $cal(R)_J$, then 
$ "Cost" \( cal(R)_Gamma \) gt.eq 1 + delta_X . $

]
] <deployment:main>

We prove the proposition using graphings at finite stages. The only limit will concern the sizes of increasing equivalence classes. We first pass to an invariant conull Borel set on which the action is free. Generation identities may also be made exact after removing countably many null sets and their saturations under the ambient countable p.m.p. relation. These restrictions leave all costs unchanged.

=== 4.1 A finite graphing and its subdivision <deployment:finite>

Fix $rho > 0$. There is a finite generating graphing of $cal(R)_Gamma$, consisting of restrictions of nonidentity group translations, whose cost $c$ satisfies

#[#set math.equation(numbering: n => "(9)")
 $ c < "Cost" \( cal(R)_Gamma \) + rho . $ <deployment:near-optimal>]

Here is the approximation argument. Start with a countable generating graphing of cost less than $"Cost" \( cal(R)_Gamma \) + rho \/ 2$, and split each map into disjoint Borel pieces according to its group displacement. This does not change its cost; discard identity restrictions, which can only lower it. Let $Psi_N$ be the first $N$ maps of the resulting graphing and let $T_N$ be their generated relation. For a fixed finite generating set $K$ of $Gamma$ not containing the identity, put

$ D_(N \, s) = { x in X : \( x \, x s \) in.not T_N } \, #h(2em) s in K . $

Each set is Borel because membership in $T_N$ is witnessed by a finite path. For each $s$, these sets decrease to a null set, so $sum_(s in K) mu \( D_(N \, s) \) arrow.r 0$. Adding the translation by $s$ on $D_(N \, s)$, for every $s in K$, gives a finite generating graphing and proves (9) for large $N$.

Write its maps as $x mapsto x g_h$ on Borel domains $D_h$, with $h$ in a finite index set. Choose a factor word

$ g_h = g_(h \, 1) dots.h.c g_(h \, ell_h) \, #h(2em) g_(h \, i) in A union B \, quad ell_h gt.eq 1 . $

For letters in $J$, choose either factor type. Form a space $Z$ by adjoining $ell_h - 1$ disjoint copies of $D_h$ to $X$, one for each internal vertex of this word. Give each copy its inherited measure and denote the resulting, unnormalized measure by $lambda$. Then

$ lambda \( Z \) = 1 + sum_h \( ell_h - 1 \) mu \( D_h \) < oo . $

Define $P : Z arrow.r X$ to be the identity on $X$, and on the copy indexed by $\( h \, i \)$ define

$ P \( x \, h \, i \) = x g_(h \, 1) dots.h.c g_(h \, i) . $

The restriction of $P$ to each sheet is a measure-preserving Borel bijection onto its image. For $L = Gamma \, A \, B \, J$, let

$ overline(cal(R))_L = { \( z \, z' \) in Z^2 : \( P z \, P z' \) in cal(R)_L } . $

These are countable p.m.p. Borel equivalence relations. Indeed, if $P_r$ and $P_s$ denote the restrictions to two sheets, the partial maps $P_s^(- 1) compose \( x mapsto x ell \) compose P_r$, for $ell in L$, enumerate their pairs and preserve measure on their natural domains.

Replace each original edge by the chain through its new vertices, and divide the successive edges according to their factor types into $cal(E)_A^0$ and $cal(E)_B^0$. Every chain edge belonging to the $h$-th map has cost $mu \( D_h \)$, so

#[#set math.equation(numbering: n => "(10)")
 $ C \( cal(E)_A^0 \) + C \( cal(E)_B^0 \) = c + lambda \( Z \) - 1 . $ <deployment:initial-cost>]

Their join is $overline(cal(R))_Gamma$. To verify this, first connect base-sheet points by replacing paths in the original graphing by their subdivided paths. Every additional point is attached along its chain to a base-sheet point in the same projected orbit. This also connects arbitrary pairs in the pullback relation.

=== 4.2 Increasing the supplied relation <deployment:iteration>

Set $S_0 = upright("id")_Z$. We construct relations $S_n subset.eq overline(cal(R))_J$ and graphings $cal(E)_i^n subset.eq overline(cal(R))_i$, for $i = A \, B$, and put

$ Q_i^n = S_n or cal(E)_i^n . $

Fix $epsilon.alt > 0$, and choose positive errors $e_n$ with $sum_(n gt.eq 0) e_n < epsilon.alt$. At stage $n$, choose $i = A$ or $B$ alternately and set

$ S_(n + 1) = Q_i^n ∩ overline(cal(R))_J . $

We have $S_n subset.eq S_(n + 1) subset.eq Q_i^n$. Apply Lemma 8 with $S = S_n$, $T = S_(n + 1)$, $Q = Q_i^n$, and error $e_n$. It replaces $cal(E)_i^n$ by $cal(E)_i^(n + 1)$ such that

$ Q_i^n = S_(n + 1) or cal(E)_i^(n + 1) $

and

$ C \( cal(E)_i^(n + 1) \) lt.eq C \( cal(E)_i^n \) - kappa \( S_n \) + kappa \( S_(n + 1) \) + e_n . $

Leave the other edge family unchanged. The processed relation $Q_i^(n + 1)$ equals $Q_i^n$; the other relation grows because its supplied relation grows. Thus both sequences $Q_i^n$ increase, remain inside their respective factor relations, and have join $overline(cal(R))_Gamma$ at every stage. The edge families themselves need not be increasing.

All costs and all values of $kappa$ here use $lambda$, without normalizing its total mass. Summing the compression inequalities and using $kappa \( S_0 \) = lambda \( Z \)$ and (10) gives

#[#set math.equation(numbering: n => "(11)")
 $ C \( cal(E)_A^n \) + C \( cal(E)_B^n \) lt.eq c - 1 + kappa \( S_n \) + epsilon.alt #h(2em) \( n gt.eq 0 \) . $ <deployment:finite-bound>]

In particular all graphings used in subsequent applications of the compression lemma have finite cost.

=== 4.3 Exhausting the amalgamating relation <deployment:limit>

Let $S_oo = union.big_n S_n$ and $Q_i^oo = union.big_n Q_i^n$. These are Borel equivalence relations, and their monotonicity gives

#[#set math.equation(numbering: n => "(12)")
 $ Q_A^oo or Q_B^oo = overline(cal(R))_Gamma \, #h(2em) Q_i^oo ∩ overline(cal(R))_J = S_oo . $ <deployment:intersections>]

For the nontrivial inclusion in the second identity, a pair in $Q_i^n ∩ overline(cal(R))_J$ enters $S_(m + 1)$ at the next later stage $m$ at which type $i$ is processed.

We claim that $S_oo = overline(cal(R))_J$. Take a pair in $overline(cal(R))_J$ and a shortest chain between its endpoints with steps in $Q_A^oo$ or $Q_B^oo$. If the chain has at least two steps, its types alternate: adjacent steps of the same type could be composed. Moreover, no step lies in $overline(cal(R))_J$. By (12), such a step would belong to $S_oo$, hence to both factor relations, and could be composed with a neighboring step.

Projecting the chain to $X$, freeness gives unique group displacements for its steps. These form an alternating word with letters outside $J$, whose product belongs to $J$ because the projected endpoints are $J$-related. This contradicts amalgam normal form. The shortest chain therefore has length at most one; (12) puts its endpoint pair in $S_oo$, as claimed.

Every $overline(cal(R))_J$-class is infinite: the class of $z$ contains the distinct base-sheet points $P \( z \) j$, for $j in J$. Since $\[ z \]_(S_n)$ increases with this infinite union,

$ frac(1, \| \[ z \]_(S_n) \|) arrow.b 0 . $

The integrands are bounded by $1$ on the fixed finite-measure space $Z$. Dominated convergence consequently gives

#[#set math.equation(numbering: n => "(13)")
 $ kappa \( S_n \) arrow.r 0 . $ <deployment:kappa-limit>]

=== 4.4 Returning to the original space <deployment:projection>

Fix a finite stage $n$. For each map $phi$ in $cal(E)_i^n$, partition its domain according to both its source sheet $r$ and its target sheet $s$. On such a piece $D$, the map

$ P_s compose phi compose P_r^(- 1) : P_r \( D \) arrow.r P_s \( phi \( D \) \) $

is a p.m.p. Borel partial isomorphism on $X$, belongs to $cal(R)_i$, and has cost $lambda \( D \)$. These maps form a graphing $cal(F)_i^n$ with

#[#set math.equation(numbering: n => "(14)")
 $ C \( cal(F)_i^n \) lt.eq C \( cal(E)_i^n \) . $ <deployment:projection-cost>]

This construction uses the sheet restrictions of $P$; it requires no injectivity of $P$ on all of $Z$.

Put $T_i = cal(R)_J or cal(F)_i^n$. Projecting paths from the base sheet shows that $T_A or T_B = cal(R)_Gamma$: every $S_n$-step projects into $cal(R)_J$, and all remaining steps project into the indicated graphings. We show that $T_A = cal(R)_A$. For a pair in $cal(R)_A$, choose a shortest chain with steps from $T_A \, T_B$. A chain of length at least two would alternate and contain no $cal(R)_J$-step, since that relation is contained in both $T_A$ and $T_B$. Its displacement word would alternate outside $J$, have length at least two, and belong to $A$, again contradicting amalgam normal form. A single step of type $B$ between $A$-related endpoints has displacement in $A ∩ B = J$, so it already belongs to $T_A$. This proves the claim.

Thus $cal(F)_A^n$ is admissible in the definition of $delta_X$. Equations (11) and (14) give, at every finite stage,

$ delta_X lt.eq C \( cal(F)_A^n \) lt.eq C \( cal(E)_A^n \) + C \( cal(E)_B^n \) lt.eq c - 1 + kappa \( S_n \) + epsilon.alt . $

Let $n arrow.r oo$ using (13), then let $epsilon.alt$ and $rho$ tend to zero in (9). This proves Proposition 11.

== 5 Bernoulli graphings and finite permutation models <models:section>

We next turn the relative graphing quantity into a generator bound for explicitly presented groups. The finite models used here are actions of $A$ alone. We then construct models whose defining rows have the expansion and overlap properties needed for the rank argument.

A finite exact right $A$-set is a finite set equipped with a right action of $A$ by permutations; the action laws hold as equalities. For such a set $V$, put

#[#set math.equation(numbering: n => "(15)")
 $ D_V = ⟨x_v med \( v in V \) med mid(bar.v) med x_v x_(v u_1) dots.h.c x_(v u_99) = 1 quad \( v in V \)⟩ . $ <models:presentation>]

Here $u_0 = 1$ and $u_i = u_(i - 1) a b_i$, as in the definition of $J$. The notation $"rk" \( D \)$ means the minimum size of a generating set of a group $D$. The groups $D_V$ need not be finite. We write $"Fix"_V \( g \) = { v in V : v g = v }$.

=== 5.1 The transfer inequality <the-transfer-inequality>

#thm([Proposition 5.1.])[
  #emph[Let $V_k$ be finite exact right $A$-sets, with $n_k = \| V_k \| arrow.r oo$, such that for every fixed $g in A \\ { 1 }$, 
#[#set math.equation(numbering: n => "(16)")
 $ frac(\| { v in V_k : v g = v } \|, n_k) arrow.r 0 . $ <models:fixed-points>]

 For the free Bernoulli action on $X$ from Section 2, whose cost agrees with the full product action on $X_0 = \[ 0 \, 1 \]^Gamma$, one has 
$ delta_X gt.eq limsup_(k arrow.r oo) frac("rk" \( D_(V_k) \), n_k) . $

]
] <models:transfer>

#proof[
  We use right actions, so that $\( x g \) \( h \) = x \( g h \)$. Choose representatives $h_c$ for the cosets $A h_c$ in $Gamma$, and let $Omega = \[ 0 \, 1 \]^(A without Gamma)$ with its product probability measure. The coordinate rearrangement
  $ x mapsto #scale(x: 120%, y: 120%)[\(] \( x \( g h_c \) \)_c #scale(x: 120%, y: 120%)[\)]_(g in A) $
  identifies the restriction of $X_0$ to $A$ with $Omega^A$, with independent base coordinates and right action $\( xi q \) \( g \) = xi \( q g \)$. We write $mu$ for the product measure on this space. All graphing identities are considered on invariant conull subsets, so the restriction to $X$ does not change the argument.
  For every finite exact $A$-set $V$, define $theta : V times A arrow.r D_V$ on the free basis of $A$ by
  $ theta \( v \, a \) = x_v \, #h(2em) theta \( v \, b_i \) = 1 \, #h(2em) theta \( v \, s^(- 1) \) = theta \( v s^(- 1) \, s \)^(- 1) $
  for each basis letter $s$. Extend by multiplying these values along a word. Cancellation of adjacent inverse letters cancels their two values at the corresponding sources. Since $A$ is free, this gives a well-defined function satisfying
  #[#set math.equation(numbering: n => "(17)")
   $ theta \( v \, g h \) = theta \( v \, g \) theta \( v g \, h \) . $ <models:cocycle>]
  The word $w = u_99 a = a b_1 a b_2 dots.h.c a b_99 a$ gives
  $ theta \( v \, w \) = x_v x_(v u_1) dots.h.c x_(v u_99) = 1 . $
  Also $theta \( v \, b_i \) = 1$ at every source. The inverse rule and (17) therefore give
  #[#set math.equation(numbering: n => "(18)")
   $ theta \( v \, j \) = 1 #h(2em) \( v in V \, med j in J \) . $ <models:j-trivial>]
  Notice that $theta \( v \, g \)$ depends on the group label $g$, not merely on the pair of endpoints $\( v \, v g \)$.
  Fix a finite-cost graphing $cal(E)$ such that $cal(R)_J or cal(E) = cal(R)_A$, and fix $epsilon.alt > 0$. Such finite-cost graphings suffice for the infimum defining $delta_X$: the full $a$-translation, together with $cal(R)_J$, already generates $cal(R)_A$. On an invariant conull free set, split each map in $cal(E)$ according to its unique displacement in $A$. This produces countably many restrictions
  $ phi_ell : L_ell arrow.r L_ell g_ell \, #h(2em) phi_ell \( x \) = x g_ell \, #h(2em) g_ell in A \, $
  with $sum_ell mu \( L_ell \) = C \( cal(E) \)$.
  A path type is a finite list of full $J$-translations and signed indices $ell$ of these paid maps. Its label is the product in $A$ of its successive step labels. Almost every $x$ has a valid path to $x a$. Freeness implies that every such path has label exactly $a$ in $A$. There are countably many path types. Choose finitely many, each with label $a$, whose validity sets cover a set of measure at least $1 - epsilon.alt$. Let $I$ be their finite set of paid indices, and let $m_ell$ count all occurrences of index $ell$ among these types.
  Choose cylinder-measurable sets $L'_ell$, depending on finitely many $A$-coordinates, such that
  $ sum_(ell in I) \( 1 + m_ell \) mu \( L_ell triangle.stroked.t L'_ell \) < epsilon.alt . $
  This approximation is available because finite-coordinate measurable sets form an algebra generating the product sigma-algebra. Its closure for the metric $mu \( E triangle.stroked.t F \)$ is a sigma-algebra, so every measurable set is approximable in this metric.
  For clarity, a forward step of index $ell$ after a prefix with label $h$ tests $x h in L_ell$. An inverse step after that prefix tests $x h g_ell^(- 1) in L_ell$. Replace these tests by the corresponding tests in $L'_ell$, keeping all path labels unchanged. Each occurrence changes its validity predicate on a set of measure at most $mu \( L_ell triangle.stroked.t L'_ell \)$, by invariance of $mu$. If $P'$ is the union of the modified path validity sets, then
  #[#set math.equation(numbering: n => "(19)")
   $ sum_(ell in I) mu \( L'_ell \) lt.eq C \( cal(E) \) + epsilon.alt \, #h(2em) mu \( P' \) gt.eq 1 - 2 epsilon.alt . $ <models:cylinder-bounds>]
  All sets $L'_ell$ and $P'$ depend on a single finite coordinate set $F subset A$: for example, a test of an $F_ell$-cylinder after prefix $h$ uses coordinates $h F_ell$, or $h g_ell^(- 1) F_ell$ for an inverse step. This finite set is fixed before $k$ tends to infinity.
  We have reduced generation to finitely many cylinder tests. We now evaluate these same tests on $V_k$. For independent base labels $\( z_v \)_(v in V_k)$ with law $Omega$, put
  $ xi_v = \( z_(v g) \)_(g in A) . $
  Exactness of the action gives $xi_(v q) = xi_v q$. If $v g eq.not v h$ for all distinct $g \, h in F$, the $F$-coordinates of $xi_v$ have exactly the product distribution. The fraction of exceptional sources is at most
  $ rho_k \( F \) := sum_(g \, h in F\
g eq.not h) frac(\| { v in V_k : v g h^(- 1) = v } \|, n_k) \, $
  which tends to zero by (16). Consequently, for every measurable $F$-cylinder $E$,
  #[#set math.equation(numbering: n => "(20)")
   $ lr(|1 / n_k sum_(v in V_k) Pr \( xi_v in E \) - mu \( E \)|) lt.eq rho_k \( F \) . $ <models:local-law>]
  This uses no independence between different sources $v$.
  For any realization of the labels, make a list containing $theta \( v \, g_ell \)$ for every $ell in I$ and every $v$ with $xi_v in L'_ell$. If $xi_v in P'$, follow a modified valid path from $v$. A forward paid factor occurs on this list. For an inverse paid step after prefix $h$, the factor is
  $ theta \( v h \, g_ell^(- 1) \) = theta \( v h g_ell^(- 1) \, g_ell \)^(- 1) \, $
  and its inverse-domain test puts $theta \( v h g_ell^(- 1) \, g_ell \)$ on the list. Each $J$-step contributes $1$ by (18). Since the path label is exactly $a$, (17) expresses $x_v = theta \( v \, a \)$ as a product from this list and its inverses. The finite configuration $xi_v$ need not be free; freeness was used only to select the original path labels.
  Add $x_v$ for every source with $xi_v in.not P'$. The resulting list generates $D_(V_k)$, so for every labeling,
  $ "rk" \( D_(V_k) \) lt.eq sum_(ell in I) sum_(v in V_k) upright(bold(1))_(L'_ell) \( xi_v \) + sum_(v in V_k) upright(bold(1))_(\( P' \)^c) \( xi_v \) . $
  Taking expectations, using (20), and then letting $k arrow.r oo$ gives
  $ limsup_k frac("rk" \( D_(V_k) \), n_k) lt.eq sum_(ell in I) mu \( L'_ell \) + 1 - mu \( P' \) lt.eq C \( cal(E) \) + 3 epsilon.alt . $
  Let $epsilon.alt$ tend to zero and then take the infimum over $cal(E)$. All finite path and cylinder tests were fixed before taking the limit in $k$. ◻
]

=== 5.2 Expanding rows with few overlaps <expanding-rows-with-few-overlaps>

Regard the defining relator for $v$ as an ordered row with columns $v u_0 \, v u_1 \, dots.h \, v u_99$. For $T subset.eq V$, write

$ N \( T \) = union.big_(v in T) { v u_0 \, v u_1 \, dots.h \, v u_99 } . $

A row is called bad if it has a repeated column or shares at least two distinct columns with a different row. Let $b \( V \)$ be the number of bad rows.

#thm([Proposition 5.2.])[
  #emph[Put $K = e^96 96^99 \/ 95^95$. Fix 
$ 0 < alpha < 1 \/ 200 \, #h(2em) K alpha^3 < 1 \/ 2 . $

 There exists a sequence of finite exact right $A$-sets $V_k$, with $n_k = \| V_k \| arrow.r oo$, satisfying (16) and 
#[#set math.equation(numbering: n => "(21)")
 $ \| N \( T \) \| & > 96 \| T \| &  & \( T subset.eq V_k \, med 1 lt.eq \| T \| lt.eq alpha n_k \) \,\
b \( V_k \) & = o \( n_k \) . $ <models:expansion>]

]
] <models:sequence>

#proof[
  First, $a \, u_1 \, dots.h \, u_99$ is a free basis of $A$. Indeed, the substitutions defining $u_i$ have the inverse substitutions
  $ b_i = a^(- 1) u_(i - 1)^(- 1) u_i . $
  Between abstract free groups on the two proposed bases, these formulas give inverse homomorphisms: they recover $b_i$ directly and recover $u_i$ by induction. Assign independent uniform permutations of ${ 1 \, dots.h \, n }$ to the 100 elements of this basis. This defines an exact right $A$-action.
  Fix an integer $s$ with $1 lt.eq s lt.eq floor.l alpha n floor.r$. If a set $T$ of size $s$ violates (21), then $N \( T \)$ is contained in a set $C$ of size $96 s$ containing $T$, since $u_0 = 1$. Such a set exists because $96 s < n$. For fixed $T$ there are $binom(n - s, 95 s)$ possible sets $C$. For one uniform permutation $sigma$, the probability that $T sigma subset.eq C$ is
  $ frac(\( 96 s \) \( 96 s - 1 \) dots.h.c \( 96 s - s + 1 \), n \( n - 1 \) dots.h.c \( n - s + 1 \)) lt.eq (frac(96 s, n))^s . $
  Using independence of the 99 permutations assigned to $u_1 \, dots.h \, u_99$, followed by the bounds $binom(n, r) lt.eq \( e n \/ r \)^r$, gives
  $ Pr #scale(x: 120%, y: 120%)[\(] exists T : med \| T \| = s \, med \| N \( T \) \| lt.eq 96 s #scale(x: 120%, y: 120%)[\)] & lt.eq binom(n, s) binom(n, 95 s) (frac(96 s, n))^(99 s)\
 & lt.eq [K (s / n)^3]^s . $
  The exponent is $99 - 1 - 95 = 3$. Set $q = K alpha^3 < 1 \/ 2$. For every fixed integer $R gt.eq 1$, the sum of these bounds over all allowed sizes is at most
  $ sum_(s = 1)^(min \( R \, floor.l alpha n floor.r \)) \[ K \( s \/ n \)^3 \]^s + frac(q^(R + 1), 1 - q) . $
  First let $n arrow.r oo$ and then $R arrow.r oo$. Thus (21) holds with probability tending to one. This includes $s = 1$; if $floor.l alpha n floor.r = 0$, the assertion is vacuous.
  We also need (16). Fix a nonempty freely reduced word of length $L$ in the random basis, and a starting vertex $v_0$. Follow the word, exposing permutation entries only when needed. Until the first repeated vertex, the current vertex has not occurred earlier except as the endpoint of its incoming edge. A positive next letter could request an already exposed domain entry only by immediately inverting that incoming edge. A negative next letter could request an already exposed range entry only in the same way. Both are excluded by free reduction. At step $t$, therefore, the requested partner is uniform among at least $n - t + 1$ available vertices. At most $t$ of these vertices have already been visited. For $n gt.eq L$,
  $ Pr \( v_0 upright(" is fixed by the word") \) lt.eq sum_(t = 1)^L frac(t, n - t + 1) lt.eq frac(L \( L + 1 \), 2 \( n - L + 1 \)) . $
  The same bound holds for the expected fixed-point fraction. It tends to zero for each fixed nonidentity element of $A$.
  Here is an explicit simultaneous choice. Enumerate the nonidentity elements of $A$ as $g_1 \, g_2 \, dots.h$. At stage $k$, take $n_k > n_(k - 1)$ so large that expansion fails with probability at most $1 \/ 4$, and
  $ bb(E) frac(\| "Fix"_V \( g_j \) \|, n_k) lt.eq frac(1, 4 k^2) #h(2em) \( 1 lt.eq j lt.eq k \) . $
  Markov’s inequality and a union bound show that the probability that some $j lt.eq k$ has fixed-point fraction greater than $1 \/ k$ is at most $1 \/ 4$. Choose an outcome with expansion and all these fixed-point bounds. This gives (16) for every fixed element, without requiring estimates uniform over words of increasing length.
  Finally we deduce (21). A repeated column in row $v$ gives $v u_i = v u_j$ for some $i eq.not j$, so $v$ is fixed by the nonidentity word $u_i u_j^(- 1)$. If two distinct columns are shared between rows $v eq.not y$, choose indices with
  $ v u_i = y u_k \, #h(2em) v u_j = y u_l . $
  Then $i eq.not j$ and $k eq.not l$ by distinctness of the columns, while $i eq.not k$ and $j eq.not l$ follow from injectivity of each permutation. Consequently $v$ is fixed by
  $ u_i u_k^(- 1) u_l u_j^(- 1) . $
  This word is nontrivial. In the cyclic order $\( i \, k \, l \, j \)$, neighboring indices differ. If all indices are nonzero, the displayed word is freely reduced. Removing one occurrence of $u_0 = 1$ joins letters of the same sign and leaves a nonempty reduced word. Two zero indices can occur only in opposite positions; the remaining two letters then have the same sign. Three zero indices are impossible. Thus every possible overlap gives a fixed point of a nonidentity word from a finite list. The union of the fixed sets in this list, together with the finite list for repeated columns, contains every bad row. Equation (16) now gives $b \( V_k \) = o \( n_k \)$. ◻
]

For later use, the sequence in Proposition 13 eventually satisfies

$ alpha n_k gt.eq 1 \, #h(2em) 100 b \( V_k \) lt.eq alpha n_k . $

These are the finite size and exceptional-row bounds used in the deterministic rank argument. Proposition 12 applies to this same sequence.

== 6 A planar word lemma with coefficients <planar:section>

This section proves the word-matching statement used in the rank argument. The coefficient group may have torsion and need not be finitely presented. The conclusion records equality of coefficient elements, as well as matching letters. The proof follows the long-boundary principle of classical small-cancellation theory associated with Greendlinger’s lemma #cite(label("greendlinger-1960")). We prove the coefficient-sensitive statement in full.

Let $H$ be a group generated by a finite alphabet $S$, let $U$ be a disjoint finite alphabet, and put $L = H * F \( U \)$. Words will be written in $S^(plus.minus 1) union U^(plus.minus 1)$. An occurrence of a letter of $U^(plus.minus 1)$ is called an #emph[exterior occurrence]. Between successive exterior occurrences there is a word in $S^(plus.minus 1)$; its value in $H$ is the corresponding #emph[coefficient gap]. For a cyclic word, this convention includes the gap from the last exterior occurrence to the first.

A cyclic word is #emph[cyclically $H$-reduced] if no two successive exterior occurrences are inverse letters separated by a coefficient gap equal to $1$ in $H$. An interval from one exterior occurrence through another #emph[matches] a relator interval if their signed exterior letters agree in order and all intervening coefficient gaps have equal values in $H$. The interval uses no position of the relator more than once. A #emph[full cyclic match] means that, after choosing cyclic starting positions, the complete signed exterior lists have the same length and agree, and all corresponding coefficient gaps, including the closing gap, agree in $H$.

#thm([Lemma 6.1.])[
  (Planar word lemma).  #emph[Let $H$ be generated by a finite alphabet $S$, let $U$ be a disjoint finite alphabet, and put $L = H * F \( U \)$. Let $cal(R)$ be a family of words in $L$ with the following properties. Each $r in cal(R)$ has $m \( r \) gt.eq 7$ exterior occurrences, all positive and with pairwise distinct underlying generators. Distinct relators share at most one generator from $U$. Suppose that the natural map 
$ H arrow.r D := L \/ chevron.l #h(-0.16667em) chevron.l cal(R) chevron.r #h(-0.16667em) chevron.r $

 is injective. If a cyclically $H$-reduced word $W$ has an exterior occurrence and represents $1$ in $D$, then at least one of the following conclusions holds:]
  + #emph[$W$ has a full cyclic match with a relator or its inverse;]
  + #emph[$W$ has two intervals disjoint in their exterior occurrences, each matching an interval of a cyclic relator or its inverse with at least $m \( r \) - 3$ exterior occurrences, where $r$ is the relator matched by that interval.]
] <planar:main>

The two intervals in the second conclusion need not come from different relators. Disjointness refers to occurrences in $W$, and matching refers to equality in $H$ of every gap strictly between the first and last matched exterior letters. In particular, no bound on the lengths of the $S$-words spelling those gaps is asserted or needed.

#proof[
  We first turn a least-relator expression for $W$ into a planar graph. The edges of this graph pair exterior occurrences. Bigon faces give consecutive matches, and a corner count will produce either one full match or two long strings of bigons.
  ===== 6.1 A finite filling over an arbitrary coefficient group. <a-finite-filling-over-an-arbitrary-coefficient-group.>
  Choose an expression for $W$ in $L$ as a product of conjugates of words from $cal(R)^(plus.minus 1)$ using the least possible number $N$ of those words. Free-product reduction shows that a cyclically $H$-reduced word with an exterior occurrence is nontrivial in $L$, so $N > 0$.
  Give $H$ the presentation on $S$ with all words trivial in $H$ as relations. An equality in this presentation uses finitely many relations: membership in their normal closure means a finite product of conjugates. Thus the chosen expression for $W$ can be witnessed using a finite set of true $H$-relations. Let $K_H$ be a finite presentation complex for this finite set of relations, and wedge it with one circle for each $u in U$. The resulting complex $K$ has a natural homomorphism $pi_1 \( K \) arrow.r L$. We do not assume this homomorphism is injective.
  Realize the expression by a map from a sphere with $N + 1$ open disks removed to $K$. Denote the distinguished boundary disk by $O$, and the other disks by $B_1 \, dots.h \, B_N$. Read every disk boundary using its disk orientation in the oriented sphere. The boundary of $O$ reads $W^(- 1)$, and each $B_i$ reads one chosen relator or its inverse. To construct the map, cut the punctured sphere along disjoint spokes carrying the conjugating paths. Its remaining boundary reads the equality in $L$; the finitely many chosen $H$-relations and free cancellations fill this boundary. Conversely, cutting any such mapped punctured sphere along spokes expresses $W$ as a product of $N$ conjugates in $L$.
  We may make the complex and map piecewise linear. For example, realize each relation with a mapping cylinder and a disk, triangulate, and use the finite filling just described. During later replacements we may enlarge the finite set of true $H$-relations: any loop trivial in $L$ becomes fillable after adding the finitely many such relations used by its equality. Minimality throughout concerns $N$ in the actual group $L$, not a possibly larger finitely presented approximation to it.
  ===== 6.2 Tracks and connectedness. <tracks-and-connectedness.>
  For every $u in U$, choose a point $q_u$ in the interior of its circle edge, avoiding the images of all vertices of a subdivision for the piecewise linear map. Near $q_u$ the target is an interval. Its inverse image consists of line segments across triangles, joined in pairs across their sides. These form disjoint cooriented arcs and circles in the punctured sphere. Each exterior occurrence on a boundary is the endpoint of exactly one arc. Each arc and each circle maps constantly to its chosen point. The two endpoints of an arc have opposite crossing signs when read in the disk orientations. This follows from coorientation and the orientation of the surface; all disk-boundary orientations are opposite the corresponding orientations as boundaries of the punctured surface.
  Regard the boundary disks as vertices and the arc tracks as edges of an embedded graph $G$ on the sphere. Closed tracks are not edges of $G$; we retain them as part of the map. We claim that $G$ is connected. If it were not, choose a component $C$ not containing $O$ and a small closed regular neighborhood of its disks and arc tracks. This neighborhood can be chosen disjoint from all other disks and tracks, including the finitely many closed tracks. Select the boundary curve $gamma$ facing the complementary component that contains $O$. The disk side of $gamma$ away from $O$ contains $C$ and at least one inner disk; it may also contain other components, which causes no problem.
  The image of $gamma$ avoids every $q_u$. Cutting the exterior circles at these points leaves a space retracting to $K_H$. Consequently the class of $gamma$, after a change of basepoint, is an element of $H$ inside $L$. Cap all relator holes on the side away from $O$ in a presentation space for $D$. The resulting mapped disk shows that this element is trivial in $D$. Injectivity of $H arrow.r D$ makes it trivial in $H$, hence $gamma$ is trivial in $L$. Replace that entire disk side by a filling using only true $H$-relations and free cancellations. At least one relator disk disappears, contradicting the choice of $N$. Thus $G$ is connected. This argument neither removes individual closed tracks nor supposes that such tracks bound disks in the target.
  ===== 6.3 Inner loops and dipoles. <inner-loops-and-dipoles.>
  There is no graph loop at an inner vertex. All exterior letters on that disk have the same sign, whereas an arc pairs opposite signs. Nor can an edge join two copies of the same relator. Such copies would have opposite orientations and meet the unique occurrence of the same exterior generator $u$. Base their boundary loops at the point $q_u$ on that occurrence. Writing the positive occurrence as $u = p s$, a positive based boundary has the form $s T p$, while the negative one is $p^(- 1) T^(- 1) s^(- 1)$; these are inverse loops. The joining track is constant and inserts no conjugating coefficient. A small disk neighborhood of the two disks and this track therefore has null boundary in $L$. Replacing its interior removes both relator disks, again contradicting minimality. Other tracks crossing the boundary of this neighborhood impose no restriction on the replacement map.
  For copies of different relators there is at most one joining edge: the relators share at most one exterior generator, used once on each disk. Thus between any two inner vertices there is at most one edge. Every inner vertex corresponding to $r$ has degree exactly $m \( r \)$.
  ===== 6.4 Face equations and bigon matches. <face-equations-and-bigon-matches.>
  The complement of a small regular neighborhood of the connected disk-and-arc graph consists of disks. Their boundary curves follow the face walks of $G$, even when a walk repeats vertices or edges. Collapse the exterior circles of $K$ to its basepoint and then take values in $H$. Each track becomes constant, and a sector between successive track endpoints on a disk contributes its coefficient gap. The map on each complementary disk proves that the ordered product of its sector values is $1$ in $H$. Closed tracks inside that disk do not affect this argument.
  There are no monogon faces. An inner loop has already been excluded; a monogon at $O$ would pair two inverse exterior occurrences across a gap trivial in $H$, contrary to cyclic $H$-reduction. Any bigon incident to an inner vertex consists of two edges joining that vertex to $O$. Indeed, there are no parallel edges between inner vertices. A face walk of length two that traverses one edge twice would require degree one at its inner endpoint, which is impossible since $m \( r \) gt.eq 7$.
  Such an inner–outer bigon matches consecutive exterior letters and their intervening coefficient gap. The exterior signs match because $O$ is labelled $W^(- 1)$ in its disk orientation. Following $W$ along the outer sector follows the corresponding inner relator in its disk orientation. The face equation, with this convention, is the inner gap times the inverse of the outer gap equal to $1$. It therefore gives equality of the two elements of $H$, rather than equality merely up to conjugacy.
  We have now reduced the desired word matches to strings of bigons. The remaining argument forces either a full cyclic string or two long strings at different inner vertices.
  ===== 6.5 The corner count. <the-corner-count.>
  Give weight zero to every corner at $O$ and to every corner of a bigon. For any other corner at an inner vertex, assign weight
  $ cases(delim: "{", 1 \/ 3 \, & upright("if both incident edges go to inner vertices") \,, 1 \/ 2 \, & upright("if exactly one incident edge goes to ") O \,, 1 \, & upright("if both incident edges go to ") O .) $
  Occurrences are counted with multiplicity along a face walk. A face of length $ell$ has total weight at most $ell - 2$. For a bigon this is equality. For $ell gt.eq 3$ with no occurrence of $O$, the total is $ell \/ 3 lt.eq ell - 2$. With exactly one occurrence of $O$, the two neighboring corners have weight $1 \/ 2$ and the remaining $ell - 3$ corners weight $1 \/ 3$, again totaling $ell \/ 3$. With at least two occurrences of $O$, there are at most $ell - 2$ inner corners, each of weight at most one. These cases include repeated face walks and loops at $O$.
  Write $E$ and $F$ for the numbers of edges and faces of $G$, and $c \( v \)$ for the total corner weight at an inner vertex $v$. Summing over faces and using Euler’s formula for the connected sphere graph with $N + 1$ vertices gives
  #[#set math.equation(numbering: n => "(22)")
   $ sum_(v eq.not O) #scale(x: 120%, y: 120%)[\(] 2 - c \( v \) #scale(x: 120%, y: 120%)[\)] gt.eq 2 N - 2 E + 2 F = 2 . $ <planar:curvature>]
  Call $2 - c \( v \)$ the contribution of $v$. A vertex of degree $m gt.eq 7$ with no edge to $O$ has $c \( v \) = m \/ 3 > 2$, so a positive vertex has an edge to $O$. At such a vertex, consider the cyclic gaps between successive edges to $O$. A gap that bounds a bigon costs zero. A gap containing no edge to an inner vertex, but not bounding a bigon, costs one. A gap containing $h gt.eq 1$ edges to inner vertices costs
  $ 1 / 2 + frac(h - 1, 3) + 1 / 2 = 1 + frac(h - 1, 3) . $
  Each gap not bounding a bigon therefore costs at least one.
  If every gap bounds a bigon, all edges at $v$ go to $O$. Successive edges at $v$ are also successive at $O$, in the opposite rotation. They exhaust the cyclic rotation at $O$: otherwise a further half-edge would interrupt one of these bigons. Connectedness leaves no other vertex. The bigon equations then match every exterior occurrence of $W$ with this relator, including all cyclic gaps. This is the first conclusion.
  Otherwise positivity means that exactly one gap does not bound a bigon, and that gap contains at most three edges to inner vertices. Indeed, two such gaps cost at least two, while a gap containing $h gt.eq 4$ inner edges also costs at least two. The other gaps form one consecutive string of bigons joining at least $m - 3$ edges to $O$. Its bigon equations give a matching interval with at least $m - 3$ exterior occurrences. The contribution of this vertex is at most one.
  Unless the first conclusion has already occurred, every positive vertex contributes at most one. The total contribution is at least two, so there are at least two distinct positive vertices. Take a matching interval from each. Each exterior occurrence of $W$ is the endpoint of exactly one arc track, so intervals arising from different inner vertices have disjoint exterior occurrences. This proves the second conclusion. ◻
]

== 7 A deterministic rank bound <rank:section>

We now turn expansion of a finite system of relators into a lower bound for the number of generators of its presented group. The proof represents a generating family by a labelled graph. After absorbing a small set of letters into a coefficient group, Lemma 14 finds a long relator segment in that graph. Replacing this segment by the short complement of the relator contradicts minimality of the graph. This is an Arzhantseva–Ol’shanskii shortening argument #cite(label("arzhantseva-olshanskii-1996")) § Marked graphs; see also #cite(label("kapovich-schupp-2002")) Definitions 2.6–2.9 and Proposition 2.11. The coefficient group and the saturation procedure below allow us to use the move for the present system of relators.

#thm([Theorem 7.1.])[
  #emph[Let $V$ and $cal(T)$ be sets of cardinality $n$. For each $t in cal(T)$, let 
$ r_t = x_(c \( t \, 0 \)) x_(c \( t \, 1 \)) dots.h.c x_(c \( t \, 99 \)) \, #h(2em) c \( t \, i \) in V \, #h(2em) D = chevron.l x_v med \( v in V \) divides r_t = 1 med \( t in cal(T) \) chevron.r . $

 For $T subset.eq cal(T)$, put $N \( T \) = { c \( t \, i \) : t in T \, med 0 lt.eq i lt.eq 99 }$. Call a row $t$ bad if it has a repeated column, or if it shares at least two distinct columns with another row, and let $b$ be the number of bad rows. Suppose that 
$ 0 < alpha < 1 / 200 \, #h(2em) alpha n gt.eq 1 \, #h(2em) 100 b lt.eq alpha n \, $

 and that 
#[#set math.equation(numbering: n => "(23)")
 $ \| N \( T \) \| > 96 \| T \| #h(2em) upright("whenever ") 1 lt.eq \| T \| lt.eq alpha n . $ <rank:expansion>]

 Then the minimum size of a generating set of $D$ satisfies 
$ "rk" \( D \) > frac(alpha n, 100) . $

]
] <rank:main>

#proof[
  Suppose instead that $D$ has at most $alpha n \/ 100$ generators. We proceed in four steps: choose a minimal graph, saturate a small coefficient alphabet, locate a long relator segment, and shorten the graph.
  === A minimal labelled graph <a-minimal-labelled-graph>
  Give each edge of a finite graph an orientation and a label $x_v$ or $x_v^(- 1)$; reading the edge backwards inverts its label. Path labels are words in these letters, evaluated in $D$. A generating set written as words in the $x_v$ gives a subdivided rose whose based loops map onto $D$. Among all finite connected labelled graphs $Y$ with
  $ beta \( Y \) = \| E \( Y \) \| - \| V \( Y \) \| + 1 lt.eq frac(alpha n, 100) $
  and surjective loop-label map to $D$, choose one with the fewest edges. Write $beta = beta \( Y \)$. Changing basepoint conjugates the loop image in $D$, so it preserves surjectivity. Consequently $Y$ has no vertex of degree one: pruning such a vertex and its edge, and moving the basepoint if necessary, would give a smaller graph with the same property.
  Choose a basepoint $p$. Decompose $Y$ into arcs by splitting at $p$ and at every vertex of degree at least three. An arc is an edge path with distinct interior vertices, all of degree two and different from $p$; its endpoints may coincide. If $Y$ is a point, it has no arcs. If $Y$ is a circle, then $beta = 1$ and marking $p$ gives one arc. In all other cases, the identity
  $ sum_(v in V \( Y \)) \( deg \( v \) - 2 \) = 2 beta - 2 $
  bounds the number of vertices of degree at least three by $2 beta - 2$. Suppressing all degree-two vertices except possibly $p$ leaves at most $2 beta - 1$ vertices and therefore at most $3 beta - 2$ edges. In particular, in every case the number of arcs is at most $3 beta$.
  === Saturating the coefficient alphabet <saturating-the-coefficient-alphabet>
  Start with $S subset.eq V$ equal to the set of columns occurring in bad rows. Apply either of the following rules whenever it adds a new column:
  + If an arc has at most $30$ occurrences of labels with index outside $S$, put every index occurring on that arc into $S$.
  + If a row has at least $10$ occurrences with index in $S$, put all its columns into $S$.
  The process terminates, since each step enlarges $S subset.eq V$. An arc can contribute at most $30$ new columns and is used at most once. Thus the initial set and all arc additions together contribute at most
  #[#set math.equation(numbering: n => "(24)")
   $ 100 b + 30 \( 3 beta \) lt.eq alpha n + frac(90 alpha n, 100) < 2 alpha n . $ <rank:seed>]
  Every nontrivial row addition contributes at most $90$ new columns.
  Put $s = floor.l alpha n floor.r gt.eq 1$. If $s$ rows were processed by the second rule, let $T$ consist of the first $s$ such rows. At that moment,
  $ N \( T \) subset.eq S \, #h(2em) \| S \| lt.eq 2 alpha n + 90 s < 96 s . $
  For the strict inequality, use $alpha n < s + 1 lt.eq 2 s < 3 s$. This contradicts (23). Thus fewer than $s$ rows are processed, and the final set satisfies
  #[#set math.equation(numbering: n => "(25)")
   $ \| S \| lt.eq 2 alpha n + 90 \( s - 1 \) lt.eq 92 alpha n < n . $ <rank:saturation>]
  Let $U = V \\ S$, which is nonempty. At termination, every arc has either no $U$-labelled edge or more than $30$ such occurrences. Moreover, every row not entirely in $S$ is good and has at most nine $S$-occurrences. Such a row has at least $91$ distinct positive $U$-letters, and distinct such rows share at most one $U$-letter.
  Let $H = chevron.l x_s : s in S chevron.r$ be the actual subgroup of $D$ generated by these elements. There is an isomorphism
  #[#set math.equation(numbering: n => "(26)")
   $ D tilde.equiv #scale(x: 120%, y: 120%)[\(] H * F \( x_u : u in U \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\/] chevron.l #h(-0.16667em) chevron.l r_t : r_t upright(" is not entirely in ") S chevron.r #h(-0.16667em) chevron.r . $ <rank:relative-presentation>]
  Indeed, the group on the right maps to $D$ because every defining relation of $H$ and every displayed row hold in $D$. Conversely, its generators satisfy all the original rows: an omitted row is a true relation of $H$, and every other row is retained. The resulting maps are inverse on the generators, hence are inverse isomorphisms. In particular, the coefficient group in (26) embeds in the quotient. No finite presentation of $H$ is being assumed.
  === Finding a long segment in a shortest loop <finding-a-long-segment-in-a-shortest-loop>
  Call an occurrence of $x_u^(plus.minus 1)$ with $u in U$ exterior. Choose $j in U$ and a shortest edge loop $P$ based at $p$ whose label represents $x_j$ in $D$. This includes the possibility that $P$ is empty. It has no immediate backtracks and therefore traverses complete arcs. Its number of exterior occurrences is consequently either zero or greater than $30$.
  The label of $P$ is linearly $H$-reduced: two consecutive exterior occurrences in its linear list cannot be inverse letters separated by an $S$-word trivial in $H$. To prove this, suppose that the relevant portion of $P$ is $e R f$, where $R$ uses only $S$-edges and has value $1$ in $H$. If $f = e^(- 1)$ as oriented edges, the closed detour $e R f$ has value $1$ in $D$, so deleting it shortens $P$ without changing its value. Otherwise $e$ and $f$ are different unoriented edges, and $R$ uses neither of them. Slide the initial incidence of $f$ backwards along $R$ to the terminal vertex of $e$. This keeps the numbers of vertices and edges unchanged and keeps the graph connected: the path $R$ is still present. Each old traversal of $f$ can be replaced by $R^(- 1) f$ in the slid graph, and a reverse traversal by its inverse. Since $R$ has value $1$ in $D$, these substitutions preserve the values of all based loops, so the loop-label image still surjects onto $D$. Now $e^(- 1)$ and $f$ leave the same vertex with the same label. Fold them together. This removes one edge and identifies either zero or one pair of distinct vertices; the graph remains connected, its rank does not increase, and the quotient preserves all loop labels. It is therefore a smaller admissible graph, contrary to the choice of $Y$. This proves linear $H$-reduction.
  Put $L = H * F \( x_u : u in U \)$. The normal form in this free product shows that a linearly $H$-reduced word representing $x_j$ in $L$ has exactly one exterior occurrence: after evaluating its $H$-gaps, adjacent free letters separated by trivial gaps form freely reduced blocks. Since $P$ has zero or more than $30$ exterior occurrences, its label does not equal $x_j$ in $L$. Thus $"lab" \( P \) x_j^(- 1)$ is nontrivial in $L$ but trivial in $D$.
  Cyclically $H$-reduce this word by cancelling adjacent inverse exterior letters across gaps trivial in $H$. Let $W$ be the resulting cyclic word. It still has an exterior occurrence. Otherwise the original word would be conjugate in $L$ to an element of $H$ trivial in $D$; the embedding of $H$ would make that element, and hence the original word, trivial in $L$.
  There is just one possible disruption of the original path when passing to $W$. If no cancellation occurs, it is the appended letter $x_j^(- 1)$, which we call the seam letter. If cancellation occurs, the first cancellation must involve that appended letter, by linear $H$-reduction of $P$. All later cancellations occur between the two ends of the remaining exterior list of $P$. The surviving exterior occurrences form a contiguous block of that list, all its intervening gaps are unchanged, and only its closing gap, called the seam gap, may have changed.
  Apply Lemma 14 to (26) and $W$. Each mixed row has at least $91$ exterior occurrences. If the lemma gives two exterior-disjoint intervals, at least one avoids the seam letter, when present. When there is a seam gap, at most one interval can cross it, because a crossing uses both adjacent exterior occurrences. In either case an interval with at least $91 - 3 = 88$ exterior occurrences remains intact in $P$. If the lemma instead gives an entire cyclic relator, remove the seam letter, when present, or cut at the seam gap. This leaves at least $90$ exterior occurrences intact in $P$.
  We have therefore obtained a subpath $Q$ of $P$, beginning and ending with exterior edges, that matches a consecutive portion of a cyclic row or its inverse and has at least $88$ exterior occurrences. Its exterior indices are distinct. Its intervening $S$-words have the same values in $H$ as the corresponding row segments, although their lengths need not agree. The matching row segment has at least $88$ of the original $100$ letters. Its complementary segment has length at most $12$, so the inverse complementary word gives a word $z$ in the original generators such that
  #[#set math.equation(numbering: n => "(27)")
   $ \[ z \]_D = \[ "lab" \( Q \) \]_D \, #h(2em) 1 lt.eq \| z \| lt.eq 12 . $ <rank:short-word>]
  If the complementary word is empty, use $x_j x_j^(- 1)$ for $z$.
  === Shortening the graph <shortening-the-graph>
  Decompose $Q$ according to its arc traversals, allowing partial traversals at its two ends. Some such traversal contains more than $30$ exterior edges of $Q$. Otherwise no complete traversal could have exterior edges, by saturation, and the two partial traversals would contribute at most $60$ exterior occurrences in total. In the chosen traversal, let $I$ run from its first exterior edge through its last exterior edge, inclusive. Then
  $ Q = Q_1 I Q_2 \, #h(2em) ell := \| E \( I \) \| gt.eq 31 . $
  The segment $I$ has distinct interior vertices of degree two, none equal to $p$; its endpoints may coincide.
  The paths $Q_1 \, Q_2$ avoid both the edges and the interior vertices of $I$. First, neither endpoint of $Q$ is interior to $I$: at such a vertex the first or last edge of $Q$ would be one of the edges of $I$, because that vertex has degree two. That edge is exterior, so its two occurrences in $Q$ would repeat an exterior index. Next, any path entering the interior of $I$ from outside must use its first or last edge. Both are exterior and already occur in $I$, so neither $Q_1$ nor $Q_2$ can enter this way. These arguments also exclude a second traversal of an edge of $I$; when $I$ is closed, the same two boundary incidences give the identical conclusion.
  Figure 1 illustrates the construction.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((2.45, 2.15), [#text(size: 9pt)[Before]])
  line((6.2, 0), (7.55, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.875, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q_1$]]])], anchor: "south")
  line((7.55, 0), (9.75, 0), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.65, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$I$]]])], anchor: "south")
  line((9.75, 0), (11.1, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.43, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q_2$]]])], anchor: "south")
  circle((6.2, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((7.55, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((9.75, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((11.1, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((6.2, -0.1764), [#text(size: 9pt)[$q_-$]], anchor: "north", padding: 0.1176cm)
  content((7.55, -0.1764), [#text(size: 9pt)[$i_-$]], anchor: "north", padding: 0.1176cm)
  content((9.75, -0.1764), [#text(size: 9pt)[$i_+$]], anchor: "north", padding: 0.1176cm)
  content((11.1, -0.1764), [#text(size: 9pt)[$q_+$]], anchor: "north", padding: 0.1176cm)
  content((2.45, -0.88), [#text(size: 9pt)[$Q=Q_1"IQ"_2, |E(I)| gt.eq 31$]])
  content((8.65, 2.15), [#text(size: 9pt)[After]])
  line((6.2, 0), (7.55, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.875, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q_1$]]])], anchor: "south")
  line((9.75, 0), (11.1, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.43, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Q_2$]]])], anchor: "south")
  bezier((6.2, 0), (11.1, 0), (7.008, 1.732), (10.29, 1.732), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.65, 1.299), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Z, |E(Z)| lt.eq 12$]]])], anchor: "south")
  circle((6.2, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((7.55, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((9.75, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  circle((11.1, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((6.2, -0.1764), [#text(size: 9pt)[$q_-$]], anchor: "north", padding: 0.1176cm)
  content((7.55, -0.1764), [#text(size: 9pt)[$i_-$]], anchor: "north", padding: 0.1176cm)
  content((9.75, -0.1764), [#text(size: 9pt)[$i_+$]], anchor: "north", padding: 0.1176cm)
  content((11.1, -0.1764), [#text(size: 9pt)[$q_+$]], anchor: "north", padding: 0.1176cm)
  content((8.65, -0.88), [#text(size: 9pt)[Bypass from $i_-$ to $i_+$: $Q_1^(-1)"ZQ"_2^(-1)$]])
})],
    caption: [Figure 1: The shortening move: add $Z$ between the endpoints of $Q$, then delete the edges and interior vertices of $I$. The retained paths $Q_1 \, Q_2$ and the new path give a bypass with the same value in $D$ as $I$. The drawing is schematic: displayed endpoints may coincide, and $Q_1 \, Q_2$ may overlap or be empty. The proof establishes that both avoid the edges and interior vertices of $I$. Each line denotes a path, and the rest of the graph is omitted. ],
  ) <rank:shortening-schematic>
  Attach a new path $Z$ between the endpoints of $Q$ with label $z$, using new interior vertices and $k = \| z \| lt.eq 12$ new edges. Then delete the edges and interior vertices of $I$. The old endpoints of $I$ are still connected by the path
  $ Q_1^(- 1) Z Q_2^(- 1) \, $
  which avoids everything deleted. Thus the new graph is connected. The inserted path has $k - 1$ new interior vertices, and the deleted segment has $ell - 1$ interior vertices, also when either path has coincident endpoints. Hence the changes in the numbers of edges and vertices are both $k - ell$, and the graph rank is unchanged. The basepoint survives, since it is not an interior vertex of $I$.
  Equation (27) gives
  $ \[ "lab" \( Q_1^(- 1) Z Q_2^(- 1) \) \]_D = \[ "lab" \( I \) \]_D . $
  Every reduced loop at $p$ in the old graph that uses an edge of $I$ must traverse all of $I$, in one direction or the other: its interior vertices have degree two and do not contain $p$. Replacing each such traversal by the displayed bypass, or its inverse, gives a loop in the new graph with the same value in $D$. The loop-label map of the new graph therefore remains surjective. Its edge count has decreased by at least $31 - 12 = 19$, contradicting minimality of $Y$. This proves the theorem. ◻
]

#thm([Corollary 7.2.])[
  #emph[Suppose that a sequence of length-$100$ row systems satisfies (23) for a fixed $0 < alpha < 1 \/ 200$, their sizes $n$ tend to infinity, and their bad-row counts satisfy $b = o \( n \)$. Then their presented groups satisfy 
$ "rk" \( D \) > frac(alpha n, 100) quad upright("for all sufficiently large ") n \, #h(2em) liminf_(n arrow.r oo) frac("rk" \( D \), n) gt.eq alpha / 100 . $

]
] <rank:asymptotic>

#proof[
  Eventually $alpha n gt.eq 1$ and $100 b lt.eq alpha n$, so Theorem 15 applies. ◻
]

== 8 Completing the cost comparison <conclusion:section>

We now combine the measurable and finite arguments on the same group and the same Bernoulli action.

#proof[
  Lemma 2 shows that $Gamma$ is finitely generated and that $J$ is infinite. The actions of Section 2 are essentially free and p.m.p., and conull restriction does not change their costs.
  Fix $alpha$ with the inequalities in the theorem, and set $eta = alpha \/ 100 > 0$. Proposition 13 gives exact finite right $A$-sets $V_k$ of sizes $n_k arrow.r oo$, with vanishing fixed-point fractions for every nonidentity $A$-element, expansion (21), and $b \( V_k \) = o \( n_k \)$. For all sufficiently large $k$, we have $alpha n_k gt.eq 1$ and $100 b \( V_k \) lt.eq alpha n_k$. The row systems defining $D_(V_k)$ then satisfy every hypothesis of Theorem 15. Hence
  $ "rk" \( D_(V_k) \) > eta n_k quad upright("for all sufficiently large ") k . $
  By Proposition 12,
  $ delta_X gt.eq limsup_(k arrow.r oo) frac("rk" \( D_(V_k) \), n_k) gt.eq eta . $
  Proposition 11 therefore gives
  $ "Cost" \( cal(R)_(Gamma arrow.cw.half X) \) gt.eq 1 + delta_X gt.eq 1 + eta . $
  For every integer $M > 100$, Proposition 5 gives
  $ "Cost" \( cal(R)_(Gamma arrow.cw.half Y_M) \) lt.eq 1 + 99 \/ M . $
  The $Y_M$-orbits are infinite, because $Gamma$ is infinite and its action is free. Corollary 9 therefore gives
  $ 1 lt.eq "Cost" \( cal(R)_(Gamma arrow.cw.half Y_M) \) lt.eq 1 + 99 \/ M \, $
  so these costs tend to one as $M arrow.r oo$. An integer $M > max { 100 \, 99 \/ eta }$ exists and satisfies $1 + 99 \/ M < 1 + eta$. The two costs are therefore strictly different, which proves the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
