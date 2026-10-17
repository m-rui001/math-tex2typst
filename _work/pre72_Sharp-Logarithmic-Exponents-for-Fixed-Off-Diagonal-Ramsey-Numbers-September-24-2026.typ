#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp Logarithmic Exponents for Fixed \
Off-Diagonal Ramsey Numbers]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <intro:section>

For integers $s \, t gt.eq 2$, the Ramsey number $r \( s \, t \)$ is the least integer $N$ such that every finite simple graph on $N$ vertices contains a clique of order $s$ or an independent set of order $t$. We study the off-diagonal regime in which $s$ is fixed and $t$ tends to infinity through the integers. All logarithms are natural.

#thm([Theorem 1.1.])[
  #emph[For every fixed integer $s gt.eq 6$ there is a constant $C_s > 0$ such that, for every $epsilon > 0$ and every sufficiently large integer $t$, 
$ frac(t^(s - 1), \( log t \)^(s - 2 + epsilon)) lt.eq r \( s \, t \) lt.eq C_s frac(t^(s - 1), \( log t \)^(s - 2)) . $

 In particular, 
$ lim_(t arrow.r oo) frac(\( s - 1 \) log t - log r \( s \, t \), log log t) = s - 2 . $

]
] <intro:main>

The theorem determines the logarithmic exponent. It does not assert that $r \( s \, t \)$ is bounded below by a positive constant times $t^(s - 1) \/ \( log t \)^(s - 2)$.

=== 1.1 Background and contribution <background-and-contribution>

Ramsey’s finite partition theorem, developed in his work on a problem of formal logic, guarantees that these numbers are finite #cite(label("Ramsey1930")) Theorem B. The classical argument of Erdős and Szekeres gives

$ r \( s \, t \) lt.eq binom(s + t - 2, s - 1) $

and hence the polynomial upper bound $O_s \( t^(s - 1) \)$ #cite(label("ErdosSzekeres1935")). Ajtai, Komlós, and Szemerédi obtained the logarithmic improvement $O_s \( t^(s - 1) \/ \( log t \)^(s - 2) \)$ #cite(label("AKS1980")). Li, Rousseau, and Zang subsequently proved the upper estimate with leading coefficient $1 + o \( 1 \)$ #cite(label("LiRousseauZang2001")). The logarithmic power $s - 2$ thus comes from the classical upper-bound side of the problem. Determining whether a lower construction attains that power requires controlling independent sets far more precisely than the polynomial exponent alone.

For $s = 3$, Kim’s lower bound established $r \( 3 \, t \) = Theta \( t^2 \/ log t \)$ #cite(label("Kim1995")). For fixed $s gt.eq 5$, Spencer’s local-lemma construction gives $r \( s \, t \) = Omega_s \( \( t \/ log t \)^(\( s + 1 \) \/ 2) \)$ #cite(label("Spencer1977")). Bohman and Keevash improved the logarithmic factor through the random $K_s$-free process, proving

$ r \( s \, t \) = Omega_s #h(-1em) (t^(\( s + 1 \) \/ 2) \( log t \)^(1 \/ \( s - 2 \) - \( s + 1 \) \/ 2)) $

#cite(label("BohmanKeevash2010")) Theorem 1.2. A different route uses finite geometry and pseudorandom graphs. Mubayi and Verstraëte showed that suitable density-optimal $K_s$-free pseudorandom graphs would yield the lower order $t^(s - 1) \/ \( log t \)^(2 s - 4)$ #cite(label("MubayiVerstraete2024")) Corollary 2; this is a conditional construction criterion. For $s = 4$, Mattheus and Verstraëte obtained the unconditional bound $Omega \( t^3 \/ \( log t \)^4 \)$ using a finite-geometric construction #cite(label("MattheusVerstraete2024")). Bradač’s projective construction then established

$ r \( s \, t \) gt.eq c_s frac(t^(s - 1), \( log t \)^(2 s - 4)) #h(2em) \( s gt.eq 3 \, med t gt.eq 2 \) $

#cite(label("Bradac2026")) Theorem 1.1, determining the polynomial exponent for every fixed $s$. The remaining difference between the powers $2 s - 4$ and $s - 2$ is the logarithmic gap addressed here.

The geometric ingredients also have an earlier history. Projective orthogonality and its spectral estimates appear in Alon and Krivelevich #cite(label("AlonKrivelevich1997")). Ordered incidence constructions of Codenotti, Pudlák, and Resta #cite(label("CodenottiPudlakResta2000")), and Kostochka, Pudlák, and Rödl #cite(label("KostochkaPudlakRodl2010")), are predecessors of the flag approach. We use the ordered incident-flag graph of Bradač’s higher-dimensional construction #cite(label("Bradac2026")) Section 2.5 and adapt its marking argument #cite(label("Bradac2026")) Claim 2.13. The distinction between a step that substantially shrinks a candidate set and a step with few possible choices also appears in the independent-set counting argument of Alon and Rödl #cite(label("AlonRodl2005")) proof of Theorem 2.1. Here it must be combined with an entropy estimate for a sequence selected from the random stream: selection need not preserve the independence or uniformity of its flags.

The companion paper #emph[The sharp logarithmic exponent of $r \( 5 \, t \)$] #cite(label("RamseyFive")) Lemma 3.4 and Theorem 4.1 develops the selected-law entropy and low-dimensional sparse-pair framework for $s = 5$. The present paper supplies all the required arguments locally. To pass to arbitrary fixed dimension, we prove a repeated-projection reduction for sparse pairs and a two-row high-rank description using a rich-subspace bound that follows from Nie and Wang’s finite-degree closure inequality #cite(label("NieWang2015")). The repeated projections and the high-rank construction require their own estimates; neither is inferred from the five-clique theorem. The low-dimensional polynomial argument adapts methods of Dvir, Guth–Katz, and Elekes–Kaplan–Sharir #cite(label("Dvir2009")) #cite(label("GuthKatz2010")) #cite(label("ElekesKaplanSharir2011")), with the positive-characteristic obstructions analyzed by Ellenberg and Hablicsek explicitly controlled #cite(label("EllenbergHablicsek2016")).

=== 1.2 The construction and its entropy obstruction <the-construction-and-its-entropy-obstruction>

The main work is the following prime-indexed construction. For a graph $G$, write $alpha \( G \)$ for its independence number.

#thm([Theorem 1.2.])[
  #emph[Fix an integer $d gt.eq 5$ and a real number $0 < eta < 1 \/ 10$. For every sufficiently large prime $q$, with $sigma = log q$, there is a graph $G$ such that 
$ \| V \( G \) \| = floor.l q^d sigma floor.r \, #h(2em) K_(d + 1) subset.eq.not G \, #h(2em) alpha \( G \) < floor.l q sigma^(1 + eta) floor.r . $

]
] <intro:prime-construction>

Here is the construction and the organization of its proof. A point of $"PG" \( d \, q \)$ is a one-dimensional vector subspace of $bb(F)_q^(d + 1)$. A dual point is a one-dimensional subspace of the dual vector space; it specifies a projective hyperplane. Write $a perp b$ when the covector $b$ vanishes on the point $a$. An incident flag is a pair $\( a \, b \)$ with $a perp b$.

Choose $N = floor.l q^d sigma floor.r$ flags independently and uniformly, and use their positions as vertices. Positions $i < j$ are adjacent when

$ a_i perp b_j quad upright("and") quad a_j ⟂̸ b_i . $

Linear independence excludes $K_(d + 1)$. An independent set, in its original order, is therefore a flag sequence satisfying

$ i < j \, quad a_i perp b_j quad arrow.r.double quad a_j perp b_i . $

We call this condition consistency. Its asymmetry records the order; reversing the order and interchanging the two endpoint spaces preserves the condition.

Suppose that every stream of flags contained a consistent sequence of length $k = floor.l q sigma^(1 + eta) floor.r$. Selecting such a sequence can heavily bias its distribution. Nevertheless, a counting argument gives every selected sequence $F$ of deterministic length $ell = Theta \( k \)$ the entropy lower bound

$ H \( F \) gt.eq d sigma ell + eta ell log sigma - O \( k \) . $

This bound survives any fixed number of restrictions to events of probability bounded below. We will contradict it by successively describing shorter sequences, still of length $Theta \( k \)$, in smaller flag domains.

The cost of the exceptional positions in the marking argument explains why these successive descriptions are needed. Bradač’s direct count records $O \( q sigma \)$ expensive flags, with $O \( sigma \)$ information per flag #cite(label("Bradac2026")) proof of Lemma 2.12. The resulting $O \( q sigma^2 \)$ allowance is too coarse for the present entropy comparison: its scale exceeds the surplus $eta ell log sigma$ when $ell = Theta \( q sigma^(1 + eta) \)$. The leading term $d sigma ell$ already allows $d sigma$ units for each retained flag. Smaller flag domains reduce the excess cost of the expensive positions beyond this allowance. At each stage we replace the old description instead of carrying its history into the new message.

The description has three main components.

===== 1.2.1 Describing a sparse pair of point sets. <describing-a-sparse-pair-of-point-sets.>

Given point sets $S \, T$ in opposite point systems of $"PG" \( j \, q \)$, where $2 lt.eq j lt.eq d$, assume that $\| S \| \| T \|$ is close on a logarithmic scale to $q^(j + 1)$, while their incidence density is much smaller than $1 \/ q$. The geometric description lemma produces a short message specifying a set that captures a fixed fraction of the smaller support and is not much larger than that support. Separate validation samples then produce small domains on both sides that retain almost all of $S$ and $T$. Sections 3 and 4 prove this statement. Repeated projection reduces dimensions $j gt.eq 4$ to dimensions two and three. In the remaining dimensions, the sampling argument uses independent Poisson batches. A moment argument controls the size of the decoded set; its geometric input is a rich-line estimate with the field characteristic kept larger than the relevant polynomial degrees.

===== 1.2.2 Finding supports to which the description applies. <finding-supports-to-which-the-description-applies.>

Consistency lets us mark all but $O \( q log q \)$ positions as belonging to explicitly known flag domains of size $O \( q^d \)$. The entropy deficit in these domains bounds the dependence between suitable representative positions and the remaining sequence. Most representative pairs therefore have almost no one-way incidence conflict. In the reciprocal classes, whose two prescribed endpoint-domain bounds have product $O \( q^(d + 1) \)$, a geometric argument turns this into sparse incidence between endpoint supports. Possible exact incidence coincidences are charged to small occupied flag rectangles. Section 5 supplies these estimates. The other classes have large endpoint ranks; Section 6 describes them directly using two independent sample rows and a polynomial bound for the union of rich subspaces.

===== 1.2.3 Iterating without retaining old information. <iterating-without-retaining-old-information.>

For reciprocal supports, arrange the representative pairs in time order and apply the geometric description along a balanced binary tree. Each successful node restricts one endpoint domain for each child. Fresh validation samples bound the loss from each restriction before any later success is imposed. An additive potential bounds the total message length. Crucially, the new decoder starts with the full projective spaces and reads only the new message: it does not need the previous context, hidden supports, or their conditional laws. Section 6 proves this one-step improvement, and Section 7 iterates it a bounded number of times. The resulting entropy upper bound is $d sigma ell + O \( k \)$, contradicting the displayed lower bound.

The tables used to select description samples are public auxiliary randomness. We bound message length, not search time. After averaging over these tables, they can be fixed before imposing the next constant-probability restriction on the stream.

Section 2 establishes the projective and information estimates used throughout. The final section also transfers Theorem 2 from prime parameters to all sufficiently large integers $t$ and proves the upper bound in Theorem 1.

== 2 Flags, incidence, and selected-tuple entropy <base:section>

Fix an integer $d gt.eq 5$ and $0 < eta < 1 \/ 10$. Throughout the construction, $q$ is a sufficiently large prime, and

#[#set math.equation(numbering: n => "(2.1)")
 $ sigma = log q \, #h(2em) N = floor.l q^d sigma floor.r \, #h(2em) k = floor.l q sigma^(1 + eta) floor.r . $ <base:stream-parameters>]

Constants may depend on $d \, eta$ and on fixed retention and budget constants, but not on $q$. In particular, the constants implicit in $ell = Theta \( k \)$ do not change with $q$. We first construct a graph that always excludes $K_(d + 1)$. The remaining task will be to exclude a consistent $k$-tuple of its flags. The entropy bound below identifies the amount of information that any selected tuple must retain, even when its selection is highly biased.

=== 2.1 Projective incidence <projective-incidence>

The following point–hyperplane calculation is the bipartite form of the projective orthogonality estimate used by Alon and Krivelevich #cite(label("AlonKrivelevich1997")); we include the weighted identity needed later.

For $j gt.eq 1$, let $V_j = bb(F)_q^(j + 1)$ and let $V_j^(*)$ be its dual vector space. The two projective spaces $"PG" \( V_j \)$ and $"PG" \( V_j^(*) \)$ consist of one-dimensional vector subspaces; both have size

$ Q_j = 1 + q + dots.h.c + q^j . $

Set $Q_0 = 1$. A point $a in "PG" \( V_j \)$ and a dual point $b in "PG" \( V_j^(*) \)$ are incident, written $a perp b$, if every covector in $b$ vanishes on $a$. Thus a dual point also represents a hyperplane in $"PG" \( V_j \)$. All dimensions of linear spans below are #emph[vector] dimensions; a vector subspace of dimension $r gt.eq 1$ has $Q_(r - 1)$ projective points. For sets in the opposite projective spaces, write $e \( S \, T \)$ for their number of incident pairs.

#thm([Lemma 2.1.])[
  (Weighted incidence estimates).  #emph[Let $j gt.eq 2$, and put $p_j = Q_(j - 1) \/ Q_j = \( 1 - Q_j^(- 1) \) \/ q$. For any real weights $w_x$ on one of the two projective spaces, 
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_y (sum_(x perp y) w_x - p_j sum_x w_x)^2 = q^(j - 1) (sum_x w_x^2 - frac(\( sum_x w_x \)^2, Q_j)) lt.eq q^(j - 1) sum_x w_x^2 . $ <base:weighted-variance>]

 In particular, for sets $S \, T$ in the opposite spaces, 
#[#set math.equation(numbering: n => "(2.3)")
 $ lr(|e \( S \, T \) - p_j \| S \| \| T \||) lt.eq q^(\( j - 1 \) \/ 2) sqrt(\| S \| \| T \|) . $ <base:mixing>]

 If $S \, T$ are nonempty and $e \( S \, T \) \/ \( \| S \| \| T \| \) = o \( 1 \/ q \)$, then $\| S \| \| T \| lt.eq C q^(j + 1)$ for all sufficiently large $q$.]
] <base:incidence>

#proof[
  Let $M$ be the point-hyperplane incidence matrix. Every point lies in $Q_(j - 1)$ hyperplanes, and two distinct points lie in $Q_(j - 2)$ hyperplanes. Hence, writing $J$ for the all-ones matrix,
  $ M M^(sans(T)) = q^(j - 1) I + Q_(j - 2) J . $
  The same identity holds with the two projective spaces interchanged. Subtract the mean of $w$ and apply this identity to obtain Equation (2.2). Applying the resulting operator norm bound to the centered indicators of $S$ and $T$ proves Equation (2.3). Finally, $p_j = \( 1 + o \( 1 \) \) \/ q$, so the sparsity assumption and Equation (2.3) give
  $ frac(\| S \| \| T \|, 2 q) lt.eq q^(\( j - 1 \) \/ 2) sqrt(\| S \| \| T \|) $
  for large $q$, proving the last assertion. ◻
]

=== 2.2 The flag graph and rectangles <the-flag-graph-and-rectangles>

We use Bradač’s ordered flag construction #cite(label("Bradac2026")) Section 2.5. A #emph[flag] in dimension $d$ is an incident pair $\( a \, b \)$ in $"PG" \( V_d \) times "PG" \( V_d^(*) \)$. There are $Q_d Q_(d - 1)$ flags. Sample an ordered stream of $N$ independent uniform flags $\( a_i \, b_i \)$, and make a graph on its positions $1 \, dots.h \, N$ by declaring, for $i < j$,

#[#set math.equation(numbering: n => "(2.4)")
 $ i j in E \( G \) quad arrow.l.r.double quad a_i perp b_j med upright(" and ") med a_j ⟂̸ b_i . $ <base:edge-rule>]

Repeated flags are allowed: graph vertices are positions, not flag values. An ordered flag tuple is called #emph[consistent] if

#[#set math.equation(numbering: n => "(2.5)")
 $ i < j \, quad a_i perp b_j quad arrow.r.double quad a_j perp b_i . $ <base:consistency>]

#thm([Lemma 2.2.])[
  (Flag graph).  #emph[Every graph defined by Equation (2.4) is $K_(d + 1)$-free. Its independent sets, in increasing position order, are exactly its consistent subtuples. Reversing a consistent tuple and interchanging its first and second endpoints preserves consistency.]
] <base:flag-graph>

#proof[
  Consider a clique with flags $\( a_1 \, b_1 \) \, dots.h \, \( a_m \, b_m \)$ in its increasing position order. For $r < m$, the covector $b_r$ annihilates $a_1 \, dots.h \, a_r$ but not $a_(r + 1)$. The first assertion follows from the earlier clique edges and the flag condition; the second follows from the edge between positions $r$ and $r + 1$. Thus $a_(r + 1)$ lies outside the vector span of its predecessors. The $m$ lines are independent, while the nonzero covector $b_m$ annihilates all of them. Its kernel has dimension $d$, so $m lt.eq d$. Negating Equation (2.4) gives Equation (2.5). Reversal and dual interchange turn that same implication into itself. ◻
]

For a vector subspace $U subset.eq V_d^(*)$, define the rectangle

$ cal(R) \( U \) = { \( a \, b \) : b subset.eq U \, med a subset.eq U^perp } . $

All pairs in this set are flags. The next estimate holds simultaneously for every rectangle, including a rectangle chosen from previously observed data.

#thm([Lemma 2.3.])[
  (Simultaneous rectangle occupancy).  #emph[There is a constant $C_d$ such that, with probability $1 - o \( 1 \)$, every $cal(R) \( U \)$ contains at most $C_d sigma$ positions of the uniform stream. The same event controls rectangles after dual interchange.]
] <base:rectangles>

#proof[
  If $dim U = r$ with $1 lt.eq r lt.eq d$, then
  $ \| cal(R) \( U \) \| = Q_(r - 1) Q_(d - r) lt.eq 4 q^(d - 1) . $
  The rectangles for $r = 0 \, d + 1$ are empty. Thus the occupancy of any fixed rectangle is binomial with mean at most $4 sigma$. There are at most $\( d + 2 \) q^(\( d + 1 \)^2)$ subspaces, by counting possible ordered bases. For $A > 4 e$, the exponential-moment bound for a binomial variable gives
  $ bb(P) { upright("occupancy") > A sigma } lt.eq \( 4 e \/ A \)^(A sigma) = q^(- A log \( A \/ \( 4 e \) \)) \, $
  with an immaterial adjustment for rounding the threshold. Choose $A$ large enough in terms of $d$ and sum over the subspaces. Under dual interchange, $cal(R) \( U \)$ becomes the rectangle defined by $U^perp$, so no further event is needed. ◻
]

=== 2.3 Entropy after arbitrary selection <entropy-after-arbitrary-selection>

For a discrete random variable $X$ with mass function $p$, write $H \( X \) = - sum_x p \( x \) log p \( x \)$, with $0 log 0 = 0$. Entropies use natural units. Conditional entropy is the average of the corresponding conditional entropies. Expanding these sums gives the chain rule and

$ I \( X \; Y \) = H \( X \) + H \( Y \) - H \( X \, Y \) = "KL" \( P_(X \, Y) bar.v.double P_X ⊗ P_Y \) \, $

where $"KL" \( P bar.v.double Q \) = sum_x P \( x \) log \( P \( x \) \/ Q \( x \) \)$ is infinite if $P$ is not absolutely continuous with respect to $Q$. These identities also apply to countable variables of finite entropy.

#thm([Lemma 2.4.])[
  (Selected-tuple entropy).  #emph[Let a random stream have law dominated by $C_0$ times the iid uniform flag-stream law, where $C_0$ is independent of $q$. From this stream, using arbitrary dependent auxiliary randomness, extract a tuple $F$ of deterministic length $ell = Theta \( k \)$. Its order may be either increasing stream order or reversed stream order with the endpoints interchanged. Then 
#[#set math.equation(numbering: n => "(2.6)")
 $ H \( F \) gt.eq d sigma ell + eta ell log sigma - O \( k \) . $ <base:entropy-lower>]

 The implicit constant may depend on $C_0$ and the fixed comparison constants in $ell = Theta \( k \)$.]
] <base:selection-entropy>

#proof[
  For any prescribed tuple $f$, the event $F = f$ implies that $f$ occurs on some increasing set of $ell$ stream positions, in one of the two allowed orientations. For each such set and orientation its iid probability is $\( Q_d Q_(d - 1) \)^(- ell)$. The stream domination and a union bound therefore give
  $ bb(P) \( F = f \) lt.eq 2 C_0 binom(N, ell) \( Q_d Q_(d - 1) \)^(- ell) . $
  This containment of events uses no assumption about the selector’s conditional distribution. Shannon entropy is at least minus the logarithm of the largest atom. Now
  $ log \( Q_d Q_(d - 1) \) = \( 2 d - 1 \) sigma + O \( 1 \/ q \) \, #h(2em) log \( e N \/ ell \) = \( d - 1 \) sigma - eta log sigma + O \( 1 \) . $
  Use $binom(N, ell) lt.eq \( e N \/ ell \)^ell$ and $ell = Theta \( k \)$ to conclude. ◻
]

The positive term $eta ell log sigma$ is the eventual contradiction: we shall successively describe a selected tuple using only $d sigma ell + O \( k \)$ entropy. Constant-probability restrictions of the stream law are compatible with Lemma 6. Indeed, if the current domination factor is $C_0$ and an event in the joint probability space has probability at least $c > 0$, then after conditioning the stream marginal is dominated by $C_0 \/ c$ times the original law. This remains true when that event also uses auxiliary randomness. A fixed number of such restrictions preserves a constant domination factor.

#thm([Lemma 2.5.])[
  (Transferring a rare event).  #emph[For two probability laws $P \, Q$ on the same finite or countable space and an event $E$, 
#[#set math.equation(numbering: n => "(2.7)")
 $ Q \( E \) lt.eq frac("KL" \( P bar.v.double Q \) + P \( E \), 1 - e^(- 1)) . $ <base:kl-event>]

]
] <base:event-transfer>

#proof[
  The assertion is immediate when the relative entropy is infinite. Otherwise Jensen’s inequality gives, for bounded $f$,
  $ "KL" \( P bar.v.double Q \) gt.eq bb(E)_P f - log bb(E)_Q e^f . $
  Apply this with $f = - 1_E$. Since $- log \( 1 - u \) gt.eq u$ for $0 lt.eq u < 1$,
  $ "KL" \( P bar.v.double Q \) gt.eq - P \( E \) - log #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - e^(- 1) \) Q \( E \) #scale(x: 120%, y: 120%)[\)] gt.eq - P \( E \) + \( 1 - e^(- 1) \) Q \( E \) \, $
  which proves the claim. ◻
]

#thm([Lemma 2.6.])[
  (Elementary sampling tails).  #emph[If $X$ is binomial or Poisson with mean $mu$, then $bb(E) e^(t X) lt.eq exp \( \( e^t - 1 \) mu \)$ for every real $t$. For each fixed $0 < delta < 1$ there is $c_delta > 0$ such that 
$ bb(P) \( \| X - mu \| gt.eq delta mu \) lt.eq 2 e^(- c_delta mu) . $

 For $h gt.eq e mu > 0$, 
$ bb(P) \( X gt.eq h \) lt.eq \( e mu \/ h \)^h . $

 When $mu = 0$, the variable is zero almost surely.]
] <base:tails>

#proof[
  For a Bernoulli variable of mean $p$, its exponential moment is $1 + p \( e^t - 1 \) lt.eq e^(p \( e^t - 1 \))$; multiply over independent trials. For a Poisson variable the moment formula is an equality, by summing its series. Exponential Markov with $t = log \( 1 + delta \)$ or $t = log \( 1 - delta \)$ gives the two proportional tails. For the final bound use $t = log \( h \/ mu \)$ and discard the factor $e^(- mu)$. ◻
]

=== 2.4 The scales of a description <the-scales-of-a-description>

The geometric descriptions and the compression stages use the following common scales. Their input is a deterministic number $D$ measuring the current description budget; the precise budget interpretation will be given when a compression stage is defined. At present we need only its allowed interval. Set

#[#set math.equation(numbering: n => "(2.8)")
 $ beta = eta \/ 10^7 \, #h(2em) sigma^beta lt.eq D lt.eq sigma^(1 - eta \/ 2) \,\
K = D sigma^(3 beta) \, #h(2em) K_(*) = D sigma^(6 beta) \, #h(2em) L = D sigma^(8 beta) \, #h(2em) P = L R \,\
sigma^beta lt.eq R lt.eq 2 sigma^beta + 2 \, #h(2em) R upright(" an even integer chosen deterministically") . $ <base:parameters>]

The choice $R = 2 ceil.l sigma^beta \/ 2 ceil.r$ is one possibility.

#thm([Lemma 2.7.])[
  (Separation of scales).  #emph[Uniformly over the interval for $D$ in Equation (2.8), 
$ K_(*) = o \( L \) \, #h(2em) L = o \( P \) \, #h(2em) P = o \( sigma \) \, #h(2em) R log L + log sigma = o \( P \) . $

 Moreover, for sufficiently large $q$, $D sigma^(9 beta) lt.eq P lt.eq 4 D sigma^(9 beta)$.]
] <base:scale-comparisons>

#proof[
  The last bounds follow from the interval for $R$. Also $K_(*) \/ L = sigma^(- 2 beta)$ and $L \/ P = 1 \/ R lt.eq sigma^(- beta)$. Since $9 beta < eta \/ 2$,
  $ P lt.eq 4 sigma^(1 - eta \/ 2 + 9 beta) = o \( sigma \) . $
  Finally $L gt.eq sigma^(9 beta)$, $P gt.eq sigma^(10 beta)$, and $log L = O \( log sigma \)$, so
  $ frac(R log L, P) = frac(log L, L) = o \( 1 \) \, #h(2em) frac(log sigma, P) = o \( 1 \) . $
  ◻
]

== 3 Describing sparse pairs: validation and geometry <geom:section>

We now describe one side of a pair having unusually few incidences. The decoder knows domains containing the two supports, but not the supports themselves. The description will give a moderately enlarged set capturing a fixed fraction of the smaller support. A separate validation step turns this into almost complete capture on both sides. Dimensions at least four are reduced by projection; the remaining geometric input concerns lines and planes in projective dimension three. Section 4 supplies the sampling argument that completes the low-dimensional case.

Throughout this section, the parameters are those in (2.8); in particular, $q$ is prime and $P = o \( sigma \)$, where $sigma = log q$. All constants are uniform in the allowed parameters and may depend on the fixed dimension bound, on $eta$, and on fixed constants in the hypotheses. The estimates are for sufficiently large $q$. The reductions below change such constants only a bounded number of times. This is harmless: $log sigma = o \( K_(*) \)$, so adding $O \( log sigma \)$ to a deficiency bounded by a fixed multiple of $K_(*)$ still gives a bound of the same form.

=== 3.1 The description and its validation <the-description-and-its-validation>

We use independent public random tables, each addressed separately. Given a decoder-known finite set, a table provides independent rows of uniform samples from that set. The encoder may test a row against hidden supports and transmit the index of its first accepted row, up to a deterministic cutoff. The decoder reconstructs the row from its index, without knowing the acceptance predicate. Integers $m gt.eq 0$ are encoded with $O \( 1 + log \( m + 1 \) \)$ bits. Support sizes, row lengths, orientations, and mode choices are sent explicitly when needed. Every invocation below uses tables independent of all data making that invocation ready.

#thm([Lemma 3.1.])[
  (Sparse-pair description).  #emph[Let $2 lt.eq j lt.eq d$. Let $S \, T$ be nonempty sets in opposite point systems of $"PG" \( j \, q \)$, contained in decoder-known sets $U_S \, U_T$. Suppose, for a fixed constant $C_b$, that 
#[#set math.equation(numbering: n => "(3.1)")
 $ \| S \| \| T \| gt.eq q^(j + 1) e^(- b) \, #h(2em) frac(e \( S \, T \), \| S \| \| T \|) lt.eq tau / q \, #h(2em) 0 lt.eq b lt.eq C_b K_(*) \, quad 0 < tau lt.eq C_b sigma^(- 100 beta) . $ <geom:sparse-hypotheses>]

 Write 
$ d_S = log frac(\| U_S \|, \| S \|) \, #h(2em) d_T = log frac(\| U_T \|, \| T \|) \, $

 and orient the systems so that $n = \| S \| lt.eq \| T \|$. There is a public-table description, of length at most 
$ C q P \( d_S + d_T + P \) \, $

 which, except with probability $C e^(- c q)$, produces a decoder-known set $W subset.eq U_S$ satisfying 
#[#set math.equation(numbering: n => "(3.2)")
 $ \| W \| lt.eq n e^(C P) \, #h(2em) \| W ∩ S \| gt.eq c n . $ <geom:description-output>]

 The probability bound holds conditional on any earlier data independent of the tables used by this invocation.]
] <geom:description>

The proof is organized as dimension induction. We first prove validation without assuming this lemma, then establish the induction step and the geometric preparation in dimensions two and three. The final sampling step is Proposition 18; the induction is closed explicitly at the end of Section 4.

The sparse-incidence consequence of Lemma 3 gives

#[#set math.equation(numbering: n => "(3.3)")
 $ \| S \| \| T \| lt.eq C q^(j + 1) \, #h(2em) n lt.eq C q^(\( j + 1 \) \/ 2) \, #h(2em) n gt.eq c q e^(- b) = q^(1 - o \( 1 \)) . $ <geom:product-upper>]

The last inequality uses $\| T \| lt.eq Q_j lt.eq C q^j$. These bounds will be used even when the product lower bound is weak by a factor $e^b$. Figure 1 separates the initial description from the two fresh validation steps.

#thm([Lemma 3.2.])[
  (Fresh validation).  #emph[Under (3.1), suppose a decoder-known $W subset.eq U_S$ satisfies (3.2). Further independent tables and a message of length $C q P \( d_S + d_T + 1 \)$ produce caps $U'_T subset.eq U_T$ and $U'_S subset.eq U_S$, with additional failure probability $C e^(- c q)$, such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ \| U'_T \| & lt.eq frac(C q^(j + 1), \| S \|) \, & \| U'_S \| & lt.eq frac(C q^(j + 1), \| T \|) \,\
\| U'_T ∩ T \| & gt.eq .99 \| T \| \, & \| U'_S ∩ S \| & gt.eq .99 \| S \| . $ <geom:validation-output>]

 Each cap is its input domain intersected with an ambient test: a candidate passes if it is incident with fewer than $h \/ \( 5 q \)$ entries of the transmitted row of length $h$ in the opposite system.]
] <geom:validation>

#proof[
  Put $X = W ∩ S$, so $\| X \| gt.eq c \| S \|$, and first consider an ideal row of $h = ceil.l C_0 q \( d_T + 1 \) ceil.r$ independent uniform points of $X$. For an opposite point $y$, write $p_X \( y \) = \| X ∩ N \( y \) \| \/ \| X \|$, where $N \( y \)$ is its incident neighborhood. The variance identity in Lemma 3 yields
  $ sum_y #scale(x: 120%, y: 120%)[\(] p_X \( y \) - p_j #scale(x: 120%, y: 120%)[\)]^2 lt.eq frac(q^(j - 1), \| X \|) \, #h(2em) p_j = Q_(j - 1) / Q_j . $
  Since $q p_j = 1 - Q_j^(- 1)$, there are at most $C q^(j + 1) \/ \| X \| lt.eq C q^(j + 1) \/ \| S \|$ ambient points with $p_X \( y \) < 1 \/ \( 2 q \)$. Every other point passes the row test with probability at most $e^(- c_0 h \/ q)$, by a lower binomial tail. The expected number of such passing points in $U_T$ is at most
  $ \| U_T \| e^(- c_0 h \/ q) = \| T \| e^(d_T - c_0 h \/ q) . $
  Choosing $C_0$ large and then the cap-size constant large makes the probability of violating the first size bound less than $.04$, by Markov’s inequality and $\| T \| lt.eq C q^(j + 1) \/ \| S \|$.
  For capture, if $H_y$ denotes the row’s hit count at $y$, then
  #[#set math.equation(numbering: n => "(3.5)")
   $ bb(P) { H_y gt.eq h \/ \( 5 q \) } lt.eq 5 q p_X \( y \) . $ <geom:pointwise-iid>]
  Averaging over $y in T$ gives expected excluded fraction at most
  $ frac(5 q e \( X \, T \), \| X \| \| T \|) lt.eq C tau . $
  Thus the probability of losing more than $.01 \| T \|$ is $O \( tau \) = o \( 1 \)$. For large $q$, both desired properties hold for an ideal row with probability at least $.9$.
  To implement the ideal experiment, propose independent rows from the known set $W$. Accept only rows whose entries all lie in $X$ and whose ambient test has the two properties just proved. Conditional on all entries lying in $X$, a proposal has exactly the ideal law. Moreover,
  $ frac(\| W \|, \| X \|) lt.eq e^(C_1 P) . $
  A proposal is therefore accepted with probability at least $.9 e^(- C_1 h P)$. Search at most $ceil.l e^(C_2 h P) ceil.r$ rows, with $C_2 > C_1$ sufficiently large. The failure probability is at most $e^(- c q)$, and the index costs $O \( h P \) = O \( q P \( d_T + 1 \) \)$ bits. The decoder intersects the resulting ambient test with $U_T$, obtaining $U'_T$.
  For the second test, the hidden source is $X_T = U'_T ∩ T$ and its proposal domain is $U'_T$. At readiness, the first successful test gives
  $ frac(\| U'_T \|, \| X_T \|) lt.eq frac(C q^(j + 1), \| S \| \| T \|) lt.eq C e^b lt.eq e^(C P) . $
  Repeat the argument with $h = ceil.l C_0 q \( d_S + 1 \) ceil.r$ and a fresh table. The tested domain on the other side is the original $U_S$, not $W$. Conditional on the first cap, its source is fixed, has at least $.99 \| T \|$ points, and satisfies $e \( S \, X_T \) \/ \( \| S \| \| X_T \| \) lt.eq tau \/ \( .99 q \)$. Thus the same ideal-row acceptance bound holds uniformly over every successful first cap. Consequently this second test captures $.99$ of the original $S$. The two costs and failure bounds give the conclusion; all finite diagnostics cost $O \( sigma \)$ and fit within the stated budget. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.473cm, inset: 0.2117cm, stroke: (paint: rgb("#737373"), thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Description#linebreak() Input domains $U_S,U_T$#linebreak() Output $W subset.eq U_S$#linebreak()$|W| lt.eq |S|e^(C P)$#linebreak()$|W inter S| gt.eq c|S|$]]])])
  content((5.473, 0), [#box(width: 4.473cm, inset: 0.2117cm, stroke: (paint: rgb("#737373"), thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[First validation#linebreak() Selected row in $W inter S$#linebreak() Test candidates in $U_T$#linebreak()Output $U_T' subset.eq U_T$#linebreak()$|U_T' inter T| gt.eq .99|T|$]]])])
  content((10.95, 0), [#box(width: 4.473cm, inset: 0.2117cm, stroke: (paint: rgb("#737373"), thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Second validation#linebreak() Selected row in $U_T' inter T$#linebreak() Test candidates in $U_S$#linebreak()Output $U_S' subset.eq U_S$#linebreak()$|U_S' inter S| gt.eq .99|S|$]]])])
  line((2.237, 0), (3.237, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.71, 0), (8.71, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The description gives a first approximation; two separately addressed validation tables give near-complete capture on both sides. The second validation tests the original domain $U_S$, not $W$. For either validation row, the constant-density comparison with iid sampling holds at readiness and conditional on that row being produced, not conditional on later success. No such comparison is asserted for the description’s accepted row. ],
) <geom:validation-figure>

#thm([Lemma 3.3.])[
  (The law of a produced test).  #emph[Consider either test in Lemma 11, conditional on all data making that test ready, but not on any later event. Suppose its hidden source $X_0$ is a subset of an original support $X$ with $\| X_0 \| gt.eq c \| X \|$. For every fixed opposite point $y$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ bb(P) { upright("the test is produced and its ambient test excludes ") y } lt.eq C q frac(\| X ∩ N \( y \) \|, \| X \|) . $ <geom:exclusion-bound>]

 Conditional on production, the row law is dominated by a constant times the independent uniform row law on $X_0$. The bound (3.6) may be averaged over earlier readiness data whenever its right-hand side is fixed.]
] <geom:produced-test>

#proof[
  Let $nu$ be one proposal’s law and $A$ its acceptance event. For independent proposals and any deterministic cutoff $m$, the first accepted row, conditional on there being one among the first $m$, has law $nu \( thin dot.op divides A \)$. Indeed, the contribution of acceptance at index $i$ is $\( 1 - nu \( A \) \)^(i - 1) nu \( A \)$ times that same conditional law. Given that all entries lie in $X_0$, the proposal is an independent uniform row on $X_0$, and the further acceptance probability is at least $.9$. The claimed domination follows. Apply (3.5) and use
  $ frac(\| X_0 ∩ N \( y \) \|, \| X_0 \|) lt.eq c^(- 1) frac(\| X ∩ N \( y \) \|, \| X \|) . $
  Multiplication by the probability of production can only decrease the bound. No later success, including production of the other validation test, has been conditioned on. ◻
]

=== 3.2 Reduction from higher projective dimensions <reduction-from-higher-projective-dimensions>

#thm([Proposition 3.4.])[
  (Repeated projection).  #emph[For $j gt.eq 4$, assume Lemma 10 in projective dimension $j - 1$, for every fixed value of its hypothesis constant. Then the lemma holds in dimension $j$.]
] <geom:projection>

#proof[
  For a point $z$ represented by a vector line $chevron.l z chevron.r$, the quotient vector space has dimension $j$ and hence projectivization $"PG" \( j - 1 \, q \)$. Projection maps a point different from $z$ to its image in this quotient; its fibers are the $q$ noncentral points of lines through $z$. The dual operation retains hyperplanes containing $z$, identified with hyperplanes of the quotient. Write $S_0 \, T_0$ for the projected $S \\ { z }$ and the cut $T ∩ z^perp$. Apply the same operations to the decoder domains.
  Lifting a quotient cap can enlarge it by a factor $q$, the size of a projection fiber. We remove that enlargement by intersecting caps from eight projections, always using the original $S \, T$. At a given call let $A subset.eq U_S$ be the intersection of all caps lifted so far, initially $A = U_S$. The next center will preserve almost all of $S$ and limit collisions among the points of this current set $A$; the latter property makes successive intersections contract. There exists a center, chosen before that call’s fresh tables, satisfying
  #[#set math.equation(numbering: n => "(3.7)")
   $ \| T_0 \| & asymp \| T \| \/ q \, & \| U_T ∩ z^perp \| & lt.eq C \| U_T \| \/ q \,\
\| S_0 \| & gt.eq \( 1 - o \( 1 \) \) n \, & e \( S_0 \, T_0 \) & lt.eq C tau \| S_0 \| \| T_0 \| \/ q \,\
"coll"_z \( A \) & lt.eq C \| A \|^2 \/ q^(j - 1) . &  & $ <geom:center-properties>]
  Here $"coll"_z \( A \)$ counts unordered distinct pairs of $A \\ { z }$ with the same projection.
  To prove existence, choose $z$ uniformly in the ambient point space. The variance identity gives
  $ bb(P) {lr(|\| T ∩ z^perp \| - p_j \| T \||) > frac(\| T \|, 3 q)} lt.eq C q \/ \| T \| = o \( 1 \) . $
  Here $\| T \| gt.eq q^(\( j + 1 \) \/ 2) e^(- b \/ 2) gt.double q$, and replacing the constant $1 \/ 3$ by any other fixed positive constant is harmless. Markov’s inequality gives the stated cut-domain bound with arbitrarily high fixed probability. A distinct pair projects together only if $z$ lies on its joining line, an event of probability at most $\( q + 1 \) \/ Q_j = O \( q^(1 - j) \)$. Thus
  $ bb(E) "coll"_z \( A \) lt.eq C \| A \|^2 \/ q^(j - 1) \, #h(2em) frac(bb(E) "coll"_z \( S \), n) lt.eq C q^(\( 3 - j \) \/ 2) = o \( 1 \) . $
  The latter implies projection loss $o \( n \)$ with probability $1 - o \( 1 \)$: each nonempty fiber loses at most its number of unordered pairs, and omitting $z$ loses at most one more point. Finally, an original incidence survives the dual cut with probability $p_j lt.eq C \/ q$. Its expected count before collapsing fibers is at most $C tau n \| T \| \/ q^2$, and collapsing cannot increase it. A union bound, using large fixed constants in the three Markov bounds, proves (3.7). This reasoning is valid for every realized current $A$: fix that set and all earlier data, then combine the two events of probability $1 - o \( 1 \)$ with the three Markov bounds. Their constants can be chosen so that the simultaneous event has positive probability. Choose a center in that event before exposing any of the fresh tables used by this call.
  Transmit $z$ in $O \( sigma \)$ bits and use a fixed coordinate convention on the quotient. The new product is at least $q^j e^(- b - O \( 1 \))$ and the density at most $C tau \/ q$. The projected $S$ domain has size at most $\| U_S \|$, whereas $\| S_0 \| = \( 1 - o \( 1 \) \) n$; on the other side both domain and support shrink by comparable factors $q$. Hence both logarithmic gaps increase by $O \( 1 \)$. These are the induction hypotheses, with changed fixed constants. Reorient if necessary, apply induction, and then Lemma 11, which returns caps on both quotient sides. In particular, the projected $S$ cap captures $.99 \| S_0 \|$ and has size at most
  $ frac(C q^j, \| T_0 \|) lt.eq frac(C q^(j + 1), \| T \|) lt.eq m_0 := n e^(C_3 P) . $
  Lift this cap, excluding $z$, and intersect it with $A$. The original support loss is at most $.01 n$, plus the $o \( n \)$ total fiber excess, plus one possible center: among the lost images there are at most $.01 \| S_0 \|$ first preimages, and all additional preimages are charged to $n - \| S_0 \| - bold(1)_({ z in S }) = o \( n \)$. This bound concerns the original $S$, not merely the points retained by earlier calls. Thus each call loses fewer than $.02 n$ of its original points, and losses from intersecting the lifted caps add.
  The first call gives $\| A_1 \| lt.eq q m_0$. For any later call let $k_i$ be the retained nonzero fiber sizes; there are at most $m_0$ of them. Cauchy–Schwarz and (3.7) give
  $ \| A_(upright("new")) \| & lt.eq m_0 + sum_i \( k_i - 1 \) lt.eq m_0 + sqrt(m_0 sum_i k_i \( k_i - 1 \))\
 & lt.eq m_0 + C \| A \| sqrt(m_0 \/ q^(j - 1)) . $
  By (3.3), the last coefficient is
  $ rho lt.eq e^(C_4 P) q^(\( 3 - j \) \/ 4) lt.eq q^(- 1 \/ 4 + o \( 1 \)) . $
  After seven further calls, $\| A_8 \| lt.eq m_0 \( 1 + rho + dots.h.c + rho^6 \) + q m_0 rho^7 = O \( m_0 \)$, while more than half of the original $S$ remains. Eight calls multiply the cost and failure bounds by fixed constants. The center at each stage depends only on data available before its fresh tables, so all conditional failure bounds apply. The set $W = A_8$ proves the result. ◻
]

=== 3.3 Preparing dimensions two and three <preparing-dimensions-two-and-three>

The remaining analysis will use a retained support $S'$ and, in one case, an ordered list of planes. The list isolates planar concentrations; for a query point we remove the training cell in its first containing plane before measuring overlaps.

#thm([Proposition 3.5.])[
  (Low-dimensional preparation).  #emph[Suppose (3.1) holds with $j in { 2 \, 3 }$ and $n = \| S \| lt.eq \| T \|$. Either enumeration already proves Lemma 10, or the following preparation costs $O \( q + sigma \)$ bits. In dimension three there is also a possible reduction to the dimension-two description lemma, with the same final cost, size, capture, and failure bounds as Lemma 10.]
  #emph[In the case not resolved by enumeration or that reduction, we have $n > 100 q P$, a retained set $S' subset.eq S$ of size $n' in \[ n \/ 2 \, n \]$, and either an empty list or an ordered plane list $Pi_1 \, dots.h \, Pi_J$ in $"PG" \( 3 \, q \)$. In the latter case the sets 
#[#set math.equation(numbering: n => "(3.8)")
 $ C_i = \( S ∩ Pi_i \) \\ union.big_(h < i) Pi_h quad \( 1 lt.eq i lt.eq J \) $ <geom:cells>]

 partition $S'$, have nonincreasing sizes, and satisfy $\| C_i \| < .04 n'$. The decoder knows the list and all cell sizes, but need not know $S'$ or the cells themselves.]
  #emph[Write 
#[#set math.equation(numbering: n => "(3.9)")
 $ n = q^(1 + v) \, quad g = \( v - 1 \/ 2 \) sigma \, quad chi = P \/ 100 \, quad chi_0 = P \/ 10000 \, quad B = q^j \/ n' . $ <geom:lowdim-parameters>]

 For every ambient query point $x$, define $O_x$ to be the cell $C_i$ of its earliest containing listed plane, and $O_x = diameter$ if there is none. Define 
#[#set math.equation(numbering: n => "(3.10)")
 $ f_x = \| O_x \| \/ n' lt.eq .04 \, #h(2em) X_x = S' \\ \( O_x union { x } \) . $ <geom:outside-support>]

 If no list is present, $O_x = diameter$ for all $x$. When $j = 3$ and $g > chi_0$, the preparation additionally ensures either]
  + #emph[every plane meets $S'$ in fewer than $K_p = n^(4 \/ 3) q^(- 1) e^(- g \/ 5)$ points and the list is empty; or]
  + #emph[the list is present and $J lt.eq n \/ K_p = q^(1 \/ 2) e^(- 2 g \/ 15)$.]
] <geom:preparation>

#proof[
  If $n lt.eq 100 q P$, transmit $n$ and the index of $S$ among the $n$-subsets of $U_S$. The cost is at most
  $ O \( sigma \) + log_2 binom(\| U_S \|, n) lt.eq C #scale(x: 120%, y: 120%)[\(] sigma + n \( d_S + 1 \) #scale(x: 120%, y: 120%)[\)] \, $
  which is within the description budget. It gives $W = S$ without failure. Assume henceforth $n > 100 q P$, so $v > 0$.
  When $j = 3$ and $g > chi_0$, greedily choose a plane richest in the remaining points of $S$, provided it contains at least $K_p$ of them, and remove those points. Stop as soon as at least $n \/ 2$ points have been removed or no qualifying plane remains. In the first case retain the captured prefix, with its list and cells; in the second retain the residual without a list. Otherwise retain all of $S$ without a list. The asserted size and cap properties follow directly from the stopping rule. Greedy maximality makes the removed cell sizes nonincreasing. Since each removal has size at least $K_p$, the list has length at most $n \/ K_p = q^(1 \/ 2) e^(- 2 g \/ 15) lt.eq q^(1 \/ 2)$. Plane identifiers and cell sizes each cost $O \( sigma \)$ bits, so the list costs $O \( q \)$.
  Suppose now that a retained list has a cell of size at least $.04 n'$, and let $Pi$ be its containing plane. Then $S_1 = S ∩ Pi$ has size at least $.02 n$. The original sparsity and Markov’s inequality imply that at least half of $T$ consists of hyperplanes having incidence proportion at most $C tau \/ q$ into $S_1$. For large $q$ this is less than one, so their restrictions to $Pi$ are nonzero projective covectors. Each nonzero projective restriction has exactly $q$ projective lifts: normalize its restriction to a fixed representative and choose the coefficient on a complement of the vector space underlying $Pi$.
  Group the retained lifts by their restriction multiplicities. One dyadic class $\[ h \, 2 h \)$, with $1 lt.eq h lt.eq q$, carries at least $c \| T \| \/ sigma$ lifts. If $T_1$ is its set of distinct restrictions, then
  $ \| T_1 \| gt.eq c \| T \| \/ \( h sigma \) \, #h(2em) \| S_1 \| \| T_1 \| gt.eq q^3 e^(- b - O \( log sigma \)) . $
  Every member of $T_1$ has incidence proportion at most $C tau \/ q$ into $S_1$, since all its lifts have identical incidences there. Transmit $Pi$ and $h$. Use decoder domains $U_S ∩ Pi$ and the nonzero restrictions having at least $h$ lifts in $U_T$. The latter has size at most $\| U_T \| \/ h$, so its logarithmic gap increases by $O \( log sigma \)$; the former gap increases by $O \( 1 \)$.
  Apply the dimension-two description, with reorientation if needed, and then Lemma 11. The resulting cap on $S_1$ has size at most
  $ frac(C q^3, \| T_1 \|) lt.eq frac(C q^4 sigma, \| T \|) lt.eq C n sigma e^b lt.eq n e^(C P) $
  and captures $.99 \| S_1 \| gt.eq c n$ points of $S$. Its cost is within the required budget because $log sigma = o \( P \)$; its failure probability has the required order. This deals with every large cell. All other cases have the stated small-cell preparation. Notice that $O_x$ is a subset of the training support: even when $x in.not S'$, the earliest containing plane still specifies the same whole cell. ◻
]

=== 3.4 A polynomial bound for rich lines <a-polynomial-bound-for-rich-lines>

We give the needed algebraic estimate with its richness and characteristic hypotheses explicit. It is used only when the line richness substantially exceeds the cubic-root scale and planar concentration cannot account for many rich lines. The interpolation and tangent-plane method has antecedents in #cite(label("GuthKatz2010")) #cite(label("ElekesKaplanSharir2011")). Positive-characteristic obstructions are discussed in #cite(label("EllenbergHablicsek2016")); here the argument keeps every relevant surface degree below the characteristic.

#thm([Lemma 3.6.])[
  (Rich lines with a plane cap).  #emph[Let $q$ run through sufficiently large primes. Let $cal(S)$ be at most $n lt.eq C q^2$ points of $"PG" \( 3 \, q \)$, with at most $K_p$ points in every projective plane. Let $M > 0$ satisfy 
#[#set math.equation(numbering: n => "(3.11)")
 $ M^3 / n arrow.r oo \, #h(2em) M^2 / K_p arrow.r oo \, #h(2em) c q lt.eq n / M lt.eq C q^(41 \/ 40) . $ <geom:rich-regime>]

 Then at most $C n \/ M$ projective lines contain at least $M$ points of $cal(S)$. The constant is uniform once the displayed limits hold uniformly in the family under consideration.]
] <geom:rich-lines>

#proof[
  Work over the algebraic closure $bb(K)$ of $bb(F)_q$. Choose an affine chart containing all points of $cal(S)$, which is possible because $bb(K)$ is infinite. The plane cap remains valid for planes over $bb(K)$: rational points on such a plane have rational vector-span dimension at most three. Otherwise four linearly independent rational representatives would remain independent over $bb(K)$. The points therefore lie in an $bb(F)_q$-plane and obey the same cap.
  Independently sample each point with probability $A sqrt(n \/ M^3) = o \( 1 \)$, where $A$ is a sufficiently large fixed constant. The expected sample count on any $M$-rich line is at least $A sqrt(n \/ M) gt.eq c A sqrt(q)$. There are at most $n^2$ lines to test, since $M arrow.r oo$ and two distinct points determine a line. Binomial tails and a union bound show that, simultaneously with positive probability, every rich line contains more than $\( A \/ 2 \) sqrt(n \/ M)$ sampled points, and the total sample has size at most $2 A \( n \/ M \)^(3 \/ 2)$. The latter assertion follows from an upper binomial tail, or from stochastic domination if $\| cal(S) \| < n$.
  There are $binom(D + 3, 3)$ monomials of degree at most $D$ in three variables. Solving the homogeneous linear system requiring vanishing at the sample therefore gives a nonzero polynomial of degree at most $C A^(1 \/ 3) sqrt(n \/ M)$. Choose $A$ large enough that this degree is smaller than the guaranteed number of sampled points on each rich line. Restriction to a line is a univariate polynomial, so it vanishes identically there. Replace the polynomial by its squarefree part. Its degree $D_0$ satisfies
  #[#set math.equation(numbering: n => "(3.12)")
   $ D_0 = O \( sqrt(n \/ M) \) = o \( M \) \, #h(2em) D_0 lt.eq C q^(41 \/ 80) < q . $ <geom:interpolating-degree>]
  We now count three groups of rich lines. Plane factors are controlled by the plane cap. Among the other lines, those with few points incident to three lines are controlled by the total point count. The remaining lines will lie in the common zero set of the nonplane surface and an auxiliary polynomial coprime to it, whose degrees bound their number.
  First count rich lines lying in plane factors. There are at most $binom(D_0, 2)$ lines lying in two distinct such planes. For one plane let $u$ be the number of remaining rich lines it contains. Select $M' = floor.l M floor.r$ points of $cal(S)$ on each. If $r_a$ is the number of selected occurrences at point $a$, then
  $ sum_a r_a = u M' \, #h(2em) sum_a r_a^2 lt.eq u M' + u \( u - 1 \) . $
  The second inequality uses the fact that two distinct lines meet in at most one point. Cauchy–Schwarz and the plane cap give
  $ \( u M' \)^2 lt.eq K_p #scale(x: 120%, y: 120%)[\(] u M' + u \( u - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  For $u > 0$ this implies $u lt.eq K_p M' \/ \( \( M' \)^2 - K_p \) = o \( M' \)$. Remove from each selected line its intersections with all other plane factors, losing at most $D_0$ points. The remaining union in this plane has size at least
  $ u \( M' - D_0 \) - binom(u, 2) gt.eq u M' \/ 2 . $
  Such unions for different planes are disjoint. Thus the plane factors account for $O \( n \/ M + D_0^2 \) = O \( n \/ M \)$ rich lines.
  Let $F_0$ be the squarefree product of the nonplane irreducible factors. Every as yet uncounted rich line lies on $F_0$: the coordinate ring of a line is an integral domain, so vanishing of a product on the line implies vanishing of one factor. If there are no such factors we are done. For coordinate vectors $e_1 \, e_2 \, e_3$, form
  #[#set math.equation(numbering: n => "(3.13)")
   $ Q_(i j) = \( e_i times nabla F_0 \)^(sans(T)) "Hess" \( F_0 \) \( e_j times nabla F_0 \) \, #h(2em) 1 lt.eq i \, j lt.eq 3 . $ <geom:flatness-polynomials>]
  At a point on at least three of the remaining lines, all $Q_(i j)$ vanish. At a singular point this follows from the gradient factors. At a nonsingular point, the three distinct line directions lie in the two-dimensional tangent vector space. Restricting $F_0$ to each line shows that its Hessian quadratic form vanishes on each direction. A binary quadratic vanishing on three distinct projective directions is zero; since the characteristic is odd, its associated bilinear form is also zero. The vectors $e_i times nabla F_0$ span that tangent space, proving the assertion.
  Among incidences with points of $cal(S)$, points on at most two remaining lines account for at most $2 n$ incidences. Hence all but $O \( n \/ M \)$ remaining rich lines have at least $M \/ 2$ points incident with three or more remaining lines. Since $deg Q_(i j) < 3 D_0 = o \( M \)$, every such line lies on every $Q_(i j)$.
  To obtain a polynomial coprime to $F_0$, we must show that the $Q_(i j)$ do not all vanish identically on any of its irreducible components. The reason is local: their vanishing makes all second derivatives of a smooth formal graph zero, while the degree bound below the prime characteristic forces a plane factor.
  We claim that no irreducible factor $F$ of $F_0$ divides all these polynomials. Its degree is less than the prime characteristic $q$, so a nonconstant $F$ has a nonzero partial derivative. Rename its variable $z$, and write the other variables as $x_1 \, x_2$. By squarefreeness, $F$ and $\( F_0 \)_z$ are coprime in $bb(K) \( x_1 \, x_2 \) \[ z \]$. Indeed, modulo $F$ the derivative is $F_z \( F_0 \/ F \)$, and neither factor is divisible by $F$. Clearing a univariate Bezout identity gives
  $ A F + B \( F_0 \)_z = a \( x_1 \, x_2 \) eq.not 0 $
  with polynomial coefficients. Choose $x_1 \, x_2$ so that $a$ and the leading coefficient of $F$ in $z$ are nonzero. A root in $z$ then gives a point on $F$ where $\( F_0 \)_z eq.not 0$.
  Translate this point to the origin. The invertible coefficient of $z$ in $F_0$ determines, recursively by total degree, a unique formal series $z = h \( x_1 \, x_2 \)$ with $F_0 \( x_1 \, x_2 \, h \) = 0$. The other factors are units on this branch. If $F$ divided every $Q_(i j)$, those polynomials would vanish after this substitution. To see the tangent space statement over the formal series ring explicitly, write $g = nabla F_0 \( x_1 \, x_2 \, h \)$. Its third coordinate $g_3$ is a unit, and the kernel of the row vector $g$ has basis
  $ t_1 = \( 1 \, 0 \, - g_1 \/ g_3 \) \, #h(2em) t_2 = \( 0 \, 1 \, - g_2 \/ g_3 \) . $
  Moreover $e_2 times g = g_3 t_1$ and $e_1 times g = - g_3 t_2$. The vanishing $Q_(i j)$ therefore makes the Hessian bilinear form zero on this entire formal tangent module. Twice differentiating $F_0 \( x_1 \, x_2 \, h \) = 0$ gives
  $ \( F_0 \)_z h_(a b) = 0 quad \( a \, b in { 1 \, 2 } \) \, $
  so all second partial derivatives of $h$ vanish. For a monomial $x_1^u x_2^v$ of total degree less than $q$, these conditions require
  $ u \( u - 1 \) = u v = v \( v - 1 \) = 0 med \( mod med q \) . $
  Only the constant and linear monomials satisfy these conditions. Writing $h_1$ for the affine-linear part, we obtain $h - h_1 in \( x_1 \, x_2 \)^q$. Thus the polynomial $F_0 \( x_1 \, x_2 \, h_1 \)$ vanishes to order at least $q$. Its degree is less than $q$, so it is identically zero. The plane $z = h_1$ would be a factor of $F_0$, a contradiction. This proves the claim.
  Because $bb(K)$ is infinite, a constant linear combination $Q$ of the $Q_(i j)$ can be chosen coprime to $F_0$: for each of its finitely many irreducible factors, combinations divisible by that factor form a proper linear subspace of the coefficient space. We finish by justifying the elementary common-line bound used here.
  If coprime polynomials in three variables have degrees $D_1 \, D_2$, they contain at most $2 D_1 D_2$ common lines. To see this, take any finite collection of such lines and choose coordinates $\( t \, u \, v \)$ with $t$ nonconstant on each. Over the fraction fields in the other two variables, univariate coprimality gives cleared identities
  $ A F + B G = a \( t \, u \) eq.not 0 \, #h(2em) C F + D G = b \( t \, v \) eq.not 0 . $
  For a generic $c in bb(K)$, both right-hand sides remain nonzero polynomials after $t = c$. Any common factor of the sliced polynomials would divide both a polynomial in $u$ alone and one in $v$ alone, and hence would be constant. Choose the slice also to meet the selected lines in distinct points; only finitely many values are forbidden by pairwise intersections of lines. Choose coordinates on this slice so that these points have distinct first coordinates. The resultant eliminating the second coordinate is nonzero by coprimality and has degree at most $2 D_1 D_2$ in the first coordinate. Indeed its Sylvester determinant has at most $D_2$ columns with coefficients of degree at most $D_1$, and at most $D_1$ columns with coefficients of degree at most $D_2$. It vanishes at each of the distinct first coordinates, bounding the collection. If both sliced polynomials omit the second coordinate, their univariate coprimality gives no common point. If just one omits it, say it is $f \( u \)$ and the other has degree $m > 0$ in the second coordinate, the resultant is $f \( u \)^m$; it is again nonzero and vanishes at every common point. As this bounds every finite collection, it bounds all common lines.
  Apply the bound to $F_0 \, Q$, whose degrees are at most $D_0$ and $3 D_0$. The remaining lines number $O \( D_0^2 \) = O \( n \/ M \)$. Together with the earlier exceptional lines this proves the lemma. ◻
]

=== 3.5 Radial lines and overlap graphs <radial-lines-and-overlap-graphs>

The next two lemmas quantify the benefit of removing $O_x$. Planes through a query point can overlap along a line, but after this removal there are few lines carrying substantial retained mass, except at a small set of query points.

#thm([Lemma 3.7.])[
  (Radial rich lines).  #emph[Consider the dimension-three output of Proposition 14. A line $ell$ through a query point $x$ has strength 
$ a_ell \( x \) = q \| X_x ∩ ell \| \/ n' . $

 Outside one exceptional set of $o \( n \)$ ambient points, simultaneously for dyadic $a in \[ q^(- 10) \, 2 \]$, 
#[#set math.equation(numbering: n => "(3.14)")
 $ \# { ell in.rev x : a_ell \( x \) gt.eq a } lt.eq q^(2 - 2 v) e^chi a^(- 100) . $ <geom:radial-count>]

 In addition, whenever $g > chi_0$ and $a > e^(- g \/ 20)$ with $0 < a lt.eq 2$, the total number of ambient center–line pairs $\( x \, ell \)$ having strength at least $a$ is at most $C q^2 \/ a^2$.]
] <geom:radial>

#proof[
  The radial lines partition $X_x$, so their total strength is at most $q$. Thus there are at most $q \/ a$ qualifying lines through any center. Comparing this with (3.14) reduces to
  $ e^(2 g) a^99 lt.eq e^chi . $
  This holds for $g lt.eq chi_0$ and large $q$, since $a lt.eq 2$ and $2 chi_0 < chi$. It also holds when $g > chi_0$ but $a lt.eq e^(- g \/ 20)$.
  In the remaining regime put $M = n' a \/ q$. Since $n' gt.eq n \/ 2$ and $n = q^(3 \/ 2) e^g$,
  $ M / n^(1 \/ 3) gt.eq c e^(\( 2 \/ 3 - 1 \/ 20 \) g) \, #h(2em) M^2 / K_p gt.eq c e^(\( 2 \/ 3 + 1 \/ 10 \) g) . $
  Also $c q lt.eq n \/ M lt.eq C q e^(g \/ 20)$, and (3.3) gives $g lt.eq sigma \/ 2 + O \( 1 \)$. Hence all hypotheses of Lemma 15 hold uniformly. In the capped residual case, that lemma gives $C n \/ M lt.eq C q \/ a$ rich lines; each has $q + 1$ rational centers. This yields at most $C q^2 \/ a lt.eq C q^2 \/ a^2$ relevant pairs.
  Suppose instead that the plane list is retained. Here own-cell removal will force the center of a surviving rich line into a plane earlier than the first listed plane containing that line. This gives a bound on its possible centers. First, the list length satisfies
  $ J / M lt.eq C e^(- \( 1 + 2 \/ 15 - 1 \/ 20 \) g) = o \( 1 \) . $
  A relevant line must be contained in a listed plane, since otherwise it meets the union of the list in at most $J < M$ points. Let $i$ be its first containing plane. Earlier planes contribute at most $J$ points to this line and later cells contribute none, so $\| C_i ∩ ell \| gt.eq M - J gt.eq M \/ 2$. Its center must be in an earlier plane: otherwise $O_x = C_i$, leaving at most $J < M$ points on this line in $X_x$. Since the line is not contained in any earlier plane, there are at most $i - 1$ possible centers for it.
  Put $f_i = \| C_i \| \/ n'$. Fix a sufficiently large constant $C_0$. If $a > C_0 f_i$, the mean number of $C_i$ points on a line of $Pi_i$ is at most $2 f_i n' \/ q$, much less than $M \/ 2$. The projective-plane incidence variance bounds the number of lines with at least $M \/ 2$ points by
  $ frac(C q \| C_i \|, M^2) lt.eq C q^(2 - v) f_i \/ a^2 . $
  Multiplying by at most $i$ centers and summing gives
  $ C q^(2 - v) a^(- 2) sum_i i f_i lt.eq C q^(2 - v) J \/ a^2 lt.eq C q^2 \/ a^2 \, $
  because $sum_i f_i = 1$ and $J lt.eq q^v$. In the other case $a lt.eq C_0 f_i$, nonincreasing cell fractions and their unit sum imply $i lt.eq C_0 \/ a$; there are at most $C_0 \/ a$ such indices. Each corresponding plane has $O \( q^2 \)$ lines and each line at most $i$ possible centers. Their total is again $O \( q^2 \/ a^2 \)$. This proves the center–line bound in all remaining cases.
  For a fixed dyadic threshold, divide that bound by the right-hand side of (3.14). The number of centers where the latter fails, divided by $n = q^(1 + v)$, is at most
  $ C q^(v - 1) e^(- chi) a^98 . $
  Since $v lt.eq 1 + O \( 1 \/ sigma \)$ and the sum of $a^98$ over all dyadic $a lt.eq 2$ is bounded, the union of these exceptional sets has size $o \( n \)$, as asserted. ◻
]

#thm([Lemma 3.8.])[
  (Overlap bounds for pencils).  #emph[Use the prepared data of Proposition 14 in dimension $j = 2$ or $3$. For a query point $x$, let $cal(H)_x$ be any family of hyperplanes through $x$ such that 
$ lambda'_H := q \| X_x ∩ H \| \/ n' lt.eq 2 quad \( H in cal(H)_x \) . $

 For distinct $H \, H' in cal(H)_x$ put $theta_(H H') = q \| X_x ∩ H ∩ H' \| \/ n'$. Let $E_a$ be the number of ordered pairs with $theta_(H H') gt.eq a$ and let $Delta_a$ be the maximum degree of this graph. Outside $o \( n \)$ ambient centers, simultaneously for dyadic $a in \[ q^(- 10) \, 2 \]$ and for every such family, 
#[#set math.equation(numbering: n => "(3.15)")
 $ E_a lt.eq B^2 e^(2 chi) a^(- 200) \, #h(2em) Delta_a lt.eq B e^(2 chi) a^(- 200) . $ <geom:overlap-bounds>]

 Let $p$ be any even integer in $\[ 10000 sigma \/ P \, 10000 sigma \/ P + 2 \]$ and put $t_(*) = 1 \/ \( 100 p \)$. Outside a further set of at most $n e^(C P)$ ambient centers, also 
#[#set math.equation(numbering: n => "(3.16)")
 $ Delta_(t_(*)) lt.eq B e^(- 3 P) . $ <geom:strong-degree>]

 The further exceptional set is used only for ambient output-size control, not for support capture.]
] <geom:overlap>

#proof[
  In dimension two, two distinct hyperplanes in the pencil are lines intersecting only at $x$. Because $x in.not X_x$, all overlaps are zero and all claims follow. Consider dimension three. The intersection of two distinct planes through $x$ is a radial line; each radial line belongs to $q + 1$ planes and therefore accounts for at most $C q^2$ ordered pairs. Lemma 16 gives
  $ E_a lt.eq C q^(4 - 2 v) e^chi a^(- 100) lt.eq B^2 e^(2 chi) a^(- 200) . $
  The last inequality uses $B = q^3 \/ n' asymp q^(2 - v)$ and $a lt.eq 2$; the factor $e^chi$ absorbs fixed constants. Within one plane, the radial lines partition its points other than $x$, so the sum of their strengths is at most $2$. There are at most $2 \/ a$ qualifying lines, each giving at most $q$ other planes. Thus
  #[#set math.equation(numbering: n => "(3.17)")
   $ Delta_a lt.eq C q \/ a . $ <geom:crude-degree>]
  Since $B gt.eq c q$, this implies the second bound in (3.15).
  For the stronger assertion, $log \( 1 \/ t_(*) \) = O \( log sigma \) = o \( P \)$. If $\( v - 1 \) sigma < - 4 P$, then
  $ B e^(- 3 P) gt.eq c q e^P gt.eq C q \/ t_(*) $
  for large $q$, so (3.17) suffices at every center. Otherwise $n gt.eq q^2 e^(- 4 P)$ and $g gt.eq sigma \/ 2 - 4 P > chi_0$. Moreover $t_(*) gt.double e^(- g \/ 20)$. The center–line estimate of Lemma 16, which does not require a dyadic threshold, bounds the number of centers lying on even one radial line of strength at least $t_(*)$ by
  $ C q^2 \/ t_(*)^2 lt.eq n e^(C P) . $
  Remove these centers. At every remaining center $Delta_(t_(*)) = 0$, proving (3.16). ◻
]

The geometry is now ready for the learning step. Its training support is $S'$, the ordered plane data are known to the decoder, and the own-cell rule in (3.10) is available for every query point. Removing up to half of $S$ changes the sparse-incidence bound by at most a factor of two. The overlap estimates are uniform over all allowed pencil subfamilies, so those families may be selected later using the prepared supports. Proposition 18 uses precisely these inputs to produce the cap required by Lemma 10; the stronger ambient exceptional set is never charged against support capture.

== 4 Learning a sparse support from a short row <learn:section>

The remaining low-dimensional description problem is the following. A set $S$ has unusually few incidences with a large opposite set $T$. We want a short message describing a set that captures a fixed fraction of $S$ and is not much larger than $S$. The decoder does not know either support. We first construct the desired set from a random row of points of a prepared subset of $S$, and then implement that row by searching a public table of proposals from the known domain.

Two estimates have different roles. A second moment will show that the test retains most points of the hidden support. A higher moment will exclude almost all unwanted ambient points. Keeping these roles separate is essential: some geometric exceptions allowed in the ambient estimate are too large to discard from the support itself.

=== 4.1 The prepared input and the sampling test <the-prepared-input-and-the-sampling-test>

Use the parameters of Equation (2.8), with $sigma = log q$, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ chi = P \/ 100 \, #h(2em) xi = L \/ 100 \, #h(2em) p in \[ 10000 sigma \/ P \, 10000 sigma \/ P + 2 \] ∩ 2 bb(Z) \, #h(2em) t_(*) = \( 100 p \)^(- 1) . $ <learn:auxiliary-parameters>]

Here $p$ is a moment order, not the characteristic; the field is $bb(F)_q$ with $q$ prime. In particular,

#[#set math.equation(numbering: n => "(4.2)")
 $ b + P tau = o \( L \) \, quad R log L = o \( P \) \, quad log sigma = o \( L \) \, quad R gt.double log \( p + 2 \) \, quad P = o \( sigma \) . $ <learn:scale-use>]

These relations follow from Lemma 9 whenever $b = O \( K_(*) \)$ and $tau = O \( sigma^(- 100 beta) \)$.

We specify the geometric input to this section. Let $j in { 2 \, 3 }$, let $S \, T$ be nonempty sets in opposite projective spaces of dimension $j$, and suppose that

#[#set math.equation(numbering: n => "(4.3)")
 $ S subset.eq U_S \, #h(2em) n = \| S \| lt.eq \| T \| \, #h(2em) \| S \| \| T \| gt.eq q^(j + 1) e^(- b) \, #h(2em) e \( S \, T \) lt.eq tau / q \| S \| \| T \| . $ <learn:support-hypotheses>]

The set $U_S$ is known to the decoder. Write $d_S = log \( \| U_S \| \/ n \)$. We only need to treat $n > 100 q P$, since smaller supports can be enumerated.

The prepared support is a subset $S' subset.eq S$ of size $n' in \[ n \/ 2 \, n \]$. In dimension three there may also be an ordered list of projective planes $Pi_1 \, dots.h \, Pi_J$. Its cells are

$ C_i = S' ∩ #scale(x: 120%, y: 120%)[\(] Pi_i \\ union.big_(a < i) Pi_a #scale(x: 120%, y: 120%)[\)] . $

The list is allowed to be empty; in dimension two it is always empty. The list and the sizes of its cells admit an $O \( q \)$-bit description, and every cell has size at most $.04 n'$. For an ambient point $x$, let $O_x = C_i$ if $Pi_i$ is the first listed plane containing $x$, and let $O_x = diameter$ if there is no such plane. Set

#[#set math.equation(numbering: n => "(4.4)")
 $ f_x = \| O_x \| \/ n' \, quad X_x = S' \\ \( O_x union { x } \) \, quad B = q^j \/ n' \, quad n = q^(1 + v) . $ <learn:radial-definitions>]

Thus $0 lt.eq f_x lt.eq .04$. Every line through $x$ is called a radial line at $x$, and has strength $a_ell = q \| ell ∩ X_x \| \/ n'$.

For each $x$, consider any family of hyperplanes $H$ through $x$ with $q \| H ∩ X_x \| \/ n' lt.eq 2$. For two distinct members put $theta_(H H') = q \| H ∩ H' ∩ X_x \| \/ n'$. Let $E_a$ be the number of ordered distinct pairs with $theta_(H H') gt.eq a$, and let $Delta_a$ be the largest number of such neighbors of one member. The geometric preparation supplies a deterministic exceptional set $D_0$ of size $o \( n \)$ such that, outside $D_0$, simultaneously for dyadic $a in \[ q^(- 10) \, 2 \]$,

#[#set math.equation(numbering: n => "(4.5)")
 $ E_a lt.eq B^2 e^(2 chi) a^(- 200) \, #h(2em) Delta_a lt.eq B e^(2 chi) a^(- 200) . $ <learn:overlap-input>]

There is a further deterministic set $D_1$, of size at most $n e^(C_0 P)$, outside which, also excluding $D_0$,

#[#set math.equation(numbering: n => "(4.6)")
 $ Delta_(t_(*)) lt.eq B e^(- 3 P) . $ <learn:strong-degree-input>]

The bounds apply to all the indicated families. In dimension two the overlaps vanish, so both assertions hold without geometric exceptions. Proposition 14 establishes this prepared input after its enumeration and large-cell reductions, with the overlap bounds supplied by Lemma 17.

#thm([Proposition 4.1.])[
  (Short-row description).  #emph[Fix the constants in (4.3), the bound on $b \/ K_(*)$, the bound on $tau sigma^(100 beta)$, and $C_0$. For every sufficiently large prime $q$, the prepared input just specified has the following description scheme. Using a fresh public table, it either declares failure or describes a set $W subset.eq U_S$ satisfying 
$ \| W \| lt.eq n e^(C P) \, #h(2em) \| W ∩ S \| gt.eq c n . $

 Failure has probability at most $C e^(- c q)$, and the message has at most $C q P \( d_S + 1 \) + C q + C sigma$ bits. In particular this is within $C q P \( d_S + d_T + P \)$ for any $d_T gt.eq 0$. The bounds are uniform in all supports and prepared inputs satisfying the hypotheses, including inputs fixed by earlier random history before the fresh table is sampled. The decoder uses only $U_S$, public parameters, and the new message; it need not know $S$, $T$, or $S'$.]
] <learn:short-row>

Mixing in Lemma 3 and the smaller-side orientation give $n lt.eq C q^(\( j + 1 \) \/ 2)$. Consequently the quantities used below obey

#[#set math.equation(numbering: n => "(4.7)")
 $ q / n' < frac(1, 50 P) \, #h(2em) Q_(j - 1) = O \( B^2 \) \, #h(2em) B^(- 1) lt.eq e^(- P) \, #h(2em) v lt.eq 1 + O \( 1 \/ sigma \) . $ <learn:elementary-sizes>]

The last bound will only be needed in dimension three.

We first sample from the hidden set $S'$. Take $R$ independent batches. Each batch has Poisson size of mean $q L$, and, conditional on its size, has independent uniform entries in $S'$. Equivalently, the numbers of occurrences of the different point-batch pairs are independent Poisson variables of mean $q L \/ n'$. Indeed the joint probability of prescribed counts is obtained by multiplying the Poisson probability of their sum by the multinomial probability conditional on that sum; the factorials then factor over points. The total number of samples has mean $q P$.

For a hyperplane $H$ and a cell $C$, define

$ lambda_H = frac(q \| S' ∩ H \|, n') \, #h(2em) lambda_(H \, C) = frac(q \| C ∩ H \|, n') \, #h(2em) f_C = frac(\| C \|, n') . $

Call $H$ exceptional if $\| lambda_H - 1 \| > .1$ or $\| lambda_(H \, C) - f_C \| > .02$ for at least one cell; let $cal(E)$ be this set. All other hyperplanes are typical. Let

#[#set math.equation(numbering: n => "(4.8)")
 $ Z = { H in cal(E) : H upright(" has no sample in any batch") } \, #h(2em) z = \| Z \| \, #h(2em) z_x = \| { H in Z : x in H } \| . $ <learn:empty-set>]

These objects are used by the encoder; the decoder will receive only the integer $z$, not the hidden set $Z$.

For a query point $x$, put $b_x = e^(- L \( 1 - f_x \))$, and let $N_r \( A \)$ denote the number of samples of batch $r$ in a point set $A$. For each hyperplane through $x$, we multiply $R$ batch tests. In each batch we center the emptiness indicator outside $O_x$ at $b_x$, and set the test to zero if $O_x ∩ H$ contains a sample. Thus a hyperplane empty in every batch contributes $\( 1 - b_x \)^R$, whereas any other hyperplane has product of absolute value at most $b_x$. For typical hyperplanes, their normalized mass outside $O_x$ is close to $1 - f_x$. Batch independence turns bounds on one-batch means and pair moments into $R$th-power bounds. The overlap estimates then control the sum over typical hyperplanes. Define the score by

#[#set math.equation(numbering: n => "(4.9)")
 $ A_x = sum_(H in.rev x) product_(r = 1)^R [1_({ N_r \( O_x ∩ H \) = 0 }) (1_({ N_r \( \( S' \\ O_x \) ∩ H \) = 0 }) - b_x)] . $ <learn:score>]

The random test includes every sampled point and every other point with $A_x < z \/ \( 2 q \)$. Both factors inside the brackets belong to batch $r$. Although the formula mentions hidden subsets, the decoder can evaluate it from the samples, the plane list, the cell sizes, and $z$: earliest membership in the list identifies each sample’s cell and the cell $O_x$, if present. The size $n'$ is transmitted as well. The separate own-cell indicator also preserves the geometric benefit of removing $O_x$: once its sample counts and the absence of a sample at $x$ are fixed, the remaining randomness consists of independent counts on the radial lines in $X_x$. We use this conditioning when estimating the typical contribution.

=== 4.2 Regular pencils and empty exceptional hyperplanes <regular-pencils-and-empty-exceptional-hyperplanes>

The pencil at $x$ is the set of hyperplanes through $x$. We next discard a small deterministic set of pencils on which squared deviations are unusually concentrated. This is separate from all sampling events.

#thm([Lemma 4.2.])[
  (Regular pencils).  #emph[There is a deterministic set $D_2$ of size $o \( n \)$ such that, for $x in.not D_2$, its pencil contains at most $B e^xi$ exceptional hyperplanes and satisfies 
$ sum_(H in.rev x) min { 1 \, \( lambda_H - 1 \)^2 } lt.eq B e^xi \, #h(2em) sum_(H in.rev x) min { 1 \, \( lambda_(H \, C) - f_C \)^2 } lt.eq B e^xi $

 for every cell $C$. The constants and the $o \( n \)$ estimate are uniform over the prepared inputs. We call these pencils regular. Moreover, for every regular pencil and its typical members, with 
#[#set math.equation(numbering: n => "(4.10)")
 $ lambda'_H = frac(q \| H ∩ X_x \|, n') \, #h(2em) delta'_H = lambda'_H - \( 1 - f_x \) \, $ <learn:outside-mass>]

 we have 
#[#set math.equation(numbering: n => "(4.11)")
 $ .75 lt.eq lambda'_H < 2 \, #h(2em) \| delta'_H \| lt.eq .18 \, #h(2em) sum_(H in.rev x\
H upright(" typical")) \( delta'_H \)^2 lt.eq C B e^xi . $ <learn:typical-bounds>]

]
] <learn:regular-pencils>

#proof[
  Weighted incidence variance gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ sum_H \( lambda_H - 1 \)^2 lt.eq C q B \, #h(2em) sum_H \( lambda_(H \, C) - f_C \)^2 lt.eq C q B f_C . $ <learn:total-variance>]
  The exact means differ from $1$ and $f_C$ by the factors $q p_j = 1 - 1 \/ Q_j$, whose squared contributions satisfy the same bounds. Summing over cells and using $sum_C f_C lt.eq 1$ proves
  #[#set math.equation(numbering: n => "(4.13)")
   $ \| cal(E) \| lt.eq C q B \, #h(2em) sum_(H in cal(E)) lambda_H lt.eq C q B . $ <learn:exceptional-size>]
  For the second assertion use Cauchy–Schwarz on $sum_(H in cal(E)) \( lambda_H - 1 \)$.
  For the clipped squared-deviation weight of a cell, the total weight is at most $C q B f_C$ and each weight is at most one. Its pencil sums have mean $O \( B f_C \)$ and total squared deviation at most $C q^j B f_C$, by Lemma 3. For sufficiently large $q$, exceeding $B e^xi$ therefore excludes at most
  $ C frac(q^j B f_C, B^2 e^(2 xi)) = C n' f_C e^(- 2 xi) $
  centers. Sum this estimate over cells, rather than multiplying by their number. The full-deviation weight and the exceptional-indicator weight have the same proof with fraction one. Their union is $D_2$.
  For a typical hyperplane, removing $O_x$ subtracts a quantity within $.02$ of $f_x$, when a cell is present. Removing $x$ subtracts at most $q \/ n'$. Thus $lambda'_H gt.eq .9 - .04 - .02 - q \/ n' > .75$ and $\| delta'_H \| lt.eq .1 + .02 + q \/ n' < .18$. The upper bound by 2 follows as well. On typical hyperplanes the relevant squared deviations are already below one. The inequality $\( u + v + w \)^2 lt.eq 3 \( u^2 + v^2 + w^2 \)$ and regularity give the last bound in (4.11); the removed center adds at most $O \( q^(j - 1) \( q \/ n' \)^2 \) = O \( B \)$ by (4.7). ◻
]

#thm([Lemma 4.3.])[
  (The empty exceptional set).  #emph[There is a fixed $c_0 > 0$ such that, with probability at least $c e^(- 8 P tau)$, 
#[#set math.equation(numbering: n => "(4.14)")
 $ z gt.eq z_min := c_0 q B e^(- b - 8 P tau) \, #h(2em) sum_(H in Z) lambda_H lt.eq .001 z . $ <learn:empty-good-event>]

 For every $Z$ satisfying these two inequalities, at least $.99 n'$ points of $S'$ have $z_x lt.eq .1 z \/ q$, whereas all but $O \( q^(j + 1) \/ z \)$ ambient points have $z_x gt.eq .8 z \/ q$. At a regular pencil, the exceptional-hyperplane part of (4.9) differs from $\( 1 - b_x \)^R z_x$ by at most $b_x B e^xi = o \( z_min \/ q \)$, uniformly in the samples, and $\( 1 - b_x \)^R = 1 - o \( 1 \)$.]
] <learn:empty-exceptional>

#proof[
  The average of $lambda_H$ over $T$ is at most $2 tau$. At least half of $T$ consequently has $lambda_H lt.eq 8 tau$. These hyperplanes are exceptional, and their number $m$ is at least $c q B e^(- b)$ by (4.3) and $n' gt.eq n \/ 2$. Each is empty with probability at least $a = e^(- 8 P tau)$. If $Y$ counts the empty members of this particular set, then $0 lt.eq Y lt.eq m$ and $bb(E) Y gt.eq m a$. Therefore $bb(P) \( Y gt.eq m a \/ 2 \) gt.eq a \/ 2$, without any independence assumption among the hyperplanes. Choose $c_0$ small enough to obtain the first inequality of (4.14) on this event.
  By (4.13), the expected contribution from $lambda_H gt.eq 10^(- 4)$ to $sum_(H in Z) lambda_H$ is at most $C q B e^(- 10^(- 4) P)$. Markov’s inequality at $.0009 z_min$ bounds the probability of a larger contribution by
  $ C exp { b + 8 P tau - 10^(- 4) P } = o \( e^(- 8 P tau) \) . $
  The remaining contribution is at most $.0001 z$. Subtracting this failure probability proves the asserted simultaneous event.
  For fixed $Z$, incidence variance has mean $p_j z = \( 1 - o \( 1 \) \) z \/ q$ and total squared deviation at most $q^(j - 1) z$. This gives the ambient exception bound. On the hidden support, exact double counting gives
  $ sum_(x in S') z_x = n' / q sum_(H in Z) lambda_H lt.eq .001 n' z \/ q \, $
  which proves the $.99 n'$ assertion by Markov’s inequality.
  An exceptional hyperplane in $Z$ contributes $\( 1 - b_x \)^R$ to the score. For any other exceptional member of the pencil, an own-cell hit makes its product zero; otherwise an outside hit gives a factor $- b_x$, and all other factors have absolute value at most one. Its contribution has absolute value at most $b_x$. Regularity proves the error bound. Finally $b_x lt.eq e^(- .96 L)$, so $b_x B e^xi lt.eq B e^(- .95 L) = o \( z_min \/ q \)$ and $R b_x = o \( 1 \)$ by (4.2). ◻
]

The empty hyperplanes thus give a score that is small on most of $S'$ and large on most ambient points. It remains to show that the typical hyperplanes do not obscure this distinction. Write $T_x^(*)$ for their contribution to (4.9).

=== 4.3 Conditional moments of the typical contribution <conditional-moments-of-the-typical-contribution>

Fix $x$ and condition on its being unsampled and on all point-batch counts in $O_x \\ { x }$. Denote these conditioning data by $cal(O)_x$; when $x in.not S'$, the unsampled condition is automatic. Every assertion below is uniform over conditioning values of positive probability. The own-cell multipliers in (4.9) are now fixed zeros or ones. Counts on $X_x$ are unchanged independent Poisson variables. Grouping them by radial lines gives independent line-batch schedules, with hit probability at most $L a_ell$ for line $ell$ in one batch. Distinct lines are disjoint in $X_x$ because the center has been removed.

Temporarily omit a fixed own-cell multiplier and let $X_H = 1_({ H ∩ X_x upright(" empty in the batch") }) - b_x$. Its mean $u_H$ and its pair moments obey

#[#set math.equation(numbering: n => "(4.15)")
 $ u_H & = e^(- L lambda'_H) - b_x \, & \| u_H \| & lt.eq L e^(- .75 L) \| delta'_H \| \,\
bb(E) \( X_H X_(H') \) & = u_H u_(H') + e^(- L \( lambda'_H + lambda'_(H') \)) \( e^(L theta_(H H')) - 1 \) \,\
\| bb(E) \( X_H X_(H') \) \| & lt.eq L^2 e^(- .75 L) \( \| delta'_H delta'_(H') \| + theta_(H H') \) \, & bb(E) X_H^2 & lt.eq 2 e^(- .75 L) . $ <learn:one-mean>]

The covariance identity is the Poisson emptiness formula for a union. For its bound, use $lambda'_H + lambda'_(H') - theta_(H H') gt.eq .75$ and $e^u - 1 lt.eq u e^u$ for $u gt.eq 0$.

#thm([Lemma 4.4.])[
  (Second moment).  #emph[If $x in.not D_0 union D_2$, then, conditional on $cal(O)_x$, 
$ bb(E) #scale(x: 120%, y: 120%)[\(] \( T_x^(*) \)^2 divides cal(O)_x #scale(x: 120%, y: 120%)[\)] lt.eq B^2 e^(- .6 P) . $

 This assertion does not exclude the set $D_1$.]
] <learn:second-moment>

#proof[
  Batch independence raises the bounds in (4.15) to the $R$th power. Fixed zero-one multipliers cannot increase their absolute values. By (4.11),
  $ sum_H \| delta'_H \|^R lt.eq C B e^xi . $
  For the overlap terms, (4.5) and dyadic summation give, for $R > 200$,
  $ sum_(H eq.not H') theta_(H H')^R lt.eq B^2 exp { 2 chi + O \( R + log sigma \) } . $
  Every positive overlap is at least $q \/ n'$ and at most 2, so it falls within the available dyadic range. There are $O \( sigma \)$ dyads. The inequality $\( u + v \)^R lt.eq 2^(R - 1) \( u^R + v^R \)$ handles their sum with the deviation terms. The diagonal contributes at most $Q_(j - 1) \( 2 e^(- .75 L) \)^R$. Now use $Q_(j - 1) = O \( B^2 \)$, $2 chi = .02 P$, and $R log L = o \( P \)$ to obtain the claimed exponent. ◻
]

#thm([Lemma 4.5.])[
  (High moment).  #emph[If $x in.not D_0 union D_1 union D_2$, then, conditional on $cal(O)_x$, 
$ bb(E) #scale(x: 120%, y: 120%)[\(] \( T_x^(*) \)^p divides cal(O)_x #scale(x: 120%, y: 120%)[\)] lt.eq B^p e^(- .1 p P) . $

]
] <learn:high-moment>

#proof[
  We expand into ordered $p$-tuples of typical hyperplanes and bound the absolute expectation of every summand. The evenness of $p$ will permit the final tail estimate. A tuple may contain repeated hyperplanes. Among its distinct hyperplanes, join $H \, H'$ when $theta_(H H') > t_(*)$, and take the connected components of this graph. A component consisting of one hyperplane appearing once in the tuple is a #emph[simple singleton]. All other components are nonsimple.
  ===== 4.3.1 Component expectations. <component-expectations.>
  A positive-strength radial line is external to the tuple if it is contained in hyperplanes in different components. The sum of the strengths of the external lines in any fixed tuple hyperplane is at most $p t_(*) = .01$: assign each such line to one other tuple hyperplane containing it, whose overlap is at most $t_(*)$. Condition further on all external line-batch schedules. The remaining schedules affecting different components are independent, and each hyperplane has internal mass at least $.75 - .01 = .74$. Call a hyperplane touched in a batch if one of its external lines has a hit in that batch.
  For a nonsimple component, all factor magnitudes are at most one. Keeping just the factors of one of its hyperplanes bounds its absolute product expectation. In an untouched batch the expected absolute factor is at most $2 e^(- .74 L)$; in a touched batch it is at most $b_x lt.eq e^(- .96 L)$. Independence between batches consequently bounds the entire component by
  #[#set math.equation(numbering: n => "(4.16)")
   $ \( 2 e^(- .74 L) \)^R lt.eq e^(- .7 P) . $ <learn:nonsimple-attenuation>]
  For a simple singleton keep its signed expectation. Let $theta_max$ be the largest overlap $theta_(H H')$ over the other distinct hyperplanes $H'$ of the current tuple, taking zero if there are none. It is not a maximum over the whole pencil. In an untouched batch the mean has absolute value at most
  $ L e^(- .74 L) \( \| delta'_H \| + p theta_max \) \; $
  in every batch it has absolute value at most $2 e^(- .74 L)$. Let $cal(B)_H$ be the event that $H$ is touched in at least $R \/ 2$ batches. If it is not, at least $R \/ 2$ factors have the sharper bound. Since $p theta_max lt.eq .01$, $R \/ 2 gt.eq 200$, and $R log \( 2 L \) = o \( P \)$, the resulting bound for a simple singleton is
  #[#set math.equation(numbering: n => "(4.17)")
   $ e^(- .68 P) (\| delta'_H \|^(R \/ 2) + \( p theta_max \)^200 + 1_(cal(B)_H)) . $ <learn:simple-attenuation>]
  The fixed own multipliers do not change either estimate.
  We now sum these fixed-tuple bounds over the possible hyperplanes. For each valid tuple, retain $e^(- .7 P)$ per nonsimple component and $e^(- .68 P)$ per simple position, and expand the three terms in (4.17) at each simple position. The resulting bounds are nonnegative. After averaging the external schedules, the only remaining probabilistic factor in each term is the conditional probability of the selected events $cal(B)_H$ occurring together. We will bound the sum of these terms after dividing by $B^p$.
  The geometric choices have three forms. Nonsimple components are counted either from a strong pair and a spanning tree or from repetitions of one hyperplane; deviation and overlap terms use the corresponding pencil bounds; the remaining hit events are covered by static certificates. Each such certificate charges any independent direction-batch hit event at most once. We construct these certificates below and then verify the probability union bound. These descriptions count moment terms and are not part of the public-table message.
  The combinatorial descriptions use only $p^(O \( p \))$ choices of names, partitions, and orders. Record the partition of positions into equal hyperplane names, the partition of distinct names into their strong components, and spanning trees and traversal orders inside those components. Do not record the full strong graph. For any geometric assignment its true graph determines whether these recorded components are valid; an invalid assignment initially contributes zero. Dropping such validity restrictions later only enlarges a positive sum after the attenuation bounds have been assigned.
  ===== 4.3.2 Nonsimple and deviation choices. <nonsimple-and-deviation-choices.>
  For a component with at least two distinct hyperplanes, start with a strong pair. By (4.5), its normalized count is at most
  $ e^(2 chi) \( C \/ t_(*) \)^200 . $
  Each later distinct vertex along its tree costs at most $e^(- 3 P)$ by (4.6); a repeated position costs $1 \/ B$. For a component consisting of one hyperplane repeated, its first two positions cost $Q_(j - 1) \/ B^2 = O \( 1 \)$, and further positions again cost $1 \/ B$. These counts are combined with (4.16) once per component.
  A deviation choice has weighted normalized sum at most $C e^xi$ by (4.11). Encode these and all nonsimple components first. The remaining choices are overlap shifts and events $cal(B)_H$; their attenuation $e^(- .68 P)$ has already been retained.
  ===== 4.3.3 Overlap shifts. <overlap-shifts.>
  For an unencoded shift vertex, choose the name of a neighbor attaining its largest positive overlap and a dyad $a lt.eq theta < 2 a$. Zero weights need not be encoded. If the neighbor is encoded, the weighted normalized count is at most
  $ \( 2 p a \)^200 Delta_a \/ B . $
  If it is not, encode the ordered pair with count $\( 2 p a \)^200 E_a \/ B^2$, dropping the neighbor’s extra shift weight or event requirement, each bounded by one. Both vertices retain their attenuation. Equation (4.5) cancels $a^200$ in either case and gives at most $e^(2 chi)$ times polynomial overhead. Summing dyads has the same type of overhead. Continue until all unencoded vertices carry the event requirement $cal(B)_H$.
  ===== 4.3.4 Hit certificates and their probability weights. <hit-certificates-and-their-probability-weights.>
  Fix a tuple and external schedules for which these remaining requirements hold. We describe certificates witnessing enough of the hits to count the tuple. Maintain two objects: a dictionary of radial directions whose geometry is already recorded, and a set of charged direction-batch events. On first introduction of a direction, charge one positive hit event, except in the pair operation below, which charges 200 distinct batches at once. Once that direction enters the dictionary, any later reference to it imposes #emph[no new hit requirement]. In particular, no direction-batch event is charged twice.
  For a fixed tuple all charged events are external events, independent under the conditional law given $cal(O)_x$. Thus their joint probability is at most the product of their $L a_ell$ weights. Keeping $min \( 1 \, L a_ell \)$ would also be valid, but is unnecessary. From an encoded hyperplane $H_0$, the weighted sum of choices of a new line and a witnessing batch is at most
  #[#set math.equation(numbering: n => "(4.18)")
   $ sum_(r = 1)^R sum_(ell subset H_0) L a_ell = P lambda'_(H_0) < 2 P . $ <learn:line-charge>]
  An old direction is specified by its dictionary index and requires no new probability factor. If the current dictionary has $m$ directions, these references have at most $m$ choices, each of incremental weight one. A direction choice, allowing either a new charge or an old reference, therefore has total weight at most $2 P + m$. The construction below keeps $m = O \( p \)$, so these extra choices enter only the polynomial overhead.
  ===== 4.3.5 Anchors and pairs. <anchors-and-pairs.>
  If an unencoded vertex has a touched direction shared with an encoded hyperplane, encode it using that direction as an anchor. A new direction is paid for by (4.18); an old one is referenced. Given the direction, there are at most $C q^(j - 2)$ hyperplanes through it. The normalized geometric cost is therefore
  $ O \( q^(j - 2) \/ B \) = O \( q^(v - 1) \) = O \( 1 \) . $
  This uses $n' asymp n$ and (4.7). In dimension two there are no positive external directions, and no such event requirements occur.
  If no anchor is available but two unencoded vertices share external hits in at least 200 distinct batches on directions in no encoded hyperplane, encode this pair. Choose an overlap dyad, 200 witnessing batches and one shared hit direction in each. These events are new and distinct, outside the direction dictionary. For a fixed pair their total probability weights, summed over the witness choices, are at most $\( 2 P a \)^200$. The normalized pair count in (4.5) then gives a cost at most $e^(2 chi) \( 2 P \)^200$. Add the vertices and witness directions to the encoded data. In dimension three the intersection direction of a pair is unique; repeated use of that direction in distinct batches still charges distinct independent events. Repeat the anchor and pair operations whenever either applies.
  ===== 4.3.6 The residual root set. <the-residual-root-set.>
  Suppose $h$ vertices remain. Each has at least $R \/ 2$ touched batches, whose witnessing external directions are shared with residual vertices only; otherwise an anchor would be available. Select one witness per such batch. A fixed neighbor appears fewer than 200 times, and a fixed direction appears fewer than 200 times. Either violation would permit the pair operation. Greedily keeping one witness and discarding others with its neighbor or its direction removes fewer than 400 witnesses. Thus each residual vertex has at least $floor.l R \/ 800 floor.r$ witnesses with distinct neighbors and distinct directions.
  There exists a set of at most $h \/ 10$ roots such that every nonroot has two of these witnesses to roots. To prove this, select each vertex independently with probability $1 \/ 20$. For any one witness list, the probability of fewer than two selected neighbors is at most $C R e^(- c R)$. Union over at most $p$ lists is $o \( 1 \)$ because $R gt.double log \( p + 2 \)$. Markov’s inequality bounds the probability of more than $h \/ 10$ selected vertices by $1 \/ 2$. The two conditions therefore hold simultaneously with positive probability. If a residual set is too small to have the displayed number of distinct neighbors, it could not have reached this case in the first place.
  Record the root names and choose their hyperplanes freely, dropping their extra event requirements. A root has normalized cost $Q_2 \/ B = O \( q^v \)$. Encode each nonroot by two distinct directions in its two chosen root neighbors, using (4.18) for new directions and dictionary references for old ones. Two distinct radial lines determine at most one projective plane, so the nonroot’s normalized geometric cost is $1 \/ B = O \( q^(v - 2) \)$. Restrict to distinct directions for this uniqueness statement. Each pair operation introduces at most 200 dictionary directions, each anchor at most one, and each nonroot at most two. There are at most $p$ tuple vertices, so the dictionary always has at most $C p$ entries. Conditional on previously recorded geometry, each of the two direction choices thus has total weight at most $2 P + C p$, including old references with unit incremental weight. After counting the unique plane, their positive weighted sum is bounded by $\( 2 P + C p \)^2$; this is a polynomial overhead factor. If there are $r lt.eq h \/ 10$ roots, the aggregate geometric cost, apart from $C^(O \( h \))$, is at most
  #[#set math.equation(numbering: n => "(4.19)")
   $ q^(r v + \( h - r \) \( v - 2 \)) = q^(h v - 2 h + 2 r) lt.eq q^(- .8 h + O \( h \/ sigma \)) . $ <learn:root-saving>]
  This is favorable, and absorbs no attenuation assigned earlier.
  ===== 4.3.7 Justification of the enumeration. <justification-of-the-enumeration.>
  The operations above are a way to choose a certificate from a realization, not an assertion of independence under adaptive choices. Take the union bound over all resulting static descriptions. More formally, for a fixed valid tuple, let $I$ be the set of its remaining event requirements and let $frak(C)$ be the family of certificates just described. Write $cal(L) \( c \)$ for the charged direction-batch ledger of $c$, and $E_(ell \, r) = { N_r \( ell ∩ X_x \) > 0 }$. The construction proves the pointwise inequality
  $ 1_(⋂_(H in I) cal(B)_H) lt.eq sum_(c in frak(C)) product_(\( ell \, r \) in cal(L) \( c \)) 1_(E_(ell \, r)) . $
  Every ledger consists of distinct external events, so integration gives
  $ bb(P) (⋂_(H in I) cal(B)_H thin mid(bar.v) thin cal(O)_x) lt.eq sum_(c in frak(C)) product_(\( ell \, r \) in cal(L) \( c \)) L a_ell . $
  Different certificates may overlap, which is harmless in this union bound. Exchange the nonnegative sums over tuples and certificates, and sum their numerical weights by the encoding order. Equations (4.5) and (4.18) give uniform bounds after previously encoded geometry is fixed. Every encoded hyperplane remains in the fixed typical pencil; in particular $lambda'_H < 2$ is retained wherever (4.18) is used. The local overlap constraints used in degree bounds are retained as well. For a residual nonroot, the two directions remain distinct until its unique plane has been counted; only their positive weighted sum is then bounded by the product of the two new-or-old choice bounds $2 P + C p$. Old dictionary references add multiplicity without adding a hit probability factor. Discarding other compatibility restrictions can only increase these weighted sums. This occurs after the component attenuations have been justified for valid tuples, and never treats an adaptive hit as a fresh event.
  There are $O \( p \)$ dictionary directions and charged events: a pair uses the fixed number 200, an anchor uses one, and a residual nonroot uses at most two. Names, traversal orders, component partitions, root choices, batches, dyads, dictionary references and all polynomial factors in $p \, sigma \, P \, R$ contribute at most $exp \( O \( p log \( sigma + 2 \) \) \) = exp \( o \( p P \) \)$.
  Finally, a nonsimple component pays for its first two positions by $e^(- .7 P + 2 chi) = e^(- .68 P)$, and for each additional position by at most $e^(- P)$. A simple position retains $e^(- .68 P)$; its normalized weighted choice costs at most $e^(2 chi)$ per position apart from the overhead, or less in (4.19). The deviation factor $e^xi$ is also at most $e^(2 chi)$. The weakest per-position saving comes from sharing $e^(- .68 P)$ between the first two positions of a nonsimple component. It is $e^(- .34 P)$ before negligible overhead. Summing the expansion proves the asserted $B^p e^(- .1 p P)$ bound. ◻
]

=== 4.4 Capture, ambient size, and a public-table message <capture-ambient-size-and-a-public-table-message>

The two moment bounds now have their promised separate applications. The second moment controls support points without removing $D_1$; the high moment is used only for the ambient size.

#thm([Lemma 4.6.])[
  (A successful true-law row).  #emph[For the Poisson batches sampled from $S'$, with probability at least $c e^(- 8 P tau)$ their total size is at most $2 q P$ and the test (4.9), including all sampled points, captures at least $c n$ points of $S$ and contains at most $n e^(C P)$ ambient points. The integer $z$ and the score are those determined by these same batches.]
] <learn:row-success>

#proof[
  Use the deterministic threshold $z_min \/ \( 10 q \)$. By Lemma 22, the probability that $\| T_x^(*) \|$ exceeds it, conditional on $cal(O)_x$, is at most
  $ exp { - .1 p P + p \( b + 8 P tau + O \( 1 \) \) } lt.eq e^(- .09 p P) lt.eq q^(- 50) $
  outside $D_0 union D_1 union D_2$. By Lemma 21, the corresponding bound outside $D_0 union D_2$ is $e^(- c P)$. Multiply each conditional estimate by the probability that $x$ is unsampled and average its own schedules. These bounds therefore hold for the event that $x$ is unsampled and its typical contribution exceeds the threshold.
  For training points, the expected number of these failures is at most $n' e^(- c P)$. With failure probability $O \( e^(- c P) \) = o \( e^(- 8 P tau) \)$, there are fewer than $.01 n'$ failures outside $D_0 union D_2$. For ambient points, the expected number is at most $Q_j q^(- 50)$, so Markov gives at most $n e^(C P)$ failures with a further $o \( e^(- 8 P tau) \)$ exceptional probability. Here $j lt.eq 3$ and $P tau = o \( sigma \)$. The static ambient exceptions $D_1$ are included by increasing $C$; $D_0 union D_2$ has size $o \( n \)$.
  Intersect these events with (4.14). Their failure probabilities are subtracted from that event’s probability, not conditioned on its occurrence. The total sample count is Poisson with mean $q P$, and its exceeding $2 q P$ costs $e^(- c q P)$ by Lemma 8, again negligible. The remaining probability is at least $c e^(- 8 P tau)$.
  On this joint event, at least $.99 n'$ training points satisfy $z_x lt.eq .1 z \/ q$. Apart from $o \( n \)$ static exceptions and $.01 n'$ unsampled failures, their exceptional and typical score contributions give $A_x < z \/ \( 2 q \)$, by Lemma 20 and $z gt.eq z_min$. Sampled points are included automatically. This retains a fixed fraction of $S'$ and hence of $S$.
  Conversely, an unsampled point with $z_x gt.eq .8 z \/ q$, a regular pencil, and typical contribution of magnitude at most $z_min \/ \( 10 q \)$ has $A_x > z \/ \( 2 q \)$ for sufficiently large $q$. The further exception depending on $Z$ has size
  $ O \( q^(j + 1) \/ z \) lt.eq C n' e^(b + 8 P tau) lt.eq n e^(C P) . $
  Together with the static exceptions, ambient failures, and at most $2 q P$ sampled points, this proves the size bound after enlarging $C$. ◻
]

#thm([Lemma 4.7.])[
  (Implementation by proposals).  #emph[The true-law success in Lemma 23 gives the description scheme of Proposition 18.]
] <learn:implementation>

#proof[
  Transmit the prepared plane list and cell sizes, the integers $n \, n'$, and the choice of the present mode. These cost $O \( q + sigma \)$ bits. The decoder can now generate a public-table proposal consisting of $R$ independent Poisson batch sizes of mean $q L$, with entries uniform in its known domain $U_S$. The table supplies independent repetitions of this entire proposal. It is fresh relative to the data used to prepare $S'$.
  The encoder accepts a proposal precisely if every entry belongs to $S'$ and the conclusion of Lemma 23 holds for that row. The encoder knows the hidden data, so this is a well-defined finite test. For a specified ordered row with total count $m$ and all entries in $S'$, the proposal-to-true-law probability ratio is
  $ (frac(n', \| U_S \|))^m . $
  The Poisson probabilities of the batch sizes cancel exactly. On successful true-law rows $m lt.eq 2 q P$ and $n' gt.eq n \/ 2$, so summing these ratios over the successful rows proves proposal success probability at least
  $ c e^(- 8 P tau) e^(- 2 q P \( d_S + log 2 \)) gt.eq e^(- C_1 q P \( d_S + 1 \)) . $
  Choose a fixed $C_2 > C_1$ and search at most
  $ M = ⌈e^(C_2 q P \( d_S + 1 \))⌉ $
  independent proposals, taking the first success and declaring failure if none exists. The failure probability is at most
  $ exp { - M e^(- C_1 q P \( d_S + 1 \)) } lt.eq exp { - e^(\( C_2 - C_1 \) q P \( d_S + 1 \)) } lt.eq C e^(- c q) . $
  The successful index has a self-delimiting description of $O \( q P \( d_S + 1 \) \)$ bits. The encoder also sends $z lt.eq Q_j$, costing $O \( sigma \)$ bits. The decoder reconstructs that proposal, computes the score from its samples and the transmitted list data, includes the sampled points, and intersects the resulting set with $U_S$. This intersection preserves all captured points of $S'$.
  The decoder neither repeats the acceptance test nor needs the hidden supports to evaluate the resulting score. The guarantee concerns the first accepted row within a finite cutoff; it does not assert that this accepted row has an unbiased true-law distribution. Any later validation procedure uses its own fresh table. Finally, conditional on arbitrary earlier readiness data, the fixed-input calculation above is unchanged. This proves the uniformity, length, and failure claims. ◻
]

#proof[
  #emph[Completion of Proposition 18.] Lemmas 23 and 24 give the stated set, message bound, and failure probability. ◻
]

#proof[
  #emph[Completion of the description lemma.]  The only unresolved branch in the proof of Lemma 10 was the prepared small-cell case in projective dimension two or three. Its inputs satisfy exactly the hypotheses of Proposition 18, which supplies that branch at a cost bounded by the lemma’s stated budget. Dimension two has no plane-list reduction and no external radial overlaps. The dimension-three large-cell reduction of Proposition 14 invokes the now established dimension-two result. The bounded higher-dimensional projection induction of Proposition 13 then applies successively. Its validation calls use fresh tables, as stipulated in the preceding section. Hence all branches of Lemma 10 are proved, with the specified one-sided capture, message length, and exponentially small failure. ◻
]

== 5 Marking and representative laws <mark:section>

This section prepares a consistent tuple for compression. A short marking message first restricts most flags to domains of size $O \( q^d \)$. We then choose a conditional law in which most positions have small entropy deficit and small mutual information with a collection of representative positions. In the reciprocal marginal classes, consistency turns this information bound into a sparse-incidence estimate. All subspace dimensions below are vector dimensions.

Fix $d$, $eta$, and the scales from (2.8). Let $F = \( F_1 \, dots.h \, F_ell \)$ be a consistent tuple of deterministic length $ell = Theta \( k \)$, extracted in either permitted orientation from the flag stream. Assume that the stream law is dominated by a fixed constant times the independent uniform law and that the simultaneous occupancy bound of Lemma 5 holds. An old context $sans(C)$ is a discrete random variable whose value specifies a domain for each slot, with

#[#set math.equation(numbering: n => "(5.1)")
 $ H \( sans(C) \) lt.eq Lambda \, #h(2em) \| upright("domain of ") F_i upright(" given ") sans(C) \| lt.eq C q^d e^Delta \, #h(2em) Lambda \, Delta gt.eq 0 . $ <mark:stage-budget>]

The context and tuple may have arbitrary dependence on the stream. Any public tables already fixed by preceding stages are regarded as fixed here; further support and description tables will be drawn only after the representative experiment below. Set

#[#set math.equation(numbering: n => "(5.2)")
 $ D = sigma^beta \( 1 + Lambda \/ k + Delta sigma^(- eta) \) \, #h(2em) D lt.eq sigma^(1 - eta \/ 2) . $ <mark:parameters>]

Thus $K = D sigma^(3 beta)$ and $K_(*) = D sigma^(6 beta)$, as in the common parameter convention. Constants in this section may depend on $d \, eta$ and fixed retention and domination constants, but not on $q$ or on a realized history.

=== 5.1 The marking message <the-marking-message>

This marking procedure adapts the counting argument in #cite(label("Bradac2026")) Claim 2.13, with earlier expensive/cheap exposure methods in #cite(label("AlonRodl2005")). The entropy bound below concerns the actual conditional law of the selected flags.

In a forward scan, keep a vector subspace $V \( y \)$ of the second system for each second point $y$. Initially it is zero. Whenever a position is declared expensive, adjoin its second endpoint $b$ to $V \( y \)$ for every $y$ incident with its first endpoint $a$. No other position changes the state. Equivalently, $V \( y \)$ is the span of earlier expensive second endpoints whose first endpoints annihilate $y$.

At a current flag $\( a \, b \)$, consistency implies $a perp V \( b \)$. Put $r = dim V \( b \) lt.eq d$, and write $Z_j = { y : dim V \( y \) = j }$. Choose $l in { 0 \, dots.h \, r }$ maximizing $\| Z_l \|$, with fixed tie-breaking. Declare the position #emph[popular-cheap] if

#[#set math.equation(numbering: n => "(5.3)")
 $ \| { y in Z_l : b subset.eq V \( y \) } \| gt.eq \| Z_l \| \/ \( 16 q \) . $ <mark:popular>]

If it is not popular-cheap, declare it #emph[poor-cheap] if

#[#set math.equation(numbering: n => "(5.4)")
 $ \| { y in Z_l : a perp y } \| lt.eq \| Z_l \| \/ \( 8 q \) . $ <mark:poor>]

Declare it expensive otherwise, and update the state as described above. Run the same scan on the reversed tuple with its two endpoint systems interchanged. Consistency in this orientation follows from Lemma 4. Let $E_(+)$ and $E_(-)$ be the expensive index sets in the two scans, expressed in the original slot labels, and put $h = \| E_(+) union E_(-) \|$.

#thm([Lemma 5.1.])[
  (Marking and entropy budget).  #emph[Under (5.1), both scans together mark at most $h lt.eq C q sigma$ positions expensive. The old context, the two rank and type masks, and the values of all positions expensive in either scan form a message $theta_0$ satisfying 
#[#set math.equation(numbering: n => "(5.5)")
 $ H \( theta_0 \) lt.eq Lambda + O \( k \) + \( d sigma + Delta + O \( 1 \) \) bb(E) h . $ <mark:message-cost>]

 At a fixed $theta_0$, every unspecified flag has a known joint domain of size at most $e^(J_0)$, where $J_0 = d sigma + O \( 1 \)$ is deterministic. For the set $U$ of unspecified slots, and every $theta_0$-determined subset $S subset.eq U$, 
#[#set math.equation(numbering: n => "(5.6)")
 $ 0 lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] \| S \| J_0 - H_(theta_0) \( F_S \) #scale(x: 120%, y: 120%)[\]] lt.eq C \( Lambda + k + Delta q sigma \) . $ <mark:subset-deficit>]

 Here $H_(theta_0)$ means entropy in the conditional law at the specified value of $theta_0$. Independently of the extraction entropy lower bound, the same message gives 
#[#set math.equation(numbering: n => "(5.7)")
 $ H \( F \) lt.eq d sigma ell + Lambda + O \( k \) + O \( Delta q sigma \) . $ <mark:entropy-upper>]

]
] <mark:marking>

#proof[
  At a known state and rank $r$, a possible second endpoint $b$ has at most $2 q^(d - r)$ first partners annihilating $V \( b \)$. For $l gt.eq 1$, counting the incidences $b subset.eq V \( y \)$ over $y in Z_l$ gives at most $2 \| Z_l \| q^(l - 1)$ memberships. Hence (5.3) allows at most $32 q^l$ second endpoints, and its joint domain has size $O \( q^d \)$ since $l lt.eq r$. For $l = 0$ there are no popular endpoints.
  For a poor-cheap position, the variance estimate in Lemma 3 bounds the number of first endpoints in (5.4) by $C q^(d + 1) \/ \| Z_l \|$. Indeed their incidence count deviates by at least $c \| Z_l \| \/ q$ from its mean for large $q$. The second endpoint belongs to $Z_r$, and $\| Z_r \| lt.eq \| Z_l \|$. The product of these two marginal domain sizes is therefore at most $C q^(d + 1)$. Incidence mixing bounds the number of flags between them by
  $ C q^(- 1) q^(d + 1) + q^(\( d - 1 \) \/ 2) \( C q^(d + 1) \)^(1 \/ 2) = O \( q^d \) . $
  At an expensive step, more than $\| Z_l \| \/ \( 8 q \)$ points of $Z_l$ are hit by $a$, and fewer than $\| Z_l \| \/ \( 16 q \)$ already have $b subset.eq V \( y \)$. Thus at least $\| Z_l \| \/ \( 16 q \)$ points increase their rank from $l$ to $l + 1$. The cumulative set $U_l = { y : dim V \( y \) lt.eq l }$ has size at most $\( d + 1 \) \| Z_l \|$ at this step, and loses a fraction at least $1 \/ \( 16 \( d + 1 \) q \)$. Each $U_l$ is nonincreasing throughout the scan. Starting with $O \( q^d \)$ points, a nonempty integer-sized set can undergo only $O \( q sigma \)$ such multiplicative decreases. Charge a step to its chosen $l$ and sum over $0 lt.eq l lt.eq d$. This proves the expensive-position bound in each scan.
  The constant-alphabet masks specify the ranks, types, and positions of all transmitted flags. Their cost is $O \( k \)$; there is no separate cost for the expensive positions. Conditional on the old context and masks, the transmitted values range over a product of $h$ old domains. Its logarithmic size is at most $h \( d sigma + Delta + O \( 1 \) \)$, without any independence assumption. This proves (5.5). The decoder reconstructs each scan by updating only at that scan’s expensive positions, ignoring values sent solely for the other scan. Given the reconstructed state and the encoded rank $r$, the fixed tie-breaking rule determines $l$; it need not be transmitted separately. The decoder therefore recovers all cheap restrictions. Choose $J_0 = d sigma + O \( 1 \)$ to bound their joint domains uniformly.
  All values outside $U$ are known at $theta_0$, so
  $ bb(E) H_(theta_0) \( F_U \) = H \( F divides theta_0 \) gt.eq H \( F \) - H \( theta_0 \) . $
  Lemma 6 and (5.5) consequently give
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( ell - h \) J_0 - H_(theta_0) \( F_U \) #scale(x: 120%, y: 120%)[\]] & lt.eq \( ell - bb(E) h \) J_0 - H \( F \) + H \( theta_0 \)\
 & lt.eq Lambda + O \( k \) + Delta bb(E) h - eta ell log sigma . $
  The terms $d sigma bb(E) h$ cancel. Dropping the last, nonpositive term gives (5.6) for $U$. For any specified history, the chain rule and the coordinate caps imply
  $ H_(theta_0) \( F_U \) lt.eq H_(theta_0) \( F_S \) + \| U \\ S \| J_0 . $
  Thus the deficit of $S$ is pointwise nonnegative and no larger than that of $U$, proving the full assertion. Finally, the upper estimate $H \( F divides theta_0 \) lt.eq \( ell - bb(E) h \) J_0$ combined with (5.5) proves (5.7). ◻
]

=== 5.2 Marginal classes and windows <marginal-classes-and-windows>

The same masks give more than a joint-domain bound. At a slot that is poor-cheap in at least one scan, choose one such orientation by fixed priority, and put $u = max { sigma \, min { d sigma \, log \| Z_l \| } }$ in that scan. The sets of possible first and second endpoints, denoted by $A$ and $B$, then satisfy

#[#set math.equation(numbering: n => "(5.8)")
 $ \| A \| lt.eq A_max = C e^(\( d + 1 \) sigma - u) \, #h(2em) \| B \| lt.eq B_max = C e^u \, #h(2em) sigma lt.eq u lt.eq d sigma . $ <mark:reciprocal-caps>]

Before clamping, these are precisely the bounds $C q^(d + 1) \/ \| Z_l \|$ and $\| Z_l \|$ proved above. Clamping at the lower end uses the ambient first-space bound $O \( q^d \)$; at the upper end it uses $\| Z_l \| lt.eq Q_d = O \( q^d \)$. Hence it changes only the uniform constant.

If a slot is popular-cheap in both scans, write $r \, r'$ for its forward and reverse-swapped ranks. In the forward orientation,

#[#set math.equation(numbering: n => "(5.9)")
 $ \| A \| lt.eq C q^(r') \, #h(2em) \| B \| lt.eq C q^r \,\
\# { a : \( a \, b \) upright(" is allowed") } lt.eq 2 q^(d - r) \, #h(2em) \# { b : \( a \, b \) upright(" is allowed") } lt.eq 2 q^(d - r') . $ <mark:high-caps>]

Here $1 lt.eq r \, r' lt.eq d$. If $r + r' lt.eq d + 1$, these bounds imply (5.8) with $u = r sigma$. Otherwise call the slot a #emph[high slot] and classify it by its two ranks, keeping the forward orientation. In a high class we use $A_max = C q^(r')$, $B_max = C q^r$.

Classify the reciprocal slots by orientation and by one of the bands

$ \| u - r sigma \| lt.eq K_(*) quad \( 1 lt.eq r lt.eq d \) \, #h(2em) \( r - 1 \) sigma + K_(*) < u < r sigma - K_(*) quad \( 2 lt.eq r lt.eq d \) . $

Call these the integer and open bands, respectively. Since $K_(*) = o \( sigma \)$, they form a partition for large $q$, after assigning boundary points to integer bands. There are only $O_d \( 1 \)$ classes. Also $h = O \( q sigma \) = o \( k \)$, so some class contains at least $c k$ slots at every history, with a fixed sufficiently small $c > 0$. Finite pigeonholing supplies a fixed class and a $theta_0$-determined event of probability bounded below on which that class has at least $c k$ slots. Condition on this event, and retain a deterministic number $Theta \( k \)$ of its slots by a fixed $theta_0$-based rule.

This conditioning leaves each law at a specified $theta_0$ unchanged. Because the subset deficit in (5.6) is nonnegative, its expected value increases by at most a fixed factor. Stream domination likewise changes only by a fixed factor. Reverse the retained order and interchange endpoints when that is the class’s orientation; this preserves consistency and entropy. Relabel the retained flags in this order. The domains and all their marginal restrictions remain valid under any later conditioning.

We henceforth use the enlarged budget

#[#set math.equation(numbering: n => "(5.10)")
 $ cal(B) = C \( Lambda + k + Delta q sigma \) \, #h(2em) cal(B) \/ k = O \( D sigma^(- beta) \) . $ <mark:budget>]

Discard an incomplete terminal window and partition the retained tuple into $w$ windows of a common deterministic length $m$, divisible by four, where

#[#set math.equation(numbering: n => "(5.11)")
 $ m asymp cases(delim: "{", q D sigma^(eta \/ 2) \, & upright("an open band") \,, q sigma^(1 + eta \/ 2) \, & upright("an integer band") \,, k \, & upright("a high class, with ") w = 1 .) #h(2em) w m = Theta \( k \) . $ <mark:windows>]

In the reciprocal cases $m = o \( k \)$, so this discarding loses $o \( k \)$ slots; in the high case discard at most three slots. In each window take the first and last quarters as representative blocks, leaving the middle half for targets.

=== 5.3 A deterministic exposure round <a-deterministic-exposure-round>

We now arrange that representative laws can be compared with most target laws at a small information cost. It matters that the exposure round is chosen from expectations, not after inspecting its flag values.

Conditioning to reduce dependence is a familiar correlation-rounding principle; compare #cite(label("RaghavendraTan2011")) Lemma 4.5. We require a maximum over representatives from separate blocks, so we prove the precise blockwise statement under the selected law.

Set $T_1 = floor.l q D sigma^(3000 beta) floor.r$. Before each of $T_1$ rounds, independently in every representative block choose one uniform unused index, independently also of all unexposed flags given the preceding history; then expose the chosen flags. Write $theta_t$ for the history before round $t$, starting with $theta_0$, and $U_t$ for the unexposed positions. Each block then has $n_t = m \/ 4 - t$ unused positions. The parameter inequalities give

$ T_1 / m = O #h(-1em) (cases(delim: "{", sigma^(3000 beta - eta \/ 2) \, & upright("open") \,, sigma^(3000 beta - eta) \, & upright("integer") \,, sigma^(3000 beta - 3 eta \/ 2) \, & upright("high") \,)) = o \( 1 \) . $

Thus $n_t = Theta \( m \)$ throughout. Let $E_t$ be the fresh index set. For $i in U_t$, let $cal(J)_i$ contain all members of $E_t$ except the representative in $i$’s own block, if $i$ is in a representative block. At the fixed older history define

$ delta_i = J_0 - H_(theta_t) \( F_i \) \, #h(2em) I_(i j) = I_(theta_t) \( F_i \; F_j \) \, #h(2em) M_i = max_(j in cal(J)_i) I_(i j) . $

An empty maximum is zero. Fresh index draws do not change these conditional flag laws.

#thm([Lemma 5.2.])[
  (Representative exposure).  #emph[There is a deterministic round $t < T_1$, depending only on the current joint law, such that, with $theta = theta_t$, $U = U_t$, and $E = E_t$, 
#[#set math.equation(numbering: n => "(5.12)")
 $ bb(E) sum_(i in U) delta_i & lt.eq cal(B) \, & bb(E) sum_(i in U) M_i & lt.eq C cal(B) \/ T_1 \,\
bb(E) sum_(i in E) delta_i & lt.eq C cal(B) \/ m \, & bb(E) sum_(i in E) M_i & lt.eq C cal(B) \/ \( m T_1 \) . $ <mark:representative-bounds>]

 All four expectations refer to the same pre-round history and fresh indices. No values $F_E$ have yet been exposed.]
] <mark:representatives>

#proof[
  At a history $h = theta_t$, put
  $ cal(D)_t \( h \) = \| U_t \| J_0 - H_h \( F_(U_t) \) \, #h(2em) cal(T)_t \( h \) = sum_(i in U_t) H_h \( F_i \) - H_h \( F_(U_t) \) . $
  Both are nonnegative. The initial subset bound gives $bb(E) cal(D)_0 lt.eq cal(B)$, and $cal(T)_0 lt.eq cal(D)_0$ since each marginal entropy is at most $J_0$. For a fixed fresh index set $E_t$, the entropy chain rule gives
  $ cal(D)_t \( h \) - bb(E) \[ cal(D)_(t + 1) divides h \, E_t \] = \| E_t \| J_0 - H_h \( F_(E_t) \) gt.eq 0 . $
  Consequently $bb(E) cal(D)_t lt.eq cal(B)$ at every round. Also $sum_i delta_i lt.eq cal(D)_t$, proving the first bound at every round, not just at the one eventually selected.
  Expansion of the entropies gives the exact total-correlation identity
  #[#set math.equation(numbering: n => "(5.13)")
   $ cal(T)_t \( h \) - bb(E) \[ cal(T)_(t + 1) divides h \, E_t \] = "TC"_h \( F_(E_t) \) + sum_(i in U_t \\ E_t) I_h \( F_i \; F_(E_t) \) . $ <mark:tc-drop>]
  Here $"TC"_h \( F_(E_t) \)$ is the sum of the selected marginal entropies minus their joint entropy, at history $h$. For each unselected $i$, data processing gives $M_i lt.eq I_h \( F_i \; F_(E_t) \)$. To include the selected positions, observe that for an $i$ in a representative block, $M_i$ is a function of the draws in the other blocks only. Its own block’s draw is uniform on $n_t$ indices and independent of those draws. Hence, conditional on $h$ and averaging only over the fresh indices,
  #[#set math.equation(numbering: n => "(5.14)")
   $ bb(E) [sum_(i in E_t) M_i thin mid(bar.v) thin h] = 1 / n_t bb(E) [sum_(i in U_t\
i upright(" in a representative block")) M_i thin mid(bar.v) thin h] lt.eq 1 / n_t bb(E) [sum_(i in U_t) M_i thin mid(bar.v) thin h] . $ <mark:selected-absorption>]
  Combining this with (5.13) yields
  $ \( 1 - n_t^(- 1) \) bb(E) [sum_(i in U_t) M_i thin mid(bar.v) thin h] lt.eq cal(T)_t \( h \) - bb(E) \[ cal(T)_(t + 1) divides h \] . $
  Now average and sum over $t < T_1$. The right-hand side telescopes and is at most $bb(E) cal(T)_0 lt.eq cal(B)$, while $n_t arrow.r oo$ uniformly. Some deterministic $t$ therefore has $bb(E) sum_i M_i lt.eq C cal(B) \/ T_1$. Finally, uniform sampling gives $bb(E) sum_(i in E_t) delta_i lt.eq n_t^(- 1) bb(E) sum_i delta_i$; (5.14) gives the identical factor for $M_i$. Since $n_t = Theta \( m \)$, both sampled bounds hold at that same round. ◻
]

=== 5.4 Endpoint mass bounds <endpoint-mass-bounds>

Fix the pre-round of Lemma 26. All definitions in the rest of this section are made at its conditional law, before revealing the fresh flags. Write $p_i \( a \, b \)$, $p_i^A \( a \)$, and $p_i^B \( b \)$ for the joint and endpoint masses. A first endpoint $a$ is #emph[good] if

$ p_i^A \( a \) gt.eq e^(- K) \/ A_(max \, i) \, #h(2em) bb(P)_theta #scale(x: 120%, y: 120%)[\(] p_i \( a \, B_i \) > e^K q^(- d) divides A_i = a #scale(x: 120%, y: 120%)[\)] lt.eq .02 . $

Define good second endpoints symmetrically, with $B_(max \, i)$. For high classes impose also $p_i^A \( a \) lt.eq e^K q^(- r')$ and $p_i^B \( b \) lt.eq e^K q^(- r)$, respectively. Endpoints outside the conditional support are not good.

#thm([Lemma 5.3.])[
  (Endpoint mass).  #emph[At every fixed history and unexposed slot $i$, the probability that either specified endpoint is not good is at most 
#[#set math.equation(numbering: n => "(5.15)")
 $ C (e^(- K) + frac(delta_i + 1, K)) . $ <mark:bad-endpoints>]

 This holds for both reciprocal and high classes, with their stated marginal caps.]
] <mark:endpoint-mass>

#proof[
  If a distribution $p$ is supported on at most $C e^L$ atoms and $Z = log \( p \( X \) e^L \)$, then $bb(P) \( - Z > t \) lt.eq min { 1 \, C e^(- t) }$. Integrating this bound gives $bb(E) Z_(-) lt.eq log C + 1$, after enlarging $C gt.eq 1$. Thus $bb(E) Z_(+) = L - H \( X \) + O \( 1 \)$. Apply this with $L = d sigma$ to the joint law at slot $i$. The cheap-domain cap yields
  $ bb(E)_theta \[ log \( p_i \( F_i \) q^d \) \]_(+) lt.eq delta_i + O \( 1 \) . $
  The mass of joint atoms exceeding $e^K q^(- d)$ is at most $C \( delta_i + 1 \) \/ K$. By Markov’s inequality, the marginal mass of endpoints for which their conditional heavy-atom probability exceeds $.02$ is at most fifty times this. The lower marginal cutoff excludes mass at most $e^(- K)$ by the support-size cap.
  For a high class, (5.9) also implies
  $ H_theta \( A_i \) gt.eq H_theta \( F_i \) - \( d - r' \) sigma - O \( 1 \) gt.eq r' sigma - delta_i - O \( 1 \) . $
  The same negative-part calculation, now using the support cap $C q^(r')$, bounds the mass of $p_i^A \( A_i \) > e^K q^(- r')$ by $C \( delta_i + 1 \) \/ K$. The second marginal uses $r$ instead of $r'$. ◻
]

=== 5.5 Reciprocal cores and rectangle charges <reciprocal-cores-and-rectangle-charges>

For reciprocal slots, we next convert small mutual information into small incidence probability between good opposite endpoints. The obstruction is a pair of flags in the same annihilator rectangle; simultaneous stream occupancy will bound the total contribution of such pairs.

Put $rho = .01 \/ \( d + 1 \)$. At a good first endpoint $a$ of slot $i$, define a subspace in the second system by

#[#set math.equation(numbering: n => "(5.16)")
 $ V_i \( a \) = ⋂_(x upright(" a first point")\
bb(P)_theta \( B_i ⟂̸ x divides A_i = a \) lt.eq rho) x^perp . $ <mark:cores>]

At a good second endpoint $y$ of slot $j$, define $U_j \( y \)$ in the first system by the symmetric rule, using tests in the second system and the law of $A_j$ given $B_j = y$. A basis chosen from the test covectors uses at most $d + 1$ tests, so each core captures at least $.99$ of its conditional endpoint law. Incidence of every flag shows that $a$ itself is a zero-error test and likewise for $y$. Thus

#[#set math.equation(numbering: n => "(5.17)")
 $ bb(P)_theta \( B_i subset.eq V_i \( a \) divides A_i = a \) gt.eq .99 \, #h(2em) a perp V_i \( a \) \,\
bb(P)_theta \( A_j subset.eq U_j \( y \) divides B_j = y \) gt.eq .99 \, #h(2em) y perp U_j \( y \) . $ <mark:core-capture>]

At a good $a$, joint nonheavy atoms have conditional mass at most $q^(- d) A_(max \, i) e^(2 K)$, and their intersection with the core has mass at least $.97$. A vector subspace of dimension $v$ contains at most $2 q^(v - 1)$ projective points. Since $K arrow.r oo$, this proves

#[#set math.equation(numbering: n => "(5.18)")
 $ dim V_i \( a \) & gt.eq ⌈d + 1 - frac(log A_(max \, i) + 3 K, sigma)⌉ \,\
dim U_j \( y \) & gt.eq ⌈d + 1 - frac(log B_(max \, j) + 3 K, sigma)⌉ . $ <mark:core-dimension>]

The extra $K$ absorbs the constant from the factor $2 \/ .97$.

#thm([Lemma 5.4.])[
  (Reciprocal incidence and collisions).  #emph[Fix a history $theta$ in the selected pre-round. For unexposed slots $i < j$ in a reciprocal class, write their flags as $\( a \, b \)$ and $\( c \, y \)$. There are symmetric nonnegative numbers $c_(i j) = c_(j i)$, with $c_(i i) = 0$, such that 
#[#set math.equation(numbering: n => "(5.19)")
 $ bb(P)_(upright("prod")) \( a \, y upright(" good") \, med a perp y \) lt.eq C \( I_(i j) + c_(i j) \) \, #h(2em) sum_(i < j) c_(i j) lt.eq C sigma k . $ <mark:incidence-charge>]

 Here the product law is the product of the two conditional flag marginals at $theta$. In an open band $c_(i j) = 0$. In an integer band, $c_(i j)$ is the conditional probability of a specified pair event placing both flags in one rectangle. For high classes set $c_(i j) = 0$; no incidence estimate is asserted for them.]
] <mark:collision>

#proof[
  Under the actual conditional joint law, the event ${ a perp y \, med c ⟂̸ b }$ has probability zero by consistency. The relative entropy of this law to the product law is $I_(i j)$. Lemma 7 therefore bounds the product probability of this reverse-conflict event by $C I_(i j)$. For given endpoints $a \, y$, let
  $ e \( a \, y \) = bb(P)_(upright("prod")) \( c ⟂̸ b divides a \, y \) . $
  Except for good-incidence mass at most $C I_(i j) \/ rho^2$, we have $e \( a \, y \) lt.eq rho^2$. For such endpoints, Markov’s inequality says that at least $1 - rho$ of the conditional $c$-mass satisfies $bb(P)_theta \( B_i ⟂̸ c divides A_i = a \) lt.eq rho$. These $c$ are tests defining $V_i \( a \)$. Every projective point of $V_i \( a \)$ consequently annihilates at least $1 - rho$ of the law of $c$ given $y$, and is a test defining $U_j \( y \)$. Hence
  #[#set math.equation(numbering: n => "(5.20)")
   $ U_j \( y \) subset.eq V_i \( a \)^perp . $ <mark:core-containment>]
  To check the rounding even when $u_i eq.not u_j$, take a common constant $C gt.eq 1$ in (5.8) and put $e_K = log C + 3 K$. Then (5.18) reads
  $ dim V_i \( a \) gt.eq ⌈frac(u_i - e_K, sigma)⌉ \, #h(2em) dim U_j \( y \) gt.eq ⌈d + 1 - frac(u_j + e_K, sigma)⌉ . $
  For large $q$, $e_K < K_(*)$ and $K_(*) + e_K < sigma$. In an open band indexed by $r$, we have $\( u_i - e_K \) \/ sigma > r - 1$ and $d + 1 - \( u_j + e_K \) \/ sigma > d + 1 - r$. Consequently the dimensions are at least $r$ and $d + 2 - r$. These dimensions rule out (5.20) in ambient vector dimension $d + 1$. All good-incidence mass is therefore exceptional, proving the claim with $c_(i j) = 0$.
  In an integer band indexed by $r$, the two expressions inside the ceilings are greater than $r - 1$ and $d - r$, respectively, since $u_i gt.eq r sigma - K_(*)$ and $u_j lt.eq r sigma + K_(*)$. The lower bounds are therefore $r$ and $d + 1 - r$. Containment forces
  #[#set math.equation(numbering: n => "(5.21)")
   $ dim V_i \( a \) = r \, #h(2em) U_j \( y \) = V_i \( a \)^perp . $ <mark:complementary-cores>]
  Let $Gamma_(i j)$ be the endpoint event that $a \, y$ are good and incident and satisfy (5.20). Define $G_(i j)$ by additionally requiring $b subset.eq V_i \( a \)$ and $c subset.eq U_j \( y \)$, and put $c_(i j) = bb(P)_theta \( G_(i j) \)$ in the actual joint law. Given $a \, y$ under the product law, $b$ and $c$ are independent with their respective conditional endpoint laws. Therefore
  $ bb(P)_(upright("prod")) \( G_(i j) \) gt.eq .99^2 bb(P)_(upright("prod")) \( Gamma_(i j) \) . $
  Applying Lemma 7 to $G_(i j)$ gives an upper bound $C \( I_(i j) + c_(i j) \)$ for its product probability. Add the $C I_(i j) \/ rho^2$ exceptional mass to obtain the first assertion of (5.19).
  It remains to bound the sum of charges without treating the history-dependent rectangles as fixed in advance. On $G_(i j)$, (5.17) and (5.21) imply
  $ b subset.eq V_i \( a \) \, quad a subset.eq V_i \( a \)^perp \, quad c subset.eq V_i \( a \)^perp \, quad y subset.eq V_i \( a \) . $
  Both flags thus belong to $cal(R) \( V_i \( a \) \)$. Fix the history and an actual realized tuple. For each fixed earlier slot $i$, all later slots charged to it lie in the single rectangle determined by that history and its actual first endpoint. The simultaneous occupancy bound holds for every rectangle, including this adaptively chosen one, on every stream in the support of the current law. No conditional stream-domination estimate is needed. There are at most $C sigma$ charged later slots for each $i$, and hence at most $C sigma k$ charged pairs, pointwise. Conditional expectation proves the second assertion of (5.19). ◻
]

=== 5.6 Good positions and representatives <good-positions-and-representatives>

The preceding information and collision bounds now give the uniform input needed for the next compression step. Keep the fresh representative indices, but still do not expose their values. The arrays $I_(i j)$ and $c_(i j)$ are determined by the older history $theta$ alone; only the representative lists $cal(J)_i$ depend on the fresh index draws. Call an unexposed index $i$ #emph[good] if

#[#set math.equation(numbering: n => "(5.22)")
 $ delta_i lt.eq D sigma^beta \, #h(2em) max_(j in cal(J)_i) \( I_(i j) + c_(i j) \) lt.eq sigma^(- 2000 beta) \/ q . $ <mark:good-index>]

This predicate depends only on the pre-round history and fresh indices.

#thm([Proposition 5.5.])[
  (Good-index fractions).  #emph[In every selected class, the expected proportion of bad unexposed indices is $o \( 1 \)$, and so is the expected proportion of bad fresh representatives. At every good index each endpoint is good with probability $1 - o \( 1 \)$, uniformly over the history and fresh indices. All limits hold for fixed $d \, eta$ and the stage constants.]
] <mark:good-indices>

#proof[
  There are $Theta \( k \)$ unexposed positions, because $T_1 = o \( m \)$. By (5.10) and Lemma 26, the expected proportion violating the deficit bound is at most
  $ C frac(cal(B) \/ k, D sigma^beta) = O \( sigma^(- 2 beta) \) . $
  Using half the second threshold for mutual information, the corresponding proportion is at most
  $ C frac(q sigma^(2000 beta) cal(B), k T_1) = O \( sigma^(- 1001 beta) \) . $
  Only integer bands have nonzero collision charges. At a fixed history, uniform sampling in blocks with $n_t = Theta \( m \)$ gives
  $ bb(E) [sum_(i in U) max_(j in cal(J)_i) c_(i j) thin mid(bar.v) thin theta] lt.eq C / m sum_(i \, j in U) c_(i j) lt.eq frac(C sigma k, m) . $
  The expected proportion exceeding half the collision threshold is therefore at most
  $ C q sigma^(2000 beta) sigma / m = O \( sigma^(2000 beta - eta \/ 2) \) = o \( 1 \) . $
  The maximum of $I_(i j) + c_(i j)$ is bounded by the sum of the two separate maxima, proving the first assertion.
  For fresh representatives, the expected deficit sum has an additional factor $C \/ m$ by (5.12). Each maximum over the other blocks is independent of its own block’s draw, so the same selected-index identity (5.14) applies to both mutual information and collision charges. Their expected sums also gain a factor $C \/ m$. The number of fresh representatives is $2 w = Theta \( k \/ m \)$, so their bad proportion obeys the same three vanishing bounds. This is an average statement and does not require that every representative be good simultaneously.
  Finally, at a good index,
  $ frac(delta_i + 1, K) lt.eq sigma^(- 2 beta) + \( D sigma^(3 beta) \)^(- 1) = o \( 1 \) . $
  Lemma 27 proves the uniform endpoint assertion. ◻
]

== 6 Replacing the context by a shorter description <comp:section>

The marking procedure gives useful conditional laws, but the history producing those laws is too large to retain indefinitely. We now replace that history by a new message which describes smaller flag domains. The encoder may use the old history and its conditional laws; the new decoder must work without them. This distinction is essential to iterating the construction.

Throughout this section the parameters are those of (2.8), and all constants may depend on the fixed dimension, on $eta$, and on fixed constants in the input hypotheses. In particular, $q$ may be taken sufficiently large in terms of those constants.

#thm([Lemma 6.1.])[
  (One compression step).  #emph[Let $F$ be a consistent tuple of deterministic length $c_0 k lt.eq ell lt.eq k$, for a fixed $c_0 > 0$, extracted in one of the two orientations from the flag stream. Suppose that the stream law is dominated by a fixed constant times its original independent law and is supported on the rectangle-occupancy event of Lemma 5. Let a discrete context $sans(C)$ specify a domain for each slot, with 
$ H \( sans(C) \) lt.eq Lambda \, #h(2em) \| upright("domain of each slot") \| lt.eq C q^d e^Delta \, #h(2em) Lambda \, Delta gt.eq 0 . $

 Define, as in (5.2), 
$ D = sigma^beta \( 1 + Lambda \/ k + Delta sigma^(- eta) \) \, #h(2em) sigma^beta lt.eq D lt.eq sigma^(1 - eta \/ 2) . $

 There is an extraction of a consistent tuple $F'$ of deterministic length $ell' = Theta \( k \)$, still in one of the two stream orientations, and a new discrete context $sans(C)'$ for which 
#[#set math.equation(numbering: n => "(6.1)")
 $ H \( sans(C)' \) & lt.eq Lambda' lt.eq C q P log \( w + 2 \) \( sigma + w P \) + C w sigma \,\
\| upright("domain of each slot of ") F' \| & lt.eq C q^d e^(Delta') \, #h(2em) Delta' lt.eq C K_(*) \,\
 & 1 lt.eq w lt.eq C sigma^(1 + eta \/ 2) \/ D . $ <comp:step-bounds>]

 Here $w$ is a deterministic integer fixed during the preparation of the step. The new decoder uses only $sans(C)'$, fixed public parameters, and fixed public tables; it does not use $sans(C)$. The extraction is obtained by conditioning on an event of probability bounded below by a positive constant. Consequently its stream law still has constant domination and satisfies the same occupancy bound. All constants, including the retained proportion, are independent of $q$. They and the sufficiently-large-$q$ threshold are uniform over the input laws and contexts: they depend only on $d \, eta \, c_0$ and fixed numerical bounds for the domination constant and the domain prefactor, not on the realized history or on $Lambda \, Delta$ within the stated admissible range.]
] <comp:step>

The preparation in Section 5 selects a class, an orientation, equal windows, a pre-round history $theta$, and fresh representative indices. It loses only a fixed proportion of the tuple, and has the entropy and goodness guarantees in Lemma 26 and Proposition 29. We first treat the high-rank classes. For the reciprocal classes we choose auxiliary supports, use them in a chronological tree of tests, and finally bound the length of the resulting message. This proves Lemma 30 at the end of the section.

=== 6.1 A bound for unions of rich subspaces <a-bound-for-unions-of-rich-subspaces>

The rich-subspace viewpoint was motivated by the finite-field Nikodym maximal estimates of Ellenberg, Oberlin, and Tao #cite(label("EOT")) Section 4.4, Theorem 4.6. The precise closure estimate used here is the Nie–Wang inequality identified below, not an application of those maximal estimates.

The high-rank construction will describe a second point by requiring its associated subspace to contain many points from a known row. The following finite-field bound controls the union of all subspaces that could pass this requirement. It is a consequence of Nie and Wang’s finite-degree closure inequality #cite(label("NieWang2015")) Theorems 4.1 and 5.6. We give a short evaluation-rank proof to make the precise density dependence available here.

#thm([Lemma 6.2.])[
  #emph[Write $"PG" \( d \, q \) = "PG" \( bb(F)_q^(d + 1) \)$. Let $X subset.eq "PG" \( d \, q \)$ and $0 < delta lt.eq 1$. Let $cal(V)$ be any family of nonzero vector subspaces of $bb(F)_q^(d + 1)$ satisfying 
$ \| X ∩ "PG" \( V \) \| gt.eq delta \| "PG" \( V \) \| #h(2em) \( V in cal(V) \) . $

 Then 
$ lr(|union.big_(V in cal(V)) "PG" \( V \)|) lt.eq C_d delta^(- \( d + 1 \)) \| X \| . $

]
] <comp:rich-union>

#proof[
  If $X$ or $cal(V)$ is empty, the result is immediate. Suppose otherwise, and put $n = d + 1$. Denote by $tilde(X)$ the set of all nonzero vector lifts of points of $X$, and by $tilde(Y)$ the nonzero vector points of the union of the spaces in $cal(V)$.
  We use the Schwartz–Zippel zero bound #cite(label("Schwartz1980")) #cite(label("Zippel1979")): a nonzero polynomial of total degree at most $h$ on $bb(F)_q^r$ has at most $h q^(r - 1)$ zeros. To see this, induct on $r$, writing the polynomial as a polynomial of degree $t$ in the last coordinate. Its nonzero leading coefficient has degree at most $h - t$ in the other coordinates. There are at most $\( h - t \) q^(r - 2)$ choices at which that coefficient vanishes; for every other choice there are at most $t$ roots in the last coordinate. The asserted bound follows, with the univariate case starting the induction.
  Fix a sufficiently small constant $c > 0$, and put $h = floor.l c delta q floor.r$. If $V$ has vector dimension $r$, at least $delta \( q^r - 1 \)$ of its vector points belong to $tilde(X)$. This is greater than $h q^(r - 1)$. Thus every polynomial of degree at most $h$ vanishing on $tilde(X)$ vanishes identically on each such $V$, and hence on $tilde(Y)$. Writing $upright("ev")_Z$ for evaluation on a set $Z$, restricted to these low-degree polynomials, gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ ker \( upright("ev")_(tilde(X)) \) subset.eq ker \( upright("ev")_(tilde(Y)) \) \, #h(2em) "rank" \( upright("ev")_(tilde(Y)) \) lt.eq \| tilde(X) \| . $ <comp:rich-rank-upper>]
  Here is a lower bound for this evaluation rank on an arbitrary nonempty set $Z subset.eq bb(F)_q^n$. The monomials with individual exponents less than $q$ span all functions on $bb(F)_q^n$, by coordinatewise Lagrange interpolation, so their evaluations on $Z$ have rank $\| Z \|$. If $h gt.eq 2 n$, partition their exponent box into boxes of side $a = floor.l h \/ n floor.r + 1$. Every box consists of a fixed monomial times monomials of total degree at most $n \( a - 1 \) lt.eq h$. Multiplication by that fixed monomial is a diagonal map on evaluations, and therefore cannot increase rank. The number of boxes is at most $C_d delta^(- n)$, giving
  $ "rank" \( upright("ev")_Z \) gt.eq c_d delta^n \| Z \| . $
  Apply this to $Z = tilde(Y)$, combine with (6.2), and divide by $q - 1$. If $h < 2 n$, then $delta q$ is bounded in terms of $d$. The result instead follows directly from $\| X \| gt.eq 1$ and the ambient bound $\| "PG" \( d \, q \) \| lt.eq 2 q^d$, after increasing $C_d$. ◻
]

=== 6.2 The high-rank classes <the-high-rank-classes>

When the early representative is good, we sample both rows from its conditional flag law restricted to good endpoints. The rows have different jobs. The first associates a candidate subspace with each second point. The second tests whether that subspace contains enough mass of the source’s second-endpoint law. Subspaces with substantial mass have a small union by Lemma 31; the independent second row rarely admits the remaining candidates. For coverage, consistency will instead show that the first endpoints of most actual targets annihilate the candidate subspace. The target law is kept unchanged throughout this comparison.

#thm([Lemma 6.3.])[
  #emph[Suppose the preparation in Section 5 produces a high-rank class with fixed vector ranks $r \, r'$, where $r + r' > d + 1$, and one window of length $Theta \( k \)$. There is a new context of length $O \( q sigma^(1 + beta) \)$ bits whose decoded flag domain has size at most $q^d e^(O \( K \))$. With probability bounded below, this domain contains a deterministic number $Theta \( k \)$ of middle targets, retained in their original order. The decoder does not need the old history or any conditional law.]
] <comp:high-rank>

#proof[
  Fix the history and fresh indices, and first suppose the early representative is good. Draw two independent rows, each of
  $ h = ceil.l q sigma^beta ceil.r $
  full flags from its conditional marginal conditioned on both endpoints being good. Write their entries $\( a_t^(\( 1 \)) \, b_t^(\( 1 \)) \)$ and $\( a_t^(\( 2 \)) \, b_t^(\( 2 \)) \)$. These are auxiliary samples, independent of the actual unexposed tuple given the history and indices. By (5.9) and Lemma 27, their first and second marginal atom sizes are at most $C e^K \/ q^(r')$ and $C e^K \/ q^r$, respectively, and their support sizes are at most $C q^(r')$ and $C q^r$.
  For every second-system projective point $y$, form the vector space
  $ V_y = "span" #scale(x: 120%, y: 120%)[\(] y \, med b_t^(\( 1 \)) : a_t^(\( 1 \)) perp y \, med 1 lt.eq t lt.eq h #scale(x: 120%, y: 120%)[\)] . $
  The decoded domain consists of all flags $\( c \, y \)$ satisfying
  #[#set math.equation(numbering: n => "(6.3)")
   $ dim V_y = r \, #h(2em) c perp V_y \, #h(2em) \# { t : b_t^(\( 2 \)) subset.eq V_y } gt.eq .1 h \/ q . $ <comp:high-domain>]
  Here and below, dimensions of the spaces $V_y$ are vector dimensions. Because $y subset.eq V_y$, every pair allowed by (6.3) is indeed an incident flag.
  ===== 6.2.1 Coverage. <coverage.>
  Consider an actual target at a good middle index, and write it $\( c \, y \)$. The weighted variance estimate of Lemma 3 shows that, except for at most $O \( q^(d + 1 - r') e^K \)$ values of $y$, a source sample satisfies $a perp y$ with probability at least $.4 \/ q$. The mass of these exceptions at a good target endpoint is at most
  $ C q^(d + 1 - r - r') e^(2 K) = o \( 1 \) . $
  For a nonexceptional $y$, while the first-row span has dimension less than $r$, it contains at most $C q^(r - 2)$ second points. The probability that a sample second endpoint belongs to that span is at most $C e^K \/ q^2 = o \( 1 \/ q \)$. A sample therefore increases the span with probability at least $.3 \/ q$ while its rank is too small. Dividing the row into a fixed number of pieces proves that the first-row span reaches rank $r$ with failure probability $o \( 1 \)$. Independently, the second row has at least $.1 h \/ q$ first-endpoint hits on $y$, again with failure probability $o \( 1 \)$.
  Consistency of the actual early representative and target, Lemma 7, and (5.22) bound the product-law conflict probability $bb(P) \( a perp y \, med c ⟂̸ b \)$ by $C sigma^(- 2000 beta) \/ q$. Conditioning the auxiliary source on good endpoints changes this by only a constant factor. Across both rows, the probability of any conflict is at most $O \( sigma^(- 1999 beta) \) = o \( 1 \)$. In the absence of a conflict, $c$ annihilates the span generated by $y$ and the second endpoints of all first-endpoint hits in both rows.
  Write $W_y$ for that combined span. We next bound the joint event ${ dim W_y > r \, med c perp W_y }$, without conditioning on the absence of conflicts or on successful span growth. Fixing both auxiliary rows leaves the actual target law equal to its original conditional law $p_i$: the conditioning on good endpoints was applied only to the auxiliary source. Thus the target still has at most $C q^r$ possible second endpoints; for each such $y$, a combined span of dimension at least $r + 1$ has at most $2 q^(d - r - 1)$ annihilating first points. Excluding joint atoms larger than $e^K q^(- d)$, their total target probability is at most $C e^K \/ q = o \( 1 \)$. The excluded atom mass is $O \( \( delta_i + 1 \) \/ K \) = o \( 1 \)$, by the proof of Lemma 27. If $r = d$, an excessive span is the whole vector space and has no projective annihilator. In particular,
  $ bb(P) \( dim W_y > r \, med c perp W_y \) lt.eq bb(P) { p_i \( F_i \) > e^K q^(- d) } + C e^K \/ q = o \( 1 \) . $
  Thus the first-row and combined spans both have dimension exactly $r$, outside an $o \( 1 \)$ exceptional probability. Every second-row first-endpoint hit then has its second endpoint in $V_y$, proving (6.3).
  The expected number of bad middle indices is $o \( k \)$, as is the loss from bad target endpoints. A bad early representative can be declared a failure at cost $o \( 1 \)$. We have therefore proved coverage of the middle targets with expected loss $o \( k \)$.
  ===== 6.2.2 Size. <size.>
  Fix the first row. For every $y$ with $dim V_y = r$, set
  $ a_y = q bb(P) \( b subset.eq V_y \) \, $
  where $\( a \, b \)$ is a further independent sample from the same source law. Let $X$ be the source’s second-endpoint support. If $a_y gt.eq u > 0$, the atom bound implies
  $ \| X ∩ "PG" \( V_y \) \| gt.eq c u q^(r - 1) e^(- K) . $
  For $0 < u lt.eq u_0$, with $u_0 > 0$ fixed and small, this is relative density at least $c u e^(- K)$ in $"PG" \( V_y \)$. Since $y in "PG" \( V_y \)$, Lemma 31 gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ \# { y : dim V_y = r \, med a_y gt.eq u } lt.eq C q^r \( C e^K \/ u \)^(d + 1) . $ <comp:high-tail>]
  The same bound at $u = u_0$ accounts for every candidate above that threshold. On a dyad $u lt.eq a_y < 2 u$ below $u_0$, the second-row count in (6.3) is binomial with mean at most $2 h u \/ q$. Its probability of reaching $.1 h \/ q$ is at most
  $ \( C u \)^(.1 h \/ q) . $
  For completeness, put $t = h \/ \( 10 q \)$ and $u_j = u_0 thin 2^(- j - 1)$, $j gt.eq 0$. If $C_0$ is the constant in the binomial bound, the contribution of all these dyads is at most
  $ C q^r e^(\( d + 1 \) K) frac(C_0^t \( u_0 \/ 2 \)^(thin t - d - 1), 1 - 2^(- \( t - d - 1 \))) . $
  For large $q$, $t gt.eq d + 2$. Choose $u_0$ so that $C_0 u_0 lt.eq 1 \/ 2$. The displayed fraction is then bounded uniformly in $t$, so no factor exponential in $h \/ q$ remains. Together with the count for $a_y gt.eq u_0$, the expected total number of admitted second points is at most $q^r e^(O \( K \))$. These dyads cover every arbitrarily small positive $a_y$; candidates with $a_y = 0$ never pass. Markov’s inequality gives the same bound, with an enlarged constant, with high constant probability. Each admitted point has at most $2 q^(d - r)$ first-point partners, giving the claimed flag-domain bound.
  The decoder receives the two raw rows and $r$, so the message length is $O \( h sigma \) = O \( q sigma^(1 + beta) \)$. Definition (6.3) uses neither $X$, the probabilities $a_y$, nor any other hidden marginal data. The size event and the event of retaining a prescribed positive fraction of the middle targets have intersection of probability bounded below. On that event retain the first prescribed number in order. ◻
]

=== 6.3 Auxiliary supports in a reciprocal class <auxiliary-supports-in-a-reciprocal-class>

We now treat the reciprocal classes. All conditional probabilities in this subsection are given the history $theta$ and the fresh indices. An auxiliary support is a random set sampled from these conditional laws, independently of the actual unexposed flags. The useful property is not merely that this set is large: its averaged uniform measure must be controlled pointwise.

#thm([Lemma 6.4.])[
  #emph[At every good index in a reciprocal class, there are auxiliary choices of first and second supports consisting entirely of good endpoints. If $A$ is the first support and $p_i^A$ the conditional first-endpoint law, then 
#[#set math.equation(numbering: n => "(6.5)")
 $ 1 / 2 A_(max \, i) e^(- K) lt.eq \| A \| lt.eq A_(max \, i) \, #h(2em) bb(E) frac(bold(1)_({ a in A }), \| A \|) lt.eq C p_i^A \( a \) . $ <comp:support-measure>]

 The analogous assertions hold for the second support $B$. All such support choices can be made mutually independently, conditional on the history and indices.]
] <comp:supports>

The pointwise inequality is the link to the preceding section: integrating an incidence indicator against the averaged uniform support measure costs only a constant relative to the original marginal law. It does not assert that every chosen pair of supports is sparse. We first transfer incidence bounds under these independent choices and only later test the realized supports.

#proof[
  Partition each positive marginal support into levels according to $floor.l - log p floor.r$. This nonnegative integer has mean at most the marginal entropy, which is $O \( sigma \)$. Comparison with a geometric distribution of comparable mean, using nonnegativity of relative entropy, bounds its entropy by $O \( log sigma \)$.
  For a pair of level sets $A_0 \, B_0$, put
  $ x = log \( A_(max \, i) \/ \| A_0 \| \) \, #h(2em) y = log \( B_(max \, i) \/ \| B_0 \| \) . $
  These numbers are nonnegative. The reciprocal caps (5.8) and incidence mixing give
  $ e \( A_0 \, B_0 \) lt.eq C q^d #scale(x: 120%, y: 120%)[\(] e^(- x - y) + e^(- \( x + y \) \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq C' q^d e^(- \( x + y \) \/ 2) . $
  Apply the entropy chain rule to the two level indices and then bound the conditional flag entropy by the logarithm of this count. Since $H_theta \( F_i \) = J_0 - delta_i$, this gives
  $ bb(E) \( x + y \) lt.eq C \( delta_i + log sigma + 1 \) . $
  At a good index, $delta_i \/ K lt.eq sigma^(- 2 beta)$, and $log sigma = o \( K \)$. Levels whose loss exceeds $K$ therefore carry $o \( 1 \)$ marginal mass.
  Within each level the positive weights differ by at most a factor $e$. If more than half its points are bad, its bad points carry at least $1 \/ \( 2 e \)$ of the level’s mass. Equation (5.15) consequently shows that such levels also carry only $o \( 1 \)$ mass. Keep the levels with loss at most $K$ and at least half of their points good. Choose one with probability proportional to its original marginal mass, and take its subset of good points. The size assertion follows immediately. The retained levels have total mass at least $1 \/ 2$ for large $q$. For a point in a retained level, its level mass divided by the number of good points in that level is at most $2 e$ times its own mass. The renormalization costs at most another factor $2$, proving the pointwise bound. The same construction applies to the other endpoint and uses independent auxiliary randomness when desired. ◻
]

For brevity put $epsilon = sigma^(- 2000 beta)$. For good representatives $i < j$ in distinct representative blocks, (5.19), (5.22), and (6.5) give

#[#set math.equation(numbering: n => "(6.6)")
 $ bb(E) frac(e \( A_i \, B_j \), \| A_i \| \| B_j \|) lt.eq C epsilon \/ q . $ <comp:average-incidence>]

Here the two auxiliary support choices are independent. Their uniform measures vanish outside the good endpoints, which is precisely the endpoint restriction in the collision bound. The same argument, using only one auxiliary support, gives

#[#set math.equation(numbering: n => "(6.7)")
 $ bb(E) sum_(a \, y) frac(bold(1)_({ a in A_i }), \| A_i \|) p_t^B \( y \) bold(1)_({ y med upright("good") }) bold(1)_({ a perp y }) & lt.eq C epsilon \/ q &  & \( i < t \) \,\
bb(E) sum_(a \, y) p_t^A \( a \) bold(1)_({ a med upright("good") }) frac(bold(1)_({ y in B_j }), \| B_j \|) bold(1)_({ a perp y }) & lt.eq C epsilon \/ q &  & \( t < j \) \, $ <comp:target-incidence>]

whenever $t$ is a good middle target and the representative in question belongs to its fresh representative list.

These incidence bounds also control the chronological movement of the reciprocal parameter $u$. For good representatives $i < j$ in distinct blocks,

#[#set math.equation(numbering: n => "(6.8)")
 $ u_j lt.eq u_i + C K . $ <comp:order>]

Indeed, if the difference exceeded a sufficiently large multiple of $K$, the lower support sizes in (6.5) and the reciprocal cap formulas would give

$ \| A_i \| \| B_j \| gt.eq c q^(d + 1) exp \( u_j - u_i - 2 K \) gt.double q^(d + 1) $

for every support choice. Mixing would force incidence density at least $c \/ q$, contradicting (6.6).

Delete a window if either representative is bad. The expected number deleted is $o \( w \)$, by Proposition 29. In an open band, additionally delete a window if $u_(upright("early")) - u_(upright("late")) > K_(*)$. Before this additional deletion, the total downward movement in the chronological list of retained representatives is at most

$ C sigma + C K w . $

To justify this, its total upward movement is at most $C K$ per step by (6.8), while all $u$’s lie in an interval of length $O \( sigma \)$. The additional deletions therefore number at most

$ C \( sigma + K w \) \/ K_(*) = o \( w \) \, $

because in an open band $w asymp sigma^(1 + eta \/ 2) \/ D$, so $sigma \/ \( w K_(*) \) = O \( sigma^(- eta \/ 2 - 6 beta) \)$ and $K \/ K_(*) = sigma^(- 3 beta)$. In an integer band there is no additional deletion: the two parameters already differ by at most $2 K_(*)$.

For each remaining window choose $A$ at the early representative and $B$ at the late representative, using Lemma 33. Make all these choices independently, and independently of the remaining flags given the history and fresh indices. Every resulting pair satisfies

#[#set math.equation(numbering: n => "(6.9)")
 $ \| A \| \| B \| gt.eq q^(d + 1) e^(- C K_(*)) . $ <comp:product>]

Both (6.6) and (6.7) apply to the corresponding supports, including those in the same window. These are averages under the original independent support choices, before any further support-dependent selection.

=== 6.4 A chronological tree of fresh tests <a-chronological-tree-of-fresh-tests>

At this point the surviving list of windows is fixed by the history and fresh indices, before the auxiliary supports are chosen. If it is empty we declare failure. Otherwise build the balanced binary search tree on this list: the middle window is the root, and the earlier and later halves are treated recursively. Its depth is at most $C log \( w + 2 \)$, where $w$ is the original number of windows. Every node has inherited first and second point domains, denoted $U_A \, U_B$; initially both are full projective spaces.

At a pivot with original auxiliary supports $A \, B$, form the trimmed supports

$ S = A ∩ U_A \, #h(2em) T = B ∩ U_B . $

If either size is less than $.9$ of its original support, or if

$ frac(e \( A \, B \), \| A \| \| B \|) > sigma^(- 1000 beta) / q \, $

delete the whole subtree. Otherwise put $n_A = \| S \|$, $n_B = \| T \|$ and

$ d_A = log \( \| U_A \| \/ n_A \) \, #h(2em) d_B = log \( \| U_B \| \/ n_B \) . $

The pair $S \, T$ satisfies the hypotheses of Lemma 10: by (6.9) its product is at least $q^(d + 1) e^(- C K_(*))$, and its incidence density is at most $C sigma^(- 1000 beta) \/ q$. Orient the description toward its smaller side and use Lemma 11 to produce both caps, denoted $U'_A \, U'_B$. If any part fails, delete the subtree. A successful pivot uses both caps for its own targets. Its left child inherits $\( U'_A \, U_B \)$, and its right child inherits $\( U_A \, U'_B \)$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[pivot window#linebreak()inherited $(U_A,U_B)$]])
  content((-3, -1.6), [#text(size: 9pt)[earlier windows#linebreak()\(\(U\_A',U\_B\)\)]])
  content((3, -1.6), [#text(size: 9pt)[later windows#linebreak()\(\(U\_A,U\_B'\)\)]])
  line((0, 0), (-3, -1.6), stroke: (thickness: 0.4pt), mark: (end: ">"))
  content((-1.5, -0.8), [#text(size: 9pt)[test from $B$]], anchor: "south-east")
  line((0, 0), (3, -1.6), stroke: (thickness: 0.4pt), mark: (end: ">"))
  content((1.5, -0.8), [#text(size: 9pt)[test from $A$]], anchor: "south-west")
})],
  caption: [Figure 2: A pivot restricts the first points to its left and the second points to its right. Its own targets use both new caps. This is exactly the time direction in (6.6) and (6.7). ],
) <comp:tree-figure>

All calls use fresh independent public tables. Their acceptance predicates are exactly those prescribed in Lemmas 10 and 11, applied to the trimmed inputs $S \, T$ and the captured subsets produced by those lemmas. These inputs are determined by the original auxiliary supports, the history and indices, and earlier auxiliary tables. Conditional marginal laws are used to choose the original supports, not as an additional acceptance filter. No call inspects actual unexposed flags. Thus, given the history and indices, the entire auxiliary construction remains independent of those flags. In the loss estimates below, we compare each test’s hidden source with its original pivot support, which still supplies the unconditioned incidence bounds.

#thm([Lemma 6.5.])[
  #emph[The expected number of middle targets lost through the pre-tree deletions, deleted subtrees, or exclusion by the produced caps is $o \( k \)$. In particular, a prescribed deterministic number $Theta \( k \)$ of targets can be retained in order with probability bounded below.]
] <comp:tree-loss>

#proof[
  The pre-tree deletions have already been bounded, and all windows have equal size. It remains to analyze the tests without conditioning on the later retention of a window.
  Fix the history, indices, all original support choices, and any earlier auxiliary data making a validation test ready. In the first validation test the hidden source is the intersection of the described set with one trimmed support. Description capture and the $.9$ trim make it a fixed positive fraction of the corresponding original support. If this test succeeds, the second test’s hidden source is also a fixed positive fraction of its original support, by the $.99$ capture assertion of Lemma 11. For either test and every fixed opposite point $y$, let $E_y$ be the event that the test is produced and excludes $y$ by its ambient test. Lemma 12 gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ bb(P) \( E_y divides upright("readiness data") \) lt.eq C q frac(\| X ∩ N \( y \) \|, \| X \|) \, $ <comp:pointwise-test>]
  where $X$ is that test’s original pivot support. The right side no longer depends on the readiness data. The contribution is zero if the node is not reached or the test is not ready. We may consequently average over all earlier auxiliary data with no additional conditioning.
  More explicitly, fix one ancestor test and a descendant’s corresponding original support $Y$. Let $L$ be the fraction of $Y$ excluded by that test, set to zero when the test is not produced. If $cal(H)$ denotes the history and indices, and $cal(S)$ all original support choices, averaging over readiness data gives
  $ bb(E) \( L divides cal(H) \, cal(S) \) lt.eq C q frac(e \( X \, Y \), \| X \| \| Y \|) . $
  This bound is not conditioned on reaching the test. Now average the original support choices under their original independent law. The chronological inheritance rule ensures that the pair is always an earlier first support against a later second support. Equation (6.6) bounds the expected lost fraction by $C epsilon$ per ancestor test. This remains true when readiness data or the prescribed acceptance predicates depend on other original support sets: those sets were fixed before (6.10) was applied.
  At a node of depth $j$, failure of a trim after all previous successes requires loss of at least one tenth of an original support to its ancestor tests. The joint probability of this event and reaching the node is therefore at most $C j epsilon$. By (6.6) and Markov’s inequality, the unconditional same-node density rejection probability is at most $C sigma^(- 1000 beta)$. Conditional on reaching a ready node, a description or validation failure costs $C e^(- c q)$, uniformly in its input data. Hence, if $H = C log \( w + 2 \)$, a fixed window’s probability of deletion somewhere along its path is at most
  #[#set math.equation(numbering: n => "(6.11)")
   $ C epsilon H^2 + C sigma^(- 1000 beta) H + C e^(- c q) H = o \( 1 \) . $ <comp:subtree-loss>]
  For an actual good middle target, instead integrate (6.10) against its unnormalized good endpoint mass. Independence of the auxiliary construction from actual unexposed flags and (6.7) give an exclusion probability at most $C epsilon$ per relevant ancestor test. Both tests are relevant at the target’s own pivot. This count includes a first test as soon as it is produced, even if the second test subsequently fails. Neither this estimate nor (6.11) conditions on eventual survival of a descendant or target.
  The expected bad-index fraction tends to zero by Proposition 29, and the bad-endpoint mass at every good index tends uniformly to zero by Lemma 27. Combining these losses with (6.11) and the $O \( H \)$ relevant tests gives expected total loss $o \( k \)$. The original middle-target population is a fixed positive multiple of $k$. With probability tending to one, at least a prescribed smaller positive multiple remains; retain the first prescribed number in order. ◻
]

=== 6.5 The new decoder and its message length <the-new-decoder-and-its-message-length>

The loss argument has shown that many targets survive. We must now verify that their domains can be reconstructed from the new message alone, and that the message has the bound asserted in Lemma 30.

The message specifies the surviving-list tree, construction statuses, all successful node descriptions and validation messages, the necessary support sizes and orientations, and the number of retained targets at each pivot. These additional discrete data cost $O \( w sigma \)$ bits. In particular, original slot labels are not sent. Traversing the tree in chronological order and using the retained counts specifies the domain of each new tuple slot.

The decoder starts with full point domains, prescribed public parameters, and a fresh table address for every call at every tree address. It reconstructs the domains recursively from successful messages. At each successful node its header supplies $n_A \, n_B$ and the orientation and mode choices. The inherited domains then determine $d_A \, d_B$. In particular, the validation row lengths $ceil.l C_0 q \( d_A + 1 \) ceil.r$ and $ceil.l C_0 q \( d_B + 1 \) ceil.r$, and the associated finite search cutoffs, are determined from these data and public constants. Any other row-length diagnostics required inside a description are sent within that lemma’s message budget. Table addresses consist of the binary tree word, the call phase (description, first validation, or second validation), and the internal call address used by that subroutine. Thus neither the table choice nor a variable row length requires the old history. An acceptance predicate can involve a hidden support, but the accepted proposal row is recoverable from its transmitted index without checking that predicate again. A failed construction deletes its whole subtree; no retained descendant depends on a failed test that was not transmitted. This also explains why descriptions of failed constructions need not be part of the message. None of this reconstruction uses the old context, conditional laws, or hidden support sets.

At a successful node, validation gives

$ \| U'_A \| lt.eq C q^(d + 1) \/ n_B \, #h(2em) \| U'_B \| lt.eq C q^(d + 1) \/ n_A . $

Since $n_A n_B gt.eq q^(d + 1) e^(- C K_(*))$, mixing between the two caps gives at most

#[#set math.equation(numbering: n => "(6.12)")
 $ C q^d e^(C K_(*)) $ <comp:new-domain>]

incident flags in their product. This is the domain assigned to each retained target at that pivot.

An independent ambient-size bound at each node would charge $O \( sigma \)$ at every pivot. Instead, the two children jointly receive the parent’s two marginal gaps, up to $O \( K_(*) \)$. We use this additive bound to sum the costs level by level. Put

$ G = log \( \| U_A \| \| U_B \| \/ q^(d + 1) \) $

at a node with nonempty data. Its support gaps obey

#[#set math.equation(numbering: n => "(6.13)")
 $ d_A + d_B lt.eq G + C K_(*) . $ <comp:gap-potential>]

The description and validation together cost $O \( q P \( d_A + d_B + P \) \)$. For a successful node the children satisfy

$ G_(upright("left"))^(+) lt.eq d_B + C \, #h(2em) G_(upright("right"))^(+) lt.eq d_A + C \, #h(2em) x^(+) = max \( x \, 0 \) . $

Indeed the left child inherits $U'_A \, U_B$, so its untruncated potential is at most $log \( C \| U_B \| \/ n_B \) = d_B + C$; the other child is symmetric. It follows from (6.13) that

#[#set math.equation(numbering: n => "(6.14)")
 $ G_(upright("left"))^(+) + G_(upright("right"))^(+) lt.eq G^(+) + C K_(*) . $ <comp:potential-branch>]

The root potential is $O \( sigma \)$. Pruning can only reduce a positive-potential sum, and charging (6.14) to the at most $w$ ancestors shows that the sum of positive potentials at any level is at most $C \( sigma + w K_(*) \)$. There are $O \( log \( w + 2 \) \)$ levels. Summing the successful node costs, using $K_(*) = o \( P \)$, and including the additional discrete data gives the deterministic bound

#[#set math.equation(numbering: n => "(6.15)")
 $ C q P log \( w + 2 \) \( sigma + w P \) + C w sigma . $ <comp:tree-cost>]

All row searches have the prescribed finite cutoffs of the description and validation lemmas, so this is a maximum message-length bound, not only an expected one. Self-delimiting messages convert it to the same entropy bound after an absolute constant adjustment.

#proof[
  Apply the preparation of Section 5. Its class selection conditions on an event of probability bounded below; its choices and orientation are determined by the revealed history. In a high-rank class use Lemma 32, with $w = 1$. Its cost $O \( q sigma^(1 + beta) \)$ is bounded by (6.1), and its exponent $O \( K \)$ is $O \( K_(*) \)$. In a reciprocal class use the support construction, tree, and Lemma 34. Equations (6.12) and (6.15) give the required output budgets. The window sizes in (5.11) imply
  $ w lt.eq C sigma^(1 + eta \/ 2) \/ D $
  in both reciprocal cases, and this bound also holds for $w = 1$ under the admissible range of $D$.
  Initially average over the fresh public tables as well as the auxiliary support choices and other randomness. The preceding arguments give a probability bounded below of having the required number of targets and all asserted output properties. Hence some fixed choice of the entire public table family retains a bounded-below probability of this event. Fix that family first, then condition on successful extraction of the prescribed deterministic length. The fresh table family was independent of the input stream, so fixing it does not change the input stream’s marginal law. For any stream event, the subsequent success conditioning increases its probability by at most the reciprocal of the fixed success probability. Thus constant domination persists, while the occupancy property persists pointwise. The retained tuple is an ordered subtuple in the selected orientation and remains consistent.
  The message-length and domain bounds hold for every successful history and every fixed table realization, not merely on average over histories. They therefore remain valid under this possibly biased conditioning. The new context is precisely its standalone message, not that message together with the old history. Consequently its entropy and slot domains satisfy (6.1), with fixed constants, as asserted. ◻
]

== 7 Completion of the construction and the Ramsey bounds <end:section>

The preceding compression step replaces an old description by a new one while retaining a fixed positive fraction of the selected tuple. We now iterate that replacement a bounded number of times. The final description has too little entropy to encode a selected tuple from the original stream. We then pass from the resulting prime-indexed graphs to every sufficiently large integer $t$ and prove the matching upper estimate.

=== 7.1 A bounded number of compression stages <end:construction>

#proof[
  Fix $d gt.eq 5$ and $0 < eta < 1 \/ 10$, with all the parameters of Equation (2.1). Suppose, for a contradiction, that every stream has a consistent $k$-tuple. Select one by a fixed rule, and condition on the simultaneous rectangle event of Lemma 5. For large $q$ this event has probability at least $1 \/ 2$, so the new stream law is dominated by twice the iid law. The selected tuple has deterministic length $k$.
  Initially the context is empty. Its entropy budget is $Lambda_0 = 0$, and the full flag domain has size
  $ Q_d Q_(d - 1) lt.eq 4 q^d exp \( \( d - 1 \) sigma \) . $
  Thus we may take $Delta_0 = \( d - 1 \) sigma$. The stage parameter defined in Equation (5.2) is initially
  $ D_0 = sigma^beta #scale(x: 120%, y: 120%)[\(] 1 + \( d - 1 \) sigma^(1 - eta) #scale(x: 120%, y: 120%)[\)] = O \( sigma^(1 - eta + beta) \) \, $
  which lies in the admissible interval $\[ sigma^beta \, sigma^(1 - eta \/ 2) \]$ for sufficiently large $q$.
  Consider any admissible stage with budgets $Lambda \, Delta$ and parameter $D$. By Lemma 30, its replacement context has budgets satisfying
  #[#set math.equation(numbering: n => "(7.1)")
   $ Lambda' lt.eq C q P log \( w + 2 \) \( sigma + w P \) + C w sigma \, #h(2em) Delta' lt.eq C K_(*) \, #h(2em) 1 lt.eq w lt.eq C sigma^(1 + eta \/ 2) \/ D . $ <end:one-step-budget>]
  The high-rank case is included with $w = 1$. The constants may depend on $d \, eta$, a fixed lower bound for $ell \/ k$, and fixed upper bounds for the stream domination factor and the domain prefactor. They are uniform over all input laws, contexts, conditional histories, and class choices satisfying those numerical bounds, as in Lemma 30. Using $k asymp q sigma^(1 + eta)$ and $P lt.eq 4 D sigma^(9 beta)$, the three terms to estimate satisfy
  $ frac(q P sigma, k) lt.eq C D sigma^(9 beta - eta) \, #h(2em) frac(q P^2 w, k) lt.eq C D sigma^(18 beta - eta \/ 2) \, #h(2em) frac(w sigma, k) lt.eq frac(C q^(- 1) sigma^(1 - eta \/ 2), D) . $
  Also $log \( w + 2 \) = O \( log \( sigma + 2 \) \)$. We obtain
  #[#set math.equation(numbering: n => "(7.2)")
   $ Lambda' / k & lt.eq C D log \( sigma + 2 \) #scale(x: 120%, y: 120%)[\(] sigma^(9 beta - eta) + sigma^(18 beta - eta \/ 2) #scale(x: 120%, y: 120%)[\)] + frac(C w sigma, k)\
 & lt.eq D sigma^(- eta \/ 3) . $ <end:entropy-contraction>]
  Indeed, $w sigma \/ k lt.eq C q^(- 1) sigma^(1 - eta \/ 2) \/ D$ is exponentially small in $sigma$, uniformly for admissible $D$. The other two terms have exponents strictly below $- eta \/ 3$, because $beta = eta \/ 10^7$; their fixed constants and logarithmic factor are absorbed for large $q$.
  Recompute the stage parameter from the new budgets, without retaining the old context. Equations (5.2) and (7.2) give
  #[#set math.equation(numbering: n => "(7.3)")
   $ D_(upright("new")) & = sigma^beta #scale(x: 120%, y: 120%)[\(] 1 + Lambda' \/ k + Delta' sigma^(- eta) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq sigma^beta + D sigma^(beta - eta \/ 3) + C D sigma^(7 beta - eta)\
 & lt.eq sigma^(2 beta) + D sigma^(- eta \/ 4) . $ <end:parameter-contraction>]
  The last inequality follows from $beta - eta \/ 3 < - eta \/ 4$ and $7 beta - eta < - eta \/ 4$. This recurrence preserves admissibility: its lower bound $D_(upright("new")) gt.eq sigma^beta$ follows from the definition, while
  $ sigma^(2 beta) + sigma^(1 - 3 eta \/ 4) lt.eq sigma^(1 - eta \/ 2) $
  for large $q$.
  Choose the number of stages in advance, for example $T = ceil.l 8 \/ eta ceil.r$. Iterating Equation (7.3), and using $D_0 lt.eq sigma$ for large $q$, gives
  $ D_T lt.eq sigma^(1 - T eta \/ 4) + frac(sigma^(2 beta), 1 - sigma^(- eta \/ 4)) lt.eq 2 sigma^(2 beta) . $
  One further compression stage produces budgets $Lambda_(*) \, Delta_(*)$ with
  #[#set math.equation(numbering: n => "(7.4)")
   $ Lambda_(*) / k lt.eq 2 sigma^(2 beta - eta \/ 3) = o \( 1 \) \, #h(2em) frac(Delta_(*) q sigma, k) lt.eq C sigma^(8 beta - eta) = o \( 1 \) . $ <end:final-budgets>]
  We justify explicitly the probabilistic invariants throughout this iteration. At each stage Lemma 30 first averages over fresh public tables and fixes a table family with an extraction event of probability bounded below. It then conditions on that event and retains a prescribed deterministic number of slots in one of the two allowed orientations. The new decoder uses only its new context and its fixed tables. In particular, its entropy budget is $Lambda'$, not the sum of earlier context entropies. Every retained tuple is consistent, remains in the original stream in an allowed orientation, and still satisfies the simultaneous rectangle bound.
  The constants and thresholds can be fixed without knowing the actual conditional laws. Start with the numerical bounds $ell \/ k = 1$, domain prefactor $4$, and domination factor $2$. The uniform statement of Lemma 30 supplies a positive lower bound on the next retained proportion and on the conditioning probability, and an upper bound on the next domain prefactor. Use these to prescribe the next stage’s numerical bounds, including the old domination bound divided by the success-probability lower bound. Recursively do this for the already fixed $T + 1$ stages, taking maxima over the finitely many class types if necessary. All resulting constants are independent of $q$; choose $q$ above their finitely many uniform thresholds and the arithmetic thresholds used above. No enumeration of conditional histories, or history-dependent limiting argument, is involved.
  Consequently the final length is deterministic and satisfies $ell_(*) = Theta \( k \)$, and the final stream law still has a constant domination factor. Lemma 6 therefore applies to the final tuple $F_(*)$. Only the marking scans are now performed: no further class selection, tuple extraction, or conditioning is used. The marking message specifies the expensive flag values and a cheap domain for each remaining slot. Conditional on that message, the entropy of the remaining values is bounded by the logarithm of the product of those domains. Thus Equation (5.7) bounds the entropy of the entire tuple under its present law.
  Therefore, Equation (5.7) from the final marking scan and Equation (7.4) give
  $ H \( F_(*) \) lt.eq d sigma ell_(*) + Lambda_(*) + O \( k \) + O \( Delta_(*) q sigma \) = d sigma ell_(*) + O \( k \) . $
  Lemma 6 gives instead
  $ H \( F_(*) \) gt.eq d sigma ell_(*) + eta ell_(*) log sigma - O \( k \) . $
  These inequalities contradict each other, since $ell_(*) gt.eq c k$ for a fixed $c > 0$ and $log sigma arrow.r oo$. Consequently some stream has no consistent $k$-tuple. Its flag graph has independence number less than $k$ and is $K_(d + 1)$-free by Lemma 4, as required. ◻
]

=== 7.2 From prime orders to every integer <from-prime-orders-to-every-integer>

Only a fixed-ratio interval between consecutive available prime scales is needed. We include an elementary proof to avoid imposing a prime-subsequence restriction on the Ramsey bound.

#thm([Lemma 7.1.])[
  (A prime in a fixed-ratio interval).  #emph[There is a constant $c_0 > 0$ such that, for every sufficiently large real $x$, a prime $q$ satisfies $c_0 x lt.eq q lt.eq x$.]
] <end:prime-interval>

#proof[
  Define
  $ theta.alt \( x \) = sum_(p lt.eq x) log p \, #h(2em) psi \( x \) = sum_(p^h lt.eq x\
h gt.eq 1) log p \, $
  where $p$ ranges over primes. Every prime in $\( m \, 2 m \]$ divides $binom(2 m, m)$, so
  $ theta.alt \( 2 m \) - theta.alt \( m \) lt.eq log binom(2 m, m) lt.eq 2 m log 2 . $
  Summing at powers of two and then using monotonicity proves $theta.alt \( x \) lt.eq C x$.
  The exponent of $p$ in the central binomial coefficient is
  $ sum_(h gt.eq 1) (⌊frac(2 m, p^h)⌋ - 2 ⌊m / p^h⌋) . $
  Each summand is zero or one, and therefore
  $ psi \( 2 m \) gt.eq log binom(2 m, m) gt.eq 2 m log 2 - log \( 2 m + 1 \) . $
  The last inequality follows because the largest of the $2 m + 1$ binomial coefficients is at least their average $4^m \/ \( 2 m + 1 \)$. For proper prime powers the rough estimate
  $ 0 lt.eq psi \( x \) - theta.alt \( x \) lt.eq C sqrt(x) log^2 \( x + 2 \) = o \( x \) $
  suffices: there are $O \( log x \)$ exponents $h gt.eq 2$, at most $sqrt(x)$ possible bases for each, and each weight is at most $log x$. It follows first for even integers, and then by monotonicity for all large real $x$, that $theta.alt \( x \) gt.eq c x$. Choose $c_0 < c \/ \( 2 C \)$. For sufficiently large $x$, $theta.alt \( x \) > theta.alt \( c_0 x \)$, proving that the stated interval contains a prime. ◻
]

Fix $s gt.eq 6$, put $d = s - 1$, and choose $0 < eta < 1 \/ 10$. For a sufficiently large integer $t$, apply Lemma 35 with

$ x = frac(t, \( log t \)^(1 + eta)) . $

The resulting prime tends to infinity, and $log q tilde.op log t$. Moreover,

$ q \( log q \)^(1 + eta) lt.eq t (frac(log q, log t))^(1 + eta) < t . $

The graph from Theorem 2 therefore has no independent set of size $t$. Its order gives

#[#set math.equation(numbering: n => "(7.5)")
 $ r \( s \, t \) > floor.l q^d log q floor.r gt.eq c_(s \, eta) frac(t^d, \( log t \)^(d - 1 + d eta)) . $ <end:lower-slack>]

Here the floor is absorbed into a fixed positive constant for large $t$. Given any $epsilon > 0$, choose $eta = min { 1 \/ 20 \, epsilon \/ \( 2 d \) }$. Then $epsilon - d eta > 0$, so $\( log t \)^(epsilon - d eta)$ eventually absorbs $1 \/ c_(s \, eta)$. Equation (7.5) yields the required coefficient-one lower bound for every sufficiently large integer $t$.

=== 7.3 The matching upper bound <the-matching-upper-bound>

The upper estimate of Ajtai, Komlós, and Szemerédi #cite(label("AKS1980")) can be obtained from a triangle-free independence bound followed by sampling and deletion. Shearer proved a lower bound asymptotic to $n log d \/ d$ as $d arrow.r oo$ for triangle-free graphs of average degree $d$ #cite(label("Shearer1983")). The elementary proof below uses a uniformly chosen independent set, following Alon’s method #cite(label("Alon1996")) proof of Proposition 2.1; sharper occupancy estimates appear in Davies, Jenssen, Perkins, and Roberts #cite(label("DJPR2018")) Theorems 1 and 3. We retain a convenient constant and give the details separately from the lower-bound construction.

#thm([Lemma 7.2.])[
  (Independent sets in a triangle-free graph).  #emph[If a triangle-free graph $H$ has $n > 0$ vertices and maximum degree at most a real number $D_0 gt.eq 1$, then 
$ alpha \( H \) gt.eq frac(n log \( D_0 + 1 \), 8 \( D_0 + 1 \)) . $

]
] <end:triangle-free>

#proof[
  Choose an independent set $I$ uniformly from all independent sets of $H$, including the empty set, and write $mu = bb(E) \| I \| \/ n$. At a vertex $x$, expose $I$ outside the closed neighborhood of $x$. Let $Z_x$ be the number of neighbors that have no neighbor in this exposed part of $I$. These available neighbors are mutually nonadjacent because $H$ is triangle-free. The remaining independent-set choices are therefore ${ x }$ or an arbitrary subset of the $Z_x$ available neighbors, all with equal conditional probability. Hence
  $ bb(P) \( x in I divides upright("exposure") \) = frac(1, 1 + 2^(Z_x)) \, #h(2em) bb(E) \( \| I ∩ N \( x \) \| divides upright("exposure") \) = frac(Z_x 2^(Z_x - 1), 1 + 2^(Z_x)) gt.eq Z_x / 4 . $
  The last inequality includes $Z_x = 0$. Averaging also over a uniform vertex $x$, the degree bound gives
  $ frac(bb(E) Z_x, 4) lt.eq 1 / n bb(E) sum_(v in I) deg \( v \) lt.eq D_0 mu . $
  Since $\( 1 + 2^z \)^(- 1) gt.eq 2^(- z) \/ 2$ for $z gt.eq 0$, Jensen’s inequality now gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ mu gt.eq 1 / 2 bb(E) 2^(- Z_x) gt.eq 1 / 2 2^(- bb(E) Z_x) gt.eq 1 / 2 2^(- 4 D_0 mu) . $ <end:triangle-jensen>]
  If $mu < log \( D_0 + 1 \) \/ \( 8 \( D_0 + 1 \) \)$, then Equation (7.6) implies $mu > 1 \/ \( 2 sqrt(D_0 + 1) \)$, using $log 2 < 1$. This is impossible: $log u lt.eq 2 sqrt(u)$ for $u gt.eq 1$ implies $log u \/ \( 8 u \) < 1 \/ \( 2 sqrt(u) \)$. Thus $mu$ has the claimed lower bound, and $alpha \( H \) gt.eq bb(E) \| I \| = n mu$ completes the proof. ◻
]

#thm([Proposition 7.3.])[
  (Upper Ramsey estimate).  #emph[For every fixed integer $s gt.eq 2$ there is a constant $C_s$ such that for all sufficiently large integers $t$, 
$ r \( s \, t \) lt.eq C_s frac(t^(s - 1), \( log t \)^(s - 2)) . $

]
] <end:upper-bound>

#proof[
  Induct on $s$. The case $s = 2$ follows from $r \( 2 \, t \) = t$. If a triangle-free graph has no independent set of size $t$, then all its degrees are below $t$, because every neighborhood is independent. Lemma 36, with $D_0 = t$, bounds its order by $8 t \( t + 1 \) \/ log \( t + 1 \)$. This proves the case $s = 3$.
  Now let $s gt.eq 4$ and suppose the estimate holds for smaller clique parameters. Let $G$ have $n > 0$ vertices, maximum degree $h$, no $K_s$, and no independent set of size $t$. Every neighborhood avoids $K_(s - 1)$ and an independent $t$-set. Likewise the common neighborhood of the two endpoints of an edge avoids $K_(s - 2)$ and an independent $t$-set. Therefore
  $ h < r \( s - 1 \, t \) \, #h(2em) \| N \( u \) ∩ N \( v \) \| lt.eq m := r \( s - 2 \, t \) quad \( u v in E \( G \) \) . $
  Summing these common-neighborhood sizes over edges counts each triangle three times, so $G$ has at most $n h m \/ 6$ triangles.
  If $h lt.eq t^(s - 5 \/ 2)$, the greedy bound $alpha \( G \) gt.eq n \/ \( h + 1 \)$ gives
  $ n < t \( h + 1 \) = O \( t^(s - 3 \/ 2) \) = o #h(-1em) (frac(t^(s - 1), \( log t \)^(s - 2))) . $
  Assume henceforth that $h > t^(s - 5 \/ 2)$, and set $lambda = \( h m \)^(- 1 \/ 2) lt.eq 1$. By the induction bound on $m$,
  #[#set math.equation(numbering: n => "(7.7)")
   $ lambda h = sqrt(h \/ m) gt.eq c_s t^(1 \/ 4) \( log t \)^(\( s - 4 \) \/ 2) gt.eq t^(1 \/ 5) $ <end:sample-degree>]
  for sufficiently large $t$.
  Retain each vertex independently with probability $lambda$. Delete all retained vertices whose degree in the sampled graph exceeds $12 lambda h$, and then delete one vertex from each triangle still present until none remains. If $E_0 \, T_0$ are the initial sampled edge and triangle counts, respectively, the first deletion removes at most $2 E_0 \/ \( 12 lambda h \)$ vertices, and the second at most $T_0$. Their expected numbers are at most
  $ frac(lambda^2 n h, 12 lambda h) = frac(n lambda, 12) \, #h(2em) frac(lambda^3 n h m, 6) = frac(n lambda, 6) . $
  Some realization therefore leaves a triangle-free induced subgraph $H$ with
  $ \| V \( H \) \| gt.eq 3 / 4 n lambda \, #h(2em) Delta \( H \) lt.eq 12 lambda h . $
  Deleting further vertices cannot increase degrees, so both conclusions hold simultaneously. Lemma 36 and Equation (7.7) imply
  $ t > alpha \( H \) gt.eq frac(\( 3 \/ 4 \) n lambda log \( 12 lambda h + 1 \), 8 \( 12 lambda h + 1 \)) gt.eq c frac(n log t, h) . $
  Finally substitute $h < r \( s - 1 \, t \)$ and its induction bound to obtain $n lt.eq C_s t^(s - 1) \/ \( log t \)^(s - 2)$. Increasing $C_s$ absorbs the additive one in passing from the order of an avoiding graph to its Ramsey number. ◻
]

=== 7.4 The logarithmic exponent <end:main-proof>

#proof[
  The lower bound follows from Equation (7.5) and the choice of $eta$ made there. Proposition 37 gives the asserted upper estimate. For every fixed $epsilon > 0$, its constant is eventually bounded by $\( log t \)^epsilon$; hence
  $ frac(t^(s - 1), \( log t \)^(s - 2 + epsilon)) lt.eq r \( s \, t \) lt.eq frac(t^(s - 1), \( log t \)^(s - 2 - epsilon)) $
  for all sufficiently large integer $t$. Taking logarithms and dividing by $log log t > 0$ bounds the expression in the theorem between $s - 2 - epsilon$ and $s - 2 + epsilon$. Since $epsilon$ is arbitrary, its limit is $s - 2$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
