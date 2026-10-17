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

#align(center)[#text(size: 16pt, weight: "bold")[Étale covers with a prescribed exterior sheet]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The simultaneous covering statement <the-simultaneous-covering-statement>

Fix a prime $p$, a finite extension $k \/ bb(Q)_p$, an algebraic closure $macron(k)$, and its completion $Omega = hat(macron(k))$. All analytic spaces below are Berkovich spaces over $Omega$. For a curve $X \/ macron(k)$ write $X^(upright("an")) = \( X_Omega \)^(upright("an"))$. The additive valuation is normalized by $v \( p \) = 1$, so that $v \( Omega^times \) = bb(Q)$.

Let $X \/ macron(k)$ be smooth, proper and connected, of genus at least two. Choose distinct points $b_1 \, dots.h \, b_d in X \( macron(k) \)$, where $d gt.eq 1$, and rational local parameters $t_i$ at these points. Suppose there are pairwise disjoint open disks $B_i subset X^(upright("an"))$ on which $t_i$ identifies $B_i$ with ${ \| T \| < R_i }$, and radii $r_i in \| Omega^times \|$ with $0 < r_i < R_i$. Set

$ V_i = { x in B_i : \| t_i \( x \) \| < r_i } . $

Thus the closed disk of radius $r_i$ lies strictly inside its parameter chart. Put

$ U = X^(upright("an")) \\ union.big_(i = 1)^d V_i \, $

and suppose that $U$ is nonempty and contains an $Omega$-rational point. It is a compact connected analytic domain: removing each open disk leaves its unique attachment point, and retracting the disk to that point preserves connectedness.

#thm([Theorem 1.1.])[
  #emph[For the fixed disks and exterior above, there is a smooth proper connected curve $Y \/ macron(k)$ and a finite étale surjective morphism $g : Y arrow.r X$ such that:]
  + #emph[a connected component of $g^(- 1) \( U \)$ maps isomorphically to $U$;]
  + #emph[for every $i$, every connected component of $g^(- 1) \( V_i \)$ maps to $V_i$ with degree divisible by $p$.]
  #emph[Here the inverse images and the degrees of their components refer to the induced finite étale analytic maps. The disks are the prescribed $V_i$; they are not shrunk in the conclusion.]
] <thm:exterior>

The two conditions impose simultaneous behavior on a single algebraic cover. The exterior sheet fixes its behavior on a whole compact domain, while the second condition requires nontrivial degree on every component above every deleted disk.

Resolution of nonsingularities seeks finite étale covers whose stable reductions acquire components above prescribed points of a model. Tamagawa proved this for points of a stable marked model in mixed characteristic with residue field algebraic over a finite field #cite(label("TamagawaRNS")) Theorem 0.2(v). Lepage established the corresponding property for arbitrary semistable models of Mumford curves #cite(label("LepageRNS")) Theorem 2.7. The theorem of Mochizuki–Tsujimura provides the positive-genus formulation for arbitrary hyperbolic curves over $p$-adic local fields: a stable component with positive-genus normalization can be placed above any prescribed closed point of a model #cite(label("MochizukiTsujimura")) Theorem A and the alternative formulation preceding it. This is our geometric input; the additional task is to impose the exterior and disk conditions simultaneously on one cover.

Beyond the resolution covers, the construction uses two primes with different roles. In Section 2, positive-genus components give skeletal paths above each fixed disk, using the model–skeleton correspondence and retractions described by Baker–Payne–Rabinoff #cite(label("BakerPayneRabinoff")) Sections 2–4. An auxiliary prime $ell eq.not p$ supplies residue-component torsors: above each path the edges multiply faster than the endpoint vertices, forcing a cycle. After Galois refinement this gives a cover $Z arrow.r X$ with a cycle above every $V_i$.

In Section 3, cyclic graph covers of degree $p$ detect these cycles while splitting above the entire inverse image of $U$. Their pullbacks give locally trivial analytic covers by #cite(label("DeJongCoverings")) Lemma 2.6. Standard proper non-Archimedean GAGA, in the formulation of #cite(label("GAGA")) Appendix A, and invariance of finite étale covers under algebraically closed base extension #cite(label("SGA1")) Exposé X, Corollary 1.8 return algebraic covers over $macron(k)$. Finally, Section 4 assembles all conjugate characters and takes a quotient by an exterior-component stabilizer. This retains one exterior sheet while preserving a nontrivial $p$-factor in every disk-component degree.

== 2 Models, components, and cycles <models-components-and-cycles>

The first task is to place a skeletal circle above each prescribed disk. Resolution of nonsingularities supplies positive-genus vertices there; a cover of the special fibre will turn paths between these vertices into circles.

A split semistable model over the integers of a finite extension of $k$ has a finite skeleton. Its vertices correspond to normalized special-fibre components; a vertex has the genus of that normalization. A split node with equation $x y = q$ gives an edge of length $v \( q \)$. The curve retracts onto its skeleton. Outside it are open disks attached at one point; the inverse image of an open edge is its node annulus #cite(label("BakerPayneRabinoff")) Sections 2.3 and 4. The stable model is the one for the proper unmarked curve.

We use the following precise consequence of resolution of nonsingularities. For any proper flat normal model $cal(X)$ of a hyperbolic curve over a finite extension of $k$, and any closed point $x$ of its special fibre, after a finite constant extension there are a connected finite étale Galois cover $C arrow.r X$, a stable model $cal(C)$, and a morphism $cal(C) arrow.r cal(X)$ extending the cover, such that a component of $cal(C)_s$ with normalization of genus at least one maps to $x$. This is the alternative formulation of $Sigma$-RNS preceding Theorem A in #cite(label("MochizukiTsujimura")), with $Sigma$ the set of all primes; Theorem A, equivalently Theorem 2.17, applies over the finite local field in question. The positive-genus conclusion is part of the input, in addition to existence of a model morphism. To use an arithmetic resolution cover over $macron(k)$, first enlarge the constant field to split its geometric components and choose the component containing the selected positive-genus vertex. Its stabilizer acts Galoisly over the base, so the chosen cover is connected and Galois over $macron(k)$ and retains that vertex.

#thm([Lemma 2.1.])[
  #emph[Let $f : C arrow.r X$ be a connected finite étale Galois cover with group $G$, and let $D$ be either $U$ or one of the $V_i$. Every connected component of $f^(- 1) \( D \)$ is finite étale and surjective over $D$. The group $G$ acts transitively on these components. If $B$ is the stabilizer of a component, its degree over $D$ is $\| B \|$.]
] <lem:components>

#proof[
  The spaces in question are locally path connected, and their connected components are open and closed. For the compact domain $U$ this also follows from a finite affinoid cover and the finite component decompositions of affinoids. An open-and-closed restriction of a finite étale map is finite étale: on affinoids it is given by an idempotent summand of the finite algebra. Its rank is locally constant, hence constant and positive on the connected base $D$.
  Choose a classical point of $D$. Its geometric fibre is a free transitive $G$-set. Every component meets that fibre, which proves transitivity on components. Two points of the fibre lying in the same component are related by an element preserving that component. Thus its fibre is a free transitive $B$-set, and its rank is $\| B \|$. ◻
]

#thm([Proposition 2.2.])[
  #emph[There is a connected finite étale Galois cover $Z arrow.r X$ whose stable skeleton contains, for each $i$, an embedded circle lying entirely above $V_i$.]
] <prop:cycles>

#proof[
  #emph[Positive-genus paths.] All the algebraic data descend to a finite extension of $k$. Choose a split semistable model of $X$ with, for each $i$, two distinct smooth closed special-fibre points whose tubes lie inside the fixed $V_i$. To arrange this without altering $V_i$, insert a rational-radius type-two point strictly inside $V_i$ as a vertex of a semistable refinement. Choose two smooth residue directions at this vertex away from the direction toward the exterior; their tubes lie in $V_i$. After a finite extension their centres are rational. The finite set of these type-two points can be inserted simultaneously, and the correspondence between vertex sets and models gives the required model #cite(label("BakerPayneRabinoff")) Proposition 3.13(3) and Theorem 4.11.
  Apply the positive-genus resolution input at each of the two chosen closed points. The resulting positive-genus stable vertices map into their respective tubes, hence to two distinct type-two points $x_(i 1) \, x_(i 2) in V_i$. Take a connected finite étale Galois cover $Z_0 arrow.r X$ dominating the finitely many covers so obtained. Every point of $Z_0^(upright("an"))$ over every $x_(i j)$ has positive residual genus. Indeed, some lift dominates the selected positive-genus point, and the associated inclusion of residue function fields prevents its genus from being zero by Lüroth’s theorem. Galois transitivity then gives the assertion for all lifts. These points are vertices of the stable skeleton $Gamma_0$ of $Z_0$ #cite(label("BakerPayneRabinoff")) Theorem 4.22(2).
  For each $i$, choose a component above $V_i$. By Lemma 2, it contains lifts of both $x_(i 1)$ and $x_(i 2)$. Join them by a path within that component. Its retracted image in $Gamma_0$ is contained in the original path image: to reach a point of an attached open disk from either skeletal endpoint, the path must pass through that disk’s attachment point. The retracted path therefore still lies above $V_i$. Removing repetitions gives a simple edge path $P_i$ of positive length, with distinct positive-genus endpoints, lying above $V_i$.
  #emph[A residue torsor creates cycles.] Fix a prime $ell eq.not p$. We seek a cyclic étale torsor of degree $ell$ on the special fibre which is connected on the normalized components at both ends of every $P_i$. Each endpoint will then have one vertex above it, while each edge has $ell$ lifts. This excess of edges forces a cycle; Figure 1 illustrates the one-edge case. The proof of #cite(label("MochizukiTsujimura")) Proposition 2.6 also uses cyclic component covers, gluing, and deformation. Here we prescribe the endpoint characters simultaneously through the normalization sequence.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (2, 0), stroke: (thickness: 0.65pt, miter-limit: 10))
  circle((0, 0), radius: 0.0635, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$a$]], anchor: "south-east", padding: 0.1176cm)
  circle((2, 0), radius: 0.0635, fill: black, stroke: none)
  content((2, 0), [#text(size: 9pt)[$b$]], anchor: "south-west", padding: 0.1176cm)
  content((1, -0.7), [#text(size: 9pt)[$P_i$, with one edge]])
  line((4.2, 0), (2.8, 0), stroke: (thickness: 0.65pt, miter-limit: 10), mark: (end: ">"))
  content((3.5, 0.4), [#text(size: 9pt)[$ell =3$]])
  line((5, 0), (7, 0), stroke: (thickness: 0.65pt, miter-limit: 10))
  bezier((5, 0), (7, 0), (5.6, 0.85), (6.4, 0.85), stroke: (thickness: 0.65pt, miter-limit: 10))
  bezier((5, 0), (7, 0), (5.6, -0.85), (6.4, -0.85), stroke: (thickness: 0.65pt, miter-limit: 10))
  circle((5, 0), radius: 0.0635, fill: black, stroke: none)
  content((5, 0), [#text(size: 9pt)[$a'$]], anchor: "east", padding: 0.1176cm)
  circle((7, 0), radius: 0.0635, fill: black, stroke: none)
  content((7, 0), [#text(size: 9pt)[$b'$]], anchor: "west", padding: 0.1176cm)
  content((6, -1.1), [#text(size: 9pt)[inverse subgraph]])
})],
    caption: [Figure 1: The one-edge case, drawn for $ell = 3$. Connected covers of the endpoint normalizations give a single vertex $a'$ over $a$ and a single vertex $b'$ over $b$, whereas the node has three lifts. Any two lifted edges form a circle. Only this part of the source graph is shown; the actual paths $P_i$ may have more edges, and their inverse graphs are handled by the count in the proof. ],
  ) <fig:path-cycle>
  Let $C$ be the geometric special fibre of the stable model of $Z_0$, and let $nu$ denote its normalization. For the constant étale sheaf the normalization sequence is
  $ 0 arrow.r bb(F)_ell arrow.r nu_(*) bb(F)_ell arrow.r xor.big_(upright("nodes")) bb(F)_ell arrow.r 0 . $
  The last term is a skyscraper sheaf with vanishing $H^1$, and the finite normalization has no higher direct images of this sheaf. Consequently $H^1 \( C \, bb(F)_ell \)$ surjects onto the product of the $H^1$ of its normalized components. Each smooth positive-genus component $D$ admits a nonzero $bb(F)_ell$-character. Indeed, over the algebraically closed residue field, the Kummer sequence gives $H^1 \( D \, mu_ell \) = "Pic" \( D \) \[ ell \] = "Jac" \( D \) \[ ell \]$. This group is nonzero by #cite(label("MilneAV")) Theorem 8.2 and Remark 8.4, and a choice $mu_ell tilde.eq bb(F)_ell$ identifies it with the character group in question. Prescribe such a character at each required endpoint component and lift this tuple to $H^1 \( C \, bb(F)_ell \)$. The resulting torsor is connected: its character is nonzero, and $ell$ is prime.
  After finite constant extension this torsor is defined on the special fibre over the residue field. Finite étale covers of a proper scheme over a complete Noetherian local ring are equivalent to those of its special fibre #cite(label("SGA1")) Exposé IX, Théorème 1.10. Full faithfulness also lifts the action and the torsor identity, giving a finite étale cover of the stable model. Its source is semistable and normal after every finite constant extension. Its generic fibre $Z_1$ is geometrically connected: otherwise, after some finite constant extension, a decomposition of that fibre would extend to open-and-closed components of the normal model. Each component meets the special fibre by properness, contradicting its geometric connectedness.
  The source model is also stable. On normalized components its map is finite étale, so Riemann–Hurwitz forces any genus-zero source component to have degree one over a genus-zero component, retaining at least three node branches. A genus-one component lies over a genus-one component and retains at least one node branch. Thus no stabilization can contract the cycles that we now find in its skeleton.
  If $P_i$ has $m gt.eq 1$ edges, its inverse graph has $E = m ell$ edges and $V lt.eq \( m - 1 \) ell + 2$ vertices. Every node has $ell$ split lifts; each endpoint has just one vertex above it by the connectedness imposed on its normalization. Write $c gt.eq 1$ for the number of connected components of this inverse graph. Then
  $ b_1 = E - V + c med gt.eq med m ell - \( \( m - 1 \) ell + 2 \) + 1 = ell - 1 > 0 . $
  It therefore contains an embedded circle, entirely above $V_i$.
  #emph[Galois refinement preserves the cycles.] Deck transformations of $Z_0 \/ X$ extend to its stable model. Take the product over that model of all conjugates of the cyclic cover. After a finite constant extension, choose a geometric connected component of its generic fibre and its open-and-closed closure in the normal product model. On geometric generic fibres this corresponds to the intersection of the conjugate normal index-$ell$ subgroups of $pi_1 \( Z_0 \)$, which is normal in $pi_1 \( X \)$. The resulting cover $Z arrow.r X$ is therefore Galois. The chosen component is finite étale and surjective over the model of $Z_1$.
  Above a circle with $q$ edges and $q$ vertices, a degree-$e$ finite étale model cover has $e q$ edges and at most $e q$ vertices. Its nonempty inverse graph consequently satisfies $b_1 = E - V + c gt.eq 1$. The source model is stable by the preceding argument, so its skeleton contains an embedded circle above each $V_i$, as required. ◻
]

== 3 Graph characters supported above the disks <graph-characters-supported-above-the-disks>

Fix $Z$ as in Proposition 3, and write $tau : Z^(upright("an")) arrow.r Gamma$ for the retraction to its stable skeleton. Put $U_Z = Z^(upright("an")) times_(X^(upright("an"))) U$.

#thm([Lemma 3.1.])[
  #emph[For every $i$ there is a connected cyclic finite étale cover of $Z$ of degree $p$ which is trivial over all of $U_Z$ and whose restriction to at least one component above $V_i$ is connected.]
] <lem:graph-character>

#proof[
  Choose an embedded circle $C_i subset Gamma$ lying above $V_i$, and select one of its edges. We will construct a cyclic graph cover by gluing sheets only across a cut in this edge. To make its pullback split over all of $U_Z$, the cut must avoid not just $U_Z$ but its image under the retraction.
  Choose a point $eta_i$ strictly inside the selected edge at an irrational position for the normalized valuation. Vertex positions and edge lengths are rational, so such a point exists. It is of type three and satisfies
  $ tau^(- 1) \( eta_i \) = { eta_i } . $
  Indeed side disks attach only at type-two points, whose coordinates on this edge have valuation in $bb(Q)$. Since $eta_i$ lies above $V_i$, its singleton retraction fibre misses $U_Z$. Thus $tau \( U_Z \)$ avoids $eta_i$.
  Orient the selected edge and cut it open at $eta_i$, giving two new endpoints $eta_i^(-)$ and $eta_i^(+)$ on its incoming and outgoing halves. Take $p$ copies of the cut graph, labelled by $a in bb(F)_p$, and identify $eta_i^(-)$ in copy $a$ with $eta_i^(+)$ in copy $a + 1$. This gives a cyclic graph cover of degree $p$. Away from $eta_i$ it is the disjoint union of the $p$ labelled copies of $Gamma \\ { eta_i }$. Traversing $C_i$ in the selected orientation sends the sheet label $a$ to $a + 1$, so the cover of $C_i$ is connected.
  Pull this graph cover back by $tau$. It splits over the entire $U_Z$ because $tau \( U_Z \)$ misses the cut. On the component above $V_i$ containing $C_i$, the loop $C_i$ permutes all $p$ sheets transitively. The restriction to that component, and hence the pulled-back cover itself, is connected.
  It remains to realize this topological cover algebraically. A finite topological covering of a Berkovich curve obtains an analytic structure by pulling back the structure sheaf on its locally trivial sheets #cite(label("DeJongCoverings")) Lemma 2.6. The local product algebras glue by their sheet permutations, giving a coherent finite étale analytic algebra. Proper GAGA algebraizes this algebra, its unit and multiplication, with their identities preserved by full faithfulness #cite(label("GAGA")) Appendix A, Theorem A.1(ii); étaleness is detected after analytification #cite(label("TemkinAnalytic")) Fact 5.1.5. The deck action also algebraizes. Invariance under the algebraically closed extension $macron(k) subset Omega$ descends this cover and its action to $macron(k)$ #cite(label("SGA1")) Exposé X, Corollary 1.8. The resulting cyclic finite étale cover has the two restriction properties just established. ◻
]

We have obtained the local nontriviality without sacrificing exterior splitting. To make it hold on every disk component after one quotient, we assemble the characters equivariantly.

== 4 The stabilizer quotient <the-stabilizer-quotient>

#proof[
  Take the covers of Lemma 4 for all $i$, their conjugates under $"Gal" \( Z \/ X \)$, and a connected component of their fibre product over $Z$. Call the resulting curve $T$. The intersection of their kernels in $pi_1 \( Z \)$ is normal in $pi_1 \( X \)$, so $T arrow.r X$ is connected, finite étale and Galois. Put
  $ G = "Gal" \( T \/ X \) \, #h(2em) P = "Gal" \( T \/ Z \) . $
  The group $P$ is elementary abelian of exponent $p$, since it embeds in the product of the cyclic deck groups. All conjugate covers split over $U_Z$: each deck transformation of $Z \/ X$ preserves $U_Z$. Their composite $P$-cover therefore splits over $U_Z$ as well.
  Let $H subset G$ be the stabilizer of a connected component of the inverse image of $U$ in $T^(upright("an"))$. Splitting over $U_Z$ gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ H ∩ P = 1 . $ <eq:disjoint>]
  Indeed $P$ permutes freely the trivial sheets above each component of $U_Z$.
  For a fixed $i$, choose a component $W$ above $V_i$ in $Z$ on which the cyclic cover from Lemma 4 is connected. Let $A$ be a component above $W$ in $T$, and let $B subset G$ be its stabilizer. The stabilizer for $T arrow.r Z$ is $B ∩ P$, so the same fibre calculation as in Lemma 2 gives $deg \( A \/ W \) = \| B ∩ P \|$. The map $A arrow.r W$ factors through the connected restriction of the chosen cyclic cover. The map to that restriction is surjective: it is finite étale, and its nonzero locally constant rank is positive everywhere on the connected target. Consequently $p$ divides $\| B ∩ P \|$. Lemma 2 gives transitivity of $G$ on all components over $V_i$, and $P$ is normal in $G$. Consequently
  #[#set math.equation(numbering: n => "(4.2)")
   $ B ∩ P eq.not 1 quad upright("for every such component stabilizer ") B . $ <eq:nontrivial>]
  Set $Y = T \/ H$. The two quotients fit into the commutative square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$T$])
  content((1.929, 0), [$Z$])
  content((0, -0.744), [$Y$])
  content((1.929, -0.744), [$X .$])
  line((0.336, 0), (1.593, 0), mark: (end: ">"))
  content((0.9645, 0.2266), [#text(size: 0.73em)[$upright("quotient by ") P$]])
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  content((0.9004, -0.372), [#text(size: 0.73em)[$upright("quotient by ") H$]])
  line((1.929, -0.2725), (1.929, -0.4715), mark: (end: ">"))
  line((0.336, -0.744), (1.461, -0.744), mark: (end: ">"))
})
  The curve $Y$ is smooth, proper and connected, and the induced map $g : Y arrow.r X$ is finite étale. We use one component calculation for both required assertions. Let $D$ be $U$ or one of the $V_i$, and let $A$ be a component of its inverse image in $T$, with stabilizer $B subset G$. The inverse image in $T$ of the image of $A$ in $Y$ is the union of its $H$-translates. This union is open and closed in the inverse image of $D$, so that image is a connected component of $g^(- 1) \( D \)$. An $H$-translate of $A$ is either $A$ or disjoint from it; hence the image is $A \/ \( B ∩ H \)$. By Lemma 2, its degree over $D$ is
  $ \[ B : B ∩ H \] . $
  For the chosen exterior component, $B = H$, so its image has degree one over $U$. A finite étale map of degree one is an isomorphism, which proves assertion (i).
  Now take any component over $V_i$ in $Y$, and choose a component above it in $T$ with stabilizer $B$. Put $N = B ∩ P$. By (4.2), $N$ is a nontrivial normal $p$-subgroup of $B$. By (4.1), $N ∩ \( B ∩ H \) = 1$. Hence $B ∩ H$ injects into $B \/ N$, and
  $ \[ B : B ∩ H \] = \| N \| thin \[ B \/ N : "im" \( B ∩ H \) \] $
  is divisible by $p$. This proves assertion (ii) for every component above every fixed disk and completes the proof. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
