#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 74.4pt, y: 74.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Witnessed symmetric choice is strictly stronger \
than choiceless polynomial time with counting]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Many polynomial-time algorithms make intermediate choices without changing their final answer. Gaussian elimination, for example, may select different pivots while deciding the same consistency question. The difficulty on an unordered finite structure is to permit intermediate choices in a logic whose answers are invariant under renaming the input elements. Witnessed symmetric choice addresses this difficulty by requiring certificates for the symmetry of every choice set #cite(label("ls2023")) Introduction.

A computation on a finite relational structure is #emph[choiceless] when it does not select an element from an unordered set merely because that set is nonempty. Choiceless polynomial time with counting, denoted by $upright("CPT")$, performs invariant computations with hereditarily finite sets over the input atoms. It can form all objects in a definable finite family and count their members, but it has no arbitrary ordering of the atoms. Witnessed symmetric choice allows a more specific operation: select an element of an orbit while constructing automorphisms that certify the permitted symmetry.

We use exactly the counting version of $upright("CPT")$ and the extension $upright("CPT") + upright("WSC")$ in Sections 2 and 3 of Lichter and Schweitzer’s version 3 #cite(label("ls2023")). The witnessing automorphisms preserve the entire input vocabulary and stabilize both the parameters and the preceding intermediate states. Section 2 specifies the evaluation rules and polynomial resource bounds. We use $upright("CPT")$ for the counting model throughout; some of the older literature reserves that notation for the model without counting.

For a finite vocabulary $tau$, a Boolean query is an isomorphism-invariant class of finite $tau$-structures. A $upright("CPT") + upright("WSC")$ sentence may return true, false, or a failure value $dagger$. Its #emph[true-model class] consists of the structures on which its value is true; false and $dagger$ both lie outside that class. Our separating sentence always returns a Boolean value, and satisfies the following strict expressiveness result.

#thm([Theorem 1.1.])[
  #emph[There exist a vocabulary $tau$ of eight binary relations, a fixed polynomial $p$, and a $upright("CPT") + upright("WSC")$ sentence $\( Phi \, p \)$ with one occurrence of a WSC operator such that:]
  + #emph[$\( Phi \, p \)$ has a Boolean value on every finite $tau$-structure;]
  + #emph[no $upright("CPT")$ sentence over $tau$ has the same true-model class.]
  #emph[The $upright("CPT")$ sentences in (ii) may use counting and hereditarily finite sets of unrestricted finite rank.]
] <thm:main>

Since every $upright("CPT")$ sentence is already a $upright("CPT") + upright("WSC")$ sentence, the theorem gives a strict inclusion of their collections of definable Boolean queries. In the true-model sense above, this answers affirmatively the expressiveness question posed in Section 7 of #cite(label("ls2023")). One syntactic occurrence can make many successive choices during its iteration and can be evaluated at different parameter tuples. The result concerns strict expressive power; capture of all polynomial-time queries and the expressive effect of nested WSC operators remain separate questions.

===== 1.1 Background and relation to earlier work. <background-and-relation-to-earlier-work.>

Blass, Gurevich and Shelah introduced choiceless polynomial-time computation using hereditarily finite sets and proposed its extension by a cardinality operation #cite(label("bgs1999")). Their subsequent study of unordered computation examined Cai–Fürer–Immerman structures and finite-field linear algebra as possible sources of separation #cite(label("bgs2002")) Sections 4 and 6. Shelah also made an early noncapture claim for counting extensions of choiceless computation #cite(label("shelah2000")) Introduction and Section 4. Later accounts continued to formulate the counting capture problem as open #cite(label("bgs2002")) Section 7#cite(label("pago2023")) Introduction. We retain this historical distinction and make no priority claim for noncapture of the counting formalism.

The construction of Cai, Fürer and Immerman hides a global parity obstruction from bounded-variable counting logic #cite(label("cfi1992")). Its local constraints and movable obstruction are predecessors of the charged structures used here. Passing from counting logic to full CPT requires more. Dawar, Richerby and Rossman showed that the preordered CFI query arising from ordered base graphs is definable without counting, but cannot be computed even with counting when the rank of activated sets is restricted to $o \( log n \/ log log n \)$ #cite(label("drr2008")) Theorems 17 and 40, author version. Pakusa, Schalthöfer and Selman extended positive CPT definability results to CFI problems over preordered base graphs with logarithmic color classes and, separately, over base graphs whose maximum degree is at least a fixed positive fraction of their order #cite(label("pakusaSchalthoeferSelman2016")) Theorems 1 and 15. These results show why a lower bound for the full formalism must account for its ability to construct nested sets.

Positive CPT results also exploit local automorphism groups. Suppose a total preorder is supplied on the input, with every equivalence class of size at most a fixed constant. Abu Zaid, Grädel, Grohe and Pakusa gave CPT canonization when the substructure induced by each class has an abelian automorphism group #cite(label("abuZaid2014")) Definition 15 and Corollary 19. Canonization assigns an isomorphic structure on an ordered universe in an isomorphism-invariant way. Lichter and Schweitzer extended such canonization results to structures of arity at most three whose class groups are dihedral groups of odd degree or cyclic groups, and to graphs with dihedral or cyclic class groups #cite(label("lichterSchweitzer2021")) Theorem 1. These hypotheses constrain the automorphism groups of the induced class substructures in addition to bounding the class sizes.

Other lower bounds address different parts of this difficulty. Rossman ruled out CPT construction of the set of hyperplanes of an input vector space over a fixed finite field #cite(label("rossman2010")) Theorem 6.1, author version. Pago ruled out sufficiently fine total preorders of hypercubes #cite(label("pago2021")) Theorem 2 and Corollary 3, full version and developed a symmetric-XOR-circuit approach to restricted classes of CPT algorithms #cite(label("pago2023")) Theorems 1–2, full version. The first two are functional obstructions; the circuit translation and lower bound have different restrictions. None of these statements alone is a lower bound for an arbitrary full-CPT Boolean query.

Symmetry-restricted choice has a separate history. Gire and Hoang introduced an efficiently evaluated construct based on specified symmetries #cite(label("gireHoang1998")). Dawar and Richerby developed a fixed-point logic with symmetric choice, including parameters and nesting #cite(label("dawarRicherby2003")). Lichter and Schweitzer’s extension places witnessed choice within the HF model and permits witnesses to inspect the terminal state while requiring them to preserve the preceding history #cite(label("ls2023")). Their Theorem 1 turns definable isomorphism testing into canonization on classes closed under individualization. This conditional result explains the power of the extension without assuming that it captures polynomial time on all structures. Lichter’s subsequent separations and results on nesting witnessed-choice and interpretation operators concern extensions of fixed-point logic with counting; they use that smaller base logic #cite(label("lichter2026")) Theorems 1 and 3, version 8.

The charged structures and their support and counting comparison were developed in the companion #emph[Choiceless polynomial time with counting does not capture polynomial time] #cite(label("cptCompanion2026")) Sections 2–5. We give the complete arguments needed here. In particular, we retain its rank-independent support estimate, base equivalence, quantitative homogeneity and supported-HF transfer #cite(label("cptCompanion2026")) Propositions 8, 11 and 13, Theorem 14. The companion’s noncapture theorem concerns a linear-consistency query; it does not itself supply a definition in the witnessed-choice language. Our all-input query is specified separately below. The additional steps are its legal witnessed-choice definition and a direct comparison of arbitrary CPT terms on the common grid pairs. The latter does not use the interpretation-program characterization employed in the companion.

The support-and-transfer method also has its own ancestry. Blass, Gurevich and Shelah introduced representations by forms evaluated at supporting tuples, called molecules #cite(label("bgs1999")) Sections 8–9, published version. Dawar, Richerby and Rossman developed the counting transfer under hereditary-support hypotheses #cite(label("drr2008")) Section 8, Theorem 33, author version. That transfer already permits arbitrary finite rank. The rank limitation in their lower bound comes from obtaining the required supports. Here the nonabelian group action forces short supports for its central subgroup independently of rank, and the quantitative transfer compares all objects with such hereditary supports.

===== 1.2 Proof strategy. <proof-strategy.>

The input vocabulary describes two sorts of atoms. An #emph[edge atom] specifies a state on an edge of a three-dimensional box, and a #emph[configuration atom] specifies compatible states on the edges incident with a vertex. State vectors agree across the sides of a square face; scalar states satisfy a prescribed divergence at each vertex. For each box size we construct two structures of equal cardinality: one has total divergence zero and the other has total divergence one. Globally consistent edge and vertex choices exist in the zero-charge structure and not in the unit-charge structure.

The witnessed-choice sentence first uses a tuple of four vertex blocks to define an order of the underlying graph and a spanning tree. It then chooses states only on edges outside that tree. Two candidates at the next edge are connected by two explicit transformations. A translation on at most four faces aligns their vector coordinates and moves only a fixed number of atoms. A circulation around the new edge and its tree return path corrects the remaining scalar difference. Neither transformation disturbs previously selected edge states. The formula enumerates the possible local maps and tree-cycle maps, and keeps only composites that are automorphisms of the full input fixing the required history. A transitivity guard and a pure dummy choice make the same sentence legal on arbitrary structures. The cycle-witness method of Gire and Hoang #cite(label("gireHoang1998")) is reconstructed in #cite(label("ls2023")) Section 6, including preservation of earlier choices. Here the cycle circulation follows a bounded local vector correction; the resulting maps are checked against the full input and its history (Proposition 11).

After the choices, a monotone elimination on the tree decides whether the selected edge states extend to compatible configurations. The zero-charge inputs always pass; the unit-charge inputs always fail. Sections 3–5 develop this construction and its resource bound.

The lower bound begins with a central subgroup $K$ of the automorphism group. An HF object has a #emph[$K$-support] if fixing a specified tuple of atoms pointwise forces every element of $K$ to fix that object. A small orbit under a larger group forces a short $K$-support. Counting equivalence and a quantitative homogeneity property of the base structures then transfer to the entire domains of hereditarily supported HF objects. These domains have no rank bound. Sections 6–Section 8 prove those statements.

Finally, for each fixed $upright("CPT")$ sentence, the complete actual evaluation trace has polynomial size and is invariant. Its values therefore lie in the supported domains. We describe its evaluation by a counting formula using a fixed number of variable names. The description may grow in length with the common input size, but its variable width does not grow. The crucial induction makes every term graph unique over all proposed outputs whenever its arguments are an actual activation. This prevents arbitrary high-rank objects from producing spurious fixed points or altering an empty-set default. Section 9 applies this description to force equal $upright("CPT")$ answers on sufficiently large pairs, completing the separation.

== 2 The computation model <sec:formalism>

This section fixes the conventions used by the construction and by its lower bound. All input structures are finite and relational. No order of their universes is available unless it is explicitly defined from the input.

=== 2.1 Hereditarily finite sets and ordinary iteration <hereditarily-finite-sets-and-ordinary-iteration>

For a finite set $A$ of atoms, $"HF" \( A \)$ contains the atoms and all hereditarily finite sets built from them. Atoms are distinct from sets and have no members. A permutation of $A$ acts recursively on $"HF" \( A \)$. For a set $a$, let $"TC" \( a \)$ be the set of all objects reachable from $a$ by a positive-length downward membership chain. In particular, the root $a$ is not included by a length-zero chain. Put $"TC" \( a \) = nothing$ for an atom. We use $1 + \| "TC" \( a \) \|$ as a hereditary-size bound for a set, and size $1$ for an atom.

The primitive functions of the BGS syntax are

$ nothing \, quad sans(A t o m s) \, quad sans(P a i r) \, quad sans(U n i o n) \, quad sans(U n i q u e) \, quad sans(C a r d) . $

Here $sans(A t o m s) = A$, $sans(P a i r) \( a \, b \) = { a \, b }$, and $sans(U n i o n) \( a \) = { b : exists c in a \, med b in c }$. The function $sans(U n i q u e)$ returns the member of a singleton set, and $nothing$ otherwise. The function $sans(C a r d)$ returns the finite von Neumann ordinal $\| a \|$ for a set $a$, and $nothing$ for an atom. Input relations are false on tuples having a non-atom entry.

Terms are built from these functions, variables, comprehensions

$ { thin s \( macron(a) \, u \) : u in t \( macron(a) \) \, med theta \( macron(a) \, u \) thin } \, $

and iteration from $nothing$. Formulas use input relations, equality and Boolean combinations; bounded quantifiers are abbreviations using comprehensions. If the value of a comprehension’s range term is an atom, it has no members and the comprehension is empty.

For an iteration with step $s \( macron(a) \, x \)$, write

$ a_0 = nothing \, #h(2em) a_(i + 1) = s \( macron(a) \, a_i \) . $

Its unbounded value is the first stationary value $a_ell = a_(ell + 1)$, or $nothing$ if no such index exists. A fixed polynomial annotation $p$ gives the ordinary $upright("CPT")$ value $a_ell$ if $ell lt.eq p \( \| A \| \)$ and $\| "TC" \( a_i \) \| lt.eq p \( \| A \| \)$ for every $i gt.eq 0$; otherwise the value is $nothing$. The same bounded semantics is used recursively in the step term. In particular a rejected candidate and an empty-set default must be distinguished in a description of evaluation.

We use fixed-length tuple codes formed with ordered pairs, finite products, set difference, union, bounded minima and case definitions as abbreviations. For example, a bounded existential formula tests whether its witness comprehension is nonempty, and a product is obtained from nested comprehensions followed by finite unions. All abbreviations below admit direct capture-avoiding substitution into this syntax. The bounds are verified after choosing such a fixed expansion.

=== 2.2 Witnessed choice and true-model classes <witnessed-choice-and-true-model-classes>

We use the WSC operator of #cite(label("ls2023")) Sections 3.1–3.2, written

$ upright("WSC")^(*) x y . #scale(x: 120%, y: 120%)[\(] s_(upright("step")) \( macron(z) \, x \, y \) \, s_(upright("choice")) \( macron(z) \, x \) \, s_(upright("wit")) \( macron(z) \, x \, y \) \, theta_(upright("out")) \( macron(z) \, x \) #scale(x: 120%, y: 120%)[\)] . $

All functions defining these terms are equivariant: applying an input isomorphism to their arguments applies it to their values.

For fixed parameters $macron(a)$, a choice computation starts at $b_0 = nothing$. From $b_i$, it chooses an element $c_i$ of $s_(upright("choice")) \( macron(a) \, b_i \)$ and sets $b_(i + 1) = s_(upright("step")) \( macron(a) \, b_i \, c_i \)$. Our choice sets will always be nonempty. A first-stabilization path ends with the first adjacent repetition; if its terminal value is $b_t$, the witnessing term is evaluated at

$ s_(upright("wit")) \( macron(a) \, b_t \, b_i \) $

for each preceding stage $i$. Thus the two slots after the parameters mean #emph[terminal value] and #emph[intermediate value] in the witnessing term, although they mean current state and choice in the step term.

A set $M_i$ of permutation graphs witnesses a nonempty choice set $D_i$ at stage $i$ if

#[#set math.equation(numbering: n => "(*)")
 $ M_i subset.eq "Aut" \( A \, macron(a) \, b_0 \, dots.h \, b_i \) quad upright("and") quad forall u \, v in D_i med exists g in M_i med \( g \( u \) = v \) . $ <mod:witness-condition>]

The notation on the right of the inclusion means automorphisms of the #emph[entire relational input] fixing the displayed HF objects. Permutation graphs act on HF objects by their recursive extensions. Equivariance makes $D_i$ invariant under this stabilizer, so (\*) makes it an orbit.

Every first-stabilization path must be witnessed. If evaluation succeeds, the operator returns true when the output formula holds at every terminal fixed point, and false otherwise. Under successful witnessing these fixed points lie in one orbit over the parameters, so their invariant output values agree. We will verify witnessing directly for every reachable state, rather than depend on a favorable computation path.

The polynomial annotation bounds the length and the state transitive sizes of every first-stabilization path. We will also bound every individual temporary HF object constructed while evaluating its terms. A failed witness or excessive WSC resource gives $dagger$, which propagates through enclosing expressions. In particular $dagger$ is not changed to false inside a comprehension or Boolean connective. The collection of all terminal fixed points need not be constructed as one polynomial-size HF set.

For either formalism $cal(L)$, let

$ "Def"_(cal(L)) \( tau \) = {{ A : A upright(" is a finite ") tau upright("-structure and ") phi \( A \) = upright("true") } : phi upright(" is an ") cal(L) \[ tau \] upright("-sentence")} . $

This is the comparison in Theorem 1. The polynomial, the vocabulary and the syntax of the separating sentence are fixed before the input size varies. The full syntax may nest witnessed choices; the sentence constructed here needs only one occurrence.

== 3 Grid structures and their automorphisms <str:structures>

We construct two families of finite structures with the same block sizes and different total charges. The structures encode edge states and the locally compatible choices of those states at each vertex of a box. Their automorphisms will serve two purposes: they will witness changes of edge choices, and they will constrain the objects that a choiceless computation can construct. The construction and its central extension are from #cite(label("cptCompanion2026")) Sections 2–3; we give the definitions and proofs needed here.

All vector spaces in this section are over $bb(F)_3$, and $1 \/ 2$ denotes $2 in bb(F)_3$. The fixed vocabulary consists of eight binary relations:

$ tau = { sans(E d) \, sans(C f) \, sans(E B) \, sans(V B) \, sans(I) \, sans(Z)_0 \, sans(Z)_1 \, sans(Z)_2 } . $

The numerical subscripts denote elements of $bb(F)_3$.

=== 3.1 The box and its edge states <the-box-and-its-edge-states>

Fix an integer $L gt.eq 2$. Let $G_L = \( V_L \, E_L \)$ be the box graph with

$ V_L = { 0 \, dots.h \, L - 1 }^3 \, $

whose edges join vertices differing by one in a single coordinate. Orient every edge in the positive coordinate direction. We often omit $L$ from the notation, writing $V \, E$ for $V_L \, E_L$. Define $epsilon.alt_(v e)$ to be $1$ when $v$ is the head of $e$, $- 1$ when it is the tail, and $0$ otherwise. The incidence map is

$ partial : bb(F)_3^E arrow.r bb(F)_3^V \, #h(2em) \( partial z \)_v = sum_(e in E) epsilon.alt_(v e) z_e . $

Let $F = F_L$ be the set of elementary square faces. A face in coordinate directions $i < j$ is traversed from its lower corner in directions $+ i \, + j \, - i \, - j$. Its boundary vector $c^f in bb(F)_3^E$ has coefficient $1$ on edges traversed in their positive orientation, $- 1$ on edges traversed against that orientation, and $0$ elsewhere. At each vertex on the face, one traversal edge enters and one leaves. Consequently

#[#set math.equation(numbering: n => "(3.1)")
 $ partial c^f = 0 #h(2em) \( f in F \) . $ <str:face-boundary>]

Write $F \( e \)$ for the faces containing an edge $e$, and $F \( v \)$ for the faces containing a vertex $v$. If $d \( v \)$ is the degree of $v$, then

#[#set math.equation(numbering: n => "(3.2)")
 $ \| F \( e \) \| lt.eq 4 \, #h(2em) \| F \( v \) \| lt.eq 12 \, #h(2em) 3 lt.eq d \( v \) lt.eq 6 . $ <str:local-bounds>]

Indeed, an edge belongs to at most two squares in each of the two transverse directions; for each pair of coordinate directions, a vertex belongs to at most four squares. Each coordinate supplies at least one and at most two incident edges, including at the boundary when $L = 2$.

On $bb(F)_3^2$ use the alternating bilinear form

$ omega \( \( r \, s \) \, \( r' \, s' \) \) = r s' - s r' . $

An edge state on $e$ is an element of

$ P_e = \( bb(F)_3^2 \)^(F \( e \)) times bb(F)_3 \, #h(2em) \( u \, z \) = \( \( u_f \)_(f in F \( e \)) \, z \) . $

It is useful to regard these states as a group. We use the finite Heisenberg multiplication over a field of odd characteristic #cite(label("gurevichHadani2009")) Section 2.1, with its alternating form specified by the face-boundary signs. Put

$ B_e \( u \, u' \) = 1 / 2 sum_(f in F \( e \)) c_e^f omega \( u_f \, u'_f \) $

and define

#[#set math.equation(numbering: n => "(3.3)")
 $ \( u \, z \) \( u' \, z' \) = \( u + u' \, z + z' + B_e \( u \, u' \) \) . $ <str:edge-product>]

Bilinearity yields

$ B_e \( u \, u' \) + B_e \( u + u' \, u'' \) = B_e \( u' \, u'' \) + B_e \( u \, u' + u'' \) \, $

which proves associativity. The identity is $\( 0 \, 0 \)$, and alternation gives $\( u \, z \)^(- 1) = \( - u \, - z \)$. Thus the scalar coordinate of the group difference $\( u \, z \)^(- 1) \( u' \, z' \)$ is

#[#set math.equation(numbering: n => "(3.4)")
 $ z' - z - 1 / 2 sum_(f in F \( e \)) c_e^f omega \( u_f \, u'_f \) . $ <str:edge-difference>]

This corrected difference will be recorded by the three relations $sans(Z)_delta$.

=== 3.2 Atoms, relations, and charges <atoms-relations-and-charges>

For a charge vector $b = \( b_v \)_(v in V) in bb(F)_3^V$, define the structure $A_b$ as follows. Its edge block $Y_e$ contains one atom $\( e \, u \, z \)$ for every $\( u \, z \) in P_e$. Its configuration block $X_v$ contains one atom

$ t = #scale(x: 120%, y: 120%)[\(] v \, \( \( u_e \, z_e \) \)_(e in.rev v) #scale(x: 120%, y: 120%)[\)] $

for every tuple of incident edge states satisfying

#[#set math.equation(numbering: n => "(3.5)")
 $ u_(e \, f) & = u_(e' \, f) &  & upright("for the two sides ") e \, e' upright(" of each ") f in F \( v \) upright(" at ") v \,\
sum_(e in.rev v) epsilon.alt_(v e) z_e & = b_v . $ <str:configuration>]

The blocks are disjoint, and the two sorts are separately tagged. Put

$ Y = product.co_(e in E) Y_e \, #h(2em) X = product.co_(v in V) X_v \, #h(2em) A_b = Y dot(union) X . $

These coordinates are labels for atoms; they are not set members of the atoms. In particular, the construction supplies no coordinate functions or order as part of the input structure.

For $t in X_v$ and $e in.rev v$, let $y_e \( t \) in Y_e$ denote the edge atom specified by the $e$-coordinate of $t$. Interpret the relations by

$ sans(E d) & = { \( y \, y \) : y in Y } \, & sans(C f) & = { \( t \, t \) : t in X } \,\
sans(E B) & = union.big_(e in E) Y_e^2 \, & sans(V B) & = union.big_(v in V) X_v^2 \,\
sans(I) & = { \( t \, y_e \( t \) \) : v in V \, med t in X_v \, med e in.rev v } . &  & $

For $delta in bb(F)_3$, set

#[#set math.equation(numbering: n => "(3.6)")
 $ sans(Z)_delta \( \( e \, u \, z \) \, \( e \, u' \, z' \) \) quad arrow.l.r.double quad z' - z - 1 / 2 sum_(f in F \( e \)) c_e^f omega \( u_f \, u'_f \) = delta . $ <str:z-relation>]

Each relation is false on all pairs not specified by these rules. In particular, $sans(I)$ is directed from configurations to edge atoms, and $sans(Z)_delta$ only relates atoms in one edge block. Exactly one of the three $sans(Z)_delta$ holds for each ordered pair within an edge block.

#thm([Lemma 3.1.])[
  #emph[For every $L gt.eq 2$ and every $b in bb(F)_3^(V_L)$, all edge and configuration blocks of $A_b$ are nonempty, and 
#[#set math.equation(numbering: n => "(3.7)")
 $ \| A_b \| = N_L = sum_(e in E_L) 3^(2 \| F \( e \) \| + 1) + sum_(v in V_L) 3^(2 \| F \( v \) \| + d \( v \) - 1) . $ <str:size-formula>]

 Thus $N_L$ is independent of $b$, and 
$ \| Y_e \| lt.eq 3^9 \, #h(2em) \| X_v \| lt.eq 3^29 \, #h(2em) L^3 lt.eq N_L lt.eq \( 3^10 + 3^29 \) L^3 . $

]
] <str:size>

#proof[
  The edge-block count is immediate from the definition of $P_e$. At a vertex $v$, each face $f in F \( v \)$ contributes one freely chosen vector in $bb(F)_3^2$, shared by its two sides at $v$. Coordinates for different faces are distinct, so these choices contribute $3^(2 \| F \( v \) \|)$ possibilities. The scalar constraint in Equation (3.5) is one equation in $d \( v \)$ variables, with every coefficient nonzero. Choose the scalars on all but one incident edge arbitrarily; the remaining scalar is then uniquely determined. Hence it contributes $3^(d \( v \) - 1)$ possibilities for every value of $b_v$. This proves Equation (3.7) and nonemptiness. The block bounds follow from Equation (3.2). Finally, there are $L^3$ vertices and $3 L^2 \( L - 1 \) lt.eq 3 L^3$ edges, which gives the asserted bounds on $N_L$. ◻
]

The quotient sets of $sans(E B)$-blocks and $sans(V B)$-blocks are therefore precisely ${ Y_e : e in E }$ and ${ X_v : v in V }$. Moreover, there is an $sans(I)$-pair from $X_v$ to $Y_e$ if and only if $e in.rev v$: every configuration chooses one state on each incident edge, and every $X_v$ is nonempty. Thus the incidence graph between these blocks recovers the underlying box.

The two families used below have charges

#[#set math.equation(numbering: n => "(3.8)")
 $ b^0 = 0 \, #h(2em) b^1 = upright(bold(1))_(v_(*)) \, #h(2em) v_(*) = \( 0 \, 0 \, 0 \) . $ <str:charges>]

By Lemma 2, $A_(b^0)$ and $A_(b^1)$ have the same size $N_L$. Their total charges in $bb(F)_3$ are respectively $0$ and $1$. The next construction gives a common family of automorphisms for both structures, and indeed for every charge vector.

=== 3.3 A central extension acting on the full structure <a-central-extension-acting-on-the-full-structure>

Define the vector spaces

$ C_F = \( bb(F)_3^2 \)^F \, #h(2em) K = ker partial subset.eq bb(F)_3^E . $

An element of $K$ is a circulation: its signed sum at every vertex is zero. For $a \, a' in C_F$, put

$ B \( a \, a' \) = 1 / 2 sum_(f in F) omega \( a_f \, a'_f \) c^f . $

Equation (3.1) implies $B \( a \, a' \) in K$. On the set $H = C_F times K$, define multiplication by

#[#set math.equation(numbering: n => "(3.9)")
 $ \( a \, k \) \( a' \, k' \) = \( a + a' \, k + k' + B \( a \, a' \) \) . $ <str:group-law>]

#thm([Lemma 3.2.])[
  #emph[The multiplication in Equation (3.9) makes $H$ a finite group. Its identity is $\( 0 \, 0 \)$ and $\( a \, k \)^(- 1) = \( - a \, - k \)$. The subgroup ${ 0 } times K$, identified with $K$, is central, and projection onto $C_F$ is a surjective homomorphism with kernel $K$. With the convention $\[ h \, h' \] = h h' h^(- 1) \( h' \)^(- 1)$, one has 
#[#set math.equation(numbering: n => "(3.10)")
 $ \[ \( a \, k \) \, \( a' \, k' \) \] = (0 \, sum_(f in F) omega \( a_f \, a'_f \) c^f) . $ <str:commutator>]

]
] <str:central-extension>

#proof[
  The map $B$ is bilinear and alternating. Its bilinearity gives
  $ B \( a \, a' \) + B \( a + a' \, a'' \) = B \( a' \, a'' \) + B \( a \, a' + a'' \) \, $
  so both associations of a product of three elements in $H$ agree. The identity and inverse follow from $B \( 0 \, a \) = B \( a \, 0 \) = B \( a \, - a \) = 0$. The assertions about the central subgroup and projection now follow directly from the product formula. Finally, multiplying the four factors of the commutator gives $\( 0 \, B \( a \, a' \) - B \( a' \, a \) \) = \( 0 \, 2 B \( a \, a' \) \)$. Since $2 \( 1 \/ 2 \) = 1$ in $bb(F)_3$, this is Equation (3.10). ◻
]

For $\( a \, k \) in H$, define a map $h_(a \, k)$ on each edge block by

#[#set math.equation(numbering: n => "(3.11)")
 $ h_(a \, k) \( e \, u \, z \) = (e \, med \( u_f + a_f \)_(f in F \( e \)) \, med z + k_e + 1 / 2 sum_(f in F \( e \)) c_e^f omega \( a_f \, u_f \)) . $ <str:edge-action>]

On a configuration atom, apply this map to each of its incident edge states. The following proposition verifies that the resulting tuple is again a configuration in the same block and that all input relations are preserved.

#thm([Proposition 3.3.])[
  #emph[For every $L gt.eq 2$ and $b in bb(F)_3^(V_L)$, the maps $h_(a \, k)$ define a faithful action of $H$ by automorphisms of the entire $tau$-structure $A_b$. Every $h_(a \, k)$ preserves each edge and configuration block setwise. For $k in K$, the central action $h_(0 \, k)$ fixes all face vectors and adds $k_e$ to the scalar coordinate on edge $e$.]
] <str:action>

#proof[
  For each edge $e$, the restriction map
  $ rho_e : H arrow.r P_e \, #h(2em) rho_e \( a \, k \) = \( \( a_f \)_(f in F \( e \)) \, k_e \) $
  is a homomorphism: the $e$-coordinate of $B \( a \, a' \)$ is exactly the correction in the product on $P_e$. Equation (3.11) is left multiplication by $rho_e \( a \, k \)$. It therefore defines a group action on the edge states, with inverse $h_(- a \, - k)$.
  Fix a configuration at $v$. For each $f in F \( v \)$, write $u_f$ for its common vector on the two incident sides of $f$. Both copies receive the same addition $a_f$, so the face equalities remain true. The change in its divergence is
  $ \( partial k \)_v + 1 / 2 sum_(f in F \( v \)) (sum_(e in.rev v) epsilon.alt_(v e) c_e^f) omega \( a_f \, u_f \) = 0 . $
  Here the first term vanishes because $k in K$, and every inner sum vanishes by Equation (3.1). The image is consequently a configuration with charge $b_v$. The inverse map gives a bijection of each $X_v$, and componentwise composition gives the same group law as on edge atoms.
  Preservation of sorts and blocks proves preservation of $sans(E d) \, sans(C f) \, sans(E B) \, sans(V B)$. The coordinatewise definition on configurations proves preservation of $sans(I)$. For the remaining relations, let $g \, g' in P_e$ be two edge states and $p = rho_e \( a \, k \)$. The group identity
  $ \( p g \)^(- 1) \( p g' \) = g^(- 1) g' $
  shows that their corrected scalar difference in Equation (3.4) is unchanged. Thus every $sans(Z)_delta$ is preserved. These statements also apply to the inverse, so all eight relations are preserved in both directions, including nonrelations. This proves that the action is by automorphisms of $A_b$.
  If $h_(a \, k)$ fixes every atom, apply it to the state $\( 0 \, 0 \)$ on each edge. Equation (3.11) then gives $k_e = 0$ for every $e$ and $a_f = 0$ whenever $f in F \( e \)$. Every face has an edge, so $a = 0$ and $k = 0$; the action is faithful. The final assertion follows by setting $a = 0$ in Equation (3.11). ◻
]

We identify $H$ and $K$ with these permutation groups. Their actions extend to $"HF" \( A_b \)$ by the recursive rule $h dot.op x = { h dot.op y : y in x }$ when $x$ is a set, and by the specified permutation when $x$ is an atom. Every object has finite rank, so this rule is well defined at every rank; it preserves membership and fixes all pure hereditarily finite sets.

Two face-vector translations can have a nontrivial commutator in the central circulation subgroup $K$. This link between the quotient and the central subgroup will be used in Section 6: a small orbit under the full group $H$ will constrain which circulations in $K$ can move an object. For the choice construction, the two kinds of coordinates will instead be corrected successively, first by a face translation and then by a circulation.

== 4 A witnessed-choice sentence on all inputs <sec:sentence>

We construct one sentence over the eight binary relations of Section 3. Its computation first orders the graph of blocks using a tuple of four vertex blocks. It then selects one edge atom on each edge outside a spanning tree and tests whether those selections extend to compatible configurations. The choices are guarded by an explicit test for suitable witnessing automorphisms. Consequently the construction is meaningful on arbitrary finite inputs, including inputs whose block graph is not a box.

The state is a set of selected atoms, and a real step adds one atom from the next unselected edge outside the tree. We permit that step only when an explicitly constructed family of full-input automorphisms fixes the selected atoms individually and acts transitively on a nonempty candidate set. Otherwise a pure dummy leaves the state unchanged. Since states only grow, pointwise fixation of the current selected atoms fixes every earlier state as well. This is the invariant that makes the guarded computation legal on all inputs. On the boxes, the additional work in Section 5 proves that the guard always permits a real choice until every non-tree edge has been processed.

=== 4.1 Bounded notation, blocks, and distances <bounded-notation-blocks-and-distances>

Let $A$ be the universe of an arbitrary finite $tau$-structure, and write $n = \| A \|$. All the definitions below abbreviate BGS terms and formulas, except for the one explicitly displayed WSC operator. We use Kuratowski ordered pairs

$ chevron.l a \, b chevron.r = { { a } \, { a \, b } } $

and nested pairs for tuples of any fixed length. A relation is represented by its set of ordered pairs. Fixed products are formed by nested comprehensions and finite unions. Bounded quantifiers are abbreviations: for example, $exists z in t thin theta \( z \)$ tests whether ${ nothing : z in t \, theta \( z \) }$ is nonempty. Membership, intersection, difference, singletons, and finite unions are therefore available from $sans(P a i r) \, sans(U n i o n) \, sans(U n i q u e)$, and comprehension. The predicate that an object is a set is its nonmembership in $sans(A t o m s)$.

Natural numbers are von Neumann ordinals. Their order is membership, and their successor is $i union { i }$. In particular, the bounded index set

$ I_n = sans(C a r d) \( sans(A t o m s) \) union { sans(C a r d) \( sans(A t o m s) \) } = { 0 \, dots.h \, n } $

is a term. Unique lookups are implemented by $sans(U n i q u e)$; an unsuccessful lookup returns $nothing$. A conditional term is $sans(U n i q u e)$ applied to the union of the two appropriately guarded singleton comprehensions. Tuple components can equivalently be accessed by bounded tests on their defining product, so no unbounded search is implicit in this notation. Every fixed list of conditions is expanded as a finite conjunction or disjunction.

Define the two sets of atoms

$ Y = { s in sans(A t o m s) : sans(E d) \( s \, s \) } \, #h(2em) X = { t in sans(A t o m s) : sans(C f) \( t \, t \) } \, $

and the two families of rows

$ cal(E) = { { s in Y : sans(E B) \( a \, s \) } : a in Y #scale(x: 120%, y: 120%)[}] \, #h(2em) cal(V) = { { t in X : sans(V B) \( a \, t \) } : a in X #scale(x: 120%, y: 120%)[}] . $

These terms are defined before any structural assumptions are tested. Each family has at most $n$ members and every row has at most $n$ atoms. When the checks below succeed, their members are precisely the nonempty edge blocks and vertex blocks. Define

$ v tilde.op e quad arrow.l.r.double quad exists t in v thin exists s in e #h(0.27778em) sans(I) \( t \, s \) #h(2em) \( v in cal(V) \, med e in cal(E) \) . $

For $J subset.eq cal(E)$, write $u tilde.op_J w$ when $u \, w$ are distinct vertices and some $e in J$ is incident with both.

Here is a bounded term used for every connectivity test in the construction. Starting with $R = nothing$, iterate the inflationary update

#[#set math.equation(numbering: n => "(4.1)")
 $ R mapsto R & union { chevron.l v \, v \, 0 chevron.r : v in cal(V) }\
 & union { chevron.l v \, w \, i + 1 chevron.r : v \, w in cal(V) \, med i \, i + 1 in I_n \, med exists u in cal(V) thin \[ chevron.l v \, u \, i chevron.r in R med and med \( u = w med or med u tilde.op_J w \) \] #scale(x: 120%, y: 120%)[}] . $ <sen:distance-iteration>]

Denote its fixed point by $R_J$, and put

$ "conn"_J \( v \, w \) quad arrow.l.r.double quad chevron.l v \, w \, n chevron.r in R_J . $

Every iterate lies in the fixed triple domain $cal(V)^2 times I_n$. Induction on $i$ shows that its fixed point contains $chevron.l v \, w \, i chevron.r$ exactly when there is a $J$-walk from $v$ to $w$ of length at most $i$: the option $u = w$ pads a shorter walk. Since $\| cal(V) \| lt.eq n$, the predicate $"conn"_J$ expresses reachability for the adjacency relation $tilde.op_J$. Define $d \( v \, w \)$ to be the least $i in I_n$ with $chevron.l v \, w \, i chevron.r in R_(cal(E))$, using $0$ if there is no such $i$.

Let $"Check" \( A \)$ be the conjunction of the following bounded conditions.

+ The relations $sans(E d) \, sans(C f)$ are exactly the diagonals of a partition $Y dot(union) X = A$.
+ The relation $sans(E B)$ is an equivalence relation on $Y$ and is empty outside $Y^2$; likewise $sans(V B)$ is an equivalence relation on $X$ and is empty outside $X^2$. Also $sans(I) subset.eq X times Y$.
+ The family $cal(V)$ is nonempty. Every $e in cal(E)$ has exactly two distinct incident vertices, and different edges have different unordered pairs of endpoints. Every two vertices satisfy $"conn"_(cal(E)) \( v \, w \)$.
+ If $v tilde.op e$, then every $t in v$ has exactly one $sans(I)$-neighbor in $e$.

When this check succeeds, let $G$ denote the resulting simple connected graph on $cal(V)$, with edge set $cal(E)$. No condition is imposed on the three input relations $sans(Z)_delta$; they will all be included in the automorphism test.

=== 4.2 Ordering the block graph and choosing a tree <ordering-the-block-graph-and-choosing-a-tree>

A tuple $alpha = \( a_1 \, a_2 \, a_3 \, a_4 \) in cal(V)^4$ is #emph[resolving] if the map

$ v mapsto \( d \( a_1 \, v \) \, d \( a_2 \, v \) \, d \( a_3 \, v \) \, d \( a_4 \, v \) \) $

is injective on $cal(V)$. Let $P$ be the set of codes of all resolving tuples when $"Check" \( A \)$ holds, and let $P = nothing$ otherwise. Repetitions among the four entries are permitted. For $alpha in P$, lexicographic comparison of the four distance coordinates defines a linear order $<_alpha$ on vertices. Order edges by the lexicographic order of their endpoint pairs, placing the smaller endpoint first.

Let $r$ be the least vertex. At every vertex $v eq.not r$, choose as parent the least neighbor $w$ satisfying $d \( r \, w \) + 1 = d \( r \, v \)$, and let $T = T \( alpha \)$ be the set of these parent edges. Here #emph[least] always means a bounded test that no smaller eligible member of $cal(V)$ or $cal(E)$ exists. Connectedness ensures that a parent exists. Parent distances strictly decrease, so every parent chain reaches $r$; consequently $T$ is a spanning tree. Set $T = nothing$ for $alpha in.not P$. All later tree constructions are guarded by $alpha in P$.

=== 4.3 Comparisons on four-cycles and the next choice <comparisons-on-four-cycles-and-the-next-choice>

We next define comparisons between atoms on the sides of a four-cycle. They determine which atoms on the next edge are compatible with the previously selected atoms. On the boxes, one such comparison detects equality of the vector attached to that face. Comparing two atoms on the same edge over all its faces therefore detects equality of their complete vector coordinates, leaving their scalar coordinates unrestricted. Lemma 10 proves these assertions. The definitions here use only incidence and apply to arbitrary checked inputs. Let $cal(F)$ consist of all codes

$ f = \( v_0 \, v_1 \, v_2 \, v_3 \; e_0 \, e_1 \, e_2 \, e_3 \) in cal(V)^4 times cal(E)^4 $

whose four vertices and four edges are separately distinct, with $e_i$ joining $v_i$ to $v_(i + 1)$, where subscripts are taken modulo $4$. Every starting point and direction is included.

For adjacent positions $i \, j$, define $"adj"_f \( i \, s \; j \, s' \)$ by requiring $s in e_i$, $s' in e_j$, and a configuration in their shared vertex block incident with both atoms. Explicitly, the shared vertex is $v_(i + 1)$ when $j = i + 1$, and $v_i$ when $j = i - 1$, and the last condition is

$ exists t in v #h(0.27778em) \[ sans(I) \( t \, s \) and sans(I) \( t \, s' \) \] . $

For arbitrary positions, define $"match"_f \( s \, s' \)$ as the disjunction over the sixteen pairs $i \, j in { 0 \, 1 \, 2 \, 3 }$ of $s in e_i$, $s' in e_j$, and the following condition:

- if $j = i plus.minus 1$, use $"adj"_f \( i \, s \; j \, s' \)$;
- if $j = i$ or $j = i + 2$, use
  $ exists q in e_(i + 1) #h(0.27778em) \[ "adj"_f \( i \, s \; i + 1 \, q \) and "adj"_f \( j \, s' \; i + 1 \, q \) \] . $

The two adjacency tests in the second clause may have different configuration witnesses. For $s \, s' in h in cal(E)$, put

#[#set math.equation(numbering: n => "(4.2)")
 $ "baseEq"_h \( s \, s' \) quad arrow.l.r.double quad forall f in cal(F) #h(0.27778em) \[ h upright(" is a side of ") f med arrow.r.double med "match"_f \( s \, s' \) \] . $ <sen:base-equality>]

A state $x$ of the choice computation will be a set of selected edge atoms. Let $E_(upright("next")) \( alpha \, x \)$ be the singleton consisting of the least edge in

$ { e in cal(E) \\ T : x ∩ e = nothing } \, $

or the empty set if this set is empty or $alpha in.not P$. Define $D \( alpha \, x \)$ by taking, for $e in E_(upright("next")) \( alpha \, x \)$, all $s in e$ such that

#[#set math.equation(numbering: n => "(4.3)")
 $ "match"_f \( s \, s' \) quad upright("whenever ") med f in cal(F) \, med e upright(" is a side of ") f \, med s' in x \, upright(" and ") s' upright(" lies on a side of ") f . $ <sen:candidates>]

If there is no next edge, then $D \( alpha \, x \) = nothing$. All side tests are finite disjunctions over the four positions of the tuple $f$. Thus $D$ is a bounded comprehension even when the input fails the structural check.

=== 4.4 Explicit pools of relations on atoms <explicit-pools-of-relations-on-atoms>

To witness a choice we shall test compositions of two kinds of relations. Their roles can be seen on a box. To send one candidate edge atom to another, first translate their differing face vectors. At most four faces are involved, so this changes only a bounded number of atoms. It may also change the scalar coordinate; a circulation along the new edge and its return path in $T$ corrects the remaining scalar difference. This cycle contains no previously selected non-tree edge. Proposition 11 proves that the two transformations fix all previous selections and preserve the full structure.

The first pool below contains every permutation moving at most a fixed number of atoms. The second describes the tree-cycle corrections through incidence and the relations $sans(Z)_delta$. These definitions require neither coordinates nor a promise that the input is a box. They may produce relations that are not functions; we retain a composition only after checking that it is an automorphism of the entire input fixing the selected atoms individually.

===== 4.4.1 Local relations. <local-relations.>

Write

$ I_A = { chevron.l a \, a chevron.r : a in A } \, #h(2em) B = 16 \( 3^9 + 3^29 \) . $

For $macron(p) \, macron(q) in A^B$, define the relation

#[#set math.equation(numbering: n => "(4.4)")
 $ ell_(macron(p) \, macron(q)) = { chevron.l p_i \, q_i chevron.r : 1 lt.eq i lt.eq B } union { chevron.l a \, a chevron.r : a in A \, med a eq.not p_i upright(" for every ") i } . $ <sen:local-relation>]

Set

$ cal(L) = { I_A } union { ell_(macron(p) \, macron(q)) : macron(p) \, macron(q) in A^B } . $

The indices in Equation (4.4) are a fixed finite list, not an input-dependent iteration. If a nonidentity permutation moves at most $B$ atoms, listing its moved atoms and their images and padding both lists by repetitions puts its graph in $cal(L)$. Identity was included separately, also covering $A = nothing$. Other members of $cal(L)$ need not be functions.

===== 4.4.2 Cycle relations. <cycle-relations.>

We now define the second pool $cal(C) \( alpha \, x \)$. It contains $I_A$. For $alpha in P$, add a relation for every

$ e in E_(upright("next")) \( alpha \, x \) \, quad \( U \, V \) upright(" an ordering of the endpoints of ") e \, quad o in cal(V) . $

For these indices, the directed traversal consists of $e$ from $U$ to $V$ and the tree path from $V$ to $U$. We specify it without listing a path as an unbounded tuple. Its set of directed edges is

#[#set math.equation(numbering: n => "(4.5)")
 $ Gamma_(e \, U \, V) =  & { chevron.l e \, U \, V chevron.r }\
 &  union { chevron.l h \, r \, r' chevron.r : h in T \, med r \, r' upright(" are the distinct endpoints of ") h \,\
 & #h(40mm)  not "conn"_(T \\ { h }) \( V \, U \) \, med "conn"_(T \\ { h }) \( V \, r \) \, med "conn"_(T \\ { h }) \( U \, r' \) } . $ <sen:cycle-traversal>]

Deleting a tree edge gives two components. It belongs to the return path precisely when they separate $V$ and $U$, and then the conditions in Equation (4.5) determine its direction uniquely. Write $E \( Gamma \)$ for the set of edge blocks occurring in this traversal, and for $chevron.l h \, r \, r' chevron.r in Gamma$ set

$ delta_(Gamma \, o) \( h \) = cases(delim: "{", 1 \, & d \( o \, r \) < d \( o \, r' \) \,, 2 \, & upright("otherwise") .) $

The values $1 \, 2$ here select the corresponding relation symbols $sans(Z)_1 \, sans(Z)_2$. In particular, ties in distance are assigned the value $2$; no bipartiteness assumption is needed in this definition. On the box structures of Section 5, the block at the coordinate origin is an index $o$ for which these labels give the signs of traversal in the fixed edge orientations. Enumerating all $o$ includes this index without selecting it; Proposition 11 verifies the resulting circulation.

The edge part of the indexed relation is

#[#set math.equation(numbering: n => "(4.6)")
 $ c_Y =  & { chevron.l s \, s chevron.r : h in cal(E) \\ E \( Gamma \) \, med s in h }\
 &  union { chevron.l s \, s' chevron.r : h in E \( Gamma \) \, med s \, s' in h \, med "baseEq"_h \( s \, s' \) and sans(Z)_(delta_(Gamma \, o) \( h \)) \( s \, s' \) } . $ <sen:cycle-edge-relation>]

Its configuration part is

#[#set math.equation(numbering: n => "(4.7)")
 $ c_X = { chevron.l t \, t' chevron.r : #h(0.27778em) & v in cal(V) \, med t \, t' in v \,\
 & forall h in cal(E) med \[ v tilde.op h med arrow.r.double med exists s \, s' in h thin \( sans(I) \( t \, s \) and sans(I) \( t' \, s' \) and chevron.l s \, s' chevron.r in c_Y \) \] } . $ <sen:cycle-configuration-relation>]

Put $c_(e \, U \, V \, o) = c_Y union c_X$, and collect all these relations together with identity into $cal(C) \( alpha \, x \)$. If $alpha in.not P$, take $cal(C) \( alpha \, x \) = { I_A }$. The displayed condition involving $sans(Z)_(delta_(Gamma \, o) \( h \))$ is a two-case finite disjunction, so it does not require a relation symbol with a variable index.

===== 4.4.3 Composition and the automorphism filter. <composition-and-the-automorphism-filter.>

The two raw pools are now defined. We retain their compositions that preserve the full input and fix the selected atoms. For relations $ell \, c subset.eq A^2$, their composition in this order is

$ c compose ell = { chevron.l a \, b chevron.r : a \, b in A \, med exists u in A thin \[ chevron.l a \, u chevron.r in ell and chevron.l u \, b chevron.r in c \] } . $

Let $"Filt" \( alpha \, x \, g \)$ require the following.

+ The relation $g$ is the graph of a permutation of $A$: every atom has exactly one image and exactly one preimage.
+ For every one of the eight symbols $R in tau$ and every $a \, a' \, b \, b' in A$ with $chevron.l a \, b chevron.r \, chevron.l a' \, b' chevron.r in g$,
  $ R \( a \, a' \) med arrow.l.r med R \( b \, b' \) . $
+ Each member of $cal(E) union cal(V)$ is fixed setwise, and $chevron.l s \, s chevron.r in g$ for every $s in x ∩ A$.

Each condition is bounded. For example, setwise preservation of a block $u$ is tested by requiring that the image of every $a in u$ belongs to $u$; bijectivity and finiteness then give equality of the image with $u$. Define

#[#set math.equation(numbering: n => "(4.8)")
 $ M \( alpha \, x \) = { I_A } union { c compose ell : ell in cal(L) \, med c in cal(C) \( alpha \, x \) \, med "Filt" \( alpha \, x \, c compose ell \) } #h(2em) \( alpha in P \) \, $ <sen:witness-pool>]

and set $M \( alpha \, x \) = { I_A }$ otherwise. The local relation is applied first. Only the composition is filtered; neither raw factor is assumed to be a permutation.

Every member of $M \( alpha \, x \)$, when $alpha in P$, is thus an automorphism of the full $tau$-structure. It fixes $alpha$, since it fixes all four of its block entries, and it fixes every atom in the state $x$ individually whenever $x subset.eq Y$. This last condition will ensure that witnesses respect the entire computation history.

=== 4.5 The guarded choice and witness terms <the-guarded-choice-and-witness-terms>

Define the bounded formula

$ "Trans" \( alpha \, x \) quad arrow.l.r.double quad forall s \, s' in D \( alpha \, x \) #h(0.27778em) exists g in M \( alpha \, x \) #h(0.27778em) chevron.l s \, s' chevron.r in g \, $

and the choice term

#[#set math.equation(numbering: n => "(4.9)")
 $ s_(upright("choice")) \( alpha \, x \) = cases(delim: "{", D \( alpha \, x \) \, & D \( alpha \, x \) eq.not nothing med and "Trans" \( alpha \, x \) \,, { nothing } \, & upright("otherwise") .) $ <sen:guarded-choice>]

The singleton ${ nothing }$ supplies a pure dummy choice. The step and witness terms are

#[#set math.equation(numbering: n => "(4.10)")
 $ s_(upright("step")) \( alpha \, x \, y \) & = x union #scale(x: 120%, y: 120%)[\(] { y } ∩ Y #scale(x: 120%, y: 120%)[\)] \,\
s_(upright("wit")) \( alpha \, z \, x \) & = M \( alpha \, x \) . $ <sen:step-witness>]

In the second line $z$ denotes the resulting fixed point and $x$ denotes the intermediate state being certified. These are precisely the two slots, in this order, of the witnessing term in #cite(label("ls2023")) Section 3.1; the final-state slot is unused. Equivalently the syntactic term supplied in the slots $\( alpha \, x \, y \)$ is $M \( alpha \, y \)$. Unused formal variables may be inserted through tautological self-equalities if required. Under the member-choice convention, every real choice $y$ is an atom of $Y$, so the first line adds exactly that atom. The pure dummy $nothing$ is not in $Y$ and causes no change.

=== 4.6 Testing the terminal selection <testing-the-terminal-selection>

It remains to define the output formula. Say $"Complete" \( alpha \, x \)$ holds if $alpha in P$, $x$ is a set contained in $Y$, and

$ \| x ∩ e \| = 1 quad \( e in cal(E) \\ T \) \, #h(2em) x ∩ h = nothing quad \( h in T \) . $

These cardinality tests use $sans(C a r d)$. When $"Complete" \( alpha \, x \)$ holds, the selections on non-tree edges impose restrictions on configurations within each single block $v$. Once these are imposed, the remaining compatibility conditions connect configurations only across the edges of $T$. We test them by successively deleting configurations that have no compatible survivor across an adjacent tree edge. Specifically, for $t in v in cal(V)$, say that $t$ is #emph[allowed] if

#[#set math.equation(numbering: n => "(4.11)")
 $ forall h in cal(E) \\ T med \[ v tilde.op h med arrow.r.double med exists s in x ∩ h #h(0.27778em) sans(I) \( t \, s \) \] . $ <sen:allowed>]

Compute a set $S subset.eq X$ by ordinary iteration from the empty set, adjoining to the current $S$

- every configuration that is not allowed;
- every $t in v$ for which there exist $h in T$ and $w in cal(V) \\ { v }$, with $v tilde.op h tilde.op w$, such that
  $ not exists t' in w \\ S #h(0.27778em) exists s in h thin \[ sans(I) \( t \, s \) and sans(I) \( t' \, s \) \] . $

The old set $S$ is retained at every update. Let $S_oo$ be the fixed point. Every strict update adds an atom of $X$, so stabilization takes at most $\| X \| + 1$ applications of the update. Put

#[#set math.equation(numbering: n => "(4.12)")
 $ Phi_(upright("out")) \( alpha \, x \) quad arrow.l.r.double quad "Complete" \( alpha \, x \) med and med forall v in cal(V) #h(0.27778em) \( v \\ S_oo eq.not nothing \) . $ <sen:output>]

#thm([Lemma 4.1.])[
  (Exactness of the tree test).  #emph[Suppose $"Check" \( A \)$ holds, $alpha in P$, and $"Complete" \( alpha \, x \)$ holds. Then $Phi_(upright("out")) \( alpha \, x \)$ is true if and only if there exist atoms $t_v in v$, for every $v in cal(V)$, and $s_e in e$, for every $e in cal(E)$, such that 
$ sans(I) \( t_v \, s_e \) quad upright("whenever ") v tilde.op e \, #h(2em) s_e in x quad upright("whenever ") e in.not T . $

]
] <sen:tree-test>

#proof[
  Suppose first that such atoms exist. Each $t_v$ is allowed. Inductively, none is deleted: across a tree edge from $v$ to $w$, the atom $t_w$ survives the previous round and shares $s_e$ with $t_v$. Thus every block has a survivor.
  Conversely, assume every block has a survivor at the fixed point. All survivors are allowed, and every survivor has a surviving support across each adjacent tree edge. Choose any survivor at the root of $T$. Proceed away from the root, choosing for each child a surviving configuration supporting the one chosen at its parent. This defines one $t_v$ at every vertex because $T$ is a finite tree. On each tree edge, the two chosen configurations share an atom $s_e$. Each configuration has exactly one neighbor in each incident edge block by $"Check" \( A \)$, so their selected edge atoms agree. On a non-tree edge, allowedness forces both endpoints to use its unique member of $x$. These atoms give the required completion. This argument does not require configurations within a block to be determined uniquely by their incident neighbors. ◻
]

We can now specify the sentence:

#[#set math.equation(numbering: n => "(4.13)")
 $ O \( alpha \) & = upright("WSC")^(*) x y . thin \( s_(upright("step")) \, s_(upright("choice")) \, s_(upright("wit")) \, Phi_(upright("out")) \) \,\
Phi & equiv { nothing : alpha in P \, med O \( alpha \) } eq.not nothing . $ <sen:sentence>]

The sole parameter of the WSC operator is the code $alpha$. In particular, atom variables used to form the equivalence-class rows are bound within those terms; none is an additional WSC parameter. We give the fixed polynomial annotation below.

=== 4.7 Witnesses respect all previous states <witnesses-respect-all-previous-states>

The guards make the sentence legal without any structural promise beyond what it explicitly tests.

#thm([Lemma 4.2.])[
  #emph[For every input and every $alpha in P$, each choice set reached from $x = nothing$ is a nonempty orbit under the automorphisms fixing $alpha$ and every preceding state. The corresponding value of $s_(upright("wit"))$ witnesses that orbit using automorphisms of the full input. Every path reaches its first repeated state after at most $n + 1$ transitions.]
] <sen:history>

#proof[
  Inductively, the current state $x$ consists of one selected atom from each edge in an initial segment of the ordered set $cal(E) \\ T$. This holds at the empty state. A real choice lies in the next unselected edge, so the step adds one new atom and extends that initial segment. A dummy choice leaves $x$ unchanged and hence stabilizes. Thus all earlier states are subsets of the current state. There are at most $\| cal(E) \| lt.eq n$ strict steps, followed by a stabilizing step.
  Fix an actual prefix $b_0 = nothing \, b_1 \, dots.h \, b_i = x$, and let
  $ H_i = "Aut" \( A \, alpha \, b_0 \, dots.h \, b_i \) . $
  Every element of $M \( alpha \, x \)$ is a full-input automorphism fixing $alpha$ and fixing all atoms in $x$ individually. Since $b_j subset.eq x$ for $j lt.eq i$, it fixes every earlier $b_j$. Consequently
  $ M \( alpha \, x \) subset.eq H_i . $
  All terms defining $D$ and $M$ are equivariant in their displayed arguments: they use only input relations, bounded set operations, ordinals, and the indicated iterations. An automorphism fixing $alpha$ and $x$ therefore preserves $D \( alpha \, x \)$, and it conjugates the family $M \( alpha \, x \)$ to itself.
  If the first case of Equation (4.9) applies, fix $s in D \( alpha \, x \)$. Invariance under $H_i$ gives $H_i s subset.eq D \( alpha \, x \)$, while the guard and $M \( alpha \, x \) subset.eq H_i$ give $D \( alpha \, x \) subset.eq H_i s$. Thus the choice set is exactly this orbit, and the maps in $M$ witness every ordered pair of its members. If the second case applies, the choice set is ${ nothing }$, and identity witnesses its only pair. It belongs to $M$ in every case. At a final state $z$, the witnessing term evaluated on $\( alpha \, z \, b_i \)$ returns exactly $M \( alpha \, b_i \)$, as required. ◻
]

The proof also shows directly why the output is independent of the choices for a fixed $alpha$. Given two prefixes of the same length, inductively map the first to the second by an automorphism fixing $alpha$. At the next step, transport the first chosen member into the second choice set by equivariance, and then use a witness fixing the second prefix to send it to the second chosen member. Composing the maps matches the extended prefixes. Stabilization is preserved by an automorphism, so all terminal paths have the same length and all their terminal states lie in one orbit. The formula $Phi_(upright("out"))$ is invariant on this orbit.

=== 4.8 One fixed polynomial for the expanded sentence <one-fixed-polynomial-for-the-expanded-sentence>

All the notation in this section specifies finite syntax. In particular the large integer $B$ controls a fixed product. The raw witness relations are enumerated by fixed products of atoms, and the WSC semantics handles choice paths individually. We now give a bound that also covers temporary relation graphs and objects rejected by the filter.

Fix a direct, capture-avoiding expansion of all the preceding macros using the tuple convention already specified. Let $H_0$ be its syntax height; the number of symbols may be used instead as an upper bound. Define the fixed integer sequence and polynomial

#[#set math.equation(numbering: n => "(4.14)")
 $ d_0 = 1000 \, #h(2em) d_(j + 1) = 1000 \( d_j + 1 \)^3 \, #h(2em) p \( n \) = \( n + 2 \)^(d_(H_0 + 1)) . $ <sen:polynomial>]

Every ordinary iteration and the WSC operator receive this same polynomial annotation.

#thm([Lemma 4.3.])[
  (Resource bound).  #emph[For every finite input, the expansion of Equation (4.13), annotated by Equation (4.14), has the following properties. Every constructed set, including temporary sets before any filtering, has transitive size at most $p \( n \)$. Every ordinary iteration stabilizes within $p \( n \)$ steps, and every WSC path to first stabilization has at most $p \( n \)$ state labels.]
] <sen:resources>

#proof[
  We first bound the states of the iterations independently of the annotation. The row families have at most $n$ members, each a subset of $A$. Every state of the iteration defining $R_J$ is a subset of $cal(V)^2 times I_n$, with the fixed triple coding from above. It has polynomial hereditary size even on an input failing $"Check" \( A \)$. An inflationary iteration on this domain has at most $n^2 \( n + 1 \)$ strict updates. Every state in the deletion iteration is a subset of $X$. By Lemma 6, every WSC state is a subset of $Y$, and a path to first stabilization has at most $n + 2$ state labels. The parameter $alpha$ is a fixed-length tuple of blocks, and each supplied choice is an atom or the pure dummy. With the fixed pair coding, all these state and supplied-argument hereditary sizes, and all these iteration lengths, are bounded by $\( n + 2 \)^100$.
  For the remaining terms, use hereditary size $rho \( a \) = 1$ for an atom and $rho \( a \) = 1 + \| "TC" \( a \) \|$ for a set. An actual activation here means a call to a subexpression with arguments supplied during evaluation of this expanded sentence before resource cutoffs. We include every choice path and every retrospective witness call. We verify by induction on expanded syntax height that a subexpression of height at most $j$, at any actual activation whose free arguments have hereditary sizes at most $\( n + 2 \)^d$, where $d gt.eq 1$, constructs individual values of hereditary size at most
  $ \( n + 2 \)^(d_j d) . $
  This induction includes the evaluations forming all candidates in $cal(L) \, cal(C)$, and $M$, whether or not those candidates pass a subsequent test.
  At height zero, variables and the constants $nothing \, sans(A t o m s)$ satisfy the bound. The primitive functions $sans(P a i r) \, sans(U n i o n) \, sans(U n i q u e) \, sans(C a r d)$ satisfy the next-height bound: pairing adds only finitely many wrappers to the two hereditary contents, union and unique extraction use their arguments’ contents, and $sans(C a r d)$ produces an ordinal no larger than the cardinality of the input set, or zero for an atom.
  For a comprehension of height $j + 1$, its range has at most $\( n + 2 \)^(d_j d)$ members, and each such member has hereditary size bounded by the same quantity. Thus the condition and body have argument exponent at most $d_j d$. By induction each body value has hereditary size at most $\( n + 2 \)^(d_j^2 d)$. The union of their hereditary contents, together with the comprehension itself, is bounded by $\( n + 2 \)^(\( d_j^2 + d_j + 2 \) d)$. The recurrence for $d_(j + 1)$ dominates this exponent and the bounds for all temporary condition and body evaluations. Atomic formulas and Boolean combinations introduce no larger sets.
  At an ordinary iteration, its extra state argument has the independent bound $\( n + 2 \)^100$ proved above. Replacing the argument exponent $d$ by $100 d$ bounds the step subexpressions by $\( n + 2 \)^(100 d_j d)$. The returned state has the independent state bound; the recurrence again dominates both estimates. At the WSC operator the same argument applies to its step, choice, witness, and output subexpressions, because the intermediate and final states and the choices have the stated independent bound. In particular it applies when the witness term is reevaluated at any earlier state. The operator supplies a truth value; it does not collect the branching family of paths as one HF object.
  This proves the induction. Starting with the sentence’s empty free assignment and using one extra height in Equation (4.14) gives the asserted common bound. The independent iteration bounds also lie below this polynomial. All these estimates were obtained before imposing resource cutoffs. Therefore the annotated and unbounded evaluations agree at every actual call, and no cutoff is reached. ◻
]

#thm([Proposition 4.4.])[
  (A total all-input definition).  #emph[The sentence $\( Phi \, p \)$ of Equations (4.13) and (4.14) is a fixed $upright("CPT") + upright("WSC")$ sentence over $tau$. It evaluates to either true or false on every finite $tau$-structure, never to $dagger$, and its true-model class is isomorphism-invariant.]
  #emph[More explicitly, it is true precisely when $P eq.not nothing$ and there exists $alpha in P$ such that every terminal state of the guarded selection is complete and extends to consistent configurations as in Lemma 5.]
] <sen:all-input>

#proof[
  All macros use only the permitted finite syntax and bounded iterations. The only WSC calls in the outer comprehension have parameters in $P$. Lemma 6 verifies every required witness using automorphisms of the entire input, including all three $sans(Z)_delta$ relations, and respecting every earlier state. Lemma 7 excludes exceeded bounds. Hence neither source of $dagger$ occurs. Every path reaches a fixed point, so the output semantics applies to a nonempty family of terminal states. Equation (4.12) and Lemma 5 give the stated characterization.
  An isomorphism transports the block families, $P$, all bounded constructions, and all choice paths to their counterparts. It also preserves the output test. It may permute the parameter tuples, which leaves the outer existential comprehension unchanged. Thus the true-model class is invariant. If the input check fails or $P$ is empty, the comprehension has empty range and the sentence is false. This includes the empty input. A connected graph with one vertex and no edges is also covered: its repeated four-entry tuple is resolving, the dummy stabilizes immediately, and the tree test asks only for a configuration in its nonempty vertex block. ◻
]

== 5 Witnessed choices on the grids <sec:grid-behavior>

We now evaluate the sentence of Section 4 on the structures $A_b$ of Section 3. Throughout this section, $L gt.eq 2$ and $b in bb(F)_3^(V_L)$; we identify the block graph with the underlying box when this identification has been established. The key point is that every choice between two candidates is realized by a translation on at most four faces followed by a scalar flow around one cycle. These two maps fix all previous choices, for every tree obtained from a parameter $alpha in P$.

=== 5.1 Resolving parameters and face comparisons <resolving-parameters-and-face-comparisons>

#thm([Lemma 5.1.])[
  #emph[Every structure $A_b$ passes the input check of Section 4, its block graph is the box on $V_L$, and its parameter set $P$ is nonempty.]
] <grid:parameters>

#proof[
  The sort and block relations have the required interpretations. Every configuration in $X_v$ selects exactly one atom from $Y_e$ for each $e in.rev v$, and none from other edge blocks. Each $X_v$ is nonempty by Lemma 2. Thus the incidence test between blocks recovers precisely the incidences of the box. This graph is simple and connected, and each edge has its two distinct endpoints, so all the input checks hold.
  Let $o = \( 0 \, 0 \, 0 \)$ and, for $i = 1 \, 2 \, 3$, let $q_i$ be the corner whose $i$th coordinate is $L - 1$ and whose other coordinates are zero. Distances in the box are sums of absolute coordinate differences. Indeed each step changes one coordinate by one, giving the lower bound, and changing the coordinates successively attains it within the box. Hence, for $v = \( v_1 \, v_2 \, v_3 \)$,
  $ d \( o \, v \) - d \( q_i \, v \) = 2 v_i - \( L - 1 \) #h(2em) \( i = 1 \, 2 \, 3 \) . $
  These are integer identities. The four distances therefore determine all three coordinates of $v$. The tuple of blocks $\( X_o \, X_(q_1) \, X_(q_2) \, X_(q_3) \)$ belongs to $P$. ◻
]

A face description in the sentence is an ordered description of a simple four-cycle. We use $hat(f)$ for such a description and $f$ for its underlying elementary face; different descriptions may give the same $f$. For an atom $s in Y_e$ and $f in F \( e \)$, write $u_(s \, f) in bb(F)_3^2$ for its coordinate belonging to that face.

#thm([Lemma 5.2.])[
  (Recovering face coordinates).  #emph[Every face description $hat(f)$ on $A_b$ describes an elementary face $f$, and every elementary face has such a description. For atoms $s \, s'$ on any two sides of $f$, including the same side, 
#[#set math.equation(numbering: n => "(5.1)")
 $ "match"_(hat(f)) \( s \, s' \) quad arrow.l.r.double quad u_(s \, f) = u_(s' \, f) . $ <grid:match-equivalence>]

 Consequently, for $s = \( e \, u \, z \)$ and $s' = \( e \, u' \, z' \)$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ "baseEq"_(Y_e) \( s \, s' \) quad arrow.l.r.double quad u = u' . $ <grid:base-equivalence>]

]
] <grid:matching>

#proof[
  The four unit steps of a closed walk have zero sum in each coordinate. They therefore consist either of two positive and two negative steps in one direction, or of opposite pairs in two different directions. The first possibility cannot give a simple cycle: at a greatest or least coordinate reached, a reversal repeats the preceding vertex. In the second possibility no two successive steps can be opposites, since that would also repeat a vertex. The directions consequently alternate, and the four vertices are exactly the corners of an elementary square. Conversely, traversing any elementary square supplies a face description.
  First consider adjacent sides $e \, e'$ of $f$, meeting at $v$. A configuration containing $s in Y_e$ and $s' in Y_(e')$ must satisfy $u_(s \, f) = u_(s' \, f)$ by the configuration equations. Suppose this equality holds. The two sides share exactly the face $f$. At $v$, choose one vector for each face in $F \( v \)$, using the vector prescribed by $s$ or $s'$ whenever that face meets the respective side; the only common prescription is the assumed equality on $f$. Assign the chosen vector to both incident sides of each face. This extends all vector coordinates of the two given atoms without conflict.
  Every vertex of the box has degree at least three, since $L gt.eq 2$. There is therefore an incident edge $h$ other than $e \, e'$. Keep the two prescribed scalars, choose scalars arbitrarily on the remaining edges other than $h$, and set
  $ z_h = epsilon.alt_(v h)^(- 1) (b_v - sum_(g in.rev v \, med g eq.not h) epsilon.alt_(v g) z_g) . $
  The coefficient $epsilon.alt_(v h)$ is $1$ or $- 1$, so it is invertible in $bb(F)_3$. We have constructed a configuration in $X_v$ incident with both given atoms. This proves Equation (5.1) for adjacent sides, for every charge and including boundary vertices.
  For opposite sides, the definition uses an atom on a side adjacent to both; for two atoms on the same side, it uses an atom on the next side in the description. The adjacent-side case shows that the two required tests hold precisely when this intervening atom has the same $f$-vector as both $s$ and $s'$. Every vector in $bb(F)_3^2$ occurs on the intervening side. The two configuration witnesses are independent, even when their vertex blocks coincide. Thus such an intervening atom exists exactly when $u_(s \, f) = u_(s' \, f)$. Finally, the descriptions containing $e$ cover exactly its incident faces, which proves Equation (5.2). ◻
]

=== 5.2 Transporting candidates while fixing the history <transporting-candidates-while-fixing-the-history>

Fix any $alpha in P$, and let $T = T \( alpha \)$ be its spanning tree. List the edges outside $T$ in the order defined from $alpha$ as $e_1 \, dots.h \, e_r$. Say that $x$ is a compatible prefix of length $j$ if it consists of one atom on each of $e_1 \, dots.h \, e_j$ and no other elements, and if its atoms have equal $f$-vectors whenever their edges belong to a common face $f$. The empty set is the compatible prefix of length zero.

For $j < r$ and a compatible prefix $x$ of length $j$, put $e = e_(j + 1)$ and

$ F_x \( e \) = { f in F \( e \) : upright("some edge of ") f upright(" has a selected atom in ") x } . $

For each $f in F_x \( e \)$, compatibility gives a well-defined common vector $v_f$. Lemma 10 identifies the candidate set exactly:

#[#set math.equation(numbering: n => "(5.3)")
 $ D \( alpha \, x \) = { \( e \, u \, z \) in Y_e : u_f = v_f upright(" for all ") f in F_x \( e \) } . $ <grid:candidates>]

This set is nonempty: its remaining vector coordinates and its scalar $z$ are unrestricted. We next prove that the witness guard succeeds on this entire set.

#thm([Proposition 5.3.])[
  (Transitivity for every parameter tree).  #emph[Let $A_b$ be a grid structure, $alpha in P$, and $x$ a compatible prefix of length $j < r$. For every ordered pair $s \, s' in D \( alpha \, x \)$ there is $g in M \( alpha \, x \)$ with $g \( s \) = s'$. The map $g$ preserves the full input, fixes every block setwise, and fixes every atom of $x$ individually. Consequently every selection path for $alpha$ chooses one atom from each edge outside $T$, in order, maintains compatibility, and then stabilizes with the dummy choice. All its witnessing maps respect $alpha$ and the entire preceding history.]
] <grid:transitivity>

#proof[
  Write $s = \( e \, u \, z \)$ and $s' = \( e \, u' \, z' \)$. We construct a map from the local pool $cal(L)$ and then one from the cycle pool $cal(C) \( alpha \, x \)$, in the order used to define $M$. Figure 1 illustrates the two transformations.
  Define $a in C_F$ by
  $ a_f = cases(delim: "{", u'_f - u_f \, & f in F \( e \) \,, 0 \, & f in.not F \( e \) .) $
  Let $ell = h_(a \, 0)$ be the automorphism from Proposition 4. A nonzero $a_f$ can occur on at most four faces. Outside the edge and vertex blocks belonging to these faces, $ell$ is the identity by Equation (3.11) and the induced action on configurations. Each face has four sides and four vertices, so $ell$ moves atoms in at most sixteen edge blocks and sixteen vertex blocks. The block bounds in Lemma 2 give
  $ \| { t in A_b : ell \( t \) eq.not t } \| lt.eq 16 \( 3^9 + 3^29 \) = B . $
  Thus $ell$ occurs in the local pool: if its support is nonempty, list the moved atoms and their images in the two indexing tuples and pad them with repetitions; if its support is empty, use the explicitly included identity. This represents the whole permutation because it is the identity outside the listed atoms.
  For $f in F_x \( e \)$, Equation (5.3) gives $a_f = 0$. Every face with a nonzero translation therefore contains no previously selected edge. All face coordinates and the scalar of each atom in $x$ are unchanged, so $ell$ fixes $x$ pointwise. On the current candidate, its value is
  #[#set math.equation(numbering: n => "(5.4)")
   $ ell \( s \) = \( e \, u' \, tilde(z) \) \, #h(2em) tilde(z) = z + 1 / 2 sum_(f in F \( e \)) c_e^f omega \( a_f \, u_f \) . $ <grid:post-local-scalar>]
  It remains to correct $z' - tilde(z)$, which is the scalar discrepancy after this translation.
  If $z' = tilde(z)$, take the identity from the cycle pool. Otherwise put $eta = z' - tilde(z) in { 1 \, - 1 } subset.eq bb(F)_3$. The cycle pool enumerates every auxiliary vertex block $o$, so it includes the block at the coordinate origin. For this choice of $o$, the function $d \( o \, v \) = v_1 + v_2 + v_3$ increases by one along every positive coordinate edge. Its labels $1$ and $2 = - 1$ consequently agree with signed edge traversal in the fixed coordinate orientations, regardless of the root or shape of $T$.
  Choose the ordering $\( U \, V \)$ of the endpoints of $e$ so that traversing $e$ from $U$ to $V$ has sign $eta$. Follow this edge and then the unique tree path from $V$ to $U$. Because $e in.not T$, this is a simple cycle. Let $k in bb(F)_3^(E_L)$ have coefficient $1$ or $- 1$ on each edge according to the traversal orientation and coefficient zero elsewhere. At each vertex one traversed edge enters and one leaves, so
  #[#set math.equation(numbering: n => "(5.5)")
   $ partial k = 0 \, #h(2em) k_e = eta \, #h(2em) "supp" \( k \) subset.eq T union { e } . $ <grid:cycle-circulation>]
  For the indices just chosen, the cycle-pool relation is exactly the graph of $h_(0 \, k)$. To check this assertion on an edge of the cycle, Lemma 10 makes its $"baseEq"$ condition equivalent to equality of all vector coordinates. For equal vectors, alternation gives $omega \( u_f \, u_f \) = 0$, so the $sans(Z)_delta$ condition becomes $z' - z = delta = k_h$. It therefore pairs each edge atom with precisely its scalar translate by $k_h$. Off the cycle the relation is the identity, as is $h_(0 \, k)$. On a vertex block, its definition pairs a configuration with precisely the tuple of these translated incident states. That tuple is a configuration by Proposition 4, and there is exactly one configuration atom for each permitted tuple. This proves the assertion on the configuration sort as well.
  Call this cycle map $c$. By Equation (5.5), it fixes every earlier selected atom: all their edges are outside $T$ and different from $e$. Both $c$ and $ell$ preserve every block and the full vocabulary, so the composition $g = c compose ell$ passes the filter defining $M \( alpha \, x \)$. Equations (5.4) and (5.5) give $g \( s \) = s'$. The same conclusion holds in the zero-discrepancy case with $c$ equal to the identity.
  We have proved nonemptiness and the witness guard for every compatible prefix with an unprocessed edge. The next real choice extends that prefix by one atom and preserves compatibility by Equation (5.3). Induction starts at $x = nothing$. After all $r$ edges have been processed, there is no next edge; the dummy choice leaves the state unchanged and is witnessed by the identity. Finally, fixing each block fixes the tuple $alpha$, and fixing all atoms of the current prefix fixes each earlier prefix as a set. Thus the maps satisfy the parameter and history requirements of witnessed symmetric choice. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.8, 1.8), fill: rgb("#f2f2ff"), stroke: none)
  line((0, 0), (1.8, 0), (1.8, 1.8), (0, 1.8), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.0635, fill: black, stroke: none)
  circle((1.8, 0), radius: 0.0635, fill: black, stroke: none)
  circle((1.8, 1.8), radius: 0.0635, fill: black, stroke: none)
  circle((0, 1.8), radius: 0.0635, fill: black, stroke: none)
  content((0.9, 0.9), [#text(size: 9pt)[$f$]])
  content((0.9, 0), [#text(size: 9pt)[$u_f arrow.r.bar u_f+a_f$]], anchor: "north", padding: 0.1176cm)
  content((0.9, 1.8), [#text(size: 9pt)[$u_f arrow.r.bar u_f+a_f$]], anchor: "south", padding: 0.1176cm)
  content((0, 0.9), [#text(size: 9pt)[$+a_f$]], anchor: "south", angle: 90deg, padding: 0.1176cm)
  content((1.8, 0.9), [#text(size: 9pt)[$+a_f$]], anchor: "north", angle: 90deg, padding: 0.1176cm)
  content((0.9, -0.765), [#text(size: 9pt)[Local map $h_(a,0)$]])
  line((4.59, 0), (4.59, 1.8), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  line((4.59, 1.8), (6.21, 1.8), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  line((6.21, 1.8), (6.21, 0), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  line((6.21, 1.8), (7.65, 1.8), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  line((7.65, 1.8), (7.65, 0), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10))
  line((4.59, 0), (6.21, 0), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10))
  line((6.21, 0), (7.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((5.13, 0), (5.715, 0), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((6.21, 0.585), (6.21, 1.215), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((5.715, 1.8), (5.13, 1.8), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  line((4.59, 1.215), (4.59, 0.585), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  circle((4.59, 0), radius: 0.0635, fill: black, stroke: none)
  circle((6.21, 0), radius: 0.0635, fill: black, stroke: none)
  circle((4.59, 1.8), radius: 0.0635, fill: black, stroke: none)
  circle((6.21, 1.8), radius: 0.0635, fill: black, stroke: none)
  circle((7.65, 1.8), radius: 0.0635, fill: black, stroke: none)
  circle((7.65, 0), radius: 0.0635, fill: black, stroke: none)
  content((4.59, 0), [#text(size: 9pt)[$U$]], anchor: "east", padding: 0.1176cm)
  content((6.21, 0), [#text(size: 9pt)[$V$]], anchor: "north", padding: 0.1176cm)
  content((5.4, 0), [#text(fill: rgb("#0000ff"))[#text(size: 9pt)[$e$]]], anchor: "north", padding: 0.1176cm)
  content((5.4, 1.8), [#text(size: 9pt)[return path in $T$]], anchor: "south", padding: 0.1176cm)
  content((7.02, 0.045), [#text(size: 9pt)[earlier#linebreak()choice]], anchor: "south", padding: 0.1176cm)
  content((6.075, -0.765), [#text(size: 9pt)[Cycle map $h_(0,k)$]])
})],
  caption: [Figure 1: The two parts of a candidate transport. Left: a translation on one face adds the same vector $a_f$ to its four sides and acts on their endpoint configurations; the construction uses at most four such faces. The left panel shows only vector coordinates; the scalar correction for $h_(a \, 0)$ is given in Equation (5.4). Right: the new edge $e$ (blue) and its return path in $T$ carry a circulation. Other tree edges are grey; a previously selected edge outside $T$ is dashed and is untouched by the circulation. The picture shows only the relevant part of the tree. ],
) <grid:figure>

=== 5.3 Extending a terminal selection <extending-a-terminal-selection>

Proposition 11 shows that the output test always receives a complete, compatible assignment outside its tree. To evaluate that test, we must determine whether the remaining edge states can satisfy all vertex equations. The vector coordinates extend face by face; the scalar equations reduce to divergence on a tree.

#thm([Lemma 5.4.])[
  (Solving divergence on a tree).  #emph[Let $T$ be a finite tree on vertex set $V$, orient its edges arbitrarily, and write $partial_T$ for its signed incidence map. Let $r in bb(F)_3^V$ satisfy $sum_(v in V) r_v = 0$. There is a unique $z in bb(F)_3^(E \( T \))$ with $partial_T z = r$.]
] <grid:tree-divergence>

#proof[
  For a one-vertex tree, the sum condition says $r = 0$, and the empty edge assignment is the unique solution. Otherwise let $v$ be a leaf, $h$ its incident edge, and $w$ its neighbor. The equation at $v$ forces $z_h = epsilon.alt_(v h)^(- 1) r_v$. Delete $v$ and $h$; keep all other required divergences except that at $w$, where set
  $ r'_w = r_w - epsilon.alt_(w h) z_h = r_w + r_v . $
  The new required divergences still sum to zero. Induction supplies the unique solution on the smaller tree, which together with the forced value on $h$ solves all the original equations. Each deleted edge was forced, proving uniqueness as well. ◻
]

#thm([Theorem 5.5.])[
  (Opposite grid answers).  #emph[For every $L gt.eq 2$, the fixed sentence $Phi$ of Section 4 evaluates to true on $A_(b^0)$ and to false on $A_(b^1)$. For either structure, every parameter $alpha in P$ and every terminal selection gives the stated output value, and no evaluation produces $dagger$.]
] <grid:separation>

#proof[
  By Lemma 9, both inputs pass the check and have a nonempty parameter set. Fix any $alpha in P$ and any terminal selection $x$. Proposition 11 says that $x$ is a complete compatible assignment on the edges outside $T = T \( alpha \)$.
  First work in $A_(b^0)$. For each elementary face $f$, choose its vector $v_f in bb(F)_3^2$ to be the one already prescribed by $x$ if an edge of $f$ was selected, and choose any vector otherwise. Compatibility makes each prescription unambiguous. Give every edge $e$ the vectors $\( v_f \)_(f in F \( e \))$. This preserves all selected vector coordinates and satisfies all face agreements at vertices.
  Keep the selected scalars $z_e$ on $e in.not T$, and define the divergence still required from tree edges by
  $ r_v = b_v^0 - sum_(e in.not T) epsilon.alt_(v e) z_e . $
  Every edge contributes once with each sign, and $sum_v b_v^0 = 0$; therefore $sum_v r_v = 0$. Lemma 12 supplies the scalars on $T$. The resulting full edge assignment has divergence $b^0$ and satisfies every face agreement. Its incident tuple at each vertex is consequently a configuration atom, and neighboring tuples specify the same edge atom. By Lemma 5, the output test accepts $x$.
  Now work in $A_(b^1)$. If the output test accepted $x$, Lemma 5 would supply configurations agreeing on a single atom on every edge. Let $z_e$ denote the scalar of that common atom. The equations at all vertices would give
  $ 1 = sum_(v in V_L) b_v^1 = sum_(v in V_L) sum_(e in E_L) epsilon.alt_(v e) z_e = sum_(e in E_L) \( 1 - 1 \) z_e = 0 quad upright("in ") bb(F)_3 \, $
  a contradiction. Thus every terminal selection is rejected.
  The witness and resource conclusions of Proposition 8 apply to these calls, so their values are Boolean. The output value just proved is the same for every terminal selection for each parameter. Since $P$ is nonempty, the outer existential aggregation defining $Phi$ is true on $A_(b^0)$ and false on $A_(b^1)$, as asserted. ◻
]

== 6 Small orbits give supports at every rank <sec:support>

We now begin the lower-bound argument. The group $H$ of automorphisms from Section 3 has an abelian quotient of face translations and a central subgroup $K$ of edge circulations. Commutators connect these two parts. We use that connection to show that an object with a small $H$-orbit is fixed by the pointwise stabilizer in $K$ of a short tuple of atoms. The bound does not depend on the object’s rank. We give the full support argument from #cite(label("cptCompanion2026")) Section 3, Proposition 8.

Fix $L gt.eq 2$ and $b in bb(F)_3^(V_L)$. Write $V = V_L$, $E = E_L$, $F = F_L$, and $N = \| A_b \|$. Recall the incidence map $partial : bb(F)_3^E arrow.r bb(F)_3^V$, the oriented face boundaries $c^f$, and

$ K = ker partial \, #h(2em) C_F = \( bb(F)_3^2 \)^F \, #h(2em) H = C_F times K $

with the group law of Section 3. We identify $K$ with the central subgroup ${ 0 } times K$ of $H$. Its action fixes face coordinates and adds $k_e$ to the scalar coordinate of every edge atom on $e$. As usual, an atom permutation acts on finite sets recursively by $h dot.op x = { h dot.op y : y in x }$.

#prodef([Definition 6.1.])[
  For an atom tuple $alpha = \( alpha_1 \, dots.h \, alpha_r \)$, let
  $ K_alpha = { k in K : k dot.op alpha_j = alpha_j upright(" for every ") 1 lt.eq j lt.eq r } . $
  The tuple $alpha$ is a #emph[$K$-support] of an atom or hereditarily finite set $x$ over $A_b$ if every element of $K_alpha$ fixes $x$. The empty tuple is permitted, and $K_(\( \)) = K$.
] <sup:definition>

The proof has two steps. First, an edge functional whose curl is nonzero on few faces can be represented on few edges. Second, the small index of an object’s stabilizer forces precisely this curl condition for the functionals that detect its central stabilizer.

=== 6.1 Sparse representatives of edge functionals <sparse-representatives-of-edge-functionals>

An #emph[edge cochain] is a vector $ell in bb(F)_3^E$. Define its curl $D ell in bb(F)_3^F$ by

$ \( D ell \) \( f \) = sum_(e in E) c_e^f ell_e . $

For a vertex function $phi in bb(F)_3^V$, its gradient is $partial^(sans(T)) phi$; on an edge directed from $v$ to $w$ it has value $phi \( w \) - phi \( v \)$. Since $partial c^f = 0$, adding a gradient changes neither the curl nor the functional $k mapsto sum_e ell_e k_e$ on $K$.

#thm([Lemma 6.2.])[
  (Sparse cochains).  #emph[Let $ell in bb(F)_3^E$, and let $t = \| { f in F : \( D ell \) \( f \) eq.not 0 } \|$. There is a vertex function $phi in bb(F)_3^V$ such that 
$ \| "supp" \( ell - partial^(sans(T)) phi \) \| lt.eq 2 L t \, #h(2em) "supp" \( r \) = { e in E : r_e eq.not 0 } . $

 In particular, every cochain with zero curl is a gradient.]
] <sup:sparse-cochain>

#proof[
  We first eliminate the cochain in one coordinate direction. We then eliminate a second direction on a slice containing few nonzero curls, and use the remaining curls to bound the support away from that slice.
  Write vertices as $\( i \, j \, k \)$. The coordinate $ell_1 \( i \, j \, k \)$ belongs to the edge from $\( i \, j \, k \)$ to $\( i + 1 \, j \, k \)$, and $ell_2 \, ell_3$ are defined similarly. A direction-$a$ edge coordinate is used only when increasing coordinate $a$ stays in the box. Put
  $ phi_1 \( i \, j \, k \) = sum_(u = 0)^(i - 1) ell_1 \( u \, j \, k \) \, #h(2em) r^(\( 1 \)) = ell - partial^(sans(T)) phi_1 \, $
  where empty sums are zero. Then $r_1^(\( 1 \)) = 0$. The face orientation $+ 1 \, + a \, - 1 \, - a$ gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ \( D ell \)_12 \( i \, j \, k \) & = r_2^(\( 1 \)) \( i + 1 \, j \, k \) - r_2^(\( 1 \)) \( i \, j \, k \) \,\
\( D ell \)_13 \( i \, j \, k \) & = r_3^(\( 1 \)) \( i + 1 \, j \, k \) - r_3^(\( 1 \)) \( i \, j \, k \) . $ <sup:curl12>]
  Here $a b$ indicates the face in directions $a < b$ with lower corner $\( i \, j \, k \)$, and the identity is asserted whenever that face exists.
  Let $t_(a b)$ be the number of nonzero $a b$ curls, so $t = t_12 + t_13 + t_23$. The $23$ faces are partitioned into the $L$ slices of fixed first coordinate. Choose a slice $i = i_0$ containing $t_0 lt.eq t_23 \/ L$ nonzero $23$ curls. Define
  $ phi_2 \( i \, j \, k \) = sum_(v = 0)^(j - 1) r_2^(\( 1 \)) \( i_0 \, v \, k \) \, #h(2em) r^(\( 2 \)) = r^(\( 1 \)) - partial^(sans(T)) phi_2 . $
  Because $phi_2$ is independent of $i$, we still have $r_1^(\( 2 \)) = 0$, and now $r_2^(\( 2 \)) \( i_0 \, j \, k \) = 0$. Finally put
  $ phi_3 \( i \, j \, k \) = sum_(w = 0)^(k - 1) r_3^(\( 2 \)) \( i_0 \, 0 \, w \) \, #h(2em) r = r^(\( 2 \)) - partial^(sans(T)) phi_3 . $
  The function $phi_3$ is independent of $i \, j$, so
  $ r_1 = 0 \, #h(2em) r_2 \( i_0 \, j \, k \) = 0 \, #h(2em) r_3 \( i_0 \, 0 \, k \) = 0 . $
  All three gradient subtractions preserve curl. On the selected slice the $23$ curl identity therefore becomes
  $ r_3 \( i_0 \, j + 1 \, k \) - r_3 \( i_0 \, j \, k \) = \( D ell \)_23 \( i_0 \, j \, k \) . $
  For each fixed $k$, every nonzero value of $r_3 \( i_0 \, j \, k \)$ has a nonzero curl earlier on its $j$-line. One nonzero curl can affect at most $L$ positions on that line. Thus at most $L t_0$ direction-$3$ edge coordinates on the slice are nonzero. Direction $2$ is zero there.
  Copy these direction-$2$ and direction-$3$ slice values to every first coordinate $i$, obtaining a reference cochain supported on at most $L^2 t_0$ edges, with direction $1$ zero. Identities (6.1) and (6.1) remain valid for $r$. Consequently
  $ r_2 \( i \, j \, k \) - r_2 \( i_0 \, j \, k \) $
  is the signed sum of the $12$ curls between $i_0$ and $i$ on that line. A nonzero $12$ curl occurs in at most $L$ such sums, so at most $L t_12$ direction-$2$ coordinates differ from the reference cochain. The same reasoning bounds the differing direction-$3$ coordinates by $L t_13$. A coordinate in the support of $r$ must either belong to the reference support or differ from its reference value. Hence
  $ \| "supp" \( r \) \| lt.eq L^2 t_0 + L \( t_12 + t_13 \) lt.eq L t lt.eq 2 L t . $
  Taking $phi = phi_1 + phi_2 + phi_3$ proves the claim. The same construction gives $r = 0$ when $t = 0$. ◻
]

=== 6.2 From a small orbit to a support <from-a-small-orbit-to-a-support>

#thm([Proposition 6.3.])[
  (Small-orbit support bound).  #emph[Let $L gt.eq 2$, $b in bb(F)_3^(V_L)$, and $N = \| A_b \|$. Let $q gt.eq 0$ and let $x$ be an atom or a hereditarily finite set over $A_b$. If $\| H dot.op x \| lt.eq N^q$, then $x$ has a $K$-support consisting of at most 
$ 2 L \( q log_3 N \)^2 $

 edge atoms. There is no bound on the finite rank of $x$ in this statement.]
] <sup:small-orbit>

#proof[
  Let $S = { h in H : h dot.op x = x }$ be the stabilizer of $x$. Let $U$ be its image under the projection $H arrow.r C_F$, and put $K_0 = S ∩ K$. Both $U$ and $K_0$ are subgroups of additive groups over the prime field $bb(F)_3$, and hence are vector subspaces. Define
  $ a = "codim"_(C_F) U \, #h(2em) d = "codim"_K K_0 \, #h(2em) h = log_3 \[ H : S \] . $
  The restriction of the projection to $S$ has image $U$ and kernel $K_0$. Every fibre has size $\| K_0 \|$, so $\| S \| = \| U \| thin \| K_0 \|$. Since $\| H \| = \| C_F \| thin \| K \|$, orbit–stabilizer gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ a + d = h = log_3 \| H dot.op x \| lt.eq q log_3 N . $ <sup:index>]
  Consider the annihilator
  $ W = { lambda in K^(*) : lambda \( k \) = 0 upright(" for all ") k in K_0 } \, #h(2em) dim W = d \, $
  where $K^(*)$ is the linear dual of $K$. Each $lambda in K^(*)$ extends to a linear functional on $bb(F)_3^E$: extend a basis of $K$ to one of $bb(F)_3^E$ and assign arbitrary values on the additional basis vectors. The standard coordinate pairing thus gives an edge cochain $ell$ with
  $ lambda \( k \) = sum_(e in E) ell_e k_e quad \( k in K \) . $
  Two representatives differ by an element of $K^perp = "im" partial^(sans(T))$. Indeed the latter space is contained in $K^perp$, and both have dimension $"rank" partial$. In particular, their curls agree.
  Fix $lambda in W$ and a representative $ell$. For any $u \, u' in U$, choose lifts in $S$. Their commutator belongs to $K_0$; the commutator formula (3.10) therefore implies
  #[#set math.equation(numbering: n => "(6.3)")
   $ 0 = sum_(f in F) \( D ell \) \( f \) thin omega \( u_f \, u'_f \) . $ <sup:isotropic>]
  The right-hand side defines an alternating bilinear form $beta_ell$ on $C_F$. If $t$ of the coefficients $\( D ell \) \( f \)$ are nonzero, its rank is $2 t$: each nonzero coefficient multiplies a nondegenerate two-dimensional alternating block, and the face coordinates are independent summands of $C_F$. Relations among the boundary vectors $c^f$ do not identify these summands.
  We use the standard dimension bound for isotropic subspaces of an alternating form, after quotienting by its radical #cite(label("cameron2000classical")) Sections 3.1 and 3.3. Equation (6.3) says that $U$ is totally isotropic for $beta_ell$, meaning that the form vanishes on $U times U$. Put $n_F = dim C_F$, and let $R = { v in C_F : beta_ell \( v \, w \) = 0 upright(" for every ") w in C_F }$ be the radical of this form. The quotient $C_F \/ R$ is nondegenerate of dimension $2 t$. The image $overline(U)$ of $U$ is isotropic, so $overline(U) subset.eq overline(U)^perp$ and $dim overline(U) lt.eq t$. The radical has dimension $n_F - 2 t$, whence
  $ dim U lt.eq \( n_F - 2 t \) + t = n_F - t \, #h(2em) t lt.eq a . $
  Lemma 15 now replaces $ell$ by a representative of the same functional $lambda$ supported on at most $2 L a$ edges.
  We have obtained a sparse representative for every functional detecting the quotient $K \/ K_0$. Choose such representatives for a basis of $W$, and let $T subset.eq E$ be the union of their supports. Then
  #[#set math.equation(numbering: n => "(6.4)")
   $ \| T \| lt.eq 2 L a d lt.eq 2 L h^2 lt.eq 2 L \( q log_3 N \)^2 . $ <sup:edge-support-size>]
  When $d = 0$, use the empty basis and $T = nothing$. If $k in K$ vanishes on $T$, every member of that basis vanishes on $k$. Thus all of $W$ vanishes on $k$, and finite-dimensional duality gives $k in K_0$. For each $e in T$, choose one edge atom on $e$, and list the chosen atoms in a tuple $alpha$. The central action in (3.11) fixes that atom exactly when $k_e = 0$. Consequently $K_alpha subset.eq K_0 subset.eq S$, so $alpha$ supports $x$ and satisfies (6.4). This argument concerns the stabilizer of $x$ alone and makes no induction on its rank. ◻
]

=== 6.3 Hereditary support for finite invariant families <hereditary-support-for-finite-invariant-families>

A family $cal(X)$ of atoms and hereditarily finite sets is #emph[membership-transitive] if $y in x in cal(X)$ implies $y in cal(X)$. It then contains every object reached from a member by any finite sequence of membership steps. We call an object #emph[hereditarily $s$-supported] if it and every such recursive member have a $K$-support of length at most $s$; these supports need not coincide.

#thm([Corollary 6.4.])[
  #emph[Let $L gt.eq 2$, $b in bb(F)_3^(V_L)$, and $N = \| A_b \|$. Suppose $cal(X)$ is a finite $H$-invariant, membership-transitive family of atoms and hereditarily finite sets over $A_b$, with $\| cal(X) \| lt.eq N^q$ for some $q gt.eq 0$. Every member of $cal(X)$ and every recursive member has a $K$-support of length at most $2 L \( q log_3 N \)^2$. In particular, every member is hereditarily $s$-supported for 
#[#set math.equation(numbering: n => "(6.5)")
 $ s = ⌈2 L \( q log_3 N + 1 \)^2⌉ + 1 . $ <sup:length>]

 All the supports may be padded to length exactly $s$. For fixed $q$, 
$ s = O_q #scale(x: 120%, y: 120%)[\(] L \( 1 + log L \)^2 #scale(x: 120%, y: 120%)[\)] . $

]
] <sup:hereditary>

#proof[
  $H$-invariance places the orbit of each $x in cal(X)$ inside $cal(X)$. Proposition 16 therefore gives the claimed support for every member. Membership transitivity gives the same conclusion for all recursive members. Adding coordinates to an atom tuple can only shrink its pointwise stabilizer, so it preserves the support property. Since $L gt.eq 2$, the base has an edge atom; append copies of any one such atom to reach length $s$, including when the original support is empty. Finally Lemma 2 gives $N = Theta \( L^3 \)$, which yields the displayed asymptotic bound. ◻
]

== 7 Counting equivalence and central-group homogeneity <sec:base-counting>

We now establish the two facts about atom tuples needed to transfer supports. With sufficiently few variable names, counting logic cannot distinguish the zero-charge and unit-charge structures. Within either structure, however, the counting type of a short tuple determines its orbit under the central group $K = ker partial$. Both statements will be proved in an auxiliary expansion of the structures from Section 3. We give the quantitative base argument from #cite(label("cptCompanion2026")) Section 4, Propositions 11 and 13 in full.

Throughout this section, write $V = V_L$, $E = E_L$, and let $G = \( V \, E \)$ denote the undirected box graph, retaining the fixed edge orientations when using $partial$. Thus an element $k in K$ adds $k_e$ to the scalar coordinate of every state on $e$, and acts on configurations by the induced changes of their incident states.

=== 7.1 The auxiliary expansion and counting types <the-auxiliary-expansion-and-counting-types>

Partition the atoms of $A_b$ into classes with labels

$ \( e \, u \) \, #h(2em) e in E \, quad u in \( bb(F)_3^2 \)^(F \( e \)) \, #h(2em) upright("and") #h(2em) \( v \, eta \) \, #h(2em) v in V \, quad eta in \( bb(F)_3^2 \)^(F \( v \)) . $

An edge class consists of the three atoms $\( e \, u \, z \)$ with its indicated $e \, u$. A configuration class consists of the configurations at $v$ whose common vector on each face $f in F \( v \)$ is $eta_f$. The latter class has $3^(deg \( v \) - 1)$ members: its scalar coordinates satisfy just the one divergence equation. Every class is therefore nonempty, and its size is independent of $b$.

Choose a linear order of these labels, using the same order for all charge assignments at a fixed $L$. Add the binary relation $prec.curly.eq$ which compares atoms by their labels, so that its equivalence classes are exactly the classes just defined. Also add three binary relations $sans(D)_delta$, for $delta in bb(F)_3$, given by

$ sans(D)_delta #scale(x: 120%, y: 120%)[\(] \( e \, u \, z \) \, \( e' \, u' \, z' \) #scale(x: 120%, y: 120%)[\)] quad arrow.l.r.double quad e = e' med upright(" and ") med z' - z = delta . $

They are false on pairs involving a configuration atom. The vector patterns $u \, u'$ need not be equal. Denote the expansion by $macron(A)_b$. Its vocabulary is still fixed and binary. Every element of $K$ preserves it, since central translations fix the labels and preserve raw scalar differences. The group $H$ is only required to act on the original input; these additional relations are used in the proof and are never supplied to a choiceless program.

For a positive integer $h$, let $C^h$ be first-order logic with equality, ordinary quantifiers, and exact counting quantifiers $exists^(= a) x$, using at most $h$ distinct variable names. The formula $exists^(= a) x thin phi$ is true precisely when exactly $a$ elements satisfy $phi$, where $a$ is any nonnegative integer. Formula length and counting constants are unrestricted. In particular, when comparing structures for a fixed $L$, the formulas may depend on $L$.

For an $r$-tuple $macron(a)$ with $r lt.eq h$, its $C^h$-type is the set of all $C^h$ formulas true at $macron(a)$ whose free variables belong to its $r$ designated positions. The positions have distinct variable names, but their assigned atoms may repeat. Types on different structures are compared using the same designated positions.

=== 7.2 A large component after deleting few edges <a-large-component-after-deleting-few-edges>

Write $delta_G R$ for the edge boundary of a vertex set $R subset.eq V$; this is separate from the incidence map $partial$. We first show that a small set of deleted edges cannot split the box into small pieces. The projection step is the three-dimensional discrete Loomis–Whitney inequality #cite(label("loomisWhitney1949")); its short proof below also gives the finite-box boundary constant needed here.

#thm([Lemma 7.1.])[
  (Boundary estimate).  #emph[Let $c = 1 - 2^(- 1 \/ 3)$. For every $L gt.eq 2$ and every nonempty $R subset.eq { 0 \, dots.h \, L - 1 }^3$ with $\| R \| lt.eq L^3 \/ 2$, 
$ \| delta_G R \| gt.eq c \| R \|^(2 \/ 3) . $

]
] <base:boundary>

#proof[
  Let $a_(i j) \, b_(i k) \, d_(j k)$ be the indicators of the three projections of $R$ onto coordinate pairs, and let their sizes be $A \, B \, D$, respectively. Every point of $R$ contributes to the product of these indicators. Twice applying Cauchy–Schwarz gives
  $ \| R \| & lt.eq sum_(i \, j \, k) a_(i j) b_(i k) d_(j k)\
 & lt.eq A^(1 \/ 2) (sum_(i \, j) (sum_k b_(i k) d_(j k))^2)^(1 \/ 2) lt.eq \( A B D \)^(1 \/ 2) . $
  For the last step, bound each squared inner sum by $\( sum_k b_(i k)^2 \) \( sum_k d_(j k)^2 \)$ and then sum over $i \, j$. At least one projection consequently has size at least $\| R \|^(2 \/ 3)$. It indexes that many nonempty coordinate lines meeting $R$. At most $\| R \| \/ L$ of these lines lie wholly in $R$. Each of the remaining lines is a path meeting both $R$ and its complement, and hence contains a boundary edge. The lines are disjoint, so these edges are distinct. Finally,
  $ \| delta_G R \| gt.eq \| R \|^(2 \/ 3) - frac(\| R \|, L) gt.eq \( 1 - 2^(- 1 \/ 3) \) \| R \|^(2 \/ 3) \, $
  where the last inequality uses $\| R \| lt.eq L^3 \/ 2$. ◻
]

Set

#[#set math.equation(numbering: n => "(7.1)")
 $ M = floor.l L^(7 \/ 4) floor.r . $ <base:M>]

#thm([Lemma 7.2.])[
  (Persistent large component).  #emph[For all sufficiently large $L$, every graph $G \\ T$ obtained by deleting at most $6 M$ edges has a unique component with more than $L^3 \/ 2$ vertices. If $T subset.eq T'$ and $\| T' \| lt.eq 6 M$, the component for $T'$ is contained in the component for $T$.]
] <base:giant>

#proof[
  Sum Lemma 18 over the components $R$ of $G \\ T$ having at most $L^3 \/ 2$ vertices. Every boundary edge belongs to $T$ and is counted at most twice. Thus
  #[#set math.equation(numbering: n => "(7.2)")
   $ sum_R \| R \| lt.eq c^(- 3 \/ 2) sum_R \| delta_G R \|^(3 \/ 2) lt.eq c^(- 3 \/ 2) \( 2 \| T \| \)^(3 \/ 2) lt.eq c^(- 3 \/ 2) \( 12 M \)^(3 \/ 2) = o \( L^3 \) . $ <base:small-components>]
  Here $sum_j a_j^(3 \/ 2) lt.eq \( sum_j a_j \)^(3 \/ 2)$ for nonnegative $a_j$, and $M^(3 \/ 2) = O \( L^(21 \/ 8) \) = o \( L^3 \)$. If every component had at most half the vertices, the left side would be $L^3$, a contradiction for large $L$. Two components cannot both contain more than half the vertices. After further deletion each component is contained in an old component; its size forces the new large component to lie in the old large one. ◻
]

We call the component in Lemma 19 the #emph[giant component]. The next proof uses it to keep the single unmatched charge away from all assigned atoms. Its extension step constructs a bijection of the entire universes, which is what exact counting requires.

=== 7.3 Counting equivalence of the two charge assignments <counting-equivalence-of-the-two-charge-assignments>

The argument adapts the defect-moving method of the CFI construction #cite(label("cfi1992")) Section 6 and the finite-variable counting-game method of Immerman and Lander #cite(label("immermanLander1990")) Counting Quantifiers. We construct whole-universe bijections and prove formula preservation directly, so no game characterization is an additional premise.

#thm([Proposition 7.3.])[
  (Base counting equivalence).  #emph[For all sufficiently large $L$, the expansions $macron(A)_(b^0)$ and $macron(A)_(b^1)$ satisfy the same $C^M$ sentences, where $b^0 = 0$, $b^1 = upright(bold(1))_(v_(*))$, and $M$ is as in (7.1).]
] <base:equivalence>

#proof[
  An assigned edge atom #emph[touches] its edge. An assigned configuration atom at $v$ touches every edge incident with $v$. The edges touched by at most $M$ assigned positions form a set $T$ of size at most $6 M$.
  Call paired assignments in the two structures #emph[compatible] if they have matching block and vector labels and there exist $t in bb(F)_3^E$ and a vertex $w$ in the giant of $G \\ T$ such that
  #[#set math.equation(numbering: n => "(7.3)")
   $ partial t = b^1 - b^0 - upright(bold(1))_w \, $ <base:defect>]
  and each atom in the first assignment is paired with the atom obtained by adding $t_e$ on every incident scalar coordinate. The empty assignments are compatible: take $t = 0$ and $w = v_(*)$.
  Compatible assignments preserve atomic formulas. On any fixed edge, common addition of $t_e$ preserves raw scalar differences, and also the corrected differences defining each $sans(Z)_delta$, since vector coordinates do not change. It preserves whether the assigned edge atom is the state specified by an assigned configuration. Blocks, sorts, the preorder, and equality are likewise preserved, including when positions have repeated values. An assigned configuration cannot be at $w$: deleting its whole star isolates its vertex, whereas $w$ lies in a component with more than half the vertices. Thus the shift at every assigned configuration satisfies the appropriate change of divergence in (7.3).
  Forgetting an assigned position preserves compatibility. Its touched edges may disappear from $T$, and Lemma 19 places the old giant inside the new one. Suppose now that at most $M - 1$ positions remain. We construct a bijection of universes which retains their pairings and gives a compatible extension for every possible next atom.
  Partition the atoms into whole edge blocks and whole configuration blocks. For each such block $J$, let $T_J$ be $T$ together with the edge of $J$, or the star of its vertex, respectively. Then $\| T_J \| lt.eq 6 M$. Choose a vertex $w_J$ in the giant of $G \\ T_J$. By Lemma 19, both $w$ and $w_J$ lie in the giant of $G \\ T$. Choose a signed path vector $p_J$ supported outside $T$ with
  $ partial p_J = upright(bold(1))_w - upright(bold(1))_(w_J) \; $
  one may traverse a path from $w_J$ to $w$, or use zero if they agree. The vector $t_J = t + p_J$ agrees with $t$ on $T$ and satisfies (7.3) with $w_J$ in place of $w$.
  On the block $J$, map every atom by its $t_J$-shift. For an edge block this is plainly a bijection to the corresponding block. For a configuration block at $v$, deleting its star isolates $v$, so $v eq.not w_J$. Therefore
  $ \( partial t_J \)_v = b_v^1 - b_v^0 \, $
  which is exactly the condition making translation a bijection between the two configuration blocks. All their vector constraints stay the same. Taking the union over the disjoint blocks gives a bijection of the whole universes. On every retained assignment it agrees with the old pairing because $p_J$ vanishes on $T$. If the next atom belongs to $J$, the extended assignment has witness $t_J \, w_J$: its touched set is $T_J$, and all retained coordinates still have the right images.
  Induct on formulas to show that compatible assignments agree on every $C^M$ formula with their designated free positions. Atomic formulas were checked above; Boolean connectives preserve agreement. At a quantifier, forget the old value, if any, of its bound variable. At most $M - 1$ positions remain. The universe bijection just constructed pairs extensions with compatible assignments, so induction makes the body true on equally many extensions. It preserves ordinary quantifiers and every exact counting quantifier, including count zero. Apply this conclusion to the empty assignments. ◻
]

=== 7.4 Extending partial central translations <extending-partial-central-translations>

For homogeneity, both tuples lie in the same expansion $macron(A)_b$. Their coordinates will prescribe a scalar translation on the touched edges. We first identify exactly when it extends to an element of $K$.

#thm([Lemma 7.4.])[
  (Partial-flow extension).  #emph[Let $T subset.eq E$ and $sigma in bb(F)_3^T$. There is a vector $k in ker partial$ with $k \|_T = sigma$ if and only if every component $U$ of $G \\ T$ satisfies 
#[#set math.equation(numbering: n => "(7.4)")
 $ R_U := sum_(v in U) sum_(e in T\
e in.rev v) epsilon.alt_(v e) sigma_e = 0 . $ <base:balance>]

 If no extension exists, some nonempty component violating (7.4) has 
$ \| U \| lt.eq L^3 \/ 2 \, #h(2em) \| U \| lt.eq \( \| T \| \/ c \)^(3 \/ 2) . $

]
] <base:partial-flow>

#proof[
  Extend $sigma$ by zero to all of $E$. An extension is equivalent to a vector on $E \\ T$ having divergence $- partial sigma$. On a connected graph, an incidence vector always has total sum zero. Conversely, any specified vertex vector of total sum zero is an incidence vector: choose a spanning tree, give nontree edges value zero, and remove leaves successively. The equation at a leaf determines its tree-edge value uniquely because its coefficient is $1$ or $- 1$. The total-sum condition makes the last root equation hold. This also handles a one-vertex component, where the only possible divergence is zero. Applied separately to each component of $G \\ T$, this argument gives exactly the conditions (7.4).
  The sum of all $R_U$ is zero, since the two incidence signs of each edge cancel. If one component fails, at least two fail. Hence one failing component has at most $L^3 \/ 2$ vertices. Its boundary is contained in $T$, so Lemma 18 yields $c \| U \|^(2 \/ 3) lt.eq \| delta_G U \| lt.eq \| T \|$. ◻
]

#thm([Proposition 7.5.])[
  (Quantitative $K$-homogeneity).  #emph[Let $L gt.eq 2$, $b in bb(F)_3^V$, and let $r \, M$ be positive integers such that 
#[#set math.equation(numbering: n => "(7.5)")
 $ 7 r + 7 \( 6 r \/ c \)^(3 \/ 2) + 1 lt.eq M . $ <base:homogeneity-bound>]

 If two $r$-tuples in $macron(A)_b$ have the same $C^M$-type, an element of $K$ maps the first tuple to the second. Empty tuples lie in the same $K$-orbit without any width hypothesis.]
] <base:homogeneity>

#proof[
  Write the tuples as $macron(a) \, macron(a)'$. The proof first extracts a consistent scalar shift on the touched edges, then uses a formula to exclude every obstruction from Lemma 21.
  Each preorder class is defined with two variable names. If $h$ is the number of atoms in strictly earlier classes, its predicate is
  #[#set math.equation(numbering: n => "(7.6)")
   $ theta_h \( x \) := exists^(= h) y thin \( y prec.curly.eq x and not \( x prec.curly.eq y \) \) . $ <base:class-predicate>]
  Different classes have different $h$ because every class is nonempty. Equality of types therefore places $a_i$ and $a'_i$ in the same class for every $i$. In particular, their blocks and complete vector patterns agree. The two tuples touch the same set $T$ of edges, with $\| T \| lt.eq 6 r$.
  An #emph[occurrence] on $e in T$ is either an edge atom in a tuple position, or the state on $e$ specified by a configuration in a tuple position. In the latter case this state is the unique atom $y$ such that $sans(I) \( a_i \, y \)$ holds and $y$ has its specified edge-class label. The label includes $e$ and the vector pattern, so it is expressed by one of the predicates (7.6). Corresponding occurrences for $macron(a)$ and $macron(a)'$ consequently have the same edge and vector coordinates.
  For two occurrences on the same edge, their raw scalar difference is testable using $sans(D)_delta$, introducing their uniquely specified neighbors when necessary. Such a test uses at most the $r$ tuple names, two neighbor names, and one further name reused in class predicates. Inequality (7.5) supplies these $r + 3$ names. The raw differences of corresponding occurrences are therefore equal. It follows that for every $e in T$ there is a single well-defined value $sigma_e in bb(F)_3$: the scalar change from an occurrence in $macron(a)$ to its counterpart in $macron(a)'$. The value is independent of the chosen occurrence.
  Suppose this partial shift $sigma$ does not extend to $K$. By Lemma 21, a component $U$ of $G \\ T$ has
  $ R_U eq.not 0 \, #h(2em) \| U \| lt.eq \( 6 r \/ c \)^(3 \/ 2) . $
  We construct a formula distinguishing $macron(a)$ from $macron(a)'$ within the stated variable bound.
  Choose, for each $v in U$, an arbitrary configuration atom $g_v^0$ in $macron(A)_b$, and denote its state on an incident edge $e$ by $h_(v \, e)^0$. Such configurations exist for every $v$. On each boundary edge $e in delta_G U subset.eq T$, choose one tuple occurrence and write its state as $o_e^0$. Let $z \( s \)$ denote the scalar coordinate of an edge state $s$; in the following construction it is only used to specify one of the three relation symbols $sans(D)_delta$.
  The formula existentially quantifies a configuration variable $g_v$ for each $v in U$, a state variable $h_(v \, e)$ for every edge incident with $v$, and, when $o_e^0$ comes from a tuple configuration, one additional neighbor variable $y_e$. Write $o_e$ for this $y_e$ or for the selected tuple variable when the occurrence is already an edge atom. The conjunction under these quantifiers imposes the following conditions:
  + Each $g_v$ and $h_(v \, e)$ has the class of its reference atom $g_v^0$ or $h_(v \, e)^0$, and $sans(I) \( g_v \, h_(v \, e) \)$ holds.
  + On every edge $e$ with both endpoints $v \, w in U$, choose one ordering of the endpoints and impose
    $ sans(D)_(z \( h_(w \, e)^0 \) - z \( h_(v \, e)^0 \)) \( h_(v \, e) \, h_(w \, e) \) . $
  + On every boundary edge $e$ with endpoint $v in U$, impose
    $ sans(D)_(z \( h_(v \, e)^0 \) - z \( o_e^0 \)) \( o_e \, h_(v \, e) \) . $
    When $o_e = y_e$, also require its reference edge class and its incidence with the chosen tuple configuration.
  All class conditions use (7.6). Thus this is a finite formula in the expansion’s vocabulary, with $macron(a)$ as its free assignment. Its length and counting constants may depend on the chosen reference atoms. The reference configurations and states witness that it is true at $macron(a)$.
  The internal-edge condition also applies when $e in T$ has both endpoints in $U$. It does not link that edge to a tuple occurrence; the two contributions of such an edge to $R_U$ already cancel. Also, the reference configurations need not have matching vector patterns on their common edge. This is why $sans(D)_delta$ was defined between all states on the same edge, irrespective of their vectors.
  If the formula were true at $macron(a)'$, compare its state witnesses to the reference states and put
  $ d_(v \, e) = z \( h_(v \, e) \) - z \( h_(v \, e)^0 \) . $
  Both configurations at $v$ have divergence $b_v$, so
  $ sum_(e in.rev v) epsilon.alt_(v e) d_(v \, e) = 0 . $
  The constraints on an internal edge give $d_(v \, e) = d_(w \, e)$. On a boundary edge, the tuple occurrence has scalar change $sigma_e$; its uniqueness also gives this change when it is represented by $y_e$. The boundary constraint therefore forces $d_(v \, e) = sigma_e$. Summing the displayed vertex equations over $U$ cancels every internal edge and leaves $R_U = 0$, a contradiction.
  To count variable names, retain the $r$ tuple names, use $\| U \|$ configuration names and at most $6 \| U \|$ incident-state names, and use at most $\| delta_G U \| lt.eq 6 r$ extra occurrence names. One additional name can be reused inside every class predicate without capturing any of these names. The total is at most
  $ r + 7 \| U \| + 6 r + 1 lt.eq 7 r + 7 \( 6 r \/ c \)^(3 \/ 2) + 1 lt.eq M . $
  We have obtained a $C^M$ formula distinguishing the tuples, contrary to their type equality. Hence $sigma$ extends to some $k in K$. Its action maps each edge occurrence, and thus every tuple configuration as well, to its counterpart. For empty tuples, take $k = 0$. ◻
]

The support scale from the preceding section is much smaller than the width available here. We record the comparison with all parameters fixed in the order needed later.

#thm([Corollary 7.6.])[
  (Widths at the support scale).  #emph[Fix positive integers $q \, m$ independently of $L$, and let 
$ N = N_L = Theta \( L^3 \) \, #h(2em) s = ⌈2 L \( q log_3 N + 1 \)^2⌉ + 1 \, #h(2em) M = floor.l L^(7 \/ 4) floor.r . $

 For all sufficiently large $L$, Proposition 20 holds, Proposition 22 applies to every tuple length $1 lt.eq r lt.eq \( m + 4 \) s$ in either expansion, and 
$ max { 4 \, m + 1 } s lt.eq M . $

 In particular, both expansions are $K$-homogeneous for equal $C^M$ types of tuples of length at most $max { 2 \, m } s$.]
] <base:width>

#proof[
  By $N = Theta \( L^3 \)$, $s = O_q \( L \( 1 + log L \)^2 \)$. Uniformly for $1 lt.eq r lt.eq \( m + 4 \) s$, the left side of (7.5) is
  $ O_(q \, m) #scale(x: 120%, y: 120%)[\(] L^(3 \/ 2) \( 1 + log L \)^3 #scale(x: 120%, y: 120%)[\)] = o \( L^(7 \/ 4) \) . $
  The floor in $M$ does not affect this eventual inequality. Also, $max { 4 \, m + 1 } s = o \( L^(7 \/ 4) \)$. Increasing $L$ if necessary supplies Lemma 19 and Proposition 20 as well. The threshold may depend on the fixed $q \, m$. ◻
]

== 8 Counting equivalence at every finite rank <hf:section>

Small supports connect the atom structure with the sets built during a choiceless computation. The connection must preserve exact counts, even though supported objects can have arbitrarily large finite rank. We prove an abstract transfer theorem for this purpose. Its proof first represents supported objects by finite expressions over support tuples, then compares the finite orbits of those objects after parameters have been fixed. Matching these orbits will produce a bijection of the entire supported domains. Forms and molecules originate in Blass, Gurevich and Shelah #cite(label("bgs1999")) Sections 8–9, published version and were developed for counting by Dawar, Richerby and Rossman #cite(label("drr2008")) Section 8, Theorem 33, author version. Their hereditary-support transfer already permits arbitrary finite rank. We give the quantitative group-relative version proved in #cite(label("cptCompanion2026")) Section 5, Theorem 14, including its complete orbit-counting argument.

Let $B$ be a finite relational structure, also writing $B$ for its universe, and let $K lt.eq "Aut" \( B \)$. Regard the elements of $B$ as atoms, distinct from every set, and extend the action of $K$ recursively to $"HF" \( B \)$. A tuple $alpha$ of atoms #emph[supports] $x in "HF" \( B \)$ if every element of $K$ fixing $alpha$ coordinatewise fixes $x$. For an integer $s gt.eq 1$, let

$ D_s \( B \, K \) = { x in "HF" \( B \) :  & x upright(" and every recursive member of ") x\
 & upright("have a ") K upright("-support of length at most ") s } . $

Here a recursive member is an object reached by a positive number of membership steps. We view $D_s \( B \, K \)$ as a relational structure with membership, a unary atom predicate, and the relations of $B$, interpreted as false whenever an argument is a set. This domain is closed under taking members and is invariant under $K$. It contains every atom and every pure hereditarily finite set, since an atom supports itself and a pure set has empty support. Consequently the domain is countably infinite when $B$ is finite, although each of its individual objects is hereditarily finite.

For a tuple $macron(a)$ of length at most $M$, write $"tp"_M^B \( macron(a) \)$ for its complete $C^M$ type: the set of all $C^M$ formulas true at $macron(a)$, with free variables among the indicated ordered tuple positions. Tuple entries may repeat. The variable bound restricts the stock of variable names, not the length of a formula or the natural-number constants in exact counting quantifiers.

#thm([Theorem 8.1.])[
  (Transfer through small supports).  #emph[Let $B_0 \, B_1$ be nonempty finite structures in the same finite relational vocabulary of arity at most two, and let $K_i lt.eq "Aut" \( B_i \)$ for $i = 0 \, 1$. Let $s \, m \, M$ be positive integers with 
$ max { 4 \, m + 1 } s lt.eq M . $

 Suppose that:]
  + #emph[$B_0$ and $B_1$ satisfy the same $C^M$ sentences;]
  + #emph[in each $B_i$, any two tuples of length at most $max { 2 \, m } s$ having the same $C^M$ type belong to the same $K_i$-orbit.]
  #emph[Then $D_s \( B_0 \, K_0 \)$ and $D_s \( B_1 \, K_1 \)$ satisfy the same $C^m$ sentences in membership, atomhood, and the base relations.]
] <hf:transfer>

All supports below are padded to length exactly $s$. This is possible by repeating entries, or by using an arbitrary atom when the support is empty; the nonemptiness hypothesis is used here. Padding preserves the support property. Write $D_i = D_s \( B_i \, K_i \)$ for the rest of the proof.

=== 8.1 Exact extension counts of atom types <exact-extension-counts-of-atom-types>

Only types realized in $B_0$ or $B_1$ will be used. For each fixed tuple length there are finitely many such types. Although a complete type is an infinite collection of formulas, its class of realizations in these two finite structures can be isolated by one finite formula.

#thm([Lemma 8.2.])[
  (Extension counts).  #emph[Let $P \, P'$ be tuples of the same length $a$, in two structures chosen from $B_0 \, B_1$, allowing the two structures to be the same. Suppose that $P \, P'$ have the same $C^M$ type. If $a + d lt.eq M$, then for every realized type $rho$ of length $a + d$, the numbers of tuples $gamma \, gamma'$ of length $d$ satisfying 
$ "tp"_M \( P \, gamma \) = rho \, #h(2em) "tp"_M \( P' \, gamma' \) = rho $

 are equal. Equal types also give equal types on every projected or reordered subtuple.]
] <hf:extension-counts>

#proof[
  Projection and reordering follow by renaming variable positions: an injection from the selected positions to the original positions extends to a permutation of the $M$ variable names. This renames bound variables as well, so it avoids capture. Repeated atom values cause no difficulty, because equality formulas record them.
  For $d = 1$, choose a tuple realizing $rho$. For every tuple in either finite structure whose type differs from $rho$, choose a formula distinguishing it from this representative, and negate that formula if necessary so that the representative satisfies it. The conjunction of these finitely many formulas, denoted $theta_rho$, holds exactly on the tuples of type $rho$ in the two structures. It has free variables among the first $a + 1$ positions and uses the same $M$ variable names. If there are no other types, take a tautology. If $P$ has exactly $h$ extensions realizing $rho$, then
  $ exists^(= h) x_(a + 1) thin theta_rho \( x_1 \, dots.h \, x_a \, x_(a + 1) \) $
  holds at $P$ and hence at $P'$. This includes $h = 0$. For empty prefixes in different structures, agreement of the types means exactly the assumed agreement on $C^M$ sentences.
  For $d > 1$, let $sigma$ be the projection of $rho$ to the first $a + d - 1$ positions. By induction the numbers of extensions from $P \, P'$ to $sigma$ agree. The one-coordinate case, applied both within one structure and between the two structures, shows that each realization of $sigma$ has the same number of extensions to $rho$. Multiplying the two finite counts proves the assertion. ◻
]

In particular, every type realizable over one prefix is realizable over any prefix with the same type. We will use this consequence to transfer witnesses, and the full counting assertion to transfer cardinalities.

=== 8.2 Finite expressions for supported objects <finite-expressions-for-supported-objects>

Call a tuple in $B_i^s$ a #emph[molecule]. We now define a common syntax, independent of $i$, for objects represented over a molecule.

There are atomic forms $c_1 \, dots.h \, c_s$. A set form is a finite set of pairs $\( psi \, rho \)$, where $psi$ is an already constructed form and $rho$ is a realized $C^M$ type of length $2 s$. Atomic forms and set forms are distinct syntactic constructors. They have finite depth: an atomic form has depth zero; an empty set form has depth one; and a nonempty set form has depth one plus the largest depth of any of its constituent forms. For $alpha in B_i^s$, define evaluation recursively by

#[#set math.equation(numbering: n => "(8.1)")
 $ c_j * alpha & = alpha_j \,\
phi.alt * alpha & = { psi * beta : \( psi \, rho \) in phi.alt \, med beta in B_i^s \, med "tp"_M^(B_i) \( beta \, alpha \) = rho } quad upright("for a set form ") phi.alt upright(".") $ <hf:atomic-form>]

This is a finite set because both $phi.alt$ and $B_i$ are finite. The empty set form evaluates to $nothing$.

#thm([Lemma 8.3.])[
  (Representation by forms).  #emph[Every value $phi.alt * alpha$ lies in $D_i$ and is supported by $alpha$. Every object of $D_i$ has a representation of this kind. Furthermore, for each $g in K_i$, 
$ g \( phi.alt * alpha \) = phi.alt * \( g alpha \) . $

]
] <hf:representation>

#proof[
  Automorphisms preserve $C^M$ types. Induction on the form proves the displayed identity, using the change of witness molecule $beta mapsto g beta$ in Equation (8.1). It follows that $alpha$ supports $phi.alt * alpha$. The same induction shows that every member of a set-form value, and all of its recursive members, has a support of length $s$. Thus every form value belongs to $D_i$.
  Conversely, use induction on the hereditary construction of an object $x in D_i$. If $x$ is an atom, choose a molecule with first coordinate $x$ and use $c_1$. If $x$ is a set, choose a supporting molecule $alpha$. For every $y in x$, induction gives $y = psi_y * beta_y$. Set
  $ phi.alt = { \( psi_y \, "tp"_M^(B_i) \( beta_y \, alpha \) \) : y in x } . $
  Every $y in x$ belongs to $phi.alt * alpha$. Conversely, a member of $phi.alt * alpha$ has the form $psi_y * beta$ with
  $ "tp"_M^(B_i) \( beta \, alpha \) = "tp"_M^(B_i) \( beta_y \, alpha \) . $
  Homogeneity for tuples of length $2 s$ gives $g in K_i$ sending $\( beta_y \, alpha \)$ to $\( beta \, alpha \)$. Thus $g$ fixes $alpha$, so $g x = x$, and equivariance gives $psi_y * beta = g y in x$. Hence $phi.alt * alpha = x$. For the empty set, $phi.alt$ is the empty set form. ◻
]

There is no depth bound in this representation. The next lemma shows that equality and membership of form values depend only on the joint atom type of their molecules. Its variable requirement is independent of the depths of the forms.

#thm([Lemma 8.4.])[
  (Transfer of atomic facts).  #emph[Let $phi.alt \, psi$ be forms, and let $\( alpha \, beta \)$ and $\( alpha' \, beta' \)$ be pairs of molecules having the same $C^M$ type, in the same or different base structures. Then 
$ phi.alt * alpha = psi * beta & med arrow.l.r.double med phi.alt * alpha' = psi * beta' \,\
phi.alt * alpha in psi * beta & med arrow.l.r.double med phi.alt * alpha' in psi * beta' . $

 Atomhood and all base relations also agree on the corresponding values.]
] <hf:atomic-transfer>

#proof[
  For equality, induct on the sum of the depths of $phi.alt \, psi$. If both forms are atomic, equality compares two molecule coordinates and is recorded by the joint type. If exactly one is atomic, equality is false on both sides.
  Suppose now that both are set forms and $phi.alt * alpha = psi * beta$. Take a member of $phi.alt * alpha'$, witnessed by $\( theta \, rho \) in phi.alt$ and $gamma'$ such that $"tp"_M \( gamma' \, alpha' \) = rho$. By Lemma 25, the matching prefix $\( alpha \, beta \)$ can be extended by $gamma$ so that
  $ "tp"_M \( alpha \, beta \, gamma \) = "tp"_M \( alpha' \, beta' \, gamma' \) . $
  Thus $theta * gamma in phi.alt * alpha = psi * beta$. Choose its membership witness $\( xi \, sigma \) in psi$ and $zeta$ with
  $ "tp"_M \( zeta \, beta \) = sigma \, #h(2em) theta * gamma = xi * zeta . $
  Extend the primed prefix of length $3 s$ once more, obtaining $zeta'$ such that
  $ "tp"_M \( alpha \, beta \, gamma \, zeta \) = "tp"_M \( alpha' \, beta' \, gamma' \, zeta' \) . $
  This uses $4 s lt.eq M$. Projection preserves the membership-witness types. Since $theta$ and $xi$ have smaller depths than $phi.alt$ and $psi$, the induction hypothesis gives $theta * gamma' = xi * zeta'$. Therefore the chosen member lies in $psi * beta'$. Interchanging $phi.alt \, psi$ proves the other inclusion; interchanging the primed and unprimed data proves the reverse implication. Empty set forms are included because their inclusions are vacuous.
  For membership, if the right-hand form is atomic then membership is false. Otherwise a witness for $phi.alt * alpha in psi * beta$ consists of $\( theta \, rho \) in psi$ and a molecule $gamma$ with
  $ "tp"_M \( gamma \, beta \) = rho \, #h(2em) phi.alt * alpha = theta * gamma . $
  Extend $\( alpha' \, beta' \)$ to match $\( alpha \, beta \, gamma \)$, using $3 s$ positions. The equality transfer already proved transfers the equality to this witness, and hence transfers membership. The converse is symmetric.
  A form evaluates to an atom exactly when it is atomic. Base relations are false if any argument is a set. Otherwise, each argument is a specified molecule coordinate, so the truth of a base relation is recorded by the joint type. ◻
]

=== 8.3 Bijections after retaining parameters <bijections-after-retaining-parameters>

The preceding lemmas transfer individual values. Exact counting requires matching all possible values simultaneously after the other variables have been assigned.

Call two assignments to the same $r$ variable names #emph[represented alike] if, for common forms $phi.alt_1 \, dots.h \, phi.alt_r$, their values have representations

$ x_j = phi.alt_j * alpha_j \, #h(2em) x'_j = phi.alt_j * alpha'_j quad \( 1 lt.eq j lt.eq r \) \, $

and the concatenations

$ P = \( alpha_1 \, dots.h \, alpha_r \) \, #h(2em) P' = \( alpha'_1 \, dots.h \, alpha'_r \) $

have the same $C^M$ type. Dropping assigned positions preserves this property by projection. The empty assignments are represented alike by the sentence-equivalence hypothesis.

#thm([Lemma 8.5.])[
  (Extension bijections).  #emph[For represented-alike assignments with $r lt.eq m - 1$, there is a bijection $f : D_0 arrow.r D_1$ such that adjoining $x \, f \( x \)$ gives represented-alike assignments for every $x in D_0$. Moreover, $f \( x_j \) = x'_j$ for every retained position $j$.]
] <hf:bijection>

#proof[
  Fix the representing tuples $P \, P'$. A label is a pair $\( phi.alt \, tau \)$ consisting of a form and a realized type of length $\( r + 1 \) s$. Its value set on the first side is
  $ X_(phi.alt \, tau) \( P \) = { phi.alt * gamma : gamma in B_0^s \, med "tp"_M \( P \, gamma \) = tau } \; $
  define $X_(phi.alt \, tau) \( P' \)$ in $B_1$ similarly. Lemma 25 shows that these value sets are either both empty or both nonempty.
  Write $K_(0 \, P)$ for the pointwise stabilizer of the coordinates of $P$ in $K_0$, and $K_(1 \, P')$ for the corresponding stabilizer in $K_1$. Every nonempty $X_(phi.alt \, tau) \( P \)$ is a single $K_(0 \, P)$-orbit. Indeed, homogeneity for
  $ \( r + 1 \) s lt.eq max { 2 \, m } s $
  shows that the molecules of the specified type over $P$ form a single $K_(0 \, P)$-orbit. Equivariance of form evaluation makes their value set one orbit as well. The same holds on the second side. In particular two nonempty label sets on either side are equal or disjoint.
  We compare first their overlaps and then their cardinalities. Suppose two labels overlap on the first side, with molecules $gamma \, zeta$ witnessing equal form values. Extend $P'$ to match the type of $\( P \, gamma \, zeta \)$. This uses
  $ \( r + 2 \) s lt.eq \( m + 1 \) s lt.eq M . $
  Projection preserves each label condition, and Lemma 27 preserves equality of the two values. Thus the labels overlap on the second side. The converse follows by interchanging the sides.
  Equal numbers of molecules do not yet give equal numbers of represented objects: several molecules may evaluate to the same value. We will show that evaluation has constant fibre size on each label and that this size agrees in the two structures.
  Fix a nonempty label $\( phi.alt \, tau \)$. Let $n$ be the number of its molecules over $P$; the corresponding number over $P'$ is also $n$, by Lemma 25. The map
  $ gamma mapsto phi.alt * gamma $
  from these molecules onto $X_(phi.alt \, tau) \( P \)$ has fibres of a common positive size. To see this, choose preimage molecules of any two values. An element of $K_(0 \, P)$ taking the first molecule to the second maps the first fibre bijectively onto the second by equivariance.
  Choose molecules $gamma \, gamma'$ realizing $tau$ over $P \, P'$. The fibre containing $gamma$ has size
  $ h = \| { zeta in B_0^s : "tp"_M \( P \, zeta \) = tau \, med phi.alt * gamma = phi.alt * zeta } #scale(x: 120%, y: 120%)[\|] . $
  Partition the possible $zeta$ by the finitely many realized types of $\( P \, gamma \, zeta \)$. On each type, the two displayed conditions have a constant truth value, within either structure and between the structures: projection determines the first, and Lemma 27 determines the second. By Lemma 25, each such type has equally many extensions over $\( P \, gamma \)$ and $\( P' \, gamma' \)$. Again the required length is only $\( r + 2 \) s$. Summing these finite extension counts shows that the corresponding fibre on the second side has the same size $h$. Consequently
  $ \| X_(phi.alt \, tau) \( P \) \| = n / h = \| X_(phi.alt \, tau) \( P' \) \| . $
  By Lemma 26, the label sets cover the respective domains. Partition the nonempty labels by overlap on the first side. The same equivalence relation is obtained on the second side. For each label class, its value set in $D_0$ and its value set in $D_1$ are finite sets of the same size. Choose a bijection between them. Different classes have disjoint value sets, so the union of these bijections is a bijection $f : D_0 arrow.r D_1$.
  This construction does not require either domain to be finite. There are countably many labels, since there are finitely many base types of each relevant length and every form is a finite expression. For an explicit set-theoretic choice of the bijections, fix external enumerations of the labels and of the two countable HF universes. Use the first label in each class, and match the members of its two finite value sets in enumeration order. These external enumerations are used only in this proof.
  If $x$ is matched with $x'$, the class’s representative label $\( phi.alt \, tau \)$ supplies molecules $gamma \, gamma'$ with
  $ x = phi.alt * gamma \, quad x' = phi.alt * gamma' \, quad "tp"_M \( P \, gamma \) = "tp"_M \( P' \, gamma' \) = tau . $
  Thus the extended assignments are represented alike. If $x = x_j$ for a retained position, projection onto the molecules for $x_j$ and $x$, followed by Lemma 27, forces $x' = x'_j$. This also proves consistency when retained values repeat. ◻
]

#proof[
  We prove by induction on $C^m$ formulas that represented-alike assignments to their free variables agree on truth. For atomic formulas involving two distinct variables, project onto their two molecules and apply Lemma 27. Atomhood is determined by the form. For a repeated variable, $x = x$ is always true and $x in x$ always false in $"HF" \( B_i \)$; a diagonal base relation is false on a set and is otherwise determined by a coordinate in the molecule type. Unary base relations are treated in the same way. Boolean connectives preserve agreement.
  For a quantifier binding $x$, retain only the assignments to the other free variable names, dropping the previous value of $x$ if present. There are at most $m - 1$ retained positions. Lemma 28 supplies a bijection of the domains for which every extension by $x$ is represented alike. By the induction hypothesis, this restricts to a bijection between the sets of values satisfying the quantified body. It preserves existence and, for every natural number $h$, the assertion that there are exactly $h$ satisfying values. This remains valid when the satisfying sets are infinite: a bijection preserves finiteness and every finite cardinality. Universal quantification follows as well, or follows by negation. The empty assignments are represented alike, which proves the theorem. ◻
]

The homogeneity hypothesis was used only for representation with two molecules and for stabilizer orbits with at most $m$ molecules. Four molecules suffice to transfer equality, and at most $m + 1$ suffice to compare label overlaps and fibres. Neither requirement grows with hereditary rank. The domain bijections are mathematical witnesses to counting equivalence; no definability of them is asserted or needed.

== 9 Full CPT cannot distinguish the grid pairs <eval:section>

We now apply the support and counting results to an arbitrary sentence of full $upright("CPT")$, with cardinality and unrestricted finite set rank. The remaining task is to describe its actual evaluation by a counting formula of fixed variable width. The formula may depend on the common input size; its width will depend only on the sentence. This is sufficient because the supported HF domains agree on #emph[all] formulas of that width.

We use the bounded set-term semantics recalled in the preliminaries, as specified in #cite(label("ls2023")) Section 2. For an iteration with bound $p$, write $P \( n \) = floor.l p \( n \) floor.r$. Its unbounded sequence starts at $a_0 = nothing$ and applies the bounded semantics of its step term. It returns the first stationary value $a_j = a_(j + 1)$ if $j lt.eq P \( n \)$ and all states through index $j$ satisfy $\| "TC" \( a_i \) \| lt.eq P \( n \)$; otherwise it returns $nothing$. Here and below the bounds are nonnegative at the input sizes considered. After a stationary value all later states are the same, so this stopping rule is equivalent to requiring the size bound throughout the sequence. In particular, testing stationarity at index $P \( n \)$ requires computing the candidate $a_(P \( n \) + 1)$.

=== 9.1 An invariant family containing the entire evaluation <an-invariant-family-containing-the-entire-evaluation>

For an HF object $x$, put

$ chevron.l x chevron.r = { x } union "TC" \( x \) . $

For an atom $x$, this means $chevron.l x chevron.r = { x }$: atoms have no members. A finite family is membership-transitive if it contains all members of each of its objects.

Fix a CPT sentence $psi$, including its polynomial annotation. An #emph[activation] is a syntax occurrence together with the values assigned to its free variables when that occurrence is evaluated. Use the following deterministic evaluation prescription. Evaluate all arguments of a function and both children of every Boolean connective. For a comprehension, evaluate its condition on every member of the evaluated range, and its body on every member for which the condition is true. For an iteration, test successive candidates until stationarity, the first excessive transitive size, or the iteration cutoff is detected. Include the candidate needed for the final stationarity test. These conventions specify a family of activations without choosing an order on any set.

Let $cal(T)_psi \( A \)$ be the membership closure of all arguments and term values occurring in these activations, together with all input atoms and $nothing$. A rejected candidate and all objects constructed while evaluating it are included. Formula truth values need not be represented by HF objects.

#thm([Lemma 9.1.])[
  (Polynomial invariant evaluation family).  #emph[For every fixed CPT sentence $psi$, there is an integer $q gt.eq 1$ such that, on every sufficiently large finite input $A$ of size $n$, 
$ \| cal(T)_psi \( A \) \| lt.eq n^q . $

 The family $cal(T)_psi \( A \)$ is membership-transitive and invariant under $"Aut" \( A \)$. It includes the first excessive candidate of each activated iteration and, when needed, its candidate at index $P \( n \) + 1$.]
] <eval:trace>

#proof[
  We first prove a polynomial bound for an arbitrary fixed subexpression evaluated on arguments of polynomial hereditary size. More precisely, if the sum of the sizes of the families $chevron.l a chevron.r$ for its arguments is at most $R$, syntax induction bounds both its number of recursive activations and the total number of hereditary objects in these activations by a polynomial in $n + R + 2$. The polynomial may depend on the subexpression and on the annotation.
  Variables and constants satisfy this assertion directly. Pair and Union add or collect only polynomially many existing objects. Unique returns a member or $nothing$. Card returns the finite ordinal equal to the number of members of its argument, or zero on an atom. An ordinal $k$ and all its recursive members comprise $k + 1$ objects, so this operation also satisfies the assertion. Composition uses the child bounds a fixed number of times.
  For a comprehension, the induction hypothesis bounds the hereditary size of its range by a polynomial in $n + R + 2$, hence bounds its number of members. Each condition is evaluated on the parameters and one such member. Each required body evaluation has arguments of the same polynomial hereditary bound. Applying the child estimates at this enlarged bound and multiplying by the number of range members gives a polynomial total. Taking the set of body values adds one object and does not increase this estimate beyond another polynomial.
  For an iteration, every state supplied to the next step has passed the guard and has hereditary size at most $P \( n \) + 1$. The parameters retain their original bound $R$. By the induction hypothesis, a step on these arguments uses polynomially many hereditary objects. There are at most $P \( n \) + 1$ step evaluations before the stopping rule applies. This includes the first candidate violating the size guard: it is the output of a child evaluation on the preceding, bounded state, so it still has a polynomial hereditary bound, possibly larger than $p \( n \)$. It also includes the last candidate needed to compare $a_(P \( n \) + 1)$ with $a_(P \( n \))$. The empty default adds only a constant. This argument applies to a nested iteration by the same syntax induction; it does not assume that the step is iteration-free. Boolean and atomic formula evaluations only combine these bounds. At the sentence, $R = 0$, and a fixed integer exponent $q$ absorbs the resulting polynomial for all sufficiently large $n$.
  Every operation commutes with automorphisms of the input. The full comprehension range is used, the truth condition is invariant under the corresponding action on parameters, and the iteration stopping tests use only equality and cardinality. Thus an automorphism sends every activation to an activation at the same syntax occurrence and sends its value to the corresponding value. Starting with the empty assignment makes the whole family invariant. Closing it under membership preserves invariance and gives membership transitivity by definition. ◻
]

=== 9.2 Exact descriptions at actual arguments <exact-descriptions-at-actual-arguments>

The next lemma separates two requirements. We need correctness at the argument tuples actually used during evaluation. At each such tuple, however, uniqueness of the output must hold over the entire HF domain under consideration. An extra proposed output could otherwise create a false continuation of an iteration and prevent its empty-set default.

#thm([Lemma 9.2.])[
  (Bounded-width description of a CPT evaluation).  #emph[Fix a CPT sentence $psi$. There are an integer $m gt.eq 1$ and, for each sufficiently large input size $n$, a $C^m$ sentence $hat(psi)_n$ with the following property.]
  #emph[Let $A$ be an $n$-element input and let $D subset.eq "HF" \( A \)$ be membership-transitive, contain all atoms and all pure HF sets, and contain $cal(T)_psi \( A \)$. Interpret membership and the atom predicate on $D$, and interpret each input relation as false if an argument is a set. Then 
$ D tack.rr hat(psi)_n quad arrow.l.r.double quad psi upright(" evaluates to true on ") A . $

 The formula $hat(psi)_n$ depends only on $psi$ and $n$, not on $A$ or $D$. Its length and counting constants may depend on $n$; $m$ does not.]
] <eval:description>

#proof[
  Choose a common integer $J = J \( n \) gt.eq 1$, depending only on the polynomial bounds in the proof of Lemma 29, which bounds the hereditary size of every argument and value in the evaluation. In particular it bounds all cardinalities passed to Card and all descending membership depths of tested candidates. Increasing $J$ to an integer polynomial bound is harmless.
  For each term occurrence $t$, with free argument tuple $macron(x)$, we construct a relational formula $G_t \( macron(x) \, v \)$. For each formula occurrence $theta$, we construct a truth formula $F_theta \( macron(x) \)$. Write $"val"_A \( t \, macron(a) \)$ for the bounded semantic value of $t$ at $macron(a)$. Our simultaneous induction assertion is
  #[#set math.equation(numbering: n => "(9.1)")
   $ D tack.rr G_t \( macron(a) \, v \) & quad arrow.l.r.double quad v = "val"_A \( t \, macron(a) \) #h(2em) upright("for every ") v in D \,\
D tack.rr F_theta \( macron(a) \) & quad arrow.l.r.double quad theta upright(" is true at ") macron(a) \, $ <eval:graph-invariant>]
  whenever the displayed argument tuple is an activation of the indicated occurrence. Every genuine term value belongs to $D$ by the trace assumption. No assertion is made about an argument tuple which never occurs.
  Write $"At" \( v \)$ for the atom predicate and define the typed empty-set predicate
  $ E \( v \) := not "At" \( v \) med and med forall z thin not \( z in v \) . $
  It has exactly the empty set as its solution in $D$. Indeed a nonempty set in $D$ has a member in $D$ by membership transitivity, while the non-atom conjunct excludes urelements.
  ===== 9.2.1 Ordinals and the elementary operations. <ordinals-and-the-elementary-operations.>
  There are two-variable formulas $O_k \( v \)$ defining the pure von Neumann ordinal $k$, for every fixed nonnegative integer $k$:
  $ O_0 \( v \) := E \( v \) \, #h(2em) O_k \( v \) := not "At" \( v \) med and med forall z (z in v med arrow.l.r med or.big_(0 lt.eq j < k) O_j \( z \)) quad \( k > 0 \) . $
  All pure ordinals belong to $D$. Induction on $k$, membership transitivity and extensionality show that $O_k$ has exactly the claimed solution. The two names alternate in the recursion: inside $O_j \( z \)$, the old name $v$ can be bound, since that child formula has only $z$ free.
  Variable graphs are equalities with their corresponding arguments. The graphs for $nothing$ and $sans(A t o m s)$ are respectively $E \( v \)$ and
  $ not "At" \( v \) med and med forall z thin \( z in v arrow.l.r "At" \( z \) \) . $
  For evaluated arguments $a \, b$, the graphs of Pair and Union are
  $ & not "At" \( v \) med and med forall z thin \( z in v arrow.l.r \( z = a or z = b \) \) \,\
 & not "At" \( v \) med and med forall z thin \( z in v arrow.l.r exists w thin \( w in a and z in w \) \) . $
  Put
  $ "Sing" \( a \, w \) := not "At" \( a \) med and med forall z thin \( z in a arrow.l.r z = w \) . $
  The graph of Unique is
  $ "Sing" \( a \, v \) med or med #scale(x: 120%, y: 120%)[\(] not exists w thin "Sing" \( a \, w \) and E \( v \) #scale(x: 120%, y: 120%)[\)] . $
  These are graphs of the operations, not assertions that their outputs are atoms or that their inputs are sets. They give the specified defaults on atoms as well.
  The graph of Card on the actual argument $a$ is
  $ #scale(x: 120%, y: 120%)[\(] "At" \( a \) and E \( v \) #scale(x: 120%, y: 120%)[\)] med or med (not "At" \( a \) and or.big_(k = 0)^J (\( exists^(= k) z thin z in a \) and O_k \( v \))) . $
  Every member of $a$ belongs to $D$, so the quantifier counts its actual members. Its actual cardinality is at most $J$, and therefore one and only one disjunct yields an output.
  For a composite term, existentially bind the outputs of its child terms and apply the appropriate operation graph. By the induction hypothesis, these intermediate outputs are forced to be their genuine values among all elements of $D$. Membership transitivity then makes each displayed extensional graph exact among all possible proposed outputs. The graph for an input relation applied to terms is obtained in the same way; for equality use equality of their outputs. Translate Boolean connectives by the corresponding Boolean connectives.
  ===== 9.2.2 Comprehension. <comprehension.>
  Suppose
  $ t \( macron(x) \) = { u \( macron(x) \, y \) : y in r \( macron(x) \) \, med theta \( macron(x) \, y \) } . $
  Its graph is
  $ G_t \( macron(x) \, v \) :=  & exists w #scale(x: 240%, y: 240%)[\(] G_r \( macron(x) \, w \) and not "At" \( v \) and\
 & #h(7mm)  forall z [z in v med arrow.l.r med exists y #scale(x: 120%, y: 120%)[\(] y in w and F_theta \( macron(x) \, y \) and G_u \( macron(x) \, y \, z \) #scale(x: 120%, y: 120%)[\)]] #scale(x: 240%, y: 240%)[\)] . $
  At an actual parameter tuple, $w$ must be the actual range. Each of its members activates the condition. When the condition is true, that member also activates the body, whose graph has exactly its correct output by induction. When the condition is false, the conjunction is false without any correctness requirement on the body graph at that unused argument tuple. This proves that the right-hand side of the membership biconditional defines exactly the actual collected values. An alternative output set with an extra member is also excluded: that member lies in $D$ and is tested by the universal quantifier. The non-atom condition excludes an atom as a spurious empty output.
  ===== 9.2.3 The transitive-size guard. <the-transitive-size-guard.>
  For positive integers $ell$, define strict downward path formulas
  $ R_1 \( r \, z \) & := \( z in r \) \,\
R_(ell + 1) \( r \, z \) & := exists w thin \( w in r and R_ell \( w \, z \) \) . $
  Three variable names suffice for all $ell$: the endpoints and one intermediate name, with the former root name recycled inside the child formula. Set
  $ R_(lt.eq J + 1) \( r \, z \) := or.big_(ell = 1)^(J + 1) R_ell \( r \, z \) . $
  For every actual value $a$ under consideration, its solutions in $D$ are exactly $"TC" \( a \)$. All descendants belong to $D$, and the chosen depth bound reaches every descendant. The paths have positive length; they do not count the root merely by a path of length zero. Exact counting counts endpoints, not paths, even if a descendant is reached in several ways.
  For an iteration bound $p$, the formula
  $ "Ok"_(p \, n) \( r \) := or.big_(k = 0)^(P \( n \)) exists^(= k) z thin R_(lt.eq J + 1) \( r \, z \) $
  therefore says exactly $\| "TC" \( r \) \| lt.eq P \( n \)$ on every actual candidate. It also handles atoms and $nothing$, whose strict transitive closures are empty. Its behavior on unrelated objects of greater depth is not needed.
  ===== 9.2.4 Iteration and the empty default. <iteration-and-the-empty-default.>
  Consider a term $t = s \[ y \]^(*)$, with free parameters $macron(x)$, and let $S \( macron(x) \, w \, v \)$ be the already constructed graph for its step term. At the present input size abbreviate $P = P \( n \)$ and $"Ok" = "Ok"_(p \, n)$. Define finite formulas
  $ I_0 \( macron(x) \, v \) & := E \( v \) and "Ok" \( v \) \,\
I_(j + 1) \( macron(x) \, v \) & := "Ok" \( v \) and exists w thin \( I_j \( macron(x) \, w \) and S \( macron(x) \, w \, v \) \) \, #h(2em) 0 lt.eq j < P . $
  Let
  $ F \( macron(x) \, v \) & := or.big_(j = 0)^P #scale(x: 120%, y: 120%)[\(] I_j \( macron(x) \, v \) and S \( macron(x) \, v \, v \) #scale(x: 120%, y: 120%)[\)] \,\
G_t \( macron(x) \, v \) & := F \( macron(x) \, v \) med or med #scale(x: 120%, y: 120%)[\(] E \( v \) and not exists w thin F \( macron(x) \, w \) #scale(x: 120%, y: 120%)[\)] . $
  For $P = 0$ the disjunction has its $j = 0$ term: a single step still tests whether the initial empty state is stationary.
  We verify this graph for an actual parameter tuple $macron(a)$. Induction on $j$ shows that before stopping, $I_j \( macron(a) \, v \)$ has exactly the genuine state $a_j$ as its solution if all states through that index pass the size guard. At an admitted state, the step activation is actual. Its graph has exactly its actual candidate as output over the whole of $D$, by the syntax induction hypothesis. This candidate is in $D$, including when it is the first excessive one. The exact guard either admits that candidate or makes $I_(j + 1)$ have no solution. In the latter case all subsequent $I$’s have no solution, so no unrelated state can enter later.
  If an allowed stationary state is reached early, all subsequent $I_j$ repeat that same state. The step graph is still exact there because this argument tuple was already an actual activation. If no earlier stop occurs, the test $S \( macron(a) \, a_P \, a_P \)$ uses the actual final candidate $a_(P + 1)$, which was included in the evaluation family. It succeeds exactly when stationarity is reached at index $P$. Thus $F$ is empty when the bounded iteration fails, and otherwise its only output is the genuine stationary value. The final displayed formula returns precisely that value or the typed empty default. This proves the term part of (9.1). In particular, a fixed point at some argument tuple that was never activated cannot supply an extra output: every successful disjunct first requires a state reached from $I_0$.
  ===== 9.2.5 One fixed supply of variable names. <one-fixed-supply-of-variable-names.>
  All formulas above are finite at fixed $n$. It remains to show that their variable width is bounded independently of $n$. For each syntax occurrence, reserve its finitely many argument names, an output name when it is a term, and finitely many names for the intermediate outputs and local quantifiers in its displayed construction. Child formulas receive their indicated free interface and a separate working supply, renamed to avoid capture. Since the syntax tree is fixed, the sum of these finite reservations depends only on $psi$.
  The only repetitions whose depths grow with $n$ are the ordinal, membership-path and iteration expansions. The first two use the recycled interfaces already described. In the iteration recursion, retain $macron(x)$ and two state names. When $I_j \( macron(x) \, w \)$ is inserted in the formula for $I_(j + 1) \( macron(x) \, v \)$, its internal quantifier may bind the name $v$: the later state is not free in that child. This binder has scope only inside $I_j$, so it does not capture $v$ in the sibling formula $S \( macron(x) \, w \, v \)$. The step graph uses a separate fixed working supply. Repeating the recursion therefore does not keep a tuple of all previous states. Identified slots such as $S \( macron(x) \, v \, v \)$ can, if needed, use a fresh local alias constrained equal to $v$.
  This argument applies at every syntax level, including inside step terms that themselves contain iterations. Nesting depth adds only a fixed number of reservations. Let $m$ bound their total number. Taking the translated truth formula at the top sentence gives $hat(psi)_n$, and (9.1) at the empty assignment proves the claim. ◻
]

The descriptions are a tool for comparing two evaluations. They need not be computable by the CPT sentence, have polynomial length, or describe evaluation on every assignment in $D$. Their relevant properties are the fixed width and the exactness asserted in Lemma 30. Neither property puts a bound on the finite ranks occurring in $D$.

=== 9.3 Applying support and transfer <applying-support-and-transfer>

Recall the two grid structures $A_(b^0)$ and $A_(b^1)$, of common size $N = N_L = Theta \( L^3 \)$. The group $H$ acts on each original input, while its central subgroup $K$ also preserves the analytical expansion of Section 7. We now combine these two actions: the first places all actual evaluation values in a supported domain, and the second lets us compare those domains by counting logic.

#thm([Theorem 9.3.])[
  (Eventual equality for every CPT sentence).  #emph[For every sentence $psi$ of full CPT with counting over $tau$, there is $L_psi$ such that for every $L gt.eq L_psi$, 
$ A_(b^0) tack.rr psi quad arrow.l.r.double quad A_(b^1) tack.rr psi . $

]
] <eval:pair-equivalence>

#proof[
  Fix $psi$ first. Choose the integer $q$ from Lemma 29 and the width $m$ from Lemma 30. For each $L$, put
  $ s = ⌈2 L \( q log_3 N + 1 \)^2⌉ + 1 \, #h(2em) M = floor.l L^(7 \/ 4) floor.r . $
  For $i in { 0 \, 1 }$, let $D_(L \, i)^(\( s \))$ consist of the objects of $"HF" \( A_(b^i) \)$ such that the object and each recursive member have a $K$-support of length at most $s$. Give this domain membership, the atom predicate, and the original input relations, false whenever any argument is not an atom.
  The family $cal(T)_psi \( A_(b^i) \)$ is $H$-invariant, membership-transitive and of size at most $N^q$, for large $L$. Corollary 17 therefore gives
  $ cal(T)_psi \( A_(b^i) \) subset.eq D_(L \, i)^(\( s \)) . $
  The domain is membership-transitive and contains all atoms and pure HF sets: an atom supports itself, and a pure set is fixed by every atom permutation. Thus it satisfies all the domain requirements of Lemma 30.
  For the fixed $q \, m$, Corollary 23 supplies all the quantitative hypotheses of Theorem 24 on sufficiently large grids: the two analytical expansions are $C^M$-equivalent, equal $C^M$ types of tuples of length at most $max { 2 \, m } s$ determine $K$-orbits, and $max { 4 \, m + 1 } s lt.eq M$. These are nonempty finite structures in the same binary vocabulary, and $K$ acts by automorphisms of both expansions.
  The supported domains computed from the expansions have the same underlying sets $D_(L \, i)^(\( s \))$, since supports depend on the atom action of $K$, which did not change. The theorem gives $C^m$ equivalence with the additional analytical relations; forgetting those relations gives
  $ D_(L \, 0)^(\( s \)) equiv_(C^m) D_(L \, 1)^(\( s \)) . $
  The larger group $H$ was used only on the original input and its evaluation family. No assertion that $H$ preserves the analytical expansion is needed.
  Both inputs have size $N$, so the same formula $hat(psi)_N$, with the same numerical cutoffs and ordinal predicates, describes their evaluations. Lemma 30 and the displayed $C^m$ equivalence therefore give equal truth values for $psi$ on the two inputs. All inequalities hold eventually in $L$ after fixing $psi \, q \, m$, which proves the quantified assertion. ◻
]

#proof[
  Let $Phi$ be the single sentence constructed in Section 4, over the eight-relation vocabulary $tau$ and with its fixed polynomial annotation. It has one syntactic WSC occurrence, and Proposition 8 gives a Boolean value on every finite $tau$-structure. Let $Q$ be its true-model class. By Theorem 13, for every $L gt.eq 2$,
  $ A_(b^0) in Q \, #h(2em) A_(b^1) in.not Q . $
  If a CPT sentence $psi$ defined $Q$, it would have opposite truth values on every such pair. This contradicts Theorem 31 for large $L$. Finally, the non-strict inclusion follows from the inclusion of CPT syntax in CPT+WSC. Thus
  $ "Def"_(upright("CPT")) \( tau \) med subset.neq med "Def"_(upright("CPT") + upright("WSC")) \( tau \) . $
  ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
