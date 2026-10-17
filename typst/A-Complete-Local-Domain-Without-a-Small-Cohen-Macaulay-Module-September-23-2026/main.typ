#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Complete Local Domain without \
a Small Cohen--Macaulay Module]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A #emph[small Cohen–Macaulay module] over a Noetherian local ring $\( R \, frak(m) \)$ is a nonzero finitely generated $R$-module $M$ such that $"depth"_R M = dim R$. Such a module is also called a maximal Cohen–Macaulay module. The domain form of the small Cohen–Macaulay module conjecture asks whether every complete Noetherian local domain has one. We prove the following negative answer.

#thm([Theorem 1.1.])[
  #emph[There exists a three-dimensional complete Noetherian normal local domain $R$ containing $bb(C)$, with residue field $bb(C)$, such that no nonzero finitely generated $R$-module has depth three.]
] <thm:main>

The distinction between modules and algebras matters here. A module-finite extension domain $R subset.eq B$ that is Cohen–Macaulay supplies such a module, but the converse need not hold. Our obstruction applies to every finite module; it requires neither a grading nor an algebra structure. Hochster formulated the finite-module existence problem in his early work on Cohen–Macaulay modules and homological conjectures #cite(label("Hochster1973")) #cite(label("Hochster1975")). In dimensions at most two, a complete local domain has a small Cohen–Macaulay module: its finite normalization is Cohen–Macaulay #cite(label("Hochster2017")) Section 2. There are also important positive results in the graded setting. The theorem of Hartshorne, Peskine–Szpiro, and Hochster gives graded small Cohen–Macaulay modules for three-dimensional finitely generated nonnegatively graded domains whose degree-zero part is a perfect field of positive characteristic; see #cite(label("HochsterYao2023")) Theorem 5.2 for the statement and historical attribution. These results do not cover the characteristic-zero cones considered here. Hochster’s later account explicitly records both his early existence conjecture and his subsequent expectation of counterexamples #cite(label("Hochster2017")) Section 2, Conjectures 2.1 and 2.2.

Dropping finite generation changes the problem. In the balanced convention, a #emph[big Cohen–Macaulay module] is a possibly infinitely generated module on which every system of parameters is a regular sequence and whose quotient by the maximal ideal is nonzero. Hochster proved existence in equal characteristic #cite(label("Hochster1975")). Hochster–Huneke showed that the absolute integral closure of an excellent local domain of positive characteristic is such an algebra #cite(label("HochsterHuneke1992")). Perfectoid methods later yielded big Cohen–Macaulay algebras in mixed characteristic, completing the existence theorem for Noetherian local rings #cite(label("Andre2018")) Theorem 0.7.1. These results impose no finite-generation conclusion.

For a normal local domain containing the rational numbers, trace makes the ring a direct summand of every module-finite extension domain. A Cohen–Macaulay extension would therefore force the original ring to be Cohen–Macaulay. Bhatt constructed positive-characteristic complete normal local domains with no finite Cohen–Macaulay extension, using a Witt-vector cohomological obstruction #cite(label("Bhatt2014")). Neither obstruction excludes arbitrary finite modules. Bhatt, Hochster, and Ma instead study asymptotic substitutes for small Cohen–Macaulay modules. Their August 25, 2026 version describes the existence problem as open even for local rings at maximal ideals of affine three-dimensional domains over algebraically closed fields #cite(label("BhattHochsterMa")) Sections 1.1 and 1.3.

The geometric input is a smooth integral projective surface $X$ over $bb(C)$ with an ample globally generated line bundle $cal(O)_X \( H \)$. Write

$ T \( X \, H \) = xor.big_(j gt.eq 0) H^0 \( X \, cal(O)_X \( j H \) \) \, #h(2em) R \( X \, H \) = accent(T \( X \, H \)_(T \( X \, H \)_(> 0)), ̂) . $

Here the hat denotes completion at the maximal ideal. We write $K_X$ for the canonical divisor and $c_2 \( X \)$ for the second Chern number. For the specific pair $\( X \, H \)$ used for Theorem 1, the uncompleted vertex localization $T \( X \, H \)_(T \( X \, H \)_(> 0))$ also has no small Cohen–Macaulay module (Corollary 8). It is a three-dimensional local domain essentially of finite type over $bb(C)$, so this supplies a counterexample in the affine-local class just described. The deduction uses faithful flatness of completion. Our main intermediate result is the following obstruction.

#thm([Theorem 1.2.])[
  #emph[Let $X$ be a smooth integral projective surface over $bb(C)$, and let $H$ be an ample globally generated divisor. If $R \( X \, H \)$ admits a small Cohen–Macaulay module, then 
#[#set math.equation(numbering: n => "(1)")
 $ K_X^2 - 2 c_2 \( X \) lt.eq 6 H^2 . $ <eq:obstruction>]

]
] <thm:obstruction>

A numerical obstruction for Ulrich sheaves on surfaces follows from Bogomolov’s inequality and the Hodge index theorem. Beauville presented this route for surfaces of Néron–Severi rank one #cite(label("Beauville2017")) pp. 18–20; Anghel gives the surface inequality without that Néron–Severi rank restriction #cite(label("Anghel2026")) Proposition 2.1 and Remark 2.3. For a projective surface, an Ulrich sheaf has trivial vector-bundle pushforward under a finite linear projection to $bb(P)^2$ #cite(label("EisenbudSchreyer2003")) Proposition 2.1. The argument here replaces that triviality condition by a comparison of coherent extensions across the exceptional divisor of a completed cone. A module over the completed local ring need not carry a grading. We therefore retain its actual vector bundle on the punctured spectrum, rather than assume it descends to an Ulrich sheaf on $X$. It is this comparison that permits arbitrary nongraded modules. The explicit surface used below is the complete-quadrangle Hirzebruch–Kummer construction appearing in #cite(label("Anghel2026")) Section 7.2. We give its construction and all the required numerical and positivity checks directly.

There are two further recent comparisons. Anghel’s September 14, 2026 preprint excludes arithmetically Cohen–Macaulay bundles under the sharper inequality $K_X^2 - 2 c_2 \( X \) > 3 H^2$, and excludes graded maximal Cohen–Macaulay modules over the same complete-quadrangle section rings used here #cite(label("Anghel2026Graded")) Theorems 1.1 and 1.3, Corollary 4.3. That statement does not assert nonexistence of arbitrary modules over the vertex completion. Chen’s September 21, 2026 preprint proposes a quantitative local-cohomology bound for every nonzero finite reflexive module over a completed cone when $K_X equiv 4 H$ and $15 H^2 \/ 8 - chi \( cal(O)_X \) > 0$, and obtains a proposed completed-local counterexample from the exponent-six cover #cite(label("Chen2026")) Main claim 1.1 and Consequence 1.2. Thus the existential completed-module claim overlaps with that work. Our obstruction applies without the proportionality hypothesis on $K_X$ and $H$; the exponent-seven polarization used below has $K_X equiv 5 H$.#footnote[The two Anghel preprints disclose ChatGPT and Claude assistance for exploratory computations, literature search and editorial work. Chen discloses ChatGPT/OpenAI assistance in mathematical development, checking, computations, literature and writing.]

=== Proof overview <proof-overview>

Choose a finite morphism $f : X arrow.r bb(P)^2$ with $f^(*) cal(O)_(bb(P)^2) \( 1 \) = cal(O)_X \( H \)$, and put $h = H^2 = deg f$. The completed cone is finite over the regular local ring $A = bb(C) \[ \[ x_0 \, x_1 \, x_2 \] \]$. A small Cohen–Macaulay module is free over $A$. Its restriction to the punctured cone is a vector bundle, which extends to a coherent sheaf $cal(E)$ on a regular model $W arrow.r "Spec" R \( X \, H \)$ that is an isomorphism away from the exceptional surface $X$.

For a nonzero torsion-free sheaf $B$ on $X$, its normalized slope is

$ mu \( B \) = frac(c_1 \( B \) dot.op H, "rk" \( B \) H^2) . $

It is slope-semistable if no nonzero subsheaf of smaller rank has larger slope. Its Harder–Narasimhan filtration has torsion-free semistable factors with decreasing slopes. We choose $cal(E)$ with torsion-free restriction $P = cal(E) \|_X$. First, elementary modifications of $cal(E)$ along $X$ arrange that the slopes of the Harder–Narasimhan factors of $P$ lie in an interval of length at most one. These modifications preserve the bundle away from $X$. Second, that bundle comes from an $A$-free module. Comparing the pushforward of $cal(E)$ with a trivial sheaf on the blowup of $"Spec" A$ gives, for $F = f_(*) P$ of rank $N$, the inequality $2 N "ch"_2 \( F \) gt.eq c_1 \( F \)^2$, with Chern characters evaluated on $bb(P)^2$. Bogomolov’s inequality for the semistable factors bounds the same normalized Chern expression above. More precisely, if $r = "rk" P$, then $N = r h$ and the two comparisons give

$ 0 lt.eq frac(2 "ch"_2 \( f_(*) P \), N) - (frac(c_1 \( f_(*) P \), N))^2 lt.eq 1 / 2 - frac(K_X^2 - 2 c_2 \( X \), 12 H^2) . $

This yields (1). Neither $P$ nor $f_(*) P$ is assumed semistable or Ulrich.

Section 2 constructs the resolution and extends an arbitrary module. Section 3 proves the slope modification lemma. Section 4 establishes the Chern-character inequality, and Section 5 combines it with surface theory. Finally, Section 6 constructs a surface with $K_X^2 - 2 c_2 \( X \) > 6 H^2$.

== 2 From a completed cone to its exceptional surface <sec:cone>

Throughout this section, $X$ and $H$ satisfy the hypotheses of Theorem 2. We construct a regular model of the completed cone and explain how a small Cohen–Macaulay module produces a sheaf on it. We also prove that the completed ring is normal.

=== 2.1 The finite map and the completed ring <the-finite-map-and-the-completed-ring>

Global generation supplies sections $s_0 \, s_1 \, s_2$ of $cal(O)_X \( H \)$ with no common zero. Indeed, choose $s_0 eq.not 0$, then $s_1$ avoiding the components of its zero divisor, and then $s_2$ nonvanishing at their finitely many common zeros. The resulting morphism

$ f : X arrow.r D := bb(P)^2 \, #h(2em) f^(*) cal(O)_D \( 1 \) = cal(O)_X \( H \) \, $

is finite and surjective. A positive-dimensional fiber would contain a curve on which $H$ is both ample and trivial, which is impossible. Properness then gives finiteness, and the intersection formula gives $deg f = h := H^2$.

Put

$ S = bb(C) \[ x_0 \, x_1 \, x_2 \] \, quad T = T \( X \, H \) \, quad A = bb(C) \[ \[ x_0 \, x_1 \, x_2 \] \] \, quad R = T ⊗_S A \, $

where $x_i$ acts as $s_i$. Surjectivity of $f$ makes $S arrow.r T$ injective. The ring $T$ is a domain, as seen by trivializing $H$ rationally and embedding $T$ in $bb(C) \( X \) \[ t \]$. It is a finite graded $S$-module: by the projection formula, its graded pieces are the nonnegative twisted sections of the coherent sheaf $f_(*) cal(O)_X$ on $D$, and Serre vanishing implies finite generation. Explicitly, a surjection $cal(O)_D \( - a \)^p arrow.r f_(*) cal(O)_X$ and the vanishing of the first cohomology of its kernel in large twists generate all sufficiently large degrees; the remaining finitely many degrees complete a generating set.

Let $frak(n) = T_(> 0)$ and $frak(a) = \( x_0 \, x_1 \, x_2 \) T$. The $frak(a)$-adic filtration is cofinal with the degree filtration: if homogeneous $S$-module generators have degrees at most $a'$, then

$ frak(a)^j subset.eq T_(gt.eq j) \, #h(2em) T_(gt.eq j + a') subset.eq frak(a)^j . $

Finiteness over $S$ and completion of finite modules #cite(label("Stacks")) Tags 00MA and 00MB therefore identify

#[#set math.equation(numbering: n => "(2)")
 $ R = hat(T)^(thin frak(a)) = product_(j gt.eq 0) T_j = hat(T_(frak(n))) \, $ <eq:completion>]

with multiplication by the graded Cauchy product. The product of the first nonzero homogeneous terms proves that $R$ is a domain. An element with nonzero constant term is a unit. Moreover, $T \/ frak(a)$ is a finite-dimensional positively graded algebra with degree-zero part $bb(C)$, so $sqrt(frak(a)) = frak(n)$. This justifies the last equality in (2) and shows that $R$ is a complete Noetherian local ring with residue field $bb(C)$. Flatness of $S arrow.r A$ gives an injection $A arrow.r R$; this finite integral extension has dimension three.

=== 2.2 The regular model and normality <the-regular-model-and-normality>

Let $V_0 = "Tot" \( cal(O)_D \( - 1 \) \)$, the blowup of $"Spec" S$ at the origin, and let

$ W_0 = X times_D V_0 = "Tot" \( cal(O)_X \( - H \) \) . $

The map $W_0 arrow.r V_0$ is finite. Evaluation of homogeneous sections gives $W_0 arrow.r "Spec" T$. It is an isomorphism off the zero section. To see this without any assumption that $T$ is generated in degree one, set $X_i = { s_i eq.not 0 }$. The set $X_i$ is affine, and clearing poles along the zero divisor of $s_i$ gives

$ T \[ 1 \/ s_i \] = Gamma \( X_i \, cal(O)_(X_i) \) \[ s_i \, s_i^(- 1) \] . $

Both the punctured line bundle over $X_i$ and the corresponding open subset of $"Spec" T$ have this coordinate ring.

Base change along $S arrow.r A$ to obtain $g : W arrow.r V$ and $p : W arrow.r "Spec" R$. The zero sections remain $X subset W$ and $D subset V$. Their ideal sheaves $cal(J)$ and $cal(I)$ satisfy

#[#set math.equation(numbering: n => "(3)")
 $ cal(J) = g^(*) cal(I) \, #h(2em) cal(I) \|_D = cal(O)_D \( 1 \) \, #h(2em) cal(J) \|_X = cal(O)_X \( H \) . $ <eq:conormal>]

The zero sections are Cartier divisors by flatness. The relevant maps fit into the diagram

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X$])
  content((2.057, 0), [$W$])
  content((4.577, 0), [$"Spec" R$])
  content((0, -1.585), [$D$])
  content((2.057, -1.585), [$V$])
  content((4.577, -1.585), [$"Spec" A .$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  line((0.336, 0), (0.336, 0.3))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3223, -0.7927), [#text(size: 0.73em)[$f$]])
  line((2.393, 0), (3.911, 0), mark: (end: ">"))
  content((3.152, 0.2266), [#text(size: 0.73em)[$p$]])
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  content((2.38, -0.7927), [#text(size: 0.73em)[$g$]])
  line((4.577, -0.2725), (4.577, -1.313), mark: (end: ">"))
  line((0.336, -1.585), (1.721, -1.585), mark: (end: ">"))
  line((0.336, -1.585), (0.336, -1.285))
  line((2.393, -1.585), (3.779, -1.585), mark: (end: ">"))
})

The maps $g$ and $"Spec" R arrow.r "Spec" A$ are finite, and $V$ and $W$ are proper over $"Spec" A$. Since $"Spec" R$ is separated over $"Spec" A$, the map $p$ is proper as well. The maps $p$ and $V arrow.r "Spec" A$ identify $W \\ X$ and $V \\ D$ with the punctured spectra of $R$ and $A$, respectively.

Both $V$ and $W$ are regular. At a point of the closed fiber, a local Cartier equation is a nonzerodivisor and its quotient local ring is regular, since $D$ and $X$ are smooth. Lifting generators of the quotient maximal ideal shows that the embedding dimension is at most one more than the quotient dimension; the nonzerodivisor raises dimension by one. The local ring is therefore regular. Properness over the local base ensures that the closure of every point meets the closed fiber. Regularity at all other points follows by localization. A regular Noetherian scheme has disjoint irreducible components; here every component meets the integral closed fiber, so each of $V$ and $W$ is integral.

This model also proves normality of $R$. The line bundle projection $W_0 arrow.r X$ identifies its global functions with $T$. Flat base change #cite(label("Stacks")) Tag 02KH then gives

#[#set math.equation(numbering: n => "(4)")
 $ Gamma \( W \, cal(O)_W \) = Gamma \( W_0 \, cal(O)_(W_0) \) ⊗_S A = R . $ <eq:global-sections>]

For this equality, take a finite affine cover of the separated scheme $W_0$ and tensor the kernel computing global sections with the flat $S$-algebra $A$. The global functions on an integral normal scheme form an integrally closed domain: a fraction integral over the global ring is integral over every local ring, hence regular everywhere. Since $W$ is regular and integral, (4) proves that $R$ is normal.

=== 2.3 Extending an arbitrary module <extending-an-arbitrary-module>

Suppose that $M$ is a small Cohen–Macaulay $R$-module. The parameters $x_0 \, x_1 \, x_2$ form an $M$-regular sequence, so $M$ has depth three over $A$. The Auslander–Buchsbaum formula over the regular local ring $A$ #cite(label("Stacks")) Tags 00N6, 00O7 and 090V shows that

#[#set math.equation(numbering: n => "(5)")
 $ M tilde.eq A^N quad upright("as an ") A upright("-module") \, #h(2em) N > 0 . $ <eq:A-free>]

The localization $R ⊗_A "Frac" \( A \)$ is a finite-dimensional domain over a field, hence a field. Thus $M$ has positive generic rank over $R$ and full support.

The restriction of $M$ to the punctured spectrum is locally free. Indeed, Cohen–Macaulay modules of full support localize to Cohen–Macaulay modules. More explicitly, for a prime $frak(q)$ the depth localization inequality #cite(label("Stacks")) Tag 0FCC gives

$ "depth"_(R_(frak(q))) M_(frak(q)) gt.eq 3 - dim \( R \/ frak(q) \) gt.eq dim R_(frak(q)) . $

The second inequality follows by concatenating chains of primes below and above $frak(q)$. On the puncture $R_(frak(q))$ is regular by the model $W$, and Auslander–Buchsbaum gives freeness.

On $W$, take

$ cal(E) = \( p^(*) tilde(M) \)^(* *) \, #h(2em) P = cal(E) \|_X \, $

where duals are over $cal(O)_W$. Then $cal(E)$ is coherent and torsion-free, and agrees with $M$ away from $X$. The restriction $P$ is torsion-free of positive rank on $X$. Here is the local justification. On a regular integral scheme a coherent dual has depth at least $min \( 2 \, dim cal(O)_(W \, w) \)$: dualizing a finite presentation expresses it as a kernel of a map between finite free modules, whose image is torsion-free, and the depth lemma applies. At any nongeneric point of $X$, quotienting $cal(E)$ by the Cartier equation therefore leaves depth at least one. Thus $P$ has no associated points except the generic point of $X$. At that generic point $cal(E)$ is free over a discrete valuation ring, so $P$ has the same positive rank as $cal(E)$.

Finally, $g_(*) cal(E)$ is torsion-free and, by (5), agrees with $cal(O)_V^N$ off $D$. We have obtained the precise input for the next two sections: a sheaf that can be modified along $X$, whose pushforward remains trivial away from $D$.

== 3 Balancing slopes by modifications <sec:balancing>

We now modify the extension along $X$ so that its restriction has Harder–Narasimhan slopes in an interval of length at most one. Recall the normalization $mu \( B \) = c_1 \( B \) dot.op H \/ \( "rk" \( B \) h \)$, where $h = H^2$. Tensoring with $cal(O)_X \( H \)$ increases slope by one.

Elementary modification to constrain the slopes of exceptional-divisor restrictions has an antecedent in Chen–Sun’s optimal extensions of reflexive analytic sheaves #cite(label("ChenSun2020")) Theorem 1.4(I), Proposition 2.6 and Remark 1.5. Their analytic setting and reflexivity hypotheses differ from the Noetherian Cartier-divisor setting below; we give the needed algebraic modification and termination argument.

We recall briefly why the filtration exists in this setting. A torsion-free sheaf embeds in a sum of sufficiently positive line bundles, so its subsheaf slopes are bounded above by taking determinants. Their denominators are bounded because their ranks are bounded. Choose a subsheaf of maximum slope and, among these, of maximum rank; saturate it. Saturation does not decrease degree, since a torsion sheaf has effective divisorial first Chern class. The chosen subsheaf is semistable, and every subsheaf of its torsion-free quotient has strictly smaller slope. Induction on rank gives the filtration. This is the usual construction of the Harder–Narasimhan filtration #cite(label("HuybrechtsLehn")) Section 1.6, Theorem 1.6.7 and Definition/Corollary 1.6.9.

#thm([Lemma 3.1.])[
  #emph[Let $W$ be an integral Noetherian scheme, let $i : X arrow.r.hook W$ be an effective Cartier divisor that is a smooth integral projective surface over $bb(C)$, and suppose its ideal $cal(J)$ restricts to an ample line bundle $cal(O)_X \( H \)$. Let $cal(E)$ be a coherent torsion-free sheaf on $W$ such that $P = cal(E) \|_X$ is torsion-free of positive rank. There is a coherent torsion-free sheaf $cal(E)'$ agreeing with $cal(E)$ off $X$ such that $P' = cal(E)' \|_X$ is torsion-free and the normalized slopes of its Harder–Narasimhan factors lie in an interval of length at most one.]
] <lem:balance>

#proof[
  Suppose the current largest and smallest factor slopes differ by more than one. Let $G$ be the last semistable quotient of $P$, and let $B = ker \( P arrow.r G \)$. Replace $cal(E)$ by $cal(E)' = ker \( cal(E) arrow.r i_(*) G \)$. This is torsion-free and unchanged off $X$. The Cartier resolution gives
  #[#set math.equation(numbering: n => "(6)")
   $ 0 arrow.r G \( H \) arrow.r cal(E)' \|_X arrow.r B arrow.r 0 . $ <eq:transform>]
  Indeed, $"Tor"_1^W \( cal(E) \, cal(O)_X \) = 0$ because the Cartier equation acts injectively on $cal(E)$, whereas
  $ "Tor"_1^W \( i_(*) G \, cal(O)_X \) = G ⊗ cal(J) \|_X = G \( H \) . $
  Thus the new restriction remains torsion-free of the same rank $r$.
  The maximum slope of an extension of torsion-free sheaves is at most the larger of their maximum slopes: intersect a subsheaf with the kernel and take its image in the quotient. Since $mu \( G \) + 1 < mu_max \( P \)$, (6) shows that the maximum slope does not increase. On the other hand, additivity of rank and first Chern class gives
  $ mu \( cal(E)' \|_X \) = mu \( P \) + frac("rk" G, r) gt.eq mu \( P \) + 1 / r . $
  The average slope is always bounded above by the maximum slope, hence by the initial maximum. Consequently this procedure terminates after finitely many steps. At termination the slope interval has length at most one. ◻
]

Apply Lemma 3 to the sheaf constructed in Section 2, and again call the resulting sheaves $cal(E)$ and $P$. The rank and the bundle on the puncture are unchanged. In particular, $g_(*) cal(E)$ still agrees with $cal(O)_V^N$ off $D$. The restriction $P$ need not be semistable: it is the width of its factor slopes, rather than semistability, that we have arranged. This agreement on the puncture imposes the lower bound proved next.

== 4 A Chern-character inequality from a divisor <sec:lattice>

The pushforward of our extension agrees with a trivial bundle away from $D$. We show that this agreement forces a nonnegative expression in the Chern characters of its restriction to $D$. For a coherent sheaf $F$ of positive rank $N$ on $D = bb(P)^2$, identify $c_1 \( F \)$ with its integer coefficient in the line class, and let $"ch"_2 \( F \)$ mean the degree of the second Chern character. Define

$ v \( F \) = frac(2 "ch"_2 \( F \), N) - (frac(c_1 \( F \), N))^2 . $

For $F = xor.big_(i = 1)^N cal(O)_D \( a_i \)$, this is the ordinary variance of the integers $a_i$. It need not be nonnegative for arbitrary sheaves. The expression is unchanged by twisting $F$ by $cal(O)_D \( b \)$.

#thm([Lemma 4.1.])[
  #emph[Let $V$ be an integral Noetherian scheme with an effective Cartier divisor $D tilde.eq bb(P)^2$, whose ideal $cal(I)$ satisfies $cal(I) \|_D tilde.eq cal(O)_D \( 1 \)$. Suppose $L'$ is a coherent torsion-free sheaf on $V$ and $L' \|_(V \\ D) tilde.eq cal(O)_(V \\ D)^N$, where $N > 0$. Then $F = L' \|_D$ has rank $N$ and $v \( F \) gt.eq 0$.]
] <lem:lattice>

#proof[
  At the generic point of $D$, the local ring of $V$ has maximal ideal generated by the Cartier equation, so it is a discrete valuation ring. The torsion-free sheaf $L'$ is free of rank $N$ there; hence $F$ has rank $N$ and $v \( F \)$ is defined. Write $L = cal(O)_V^N$ and identify $L$ and $L'$ after inverting the Cartier equation. Clearing denominators on a finite affine cover gives
  $ cal(I)^b L subset.eq L' subset.eq cal(I)^(- b) L $
  for some $b gt.eq 0$. Replacing $L'$ by $L' ⊗ cal(I)^b$ replaces $F$ by $F \( b \)$ and does not change $v \( F \)$. We may therefore assume $cal(I)^(2 b) L subset.eq L' subset.eq L$.
  The quotient $Q = L \/ L'$ is killed by a power of $cal(I)$. Its finite filtration has factors
  $ Q_j = cal(I)^j Q \/ cal(I)^(j + 1) Q #h(2em) \( j gt.eq 0 \) $
  on $D$. Each $Q_j$ is a quotient of $cal(O)_D \( j \)^N$. If $n_j = "rk" Q_j$, then
  #[#set math.equation(numbering: n => "(7)")
   $ 0 lt.eq n_j lt.eq N \, #h(2em) c_1 \( Q_j \) gt.eq j n_j . $ <eq:layers>]
  For the second assertion, $Q_j \( - j \)$ is globally generated. The determinant of its torsion-free quotient has a nonzero section, and its torsion contributes a nonnegative divisorial first Chern class.
  Derived restriction to $D$ gives the following identity in the Grothendieck group of coherent sheaves on $D$:
  #[#set math.equation(numbering: n => "(8)")
   $ \[ F \] = \[ cal(O)_D^N \] + sum_(j gt.eq 0) #scale(x: 120%, y: 120%)[\(] \[ Q_j \( 1 \) \] - \[ Q_j \] #scale(x: 120%, y: 120%)[\)] . $ <eq:Tor>]
  Indeed, restriction minus first Tor is additive, with no higher Tor against a Cartier divisor. The first Tor vanishes for $L \, L'$, while for a sheaf $Q_j$ supported on $D$ it equals $Q_j \( 1 \)$. Taking Chern characters in (8) gives rank $N$ and
  $ c_1 \( F \) = sum_j n_j \, #h(2em) 2 "ch"_2 \( F \) = sum_j #scale(x: 120%, y: 120%)[\(] 2 c_1 \( Q_j \) + n_j #scale(x: 120%, y: 120%)[\)] gt.eq sum_j \( 2 j + 1 \) n_j . $
  The remaining assertion is the elementary inequality
  $ N sum_j \( 2 j + 1 \) n_j - (sum_j n_j)^2 & = sum_j n_j \( N - n_j \) + 2 sum_(j > ell) n_j \( N - n_ell \) gt.eq 0 \, $
  which follows from (7). Dividing by $N^2$ proves the lemma. ◻
]

For $L' = g_(*) cal(E)$, the equality $cal(J) = g^(*) cal(I)$ in (3) and finite pushforward give

$ L' \|_D = f_(*) P . $

Writing $r = "rk" P$, this sheaf has rank $r h$ by finite pushforward along $f$, and rank $N$ by generic restriction along $D$ in Lemma 4. Thus the two ranks agree: $N = r h$. The hypotheses of Lemma 4 hold by (3) and the construction of $cal(E)$. Consequently

#[#set math.equation(numbering: n => "(9)")
 $ v \( f_(*) P \) gt.eq 0 . $ <eq:lower>]

It remains to bound this expression above using the narrow slope interval of $P$.

== 5 The numerical obstruction <sec:numerical>

We first compute the contribution of one semistable factor. We use surface Riemann–Roch and the Hodge index theorem in their standard forms; see #cite(label("Hartshorne")) Appendix A, Theorem 4.1 and Example 4.1.2; Chapter V, Theorem 1.9. On each smooth projective surface, finite locally free resolutions extend Riemann–Roch additively to coherent sheaves #cite(label("Hartshorne")) Appendix A, Section 5. This covers the possibly non-locally-free sheaves $G$ and $f_(*) G$ below; we compare their Euler characteristics, without requiring the finite morphism $f$ to be smooth. All intersections in this section are on $X$, except for Chern characters explicitly taken on $D = bb(P)^2$.

#thm([Lemma 5.1.])[
  #emph[Let $f : X arrow.r bb(P)^2$ be finite, with $X$ a smooth integral projective complex surface and $H = f^(*) cal(O)_(bb(P)^2) \( 1 \)$ ample. Put $h = H^2$. For every nonzero torsion-free $H$-slope-semistable sheaf $G$ on $X$, 
$ v \( f_(*) G \) lt.eq 1 / 4 - frac(K_X^2 - 2 c_2 \( X \), 12 h) . $

 Moreover, $frac(c_1 \( f_(*) G \), "rk" \( f_(*) G \)) = mu \( G \) - frac(K_X dot.op H, 2 h) - 3 / 2$.]
] <lem:factor>

#proof[
  Write $u = "rk" G$, $k = K_X dot.op H$, and
  $ m = frac(c_1 \( f_(*) G \), u h) \, #h(2em) q = frac("ch"_2 \( f_(*) G \), u h) . $
  The rank of $f_(*) G$ is $u h$. Finite pushforward and the projection formula identify the twist Euler characteristics on $X$ and $bb(P)^2$. Surface Riemann–Roch, divided by $u h$, therefore gives
  $ t^2 / 2 + (3 / 2 + m) t + 1 + 3 / 2 m + q = t^2 / 2 + (mu \( G \) - frac(k, 2 h)) t + frac(chi \( cal(O)_X \), h) + frac("ch"_2 \( G \), u h) - frac(c_1 \( G \) dot.op K_X, 2 u h) . $
  Comparison of the linear coefficients proves the formula for $m$. Comparison of constants, followed by completing the square, yields
  #[#set math.equation(numbering: n => "(10)")
   $ 2 q - m^2 = 1 / 4 + frac(2 chi \( cal(O)_X \), h) + frac(2 "ch"_2 \( G \) \/ u - c_1 \( G \) dot.op K_X \/ u, h) - (mu \( G \) - frac(k, 2 h))^2 . $ <eq:RR-variance>]
  Bogomolov’s inequality for a torsion-free slope-semistable sheaf on a smooth projective complex surface states that
  $ 2 u "ch"_2 \( G \) lt.eq c_1 \( G \)^2 $
  #cite(label("HuybrechtsLehn")) Theorem 3.4.1. Its hypotheses apply to $G$ and the ample polarization $H$; normalizing slope by $h$ does not change semistability. Set $C = c_1 \( G \) \/ u - K_X \/ 2$. The last two terms of (10) are at most
  $ frac(C^2 - K_X^2 \/ 4, h) - frac(\( C dot.op H \)^2, h^2) lt.eq - frac(K_X^2, 4 h) \, $
  by the Hodge index theorem for the rational divisor class $C$. Using Noether’s formula $12 chi \( cal(O)_X \) = K_X^2 + c_2 \( X \)$ now gives the result. ◻
]

#proof[
  Starting with a small Cohen–Macaulay module, Sections 2 and 3 construct a torsion-free sheaf $P$ on $X$ whose semistable factors $G_i$ have normalized slopes in an interval of length at most one. Write $u_i = "rk" G_i$, $r = "rk" P$, and $w_i = u_i \/ r$. Thus $w_i > 0$ and $sum_i w_i = 1$. Finite pushforward is exact, so $F = f_(*) P$ has rank $r h = N$, and its normalized Chern characters are the weighted averages of those of $f_(*) G_i$. If $m_i = c_1 \( f_(*) G_i \) \/ \( u_i h \)$ and $overline(m) = sum_i w_i m_i$, then
  #[#set math.equation(numbering: n => "(11)")
   $ v \( F \) = sum_i w_i v \( f_(*) G_i \) + sum_i w_i \( m_i - overline(m) \)^2 . $ <eq:mixture>]
  Lemma 5 shows that the $m_i$ differ from $mu \( G_i \)$ by a common constant. They therefore lie in an interval of length at most one. Their weighted variance is at most $1 \/ 4$: the mean minimizes the mean square distance, and every point is within $1 \/ 2$ of the interval midpoint. Combining (9), (11), and Lemma 5 gives
  $ 0 lt.eq v \( F \) lt.eq 1 / 2 - frac(K_X^2 - 2 c_2 \( X \), 12 h) . $
  This is precisely (1). ◻
]

== 6 An explicit surface and its polarization <sec:surface>

We construct a family of smooth projective surfaces from which we will choose one violating the inequality established above. The construction uses the six lines joining four points of the plane, followed by a cover obtained by taking roots of their ratios. The same line arrangement provides the sections needed for an ample globally generated divisor on the cover. This choice of arrangement and polarization is the complete-quadrangle construction in #cite(label("Anghel2026")) Section 7.2; all properties needed here are verified below.

#thm([Proposition 6.1.])[
  #emph[For each prime $n gt.eq 3$, there is a smooth integral projective complex surface $X$ with an ample globally generated divisor $H$ such that 
$ H^2 = 5 n^3 \, #h(2em) K_X^2 - 2 c_2 \( X \) = n^3 \( n^2 - 10 \) . $

]
] <prop:surface>

We prove the proposition by constructing the cover, checking its local coordinates, and then finding sections of the required polarization. The covering construction goes back to Hirzebruch’s work on line arrangements #cite(label("Hirzebruch1983")).

=== 6.1 The branch divisor <the-branch-divisor>

Choose four points $p_1 \, dots.h \, p_4 in bb(P)_(bb(C))^2$, no three collinear, and let $B$ be their blowup. Write $ell$ for the pullback of the line class and $e_1 \, dots.h \, e_4$ for the exceptional curves. Thus

$ ell^2 = 1 \, #h(2em) ell dot.op e_i = 0 \, #h(2em) e_i dot.op e_j = - delta_(i j) \, #h(2em) K_B = - 3 ell + sum_(i = 1)^4 e_i . $

Number the six joining lines from $1$ to $6$, and choose defining linear forms $l_1 \, dots.h \, l_6$. Denote the strict transform of line $a$ by $L_a$ and its total transform by $T_a$. If its endpoints are $p_i \, p_j$, then

$ T_a = L_a + e_i + e_j tilde.op ell . $

Two joining lines are called #emph[opposite] if their endpoint pairs are disjoint. There are three opposite pairs.

Let

$ Delta = sum_(a = 1)^6 L_a + sum_(i = 1)^4 e_i . $

This reduced divisor has simple normal crossings. Each exceptional curve meets the three incident strict transforms in three distinct points. Strict transforms of lines with a common endpoint are disjoint, whereas each opposite pair meets transversely in one point away from the exceptional curves. The three latter points are distinct: an equality between two would force two lines with a common endpoint to meet away from that endpoint. Consequently $Delta$ has ten rational components, each meeting the others in three points, and fifteen nodes in total. Figure 1 records these incidences; in the figure $L_(i j)$ denotes the strict transform of the line joining $p_i$ and $p_j$. Since each point belongs to three joining lines,

#[#set math.equation(numbering: n => "(12)")
 $ Delta tilde.op 6 ell - 2 sum_(i = 1)^4 e_i = - 2 K_B \, #h(2em) K_B^2 = 5 . $ <eq:branch-class>]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((1.531e-16, 2.5), (2.378, 0.7725), (1.469, -2.023), (-1.469, -2.023), (-2.378, 0.7725), close: true, stroke: (thickness: 0.5pt, miter-limit: 10))
  line((1.531e-16, 2.5), (7.042e-17, 1.15), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((7.042e-17, 1.15), (2.378, 0.7725), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((2.378, 0.7725), (1.094, 0.3554), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((1.094, 0.3554), (1.469, -2.023), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((1.469, -2.023), (0.676, -0.9304), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((0.676, -0.9304), (-1.469, -2.023), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((-1.469, -2.023), (-0.676, -0.9304), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((-0.676, -0.9304), (-2.378, 0.7725), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((-2.378, 0.7725), (-1.094, 0.3554), stroke: (thickness: 0.5pt, miter-limit: 10))
  line((7.042e-17, 1.15), (0.676, -0.9304), (-1.094, 0.3554), (1.094, 0.3554), (-0.676, -0.9304), close: true, stroke: (thickness: 0.5pt, miter-limit: 10))
  content((1.531e-16, 2.5), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$e_1$]])])
  content((2.378, 0.7725), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$L_12$]])])
  content((1.469, -2.023), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$e_2$]])])
  content((-1.469, -2.023), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$L_23$]])])
  content((-2.378, 0.7725), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$L_14$]])])
  content((7.042e-17, 1.15), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$L_13$]])])
  content((1.094, 0.3554), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$L_34$]])])
  content((0.676, -0.9304), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$L_24$]])])
  content((-0.676, -0.9304), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$e_3$]])])
  content((-1.094, 0.3554), [#box(inset: 0.1058cm, stroke: (thickness: 0.5pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$e_4$]])])
})],
  caption: [Figure 1: The branch-incidence graph on the blown-up plane. Vertices represent the ten rational components, not points of the surface; edges represent its fifteen branch nodes. Twelve edges join $e_i$ to an incident $L_(i j)$, and three join opposite line transforms. Every vertex has degree three. Crossings of drawn graph edges do not represent additional intersections. ],
) <fig:branch-incidence>

=== 6.2 The cover and its local coordinates <the-cover-and-its-local-coordinates>

Fix a prime $n gt.eq 3$, to be chosen at the end. In an algebraic closure of $K = bb(C) \( B \)$ choose elements $y_a$ satisfying

$ y_a^n = l_a \/ l_6 #h(2em) \( 1 lt.eq a lt.eq 5 \) \, $

and let $pi : X arrow.r B$ be the normalization of $B$ in $K' = K \( y_1 \, dots.h \, y_5 \)$. The base $B$ is normal and Noetherian, and this finite characteristic-zero field extension is separable. Its normalization is therefore finite #cite(label("Stacks")) Tag 032L, so $X$ is an integral projective surface.

#thm([Lemma 6.2.])[
  #emph[The surface $X$ is smooth and $deg pi = d = n^5$. The map is unramified outside $Delta$ and has ramification index $n$ along every component of $Delta$. More precisely, near a point at which exactly $s in { 0 \, 1 \, 2 }$ components of $Delta$ meet, it is, after an étale base change, the disjoint union of $n^(5 - s)$ copies of 
$ \( t_1 \, t_2 \) mapsto cases(delim: "{", \( t_1 \, t_2 \) \, & s = 0 \,, \( t_1^n \, t_2 \) \, & s = 1 \,, \( t_1^n \, t_2^n \) \, & s = 2 .) $

 Here the displayed maps are understood in étale coordinates on the base and the source.]
] <lem:cover-smooth>

#proof[
  First, suppose that integers $c_1 \, dots.h \, c_5$ satisfy
  $ product_(a = 1)^5 \( l_a \/ l_6 \)^(c_a) in K^(* n) . $
  Taking valuations along $L_a$ shows that $n$ divides $c_a$ for every $a$. Thus the five radicands are independent in $K^(*) \/ K^(* n)$. Since $K$ contains the $n$th roots of unity, the extension $K' \/ K$ is Galois and its group embeds in $\( bb(Z) \/ n \)^5$ by its action on the roots. If its image were a proper subgroup, some nonzero linear functional on $\( bb(Z) \/ n \)^5$ would annihilate it. The corresponding product of the $y_a$ would then lie in $K$, contradicting the independence just proved. This gives $\[ K' : K \] = n^5$.
  We next record the valuations modulo $n$ along the branch curves. Use the vector space
  $ U_n = bb(F)_n^6 \/ chevron.l \( 1 \, 1 \, 1 \, 1 \, 1 \, 1 \) chevron.r $
  and denote the images of its six standard vectors by $epsilon_1 \, dots.h \, epsilon_6$. Identifying $epsilon_1 \, dots.h \, epsilon_5$ with the standard basis of $bb(F)_n^5$, the valuation vector along $L_a$ is $epsilon_a$; in particular $epsilon_6 = - sum_(a = 1)^5 epsilon_a$. If $I_i$ is the set of the three lines incident with $p_i$, the valuation vector along $e_i$ is
  $ w_i = sum_(a in I_i) epsilon_a . $
  All these vectors are nonzero. At a node formed by two strict transforms, the vectors are two distinct $epsilon_a$, hence are independent. At a node $L_a ∩ e_i$, one has $a in I_i$, and $epsilon_a \, w_i$ are independent as well. Indeed, if $lambda epsilon_a + mu w_i = 0$ in $U_n$, a coordinate outside $I_i$ forces the corresponding constant vector to be zero. A coordinate in $I_i \\ { a }$ then gives $mu = 0$, followed by $lambda = 0$.
  It remains to check that this independence gives the asserted smooth normalization, including at the nodes. At a closed point of $B$, choose regular parameters $u_1 \, u_2$ such that the local branches of $Delta$ are $u_1 = 0 \, dots.h \, u_s = 0$. Shrink to an affine neighborhood on which these parameters define an étale map to $bb(A)^2$. Each radicand is a monomial in $u_1 \, dots.h \, u_s$, with possibly negative exponents, times a unit. Adjoining $n$th roots of these units is an étale base change. On an integral neighborhood of a point of that base change, divide the $y_a$ by the resulting roots of the units.
  The $s$ columns of exponents modulo $n$ are independent by the preceding calculation. Multiplicative changes of the five root generators by a matrix in $"GL"_5 \( bb(F)_n \)$ therefore reduce their equations to
  $ Y_j^n = u_j quad \( 1 lt.eq j lt.eq s \) \, #h(2em) Y_j^n = 1 quad \( s < j lt.eq 5 \) . $
  To make this reduction in the function field, lift the matrix entries to integers and divide by suitable monomials in the $u_j$ to remove exponents divisible by $n$. The generator change is reversible because its matrix is invertible modulo $n$. It consequently describes the whole generic algebra after base change, not merely a subextension. The first $s$ equations generate a field of degree $n^s$, by the valuations along $u_j = 0$, and the remaining equations split completely. The generic algebra is therefore a product of $n^(5 - s)$ copies of that field.
  On this neighborhood, with coordinate ring $C$, the normalization in each factor is
  $ C \[ t_1 \, dots.h \, t_s \] \/ \( t_1^n - u_1 \, dots.h \, t_s^n - u_s \) \, $
  so the full normalization is a product of $n^(5 - s)$ such algebras. Indeed, this algebra is finite and free over $C$, has the indicated generic field, and is smooth: it is the base change of the étale coordinate map to $bb(A)^2$ along the corresponding coordinate power map. In particular it is normal, so it is the integral closure of $C$ in that field. Normalization commutes with this étale base change: the pullback of $X$ is normal and has the same generic algebra, and is pure of dimension two, since it is étale over the normal integral surface $X$. Each component therefore dominates the new integral base: its finite image is closed and has dimension two. This proves the local description and hence the lemma. ◻
]

=== 6.3 The Chern numbers <the-chern-numbers>

The local coordinates in Lemma 7 give both the canonical divisor formula and the degrees of the coverings of the branch strata. Thus no further description of $X$ is needed to compute its Chern numbers. These calculations recover Hirzebruch’s formulas #cite(label("Hirzebruch1983")) Section 2.2, Equations (5) and (7) for this six-line arrangement.

The Jacobian of the coordinate power map gives

$ K_X tilde.op_(bb(Q)) pi^(*) #scale(x: 120%, y: 120%)[\(] K_B + \( 1 - 1 \/ n \) Delta #scale(x: 120%, y: 120%)[\)] tilde.op_(bb(Q)) \( 1 - 2 \/ n \) pi^(*) \( - K_B \) . $

Using (12) and the degree of $pi$, we obtain

#[#set math.equation(numbering: n => "(13)")
 $ K_X^2 = 5 d \( 1 - 2 \/ n \)^2 . $ <eq:cover-canonical>]

For the second Chern number, let $e_c$ denote compactly supported topological Euler characteristic. The surface $B$ has Euler characteristic $3 + 4 = 7$. Removing the three nodes from each rational component of $Delta$ gives the one-branch stratum $Delta^compose$, whose Euler characteristic is $10 \( 2 - 3 \) = - 10$. The node set has fifteen points. Additivity therefore gives

$ e_c \( B \\ Delta \) = 7 - \( - 10 \) - 15 = 2 . $

Over the stratum with $s$ branches, the reduced inverse image is a finite étale cover of degree $d \/ n^s$. By additivity and multiplicativity of $e_c$, followed by Chern–Gauss–Bonnet #cite(label("Behrend2009")) Section 1.3 and Proposition 1.6,

#[#set math.equation(numbering: n => "(14)")
 $ c_2 \( X \) = e_c \( X \) = d (2 - 10 / n + 15 / n^2) . $ <eq:cover-euler>]

Subtracting twice (14) from (13) yields

#[#set math.equation(numbering: n => "(15)")
 $ K_X^2 - 2 c_2 \( X \) = d (1 - 10 / n^2) . $ <eq:cover-chern-gap>]

=== 6.4 An ample globally generated divisor <an-ample-globally-generated-divisor>

To compare (15) with the obstruction, we seek an integral divisor $H$ satisfying $n H tilde.op pi^(*) \( - K_B \)$. Such a divisor has square $5 d \/ n^2$, as required by Proposition 6. We first construct $H$ and sections that generate $cal(O)_X \( H \)$, and then prove ampleness separately. The ramification makes the pullbacks of all branch components divisible by $n$ as integral divisors. Put

$ R_a = 1 / n pi^(*) L_a \, #h(2em) F_i = 1 / n pi^(*) e_i \, #h(2em) E = sum_(i = 1)^4 F_i \, #h(2em) J = 1 / n pi^(*) T_6 . $

These are effective Cartier divisors because $X$ is smooth. If line $a$ joins $p_i \, p_j$, write

$ J_a = 1 / n pi^(*) T_a = R_a + F_i + F_j . $

For $1 lt.eq a lt.eq 5$, the root ratios give

$ "div" \( y_a \) = J_a - J . $

Since $J_6 = J$, all six $J_a$ are linearly equivalent to $J$. Let $z_a$ be the resulting sections of $cal(O)_X \( J \)$ with zero divisors $J_a$.

These six sections have no common zero. Away from the exceptional curves, no point of $B$ lies on all six joining lines. On an exceptional curve $e_i$, the total transform of any line not incident with $p_i$ is disjoint from $e_i$. Thus the six total transforms have empty common intersection on $B$, and the same holds for their reduced pullbacks on $X$.

For an opposite pair $a \, b$, its endpoints are the four distinct points, and hence

$ J_a + J_b = R_a + R_b + E . $

Dividing $z_a z_b$ by the canonical section of $cal(O)_X \( E \)$ gives a section of $cal(O)_X \( 2 J - E \)$ with zero divisor $R_a + R_b$. These three sections have no common zero. In fact the unions $L_a union L_b$ belonging to different opposite pairs are disjoint on $B$: a line in one pair shares an endpoint with every line in either other pair, so their strict transforms are disjoint. We have therefore proved that both $J$ and $2 J - E$ are globally generated. Their sum

#[#set math.equation(numbering: n => "(16)")
 $ H = 3 J - E $ <eq:cover-polarization>]

is globally generated as well.

To check ampleness, first note that $2 ell - sum_i e_i$ is globally generated on $B$ by the three opposite-pair conics: after removing their exceptional components, their zero divisors are precisely the three disjoint unions just considered. Thus this divisor is nef, as is $ell$. The class $ell$ has positive intersection with every nonexceptional curve, and $\( 2 ell - sum_i e_i \) dot.op e_j = 1$ for every exceptional curve. Consequently

$ - K_B = ell + (2 ell - sum_i e_i) $

has positive intersection with every integral curve. Its square is $5$, so the surface Nakai–Moishezon criterion #cite(label("Hartshorne")) Chapter V, Theorem 1.10 proves that $- K_B$ is ample. Since

$ n H tilde.op pi^(*) (3 ell - sum_i e_i) = pi^(*) \( - K_B \) \, $

finite pullback and passage to a positive tensor root #cite(label("Stacks")) Tags 0892 and 01PT show that $H$ is ample. The intersection formula now gives

#[#set math.equation(numbering: n => "(17)")
 $ H^2 = frac(5 d, n^2) . $ <eq:cover-degree>]

Equations (15) and (17), with $d = n^5$, prove Proposition 6.

== 7 The counterexample <sec:conclusion>

#proof[
  Take the surface and polarization of Proposition 6 with $n = 7$. Their invariants are
  $ H^2 = 5 dot.op 7^3 = 1715 \, #h(2em) K_X^2 - 2 c_2 \( X \) = 39 dot.op 7^3 = 13377 > 10290 = 6 H^2 . $
  The ring $R \( X \, H \)$ is a complete Noetherian normal local domain of dimension three, with residue field $bb(C)$, by Section 2. If it had a nonzero finite module of depth three, Theorem 2 would give the opposite numerical inequality. Thus it has no such module. ◻
]

#thm([Corollary 7.1.])[
  #emph[Let $X$ and $H$ be the surface and polarization constructed in Proposition 6 for $n = 7$, and put 
$ T = T \( X \, H \) \, #h(2em) frak(n) = T_(> 0) . $

 Then $T$ is a finitely generated graded three-dimensional $bb(C)$-domain, $frak(n)$ is maximal with $T \/ frak(n) = bb(C)$, and the three-dimensional local domain $T_(frak(n))$ has no nonzero finitely generated maximal Cohen–Macaulay module.]
] <cor:affine-local>

#proof[
  Section 2 shows that $T$ is a domain finite over the polynomial subring $S = bb(C) \[ x_0 \, x_1 \, x_2 \]$. Thus $T$ is a finitely generated $bb(C)$-algebra and has dimension three by invariance of dimension under integral extensions #cite(label("Stacks")) Tag 00OK. Since $T_0 = bb(C)$, $frak(n)$ is maximal, and $R_0 := T_(frak(n))$ is a Noetherian local domain essentially of finite type over $bb(C)$, with residue field $bb(C)$. Equation (2) identifies its maximal-ideal completion with the ring $R = R \( X \, H \)$ used above. Completion preserves the dimension of a Noetherian local ring #cite(label("Stacks")) Tag 07NV, so $dim R_0 = dim R = 3$.
  Suppose that $M$ is a nonzero finite $R_0$-module of depth three, and choose an $M$-regular sequence $z_1 \, z_2 \, z_3$ in the maximal ideal of $R_0$. The completion map $R_0 arrow.r R$ is faithfully flat, and, since $M$ is finite, its completion satisfies $hat(M) tilde.equiv M ⊗_(R_0) R$ #cite(label("Stacks")) Tags 00MC and 00MA. This is a finite nonzero $R$-module. Put $M_0 = M$ and $M_i = M \/ \( z_1 \, dots.h \, z_i \) M$ for $1 lt.eq i lt.eq 3$. Nakayama’s lemma gives $M_i eq.not 0$ successively. For $0 lt.eq i < 3$, flatness preserves the exact sequence
  $ 0 arrow.r M_i arrow.r^(z_(i + 1)) M_i arrow.r M_(i + 1) arrow.r 0 $
  after tensoring with $R$. The canonical identifications
  $ M_i ⊗_(R_0) R tilde.equiv hat(M) \/ \( z_1 \, dots.h \, z_i \) hat(M) #h(2em) \( 1 lt.eq i lt.eq 3 \) $
  and faithful flatness show that these completed quotients remain nonzero. The images of the $z_i$ lie in the maximal ideal of $R$, so they form an $hat(M)$-regular sequence of length three. Hence $"depth"_R hat(M) gt.eq 3$. For a nonzero finite module over a Noetherian local ring, depth is at most the dimension of its support #cite(label("Stacks")) Tag 00LK, which here is at most $dim R = 3$. Thus $hat(M)$ has depth three, contradicting the completed-ring conclusion just proved for $R = R \( X \, H \)$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
