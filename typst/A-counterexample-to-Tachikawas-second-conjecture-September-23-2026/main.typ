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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to Tachikawa's second conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $A$ be a finite-dimensional algebra over a field $k$. A finite-dimensional $A$-module $M$ is #emph[self-orthogonal] if $"Ext"_A^i \( M \, M \) = 0$ for every integer $i > 0$. Tachikawa’s second conjecture asserts that every finite-dimensional self-orthogonal module over a finite-dimensional self-injective algebra is projective. This question belongs to the homological conjectures surrounding quasi-Frobenius algebras and dominant dimension; see Tachikawa’s 1973 monograph #cite(label("Tachikawa1973")) pp. VI–VII and the account of the conjecture in #cite(label("ChenXi2025TAMS")) p. 7288. The Auslander–Reiten conjecture, originating in #cite(label("AuslanderReiten1975")), asks for finite-dimensional algebras whether the condition $"Ext"_A^i \( M \, M xor A \) = 0$ for every $i > 0$ forces $M$ to be projective. For a self-injective algebra, the groups $"Ext"_A^i \( M \, A \)$ vanish automatically, so Tachikawa’s second conjecture is its self-injective case.

Write $D = "Hom"_k \( - \, k \)$. An algebra $A$ is #emph[symmetric] if $A tilde.eq D A$ as $A$-bimodules; in particular, a symmetric algebra is self-injective. We prove the following result in this class.

#thm([Theorem 1.1.])[
  #emph[Let 
$ k = bb(F)_2 \( q \, H_1 \, H_2 \) \, $

 where $q \, H_1 \, H_2$ are algebraically independent. There exist a finite-dimensional associative unital symmetric $k$-algebra $A$ and a finite-dimensional unital left $A$-module $M$ such that $M$ is nonprojective and 
$ "Ext"_A^i \( M \, M \) = 0 #h(2em) upright("for every integer ") i > 0 . $

 In particular, Tachikawa’s second conjecture is false.]
] <thm:main>

Since $A$ is self-injective, the same module satisfies $"Ext"_A^i \( M \, M xor A \) = 0$ for every $i > 0$. Thus Theorem 1 also gives a symmetric counterexample to the Auslander–Reiten conjecture.

===== 1.1 Related results. <related-results.>

Schulz’s earlier example of a nonprojective module without positive self-extensions uses an algebra over a skew field, outside the finite-dimensional-over-a-field setting considered here; see #cite(label("Schulz1994")) and the distinction recalled in #cite(label("DiverisPurin2012")) Introduction. His quantum-exterior example has nonzero first self-extension but no higher self-extensions #cite(label("Schulz1995")) Example 7; the parameter-shifting syzygies in that example are an antecedent for our starting algebra. For symmetric Artin algebras, Diveris and Purin show that a component containing a nonprojective module with eventually vanishing self-extensions has stable part of type $bb(Z) A_oo$ #cite(label("DiverisPurin2014")) Theorem A. Over an algebraically closed field, Erdmann classifies, up to Morita equivalence, the indecomposable weakly symmetric algebras with radical cube zero and nonzero radical square that admit such modules. The classification singles out quantum exterior and double Nakayama algebras with parameters that are not roots of unity #cite(label("Erdmann2017")) Theorem 1.1.

Chen, Fang and Xi characterize the symmetric case through stratifying ideals and give conditional mirror-reflective constructions from gendo-symmetric counterexamples to the Nakayama conjecture #cite(label("ChenFangXi2024")) Theorems 1.1 and 1.2. Chen and Xi relate self-orthogonal Nakayama-stable generators over self-injective algebras to additional categorical and Gorenstein–Morita conditions #cite(label("ChenXi2025TAMS")) Theorem 1.2 and Corollary 1.4. Their further criterion assumes virtual Gorensteinness of the relevant endomorphism algebra #cite(label("ChenXi2025VG")) Theorem 1.3. Zhang and Zhou prove the self-injective case for split algebras with radical cube zero #cite(label("ZhangZhou2026")) Corollary 4.2 and subsequently treat Igusa–Todorov algebras #cite(label("ZhangZhouIgusaTodorov2026")) Theorem 3.2. Xia proves the Auslander–Reiten conjecture for quantum complete intersections #cite(label("Xia2026")) Corollary 4.3. In a different direction, Böhmler and Marczinzik construct a nonprojective module over a commutative local self-injective algebra whose first two self-extension groups vanish, while the third does not #cite(label("BohmlerMarczinzik2026")) Theorem 3.1 and the end of Section 3. Theorem 1 establishes vanishing in every positive degree.

Enomoto and Marczinzik prove that Tachikawa’s second conjecture for the two-fold trivial extension of an Artin algebra implies the Auslander–Reiten conjecture for that algebra #cite(label("Enomoto2026")) Theorem 3.5. This reduction has a self-injective target, not a symmetric target in general. Our construction obtains a symmetric algebra by establishing the additional complete-resolution vanishing needed for transfer to the ordinary trivial extension. Enomoto and Marczinzik also prove an equivalence among the universal versions of the Auslander–Reiten, generalized Nakayama, Nakayama, and both Tachikawa conjectures over a fixed commutative Artinian coefficient ring #cite(label("Enomoto2026")) Theorem 1.1.

===== 1.2 The construction. <the-construction.>

The companion article #cite(label("OpenAIAR2026")) constructs an explicit eight-simple triangular counterexample. We use the same ten-dimensional starting algebra and related cone and triangular-module constructions, and reproduce the algebra, resolutions, and arguments needed here. The passage to a symmetric algebra requires vanishing in negative degrees of a complete self-extension complex as well as positive Ext vanishing.

Two steps organize the proof. First, Proposition 11 gives a general transfer principle. For a finite-dimensional algebra $Lambda$, a doubly infinite exact complex $P_Z$ of finite projective $Lambda$-modules is #emph[totally acyclic] if $"Hom"_Lambda \( P_Z \, Lambda \)$ is also exact. Suppose $P_Z$ is totally acyclic, $Z = "coker" \( \( P_Z \)_1 arrow.r \( P_Z \)_0 \)$, and

#[#set math.equation(numbering: n => "(1.1)")
 $ H^a "Hom"_Lambda \( P_Z \, Z \) = 0 #h(2em) \( a > 0 med upright("or") med a lt.eq - 2 \) . $ <intro:profile>]

Then the trivial extension and induced module

$ A = Lambda times.l D Lambda \, #h(2em) M = A ⊗_Lambda Z $

give the required symmetric example whenever $Z$ is nonprojective. The negative tail computes the positive extensions into $D Lambda ⊗_Lambda Z$, with the precise index $- a - 1$. This transfer principle applies to any finite-dimensional algebra and module satisfying its hypotheses.

Second, we construct the data required by this transfer. A ten-dimensional algebra $C$ has a one-dimensional simple module $s$. Put

$ T = C times.l D C \, #h(2em) B = C ⊗_k C \, #h(2em) E = T ⊗_k T \, #h(2em) X = s ⊗_k s . $

We regard $s$ as a $T$-module through $T arrow.r C$, and $X$ as an $E$-module. Write $s \[ r \]$ for $s$ placed in homological degree $r$. Derived induction of $s$ from $C$ to $T$ gives an object $cal(J) = T ⊗_C^(upright(bold(L))) s$ in a triangle

$ s \[ 2 \] arrow.r cal(J) arrow.r s arrow.r^tau s \[ 3 \] . $

The class $tau$ generates $"Ext"_T^(*) \( s \, s \) = k \[ tau \]$. The tensor product $E$ is symmetric, and external products give the self-extension algebra $"Ext"_E^(*) \( X \, X \) = k \[ tau_1 \, tau_2 \]$, where $tau_1 = tau ⊗ 1$ and $tau_2 = 1 ⊗ tau$ both have degree three. A stable map is a module map modulo maps factoring through projectives; over a symmetric algebra the shift $\[ 1 \]$ is inverse syzygy. Symmetric duality determines the negative stable self-maps of $X$ from this polynomial algebra.

Tensoring two copies of this triangle describes $E ⊗_B^(upright(bold(L))) X tilde.eq cal(J) ⊗ cal(J)$. Its attaching maps act by $tau_1$ and $tau_2$. On nonnegative stable self-maps these give the two-variable Koszul sequence, and on negative self-maps they give its dual. This Koszul calculation, together with the full attaching maps, leaves only two scalar groups. The bar complex for $E ⊗_B^(upright(bold(L))) E$ provides a finite $E$-bimodule $Y$, projective separately on the left and right, whose evaluation represents $\( cal(J) ⊗ cal(J) \) \[ - 1 \]$ in the stable category. Its stable Hom groups are

$ W^a := underline("Hom")_E \( X \, \( Y ⊗_E X \) \[ a \] \) tilde.eq cases(delim: "{", k \, & a = - 3 \, 0 \,, 0 \, & a in.not { - 3 \, 0 } .) $

For $H in k^times$, let $h_H$ fix $C$ and multiply $D C$ by $H$, and let $U_H$ be $E$ with right action twisted by $h_H ⊗ h_H$. There is a natural identification $U_H ⊗_E X = X$. To combine two twists, we need the nonzero line $W^0$ to be reached by evaluating genuine bimodule maps $U_H arrow.r Y$; a module map $X arrow.r Y ⊗_E X$ alone does not supply a bimodule fiber. A trace obstruction for a character map $B arrow.r D B$, combined with symmetric duality, produces precisely these maps $g_H$, with nonzero evaluations in degree zero. The sparse Hom profile and these bimodule lifts are the two conclusions of Proposition 19.

After normalizing the maps for $H_1 \, H_2$, their fiber has a finite bimodule representative $F$, obtained as an ordinary kernel after adjoining a projective summand. It comes with a stable map $v : X arrow.r F ⊗_E X$. The two twists act by distinct scalars on each nonzero positive or negative homogeneous self-map space of $X$. These actions make the self-extension comparison invertible in the required degree ranges. Forming a cone over

$ Lambda = mat(delim: "(", E, 0; F, E) $

produces the totally acyclic resolution of $Z$ with (1.1); the boundary degrees $1$ and $- 2$ are checked separately. Figure 1 locates the bimodule construction and the final transfer in this argument. All bimodule representatives, kernels, and cokernels used to define the final algebra and module are finite-dimensional over the stated field. Infinite complexes serve to prove their properties.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 3.7), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$E=T ⊗ T$, $X=s ⊗ s$#linebreak()$"Ext"_E^*(X,X)=k[ tau_1, tau_2]$]]])])
  content((6.6, 3.7), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y$ and $g_H:U_H arrow.r Y$#linebreak()$W^a=0$ for $a in.not \{-3,0\}$]]])])
  content((6.6, 1), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$F$ and $v:X arrow.r F ⊗_E X$]]])])
  content((0, 1), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$( Lambda ,Z)$ and $P_Z$#linebreak()$H^a "Hom"_ Lambda (P_Z,Z)=0$#linebreak()for $a>0$ or $a lt.eq -2$]]])])
  content((0, -1.6), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$A= Lambda "ltimes" D Lambda$#linebreak()$M=A ⊗_ Lambda Z$#linebreak()symmetric counterexample]]])])
  line((2.612, 3.7), (3.988, 3.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.3, 4.6), [#text(size: 8pt)[derived induction#linebreak()and trace obstruction]], anchor: "south", padding: 0.1176cm)
  line((6.6, 3.144), (6.6, 1.346), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.6, 2.35), [#text(size: 8pt)[two twists#linebreak()and finite fiber]], anchor: "west", padding: 0.1176cm)
  line((3.988, 1), (2.612, 1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.3, 1.9), [#text(size: 8pt)[triangular cone]], anchor: "south", padding: 0.1176cm)
  line((0, 0.268), (0, -0.8611), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, -0.3), [#text(size: 8pt)[trivial extension#linebreak()and induction]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Constructions and implications in the proof. The complete self-Hom vanishing for $\( Lambda \, Z \)$ supplies the hypotheses for transfer to $\( A \, M \)$. Arrows indicate proof stages, not algebra maps. ],
) <fig:proof-architecture>

===== 1.3 Homological consequences. <homological-consequences.>

The pair $\( A \, M \)$ gives counterexamples to several conjectures formulated through injective resolutions and tilting modules. Corollary 2 realizes five such failures using one endomorphism algebra and two associated modules. We state the relevant conjectures in their finite-dimensional left-module forms before giving the corollary. For a finite-dimensional algebra $Gamma$, write

$ 0 arrow.r zws_Gamma Gamma arrow.r I^0 arrow.r I^1 arrow.r dots.h.c $

for its minimal injective resolution. Its #emph[dominant dimension] is the supremum of the integers $d gt.eq 0$ for which $I^j$ is projective whenever $0 lt.eq j < d$, and is infinite when every $I^j$ is projective. The classical #emph[Nakayama conjecture] asserts that infinite dominant dimension forces self-injectivity. The #emph[generalized Nakayama conjecture] asserts that every indecomposable injective occurs as a summand of some $I^j$; equivalently, for every simple module $S$, some $"Ext"_Gamma^i \( S \, Gamma \)$ with $i gt.eq 0$ is nonzero. The #emph[strong Nakayama conjecture] asserts that a finite module $V$ with $"Ext"_Gamma^i \( V \, Gamma \) = 0$ for all $i gt.eq 0$ is zero. The #emph[Auslander–Gorenstein conjecture] asserts that the bounds $"pd"_Gamma I^j lt.eq j$ for every $j gt.eq 0$ force finite self-injective dimension on both sides. These formulations are recalled in #cite(label("Zhang2018HomologicalConjectures")) Introduction.

Write $"add" W$ for the direct summands of finite direct sums of a module $W$. A finite left $Gamma$-module $W$ is #emph[tilting] if it has finite projective dimension, is self-orthogonal, and admits a finite exact coresolution

$ 0 arrow.r Gamma arrow.r W^0 arrow.r dots.h.c arrow.r W^r arrow.r 0 \, #h(2em) W^j in "add" W . $

It is #emph[Wakamatsu tilting] if it is self-orthogonal and admits an exact coresolution

$ 0 arrow.r Gamma arrow.r W^0 arrow.r W^1 arrow.r dots.h.c \, #h(2em) W^j in "add" W \, $

which remains exact after applying $"Hom"_Gamma \( - \, W \)$. This is the finite left-module definition in #cite(label("Huang2006")) Definition 2.1. The #emph[Wakamatsu tilting conjecture] asserts that a Wakamatsu tilting module of finite projective dimension is tilting; see #cite(label("DivaaniAazarMahinFallahTousi2025")) for a recent discussion.

#thm([Corollary 1.2.])[
  (Homological conjectures).  #emph[Let $A \, M$ be as in Theorem 1. For every field extension $K \/ k$, put $A_K = K ⊗_k A$, $M_K = K ⊗_k M$, and 
$ Gamma_K = "End"_(A_K) \( A_K xor M_K \)^(upright("op")) . $

 Then $Gamma_K$ is a finite-dimensional $K$-algebra with the following properties, in the category of finite left $Gamma_K$-modules.]
  + #emph[Every term of the minimal injective resolution of $Gamma_K$ is projective, but $"id"_(Gamma_K) Gamma_K = oo$.]
  + #emph[There is a nonzero simple module $S$ such that $"Ext"_(Gamma_K)^i \( S \, Gamma_K \) = 0$ for every $i gt.eq 0$.]
  + #emph[There is a projective-injective Wakamatsu tilting module $W$ which is not tilting.]
  #emph[Consequently the classical, generalized, and strong Nakayama conjectures, the Auslander–Gorenstein conjecture, and the Wakamatsu tilting conjecture are false for finite-dimensional algebras over $K$.]
] <cor:homological>

The opposite in this definition keeps our left-module convention. The endomorphism-algebra connection with dominant dimension is classical, going back to Mueller #cite(label("Mueller1968")) Lemma 3 and Theorem 4; the precise Tachikawa–Nakayama correspondence for a pair $\( A \, M \)$ is also stated in #cite(label("ChenXi2025TAMS")) p. 7288. Section 8 uses this connection and constructs the modules $S$ and $W$ directly. Taking $K$ to be an algebraic closure of $k$ gives examples over an algebraically closed field of characteristic two. This field contains the displayed transcendental parameters; the assertion does not concern the algebraic closure of a finite field.

The same resolution also gives a finitistic-dimension consequence. For a finite-dimensional algebra, the #emph[little left finitistic dimension] is the supremum of the finite projective dimensions of finite left modules; the #emph[big left finitistic dimension] allows all left modules instead.

#thm([Corollary 1.3.])[
  (Finitistic dimensions).  #emph[Let $k$ be the field in Theorem 1, let $K \/ k$ be any field extension, and let $Gamma_K$ be the algebra in Corollary 2. For every integer $n gt.eq 1$, there is a finite-dimensional left $Gamma_K$-module $C_n$ such that 
$ "pd"_(Gamma_K) C_n = n . $

 Consequently $Gamma_K$ has infinite little left finitistic dimension and infinite big left finitistic dimension.]
] <cor:finitistic>

This gives an independent characteristic-two example alongside the complex algebra of #cite(label("OpenAIFinitistic2026")) Theorem 1.1.

Two further applications are developed in Section 8. The connection between generalized Nakayama failure and cotilting complements established by Buan and Solberg #cite(label("BuanSolberg1998")) Theorems 3.1 and 3.4 gives a projective module over $Gamma_K^(upright("op"))$ that can be completed to a tilting module in infinitely many ways, each by adjoining one indecomposable summand; these summands are pairwise nonisomorphic (Corollary 31). Their introduction credits an independent proof of this connection to Happel and Unger #cite(label("BuanSolberg1998")) Introduction. The mirror-reflective constructions of Chen, Fang and Xi #cite(label("ChenFangXi2024")) give auxiliary indecomposable symmetric algebras with arbitrarily long idempotent stratifications and the resulting chains of successive derived-category recollements specified in Corollary 32.

===== 1.4 Organization. <organization.>

Section 2 establishes the complete-resolution, duality, and finite-representative tools. Section 3 proves the transfer to a symmetric algebra. Sections 4 and 5 construct the starting algebra and compute the stable self-maps and twist actions. Section 6 constructs the finite bimodule and proves the trace obstruction. Section 7 forms the triangular module, establishes the complete vanishing profile, and applies the transfer to prove Theorem 1. Section 8 studies the associated endomorphism algebra and proves Corollaries 2 and 3.

===== 1.5 Conventions. <conventions.>

All algebras are associative and unital, all modules are unital left modules unless indicated otherwise, and all modules occurring in the construction are finite-dimensional. Unspecified tensor products are over $k$, and $G^e = G ⊗_k G^(upright("op"))$ acts on $G$-bimodules by the usual outer actions. Complexes are indexed homologically, with $P \[ a \]_j = P_(j - a)$. Since the field has characteristic two, signs in their differentials and comparison maps disappear. The following section fixes the stable and derived conventions used throughout.

== 2 Homological preliminaries <sec:homological>

The tools in this section serve two passages in the construction. Complete-resolution comparison will turn the triangular cone’s endomorphism calculation into the vanishing needed for transfer to a symmetric algebra. Stable duality will supply the negative-degree maps used in that calculation. Separately, projective models and their stable images will turn the derived-induction object into a finite bimodule, preserving its maps and connecting morphisms under evaluation.

Throughout the construction, $k$ has characteristic two. Unless explicitly stated otherwise, algebras and modules are finite dimensional over $k$. Resolution and model complexes have finite-dimensional terms; the full Hom complexes defined below may have infinite-dimensional product terms. Modules are left modules unless a side is specified. Write $D = "Hom"_k \( - \, k \)$ and $G^e = G ⊗_k G^(upright("op"))$; an unsubscripted tensor product is over $k$. Differentials lower homological degree, and

$ P \[ a \]_j = P_(j - a) \, #h(2em) c_j P = "coker" \( d_(j + 1)^P : P_(j + 1) arrow.r P_j \) . $

Characteristic two removes the signs in shifts, tensor differentials and cones. For two complexes we use the full Hom complex

#[#set math.equation(numbering: n => "(2.1)")
 $ "Hom"_G^a \( P \, Q \) = product_(j in bb(Z)) "Hom"_G \( P_j \, Q_(j - a) \) \, #h(2em) \( delta f \)_j = d_(j - a)^Q f_j + f_(j - 1) d_j^P . $ <h:full-hom>]

For a module $N$, viewed in degree zero, $"Hom"_G \( P \, N \)^a = "Hom"_G \( P_a \, N \)$. The space $underline("Hom")_G \( M \, N \)$ is the quotient of $"Hom"_G \( M \, N \)$ by maps factoring through finite projectives.

=== 2.1 Complete resolutions and stable duality <complete-resolutions-and-stable-duality>

An exact complex $P$ of projectives is #emph[totally acyclic] if $"Hom"_G \( P \, G \)$ is exact. If $c_0 P = M$, we call $P$ a complete resolution of $M$. The comparison below also applies when $G$ is not self-injective. Complete resolutions and passage from derived objects to stable modules belong to the framework developed by Buchweitz #cite(label("Buchweitz2021")). We give the comparison and truncation arguments in our conventions.

#thm([Lemma 2.1.])[
  (Complete-resolution comparison).  #emph[Let $P$ be totally acyclic and let $Q$ be an exact complex of projectives. For every integer $a$ there are natural isomorphisms 
#[#set math.equation(numbering: n => "(2.2)")
 $ H^a "Hom"_G^bullet \( P \, Q \) tilde.eq underline("Hom")_G \( c_a P \, c_0 Q \) tilde.eq H^a "Hom"_G \( P \, c_0 Q \) . $ <h:comparison-formula>]

 The first isomorphism is induced by cokernels of shifted chain maps and respects composition. For $a > 0$ these spaces are $"Ext"_G^a \( c_0 P \, c_0 Q \)$.]
] <h:comparison>

#proof[
  We first record the extension property supplied by total acyclicity. If $J$ is projective, then $"Hom"_G \( P \, J \)$ is exact, since $J$ is a summand of a finite sum of copies of $G$. Identify $c_j P$ with $"im" d_j^P subset P_(j - 1)$. For $u : c_j P arrow.r J$, the map $u d_j^P : P_j arrow.r J$ is a cocycle. Exactness gives $h : P_(j - 1) arrow.r J$ with $h d_j^P = u d_j^P$, so $h$ extends $u$. It follows at once that the cycles of $"Hom"_G \( P \, N \)^a$ are maps $c_a P arrow.r N$ and its boundaries are exactly the maps factoring through projectives. This proves the second isomorphism, with $N = c_0 Q$.
  For the first, begin in degree zero. A map $c_0 P arrow.r c_0 Q$ lifts to $f_0 : P_0 arrow.r Q_0$, and then successively to $f_j$ for $j > 0$, using projectivity of $P_j$ and exactness of $Q$. To proceed downwards, $d_j^Q f_j$ vanishes on $ker d_j^P = "im" d_(j + 1)^P$ by the chain equation already obtained in degree $j + 1$. It therefore defines a map $c_j P = "im" d_j^P arrow.r Q_(j - 1)$. The extension property gives $f_(j - 1)$. Thus every cokernel map lifts to a full chain map.
  A homotopy induces a projective factorization on $c_0$. Conversely, suppose the cokernel map of $f$ factors as $c_0 P arrow.r J arrow.r c_0 Q$ with $J$ projective. Extend its first factor to $P_(- 1)$ and lift its second factor to $Q_0$. Their composite is a homotopy component $h_(- 1) : P_(- 1) arrow.r Q_0$ whose homotopy differential removes the induced map on cokernels. It remains to nullhomotope a chain map inducing zero there. For this remaining map set $h_(- 1) = 0$. For $j gt.eq 0$, lift
  $ f_j + h_(j - 1) d_j^P : P_j arrow.r "im" d_(j + 1)^Q $
  to $h_j : P_j arrow.r Q_(j + 1)$; the initial image assertion is the vanishing on $c_0$, and each later one follows from the preceding chain equation. For $j < 0$, the map $f_j + d_(j + 1)^Q h_j$ kills $"im" d_(j + 1)^P$ by the equation in degree $j + 1$. It descends to $"im" d_j^P$ and extends to $h_(j - 1) : P_(j - 1) arrow.r Q_j$ by the same extension property. These equations give $f = d h + h d$ in every degree. The product in (2.1) permits all these components; each equation uses only two of them.
  Replace $P$ by $P \[ - a \]$ to obtain degree $a$. The construction by cokernels preserves compositions and shifts. Finally, the nonnegative tail of $P$ resolves $c_0 P$. In every positive cohomological degree its Hom complex has the same two adjacent differentials as $"Hom"_G \( P \, c_0 Q \)$, proving the Ext assertion, including degree one. ◻
]

Recall that $G$ is #emph[symmetric] if there is a bimodule isomorphism $G tilde.eq D G$, or equivalently a linear form $t : G arrow.r k$ such that $t \( a b \) = t \( b a \)$ and $\( a \, b \) mapsto t \( a b \)$ is nondegenerate. In this case finite projectives are injective, and every finite module embeds in a finite projective: dualize a finite projective surjection onto its dual. Splicing a projective resolution and a projective-injective coresolution therefore gives a complete resolution of every finite module; applying $"Hom"_G \( - \, G \)$ preserves its exactness because $G$ is injective.

For such a resolution put $M \[ a \] = c_(- a) P$ in the stable category. The exact sequences

#[#set math.equation(numbering: n => "(2.3)")
 $ 0 arrow.r c_(j + 1) P arrow.r P_j arrow.r c_j P arrow.r 0 $ <h:syzygy-sequence>]

show that $\[ 1 \]$ is inverse syzygy. Lemma 4 makes these shifts independent of choices, functorial on stable maps, and compatible with composition. In particular,

#[#set math.equation(numbering: n => "(2.4)")
 $ H^a "Hom"_G \( P \, N \) = underline("Hom")_G \( M \, N \[ a \] \) #h(2em) \( a in bb(Z) \) . $ <h:stable-ext>]

For positive degrees the shifted composition is the Yoneda product, since both are computed by lifting maps to projective resolutions.

A short exact sequence $0 arrow.r L arrow.r V arrow.r N arrow.r 0$ gives a long exact sequence of the groups in (2.4): apply $"Hom"_G \( P \, - \)$ termwise. Its connecting map is composition with $partial : N arrow.r L \[ 1 \]$. Concretely, lift a projective surjection $J arrow.r N$ to $J arrow.r V$ and restrict to its kernel. The resulting map $Omega N arrow.r L$, shifted once, is $partial$. This agrees with the cochain connecting map, which lifts a cocycle and then applies the differential. We use this description to keep track of connecting maps, as well as the groups in the long exact sequences.

The next lemma is the symmetric form of Auslander–Reiten duality, also called Tate duality; see #cite(label("Linckelmann2013")) Section 2, (2.3) and (2.7)–(2.8). Its composition pairing will determine the action on negative-degree self-maps.

#thm([Lemma 2.2.])[
  (Symmetric stable duality).  #emph[For a symmetric algebra $G$ there are natural isomorphisms 
#[#set math.equation(numbering: n => "(2.5)")
 $ D underline("Hom")_G \( M \, N \) tilde.eq underline("Hom")_G \( N \, M \[ - 1 \] \) . $ <h:duality-formula>]

 There is a linear functional $lambda_M : underline("Hom")_G \( M \, M \[ - 1 \] \) arrow.r k$ for which the perfect pairing is $\( f \, g \) mapsto lambda_M \( g f \)$. Consequently, for every integer $a$ the pairing 
#[#set math.equation(numbering: n => "(2.6)")
 $ underline("Hom")_G \( M \, N \[ a \] \) times underline("Hom")_G \( N \, M \[ - a - 1 \] \) arrow.r k \, #h(2em) \( alpha \, beta \) mapsto lambda_M #scale(x: 120%, y: 120%)[\(] beta \[ a \] alpha #scale(x: 120%, y: 120%)[\)] $ <h:shifted-pairing>]

 is perfect and natural.]
] <h:duality>

#proof[
  For every finite projective $J$ the finite-dimensional adjunction gives
  $ D "Hom"_G \( J \, N \) tilde.eq "Hom"_G \( N \, D G ⊗_G J \) tilde.eq "Hom"_G \( N \, J \) . $
  The first identification is immediate for $J = G$, hence for finite sums and summands; the second uses a fixed symmetrizing form. Apply this termwise to a complete resolution $P$ of $M$. Dualizing degree-zero cohomology of $"Hom"_G \( P \, N \)$ yields
  $ frac("Hom"_G #scale(x: 120%, y: 120%)[\(] N \, ker \( P_0 arrow.r P_(- 1) \) #scale(x: 120%, y: 120%)[\)], "im" #scale(x: 120%, y: 120%)[\(] "Hom"_G \( N \, P_1 \) arrow.r "Hom"_G \( N \, ker \( P_0 arrow.r P_(- 1) \) \) #scale(x: 120%, y: 120%)[\)]) . $
  Here $ker \( P_0 arrow.r P_(- 1) \) = c_1 P = M \[ - 1 \]$. A factorization through any projective lifts through $P_1 arrow.r.twohead c_1 P$, so the displayed quotient is precisely $underline("Hom")_G \( N \, M \[ - 1 \] \)$. All identifications are natural; comparison of complete resolutions also gives naturality in $M$.
  Define $lambda_M \( g \)$ by pairing $1_M$ with $g$. Naturality in $N$, applied to $f : M arrow.r N$, identifies the pairing of $f$ and $g$ with $lambda_M \( g f \)$. Replacing $N$ by $N \[ a \]$ and using the shift equivalences gives (2.6). ◻
]

=== 2.2 Projective models and their stable images <projective-models-and-their-stable-images>

In Section 6, derived induction first supplies a bounded derived bimodule. We will obtain the finite bimodule $Y$ from high cokernels of a projective model. To compute its evaluated stable Hom groups, we must also retain the actual maps attaching the model’s successive pieces. The next two lemmas establish this passage from derived objects and connecting morphisms to finite stable modules.

We write $upright(D)^b \( G \)$ for the derived category of bounded complexes of finite modules. A complex is #emph[perfect] if it is derived isomorphic to a bounded complex of finite projectives. We will represent bounded derived objects by bounded-below complexes of finite projectives with bounded homology. The following elementary facts specify the models and maps we use. For a chain map $f : L arrow.r N$, our cone convention is

#[#set math.equation(numbering: n => "(2.7)")
 $ "Cone" \( f \)_j = N_j xor L_(j - 1) \, #h(2em) d_j^("Cone" \( f \)) = mat(delim: "(", d_j^N, f_(j - 1); 0, d_(j - 1)^L) . $ <h:cone>]

The projective-model statement is the bounded case of the standard $K$-projective formalism; see #cite(label("Spaltenstein1988")) Proposition 1.4 and Example 3.2(a), with the opposite indexing convention for complexes.

#thm([Lemma 2.3.])[
  (Derived maps and two-cell models).  #emph[A bounded-below complex $P$ of projectives computes derived maps out of it by chain maps modulo homotopy. Every bounded complex of finite modules has such a projective model with finite terms. In particular, two such models of the same derived object are homotopy equivalent.]
  #emph[Suppose a derived triangle is given by 
$ L arrow.r V arrow.r R arrow.r^partial L \[ 1 \] . $

 For projective models $P_L \, P_R$ and a chain map $b : P_R arrow.r P_L \[ 1 \]$ representing $partial$, a model of $V$ is the two-cell complex 
#[#set math.equation(numbering: n => "(2.8)")
 $ P_(V \, j) = P_(L \, j) xor P_(R \, j) \, #h(2em) d_j^(P_V) = mat(delim: "(", d_j^(P_L), b_j; 0, d_j^(P_R)) . $ <h:two-cell>]

 Its subcomplex and quotient represent $L$ and $R$, and its connecting map is the specified $partial$.]
] <h:derived-models>

#proof[
  Every chain map from $P$ to an acyclic complex is nullhomotopic: start at the lowest nonzero degree of $P$ and successively lift the residual map through the next differential of the target. The same argument applies to every shift. Thus the full Hom from $P$ sends quasi-isomorphisms to quasi-isomorphisms, which proves the assertion about derived maps. This is the $K$-projectivity of a bounded-below projective source; it does not assert $K$-projectivity of a complete resolution.
  For completeness, a bounded-below finite complex $V$ admits a projective model $theta : Q arrow.r V$ by the following induction. Having constructed lower terms, choose $Q_j$ finite projective surjecting onto
  $ { \( x \, y \) in V_j xor Q_(j - 1) : d_V x = theta \( y \) \, med d_Q y = 0 } . $
  Use its two components for $theta_j$ and $d_j^Q$. Every cycle of the comparison cone is then a boundary, so $theta$ is a quasi-isomorphism. A derived isomorphism between projective models and its inverse are represented by chain maps, and their composites are homotopic to the identities by the first assertion.
  To verify the last assertion, represent the first arrow of the triangle by $f : P_L arrow.r P_V$ on any projective models. Its cone represents $R$, and the projection $"Cone" \( f \) arrow.r P_L \[ 1 \]$ represents $partial$. The cone of the deshifted projection has $P_V$ as a subcomplex with contractible quotient $"Cone" \( 1_(P_L) \)$. It therefore represents $V$. Replacing the projective models by homotopy equivalent ones and the map by its prescribed representative preserves this conclusion: a homotopy commuting square induces a cone map with that homotopy as its off-diagonal component, and homotopic maps have isomorphic cones. The resulting cone $"Cone" \( b \[ - 1 \] \)$ is exactly (2.8). ◻
]

A bounded-below complex with bounded homology represents a bounded derived object by good truncation. Also, a bounded complex whose terms have finite projective dimension is perfect: its finite filtration by terms expresses it as successive cones of shifts of modules with bounded projective resolutions. These observations allow us to use the preceding models without introducing infinite-dimensional terms.

#thm([Lemma 2.4.])[
  (Stable images).  #emph[Let $G$ be symmetric and let $P$ be bounded below with projective terms and bounded homology. For $n$ sufficiently large the formula 
#[#set math.equation(numbering: n => "(2.9)")
 $ chevron.l P chevron.r = \( c_n P \) \[ n \] $ <h:stable-image-formula>]

 defines a stable module, independent of $n$ up to natural stable isomorphism. It is functorial on derived maps represented by such models, commutes with shifts, sends a module to its stable class, and sends an Ext class to its corresponding stable map.]
  #emph[A degreewise split short exact sequence $0 arrow.r P_L arrow.r P_V arrow.r P_R arrow.r 0$ of these complexes gives a stable connecting map $chevron.l P_R chevron.r arrow.r chevron.l P_L chevron.r \[ 1 \]$ and the associated long exact stable Hom sequences. With respect to a graded splitting, this connecting map is the stable image of the cross differential $b : P_R arrow.r P_L \[ 1 \]$ in (2.8).]
] <h:stable-image>

#proof[
  Above the homology support, (2.3) is exact for $P$. It identifies $\( c_(n + 1) P \) \[ n + 1 \]$ with $\( c_n P \) \[ n \]$, naturally on chain maps. A homotopy changes $c_n \( f \)$ by a map factoring through $P_(n - 1)$, so the construction descends to homotopy classes. Lemma 6 then makes it functorial on derived maps. The identity $c_n \( P \[ a \] \) = c_(n - a) P$ gives shift compatibility. A projective resolution of a module recovers its successive syzygies, proving the assertion for modules. Restricting a lifted representative of an Ext class to high degrees gives the same successive syzygies of that map, proving the last assertion about classes.
  Choose $n$ so that all three complexes are exact in degrees at least $n$. Their cokernels give a short exact sequence
  $ 0 arrow.r c_n P_L arrow.r c_n P_V arrow.r c_n P_R arrow.r 0 . $
  For injectivity on the left, suppose $\( x \, 0 \) = d_(n + 1)^(P_V) \( u \, v \)$. Then $d_(n + 1)^(P_R) v = 0$, so $v = d_(n + 2)^(P_R) w$ for some $w$. The equation $d_L b + b d_R = 0$ gives $x = d_(n + 1)^(P_L) \( u + b_(n + 2) w \)$, as required. Surjectivity and exactness in the middle follow by lifting components in the graded splitting.
  There is a commutative diagram with exact rows
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$0$])
  content((2.519, 0), [$c_(n + 1) P_R$])
  content((5.369, 0), [$P_(R \, n)$])
  content((8.086, 0), [$c_n P_R$])
  content((10.54, 0), [$0$])
  content((0, -1.239), [$0$])
  content((2.519, -1.239), [$c_n P_L$])
  content((5.369, -1.239), [$c_n P_V$])
  content((8.086, -1.239), [$c_n P_R$])
  content((10.54, -1.239), [$0 .$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  line((3.317, 0), (4.769, 0), mark: (end: ">"))
  line((2.519, -0.2725), (2.519, -0.9661), mark: (end: ">"))
  content((2.004, -0.6193), [#text(size: 0.73em)[$overline(b)_(n + 1)$]])
  line((5.969, 0), (7.42, 0), mark: (end: ">"))
  line((5.369, -0.2725), (5.369, -0.9661), mark: (end: ">"))
  line((8.752, 0), (10.2, 0), mark: (end: ">"))
  line((8.196, -0.2725), (8.196, -0.9661))
  line((7.976, -0.2725), (7.976, -0.9661))
  line((0.336, -1.239), (1.853, -1.239), mark: (end: ">"))
  line((3.185, -1.239), (4.703, -1.239), mark: (end: ">"))
  line((6.035, -1.239), (7.42, -1.239), mark: (end: ">"))
  line((8.752, -1.239), (10.14, -1.239), mark: (end: ">"))
})
  The middle vertical map sends $z$ to the class of $\( 0 \, z \)$. On an element $d_(n + 1)^(P_R) z$, its value is the class of $\( b_(n + 1) z \, 0 \)$, since $\( b_(n + 1) z \, d_(n + 1)^(P_R) z \)$ is a boundary in $P_V$. Thus the left vertical map is induced by $b_(n + 1) : P_(R \, n + 1) arrow.r P_(L \, n)$. Shifting the left vertical arrow by $\[ n + 1 \]$ gives $chevron.l P_R chevron.r arrow.r chevron.l P_L chevron.r \[ 1 \]$. By the description after (2.4), this is the connecting map of the bottom row shifted by $\[ n \]$, and it is exactly $chevron.l b chevron.r$. This also gives the asserted long exact sequences. ◻
]

The following criterion supplies the other use of stable images in Section 6. There, an ordinary trace will rule out a perfect factorization of a derived map. The criterion then shows that its stable image is nonzero.

#thm([Lemma 2.5.])[
  (Vanishing stable image and perfect factorization).  #emph[Over a symmetric algebra, a derived map between bounded derived objects whose stable image is zero factors in the derived category through a perfect complex.]
] <h:perfect-factor>

#proof[
  Choose bounded-below projective models $P \, Q$ and represent the map by a global chain map $f : P arrow.r Q$, using Lemma 6. For a sufficiently high $n$, both complexes are exact in degrees at least $n$ and $c_n \( f \)$ factors through a finite projective $J$:
  $ c_n P arrow.r^u J arrow.r^v c_n Q . $
  Since $J$ is injective, extend $u$ across $c_n P = "im" d_n^P subset P_(n - 1)$. Since $J$ is projective, lift $v$ to $Q_n$. The composite gives $h_(n - 1) : P_(n - 1) arrow.r Q_n$. It makes $f_n + h_(n - 1) d_n^P$ zero after projection to $c_n Q$, so this residual map lifts through $d_(n + 1)^Q$ to $h_n : P_n arrow.r Q_(n + 1)$. Inductively, for $j > n$ the chain equation and the preceding homotopy equation show that $f_j + h_(j - 1) d_j^P$ lands in $ker d_j^Q = "im" d_(j + 1)^Q$. Lift it to $h_j$. Set $h_j = 0$ for $j < n - 1$.
  The homotopic map $f' = f + d h + h d$ now vanishes in every degree $j gt.eq n$. Its chain equation in degree $n$ reads
  #[#set math.equation(numbering: n => "(2.10)")
   $ f'_(n - 1) d_n^P = 0 . $ <h:truncation-boundary>]
  Consequently its remaining components define a chain map into the actual homological subcomplex $Q_(lt.eq n - 1)$, obtained by retaining $Q_j$ for $j lt.eq n - 1$ and setting the higher terms to zero. Equation (2.10) verifies the boundary condition at the cut. Thus $f'$ factors through $Q_(lt.eq n - 1)$, which is bounded and projective because $Q$ was bounded below. Composing with the chosen model maps gives the desired derived factorization. This also covers a map with a module as target: first lift it globally to a projective resolution of that module, and then apply this argument. ◻
]

=== 2.3 Bimodule evaluation <bimodule-evaluation>

For a symmetric algebra $E$, the tensor product of symmetrizing forms makes $E^e$ symmetric. We call an $E$-bimodule #emph[side-projective] if it is projective as a left and as a right $E$-module, and write $L X = L ⊗_E X$. Side-projectivity does not assert projectivity over $E^e$. For the derived-induction construction, the passage to a finite stable bimodule must commute with evaluation at $X$, including the attaching maps just discussed. The next lemma establishes these compatibilities.

#thm([Lemma 2.6.])[
  (Finite shifts and evaluation).  #emph[Every stable shift of a finite side-projective bimodule has a finite side-projective representative. Evaluation at a finite $E$-module $X$ sends stable maps between these bimodules to stable $E$-module maps and has natural identifications 
#[#set math.equation(numbering: n => "(2.11)")
 $ \( L \[ a \] \) X tilde.eq \( L X \) \[ a \] \, #h(2em) L \( X \[ a \] \) tilde.eq \( L X \) \[ a \] . $ <h:evaluation-shifts>]

 It preserves the stable connecting maps of short exact sequences of side-projective bimodules, and these identifications are natural in both $L$ and $X$.]
  #emph[If $P$ is a bounded-below complex of projective bimodules with bounded homology and all sufficiently high $c_n P$ are side-projective, then $P ⊗_E X$ has bounded homology and 
#[#set math.equation(numbering: n => "(2.12)")
 $ chevron.l P chevron.r X tilde.eq chevron.l P ⊗_E X chevron.r \, $ <h:evaluation-image>]

 naturally on maps and on connecting maps from degreewise split sequences of such complexes. The hypothesis on the high cokernels holds whenever $P$, considered separately on either side, is homotopy equivalent to a bounded complex of projectives on that side.]
] <h:evaluation>

#proof[
  Take a projective bimodule surjection onto $L$. Its kernel is side-projective because the sequence splits on each side. For a positive shift, use the finite projective-injective embedding
  $ L arrow.r "Hom"_k \( E^e \, L \) \, #h(2em) z mapsto \( a mapsto a z \) \, #h(2em) \( r phi \) \( a \) = phi \( a r \) . $
  Its target is injective by coinduction and projective by symmetry of $E^e$. The embedding splits on each side because $L$ is injective on that side, so its cokernel is again side-projective. Iteration supplies finite representatives for every shift.
  An $E^e$-projective evaluates to an $E$-projective: this is immediate for the free bimodule $E ⊗ E$, which evaluates to $E ⊗ X$, and passes to finite sums and summands. Hence evaluation respects projective factorizations. Every short exact sequence of side-projective bimodules splits on the right, and therefore remains exact after evaluation. In particular, evaluating the sequences just used to define shifts gives the first identification in (2.11). Applying the projective-presentation description of connecting maps to these same sequences shows that their actual connecting maps are preserved.
  For fixed $L$, right projectivity makes $L ⊗_E -$ exact, and left projectivity makes it preserve projectives. Applying it to projective resolutions and projective-injective coresolutions gives the second identification in (2.11). A bimodule map $L arrow.r L'$ gives a natural transformation on these complexes; thus evaluating it on a shifted module agrees stably with shifting its evaluation. The same reasoning proves naturality in $X$ and compatibility with composition.
  For the complex assertion, the high exact sequences $0 arrow.r c_(n + 1) P arrow.r P_n arrow.r c_n P arrow.r 0$ split on the right. Their evaluations remain exact, proving bounded homology of $P ⊗_E X$; its terms are projective by the preceding argument. Right exactness gives the canonical identifications
  $ c_n \( P ⊗_E X \) = \( c_n P \) ⊗_E X . $
  Together with (2.11), these identify the two sides of (2.12). They commute with chain maps. For a filtered complex, the cross differential in Lemma 7 evaluates to its tensor with $X$. That lemma’s explicit diagram therefore identifies the evaluated connecting map with the connecting map after evaluation.
  Finally, suppose a homotopy equivalence on one side compares $P$ with a complex supported in degrees at most $d$. At any $n > d$, the homotopy between the identity and the composite through that complex gives
  $ 1_(P_n) = d_(n + 1) h_n + h_(n - 1) d_n . $
  Writing $pi_n : P_n arrow.r c_n P$, passage to the cokernel yields
  $ 1_(c_n P) = \( pi_n h_(n - 1) \) overline(d)_n \, #h(2em) overline(d)_n : c_n P arrow.r P_(n - 1) . $
  Thus $c_n P$ is a summand of a projective on that side. The separate homotopy equivalence on the other side proves the other projectivity. The homotopies need not be bimodule homotopies. ◻
]

== 3 Passing to a symmetric algebra <sec:transfer>

The final step of the construction has a general form. It explains why we will need vanishing in negative degrees as well as positive ones. Throughout this section, $R$ is a finite-dimensional algebra over our field $k$ and $D = "Hom"_k \( - \, k \)$.

We recall the standard symmetry of a trivial extension; see #cite(label("BessenrodtHolmZimmermann2007")) Proposition 3.1.

#thm([Lemma 3.1.])[
  #emph[The trivial extension $R times.l D R$ is a finite-dimensional symmetric algebra. In particular, its left and right regular modules are injective in the categories of all unital modules.]
] <tr:trivial-symmetric>

#proof[
  The dual bimodule structure is
  $ \( a lambda b \) \( c \) = lambda \( b c a \) #h(2em) \( a \, b \, c in R \, med lambda in D R \) \, $
  and the multiplication is
  $ \( a \, lambda \) \( b \, mu \) = \( a b \, a mu + lambda b \) . $
  The bimodule identities give associativity, and $\( 1 \, 0 \)$ is a unit. The functional $t \( a \, lambda \) = lambda \( 1 \)$ gives the pairing
  $ t #scale(x: 120%, y: 120%)[\(] \( a \, lambda \) \( b \, mu \) #scale(x: 120%, y: 120%)[\)] = mu \( a \) + lambda \( b \) . $
  This pairing is symmetric and nondegenerate, and associativity of the algebra makes it an associative form. Thus $R times.l D R$ is isomorphic to its dual as a bimodule.
  For any algebra $G$ over $k$, the natural isomorphism $"Hom"_G \( L \, D G \) tilde.eq "Hom"_k \( L \, k \)$ shows that $D G$ is an injective left $G$-module; the same argument applies on the right. This statement holds for arbitrary unital $L$, since vector-space duality is exact. Applying it to the symmetric algebra $G = R times.l D R$ proves the final assertion. ◻
]

#thm([Proposition 3.2.])[
  (Transfer through the trivial extension).  #emph[Let $P$ be a totally acyclic complex of finite projective left $R$-modules, and put $Z = c_0 P$. Suppose that $Z$ is nonprojective and 
#[#set math.equation(numbering: n => "(3.1)")
 $ H^a "Hom"_R \( P \, Z \) = 0 #h(2em) upright("for ") a > 0 upright(" and for ") a lt.eq - 2 . $ <tr:two-sided-vanishing>]

 Then 
$ A = R times.l D R \, #h(2em) M = A ⊗_R Z $

 are a finite-dimensional symmetric algebra and a finite-dimensional nonprojective left $A$-module satisfying 
$ "Ext"_A^a \( M \, M \) = 0 #h(2em) \( a > 0 \) . $

]
] <tr:transfer>

#proof[
  Write $nu = D R ⊗_R -$ and set $I = nu P$. Finite projectivity gives natural isomorphisms
  #[#set math.equation(numbering: n => "(3.2)")
   $ D R ⊗_R P_j tilde.eq D "Hom"_R \( P_j \, R \) \, #h(2em) "Hom"_R \( Z \, D R ⊗_R P_j \) tilde.eq D "Hom"_R \( P_j \, Z \) . $ <tr:nakayama-evaluation>]
  Both follow first for finite free modules and then for their direct summands. The module $"Hom"_R \( P_j \, R \)$ is finite projective on the right, so $I_j$ is injective on the left. Total acyclicity of $P$ and exactness of $D$ show that the entire complex $I$ is exact.
  As a right $R$-module, $A = R xor D R$. Consequently the restriction of $A ⊗_R P$ is the exact complex $P xor I$. Every term $A ⊗_R P_j$ is finite projective over $A$, since induction preserves a split direct-summand presentation. Right exactness identifies $c_0 \( A ⊗_R P \)$ with $A ⊗_R Z = M$. Thus the nonnegative tail of $A ⊗_R P$ is a projective resolution of $M$. In particular, the tensor exactness needed here has been proved for this resolution; flatness of $A_R$ is not an additional hypothesis.
  Put $N = nu Z$. Again by right exactness, $N = c_0 I$. Exactness of $I$ identifies this cokernel with $"im" \( I_0 arrow.r I_(- 1) \)$. Hence
  #[#set math.equation(numbering: n => "(3.3)")
   $ 0 arrow.r N arrow.r I_(- 1) arrow.r I_(- 2) arrow.r I_(- 3) arrow.r dots.h.c $ <tr:injective-tail>]
  is an injective coresolution. If $C^j = "Hom"_R \( P_j \, Z \)$ with differential $delta^j : C^j arrow.r C^(j + 1)$, applying $"Hom"_R \( Z \, - \)$ to (3.3) gives, in cohomological degrees $0 \, 1 \, 2$,
  $ D C^(- 1) arrow.r^(D delta^(- 2)) D C^(- 2) arrow.r^(D delta^(- 3)) D C^(- 3) . $
  Both arrows surrounding degree one are present. More generally, the term in degree $a gt.eq 0$ is $D C^(- a - 1)$. Thus, for every $a > 0$,
  #[#set math.equation(numbering: n => "(3.4)")
   $ "Ext"_R^a \( Z \, N \) tilde.eq D H^(- a - 1) "Hom"_R \( P \, Z \) = 0 . $ <tr:negative-duality>]
  The first of these equalities uses degree $- 2$, which accounts for the endpoint in (3.1).
  Induction–restriction adjunction on the projective resolution already constructed now yields
  $ "Ext"_A^a \( M \, M \) & tilde.eq "Ext"_R^a #scale(x: 120%, y: 120%)[\(] Z \, "Res"_R^A M #scale(x: 120%, y: 120%)[\)]\
 & tilde.eq "Ext"_R^a \( Z \, Z \) xor "Ext"_R^a \( Z \, N \) = 0 #h(2em) \( a > 0 \) . $
  Here the first summand vanishes by (3.1) and Lemma 4, and the second by (3.4).
  Lemma 10 proves that $A$ is symmetric. The module $M$ is finite and unital. Finally, if $M$ were a direct summand of $A^r$, tensoring the splitting with the quotient $A arrow.r R$ would make
  $ R ⊗_A M tilde.eq R ⊗_A \( A ⊗_R Z \) tilde.eq Z $
  a direct summand of $R^r$. A tensor functor preserves a split identity composite without any flatness assumption. This contradicts nonprojectivity of $Z$. ◻
]

We will apply Proposition 11 to a triangular algebra $R = Lambda$. The rest of the proof constructs its module $Z$ together with the complete resolution and the two vanishing ranges in (3.1).

== 4 The ten-dimensional algebra <a:section>

We now construct an algebra $C$ and a simple module $s$ whose resolution supplies the degree-three extension classes used below. Besides this resolution, we need finite projective-dimension bounds for the dual regular modules; these bounds make derived induction admit a finite bimodule representative. The multiplication of $C$ is the one in #cite(label("OpenAIAR2026")) Section 4.1; all properties needed here are proved directly. We work over the fixed field $k = bb(F)_2 \( q \, H_1 \, H_2 \)$, where the three parameters are algebraically independent.

Let $C$ have the following basis, arranged by its left and right idempotents:

#[#set math.equation(numbering: n => "(4.1)")
 $ upright("corner") & upright("basis") & upright("corner") & upright("basis")\
e C e & e \, x \, y \, z & e C f & u \, v\
f C e & t \, j & f C f & f \, n . $ <a:corners>]

The unit is $1 = e + f$. The complete multiplication table, with the left factor indexing the row, is

#[#set math.equation(numbering: n => "(4.2)")
 $ & e & f & x & y & z & u & v & t & j & n\
e & e & 0 & x & y & z & u & v & 0 & 0 & 0\
f & 0 & f & 0 & 0 & 0 & 0 & 0 & t & j & n\
x & x & 0 & 0 & q z & 0 & v & 0 & 0 & 0 & 0\
y & y & 0 & z & 0 & 0 & v & 0 & 0 & 0 & 0\
z & z & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\
u & 0 & u & 0 & 0 & 0 & 0 & 0 & y + q x & z & v\
v & 0 & v & 0 & 0 & 0 & 0 & 0 & q z & 0 & 0\
t & t & 0 & j & q^2 j & 0 & \( 1 + q \) n & 0 & 0 & 0 & 0\
j & j & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\
n & 0 & n & 0 & 0 & 0 & 0 & 0 & q j & 0 & 0 $ <a:multiplication>]

#thm([Lemma 4.1.])[
  #emph[The table (4.2) defines an associative unital algebra of dimension ten. Its radical is the span of the eight basis vectors other than $e \, f$, and $\( "rad" C \)^5 = 0$.]
] <a:table>

#proof[
  Give the basis vectors the degrees
  $ deg e = deg f = 0 \, #h(2em) deg u = deg t = 1 \,\
deg x = deg y = deg n = 2 \, #h(2em) deg v = deg j = 3 \, #h(2em) deg z = 4 . $
  The table is homogeneous and respects the corners. Thus associativity with an idempotent, or with incompatible adjacent corners, follows from (4.1). For positive-degree triples of total degree greater than four, both bracketings vanish. The remaining composable triples and the value of either bracketing are precisely
  $ a b c & u t u & t u t & x u t & y u t & n t u\
\( a b \) c = a \( b c \) & \( 1 + q \) v & q \( 1 + q \) j & q z & q z & 0 $
  $ a b c & u n t & t x u & t y u & u t x & u t y & t u n\
\( a b \) c = a \( b c \) & q z & 0 & 0 & z & q^2 z & 0 . $
  Every entry is obtained by two applications of (4.2); this exhausts the associativity check by trilinearity. The positive-degree span is a nilpotent ideal with fifth power zero and quotient $k e xor k f tilde.equiv k^2$. It is therefore the radical. ◻
]

Let $s$ be the one-dimensional left $C$-module on which $f$ acts as the identity and every other basis vector acts as zero. Its vector space dual $D s$ is the right simple with the same character.

The corner $e C e$ gives a concrete connection with Schulz’s example #cite(label("Schulz1995")) Example 7. The table identifies it with the quantum exterior algebra

$ e C e tilde.equiv k chevron.l x \, y chevron.r \/ \( x^2 \, y^2 \, y x - q^(- 1) x y \) . $

Moreover, the assignments $t mapsto x + q^(- 1) y$ and $j mapsto q^(- 1) z$ give an isomorphism of right $e C e$-modules

$ f C e tilde.equiv \( x + q^(- 1) y \) e C e . $

The identities $t x = j$, $t y = q^2 j$, and $j x = j y = 0$ verify right-linearity, and the two images form a basis of the right ideal. With Schulz’s parameter $p = q^(- 1)$, this right ideal is the first syzygy of his module $\( x + y \) e C e$. The later left-module resolutions will use the same type of parameter shift within the ten-dimensional algebra.

Write $a^(*)$ for the basis vector of $D C$ dual to a basis vector $a$ of $C$. Form the trivial extension

#[#set math.equation(numbering: n => "(4.3)")
 $ T = C times.l D C \, #h(2em) \( a \, phi.alt \) \( b \, psi \) = \( a b \, a psi + phi.alt b \) \, #h(2em) \( a phi.alt b \) \( c \) = phi.alt \( b c a \) . $ <a:trivial-extension>]

By Lemma 10, this is a symmetric algebra of dimension twenty, with symmetrizing functional $t_T \( a \, phi.alt \) = phi.alt \( 1 \)$. In particular,

$ t_T #scale(x: 120%, y: 120%)[\(] \( a \, phi.alt \) \( b \, psi \) #scale(x: 120%, y: 120%)[\)] = phi.alt \( b \) + psi \( a \) . $

We regard $s$ as a $T$-module through the quotient $T arrow.r C$. Set

#[#set math.equation(numbering: n => "(4.4)")
 $ B = C ⊗ C subset.eq E = T ⊗ T . $ <a:tensor-algebras>]

Then $dim_k B = 100$ and $dim_k E = 400$. The functional $t_E = t_T ⊗ t_T$ gives a symmetric nondegenerate product pairing, so $E$ is symmetric.

We record the radical and corner information that will enter the trace argument. One has

#[#set math.equation(numbering: n => "(4.5)")
 $ "rad" T & = \( "rad" C \) xor D C \,\
"rad" B & = \( "rad" C \) ⊗ C + C ⊗ \( "rad" C \) \,\
"rad" E & = \( "rad" T \) ⊗ T + T ⊗ \( "rad" T \) . $ <a:radicals>]

For the first equality, the displayed ideal is a square-zero extension of the nilpotent ideal $"rad" C$, and its quotient is $k^2$. For the tensor products the displayed ideals are sums of commuting nilpotent ideals, and their quotients are $k^4$. This proves all three equalities. The four vertex idempotents of $B$, also used in $E$, are $e ⊗ e \, e ⊗ f \, f ⊗ e \, f ⊗ f$. For these vertices the corner dimensions are

#[#set math.equation(numbering: n => "(4.6)")
 $ #scale(x: 120%, y: 120%)[\(] dim_k \( p B p' \) #scale(x: 120%, y: 120%)[\)]_(p \, p') = mat(delim: "(", 16, 8, 8, 4; 8, 8, 4, 4; 8, 4, 8, 4; 4, 4, 4, 4) . $ <a:corner-parity>]

Indeed these dimensions are the products of the corresponding corner dimensions $4 \, 2 \, 2 \, 2$ of $C$. In particular, every entry is even.

For $i in bb(Z)$, put

$ ell_i = x + q^i y . $

We denote right multiplication by $a$ by $rho_a$ and left multiplication by $a$ by $lambda_a$. Thus $rho_a$ is a map of left modules and $lambda_a$ is a map of right modules whenever the indicated source and target corners allow it.

#thm([Proposition 4.2.])[
  #emph[The dual regular module $D C$ has projective dimension at most two on both sides. More precisely, 
$ D \( e C \) tilde.equiv C e \, #h(2em) D \( C e \) tilde.equiv e C \, $

 and there are exact sequences 
#[#set math.equation(numbering: n => "(4.7)")
 $ 0 arrow.r C f arrow.r^(rho_t) C e arrow.r^(rho_(ell_(- 2))) C e arrow.r^(e mapsto j^(*)) D \( f C \) arrow.r 0 \,\
0 arrow.r f C arrow.r^(lambda_u) e C arrow.r^(lambda_(ell_0)) e C arrow.r^(e mapsto v^(*)) D \( C f \) arrow.r 0 . $ <a:left-dual-resolution>]

 Consequently 
#[#set math.equation(numbering: n => "(4.8)")
 $ "pd"_B \( zws_B E \) lt.eq 4 \, #h(2em) "pd"_(B^(upright("op"))) \( E_B \) lt.eq 4 \, #h(2em) "id"_B \( zws_B B \) lt.eq 4 . $ <a:dimension-bounds>]

]
] <a:dual-dimensions>

#proof[
  The pairing $e C times C e arrow.r k$ that takes the coefficient of $z$ in a product is nondegenerate. In the ordered bases
  $ cal(B)_(e C) = \( e \, x \, y \, z \, u \, v \) \, #h(2em) cal(B)_(C e) = \( e \, x \, y \, z \, t \, j \) \, $
  its only nonzero entries are the products $e z \, x y \, y x \, z e \, u j \, v t$, with coefficients $1 \, q \, 1 \, 1 \, 1 \, q$. Thus it has determinant $q^2 eq.not 0$. The maps sending $e$ to $z^(*)$ give the stated left- and right-module isomorphisms.
  Here is the full calculation for the other dual summands. The two surjections, on the ordered bases just specified, have the images
  $ C e arrow.r D \( f C \) : quad \( e \, x \, y \, z \, t \, j \) & mapsto \( j^(*) \, t^(*) \, q^2 t^(*) \, 0 \, q n^(*) \, f^(*) \) \,\
e C arrow.r D \( C f \) : quad \( e \, x \, y \, z \, u \, v \) & mapsto \( v^(*) \, u^(*) \, u^(*) \, 0 \, n^(*) \, f^(*) \) . $
  Each has rank four; their kernels are respectively $chevron.l ell_(- 2) \, z chevron.r_k$ and $chevron.l ell_0 \, z chevron.r_k$. The intermediate maps have images and kernels
  $ upright("map") & upright("image") & upright("kernel")\
rho_(ell_(- 2)) : C e arrow.r C e & chevron.l ell_(- 2) \, z chevron.r_k & chevron.l y + q x \, z \, t \, j chevron.r_k\
lambda_(ell_0) : e C arrow.r e C & chevron.l ell_0 \, z chevron.r_k & chevron.l y + q x \, z \, u \, v chevron.r_k . $
  For completeness, the initial injections are given by
  $ rho_t : \( f \, u \, v \, n \) & mapsto \( t \, y + q x \, q z \, q j \) \,\
lambda_u : \( f \, t \, j \, n \) & mapsto \( u \, y + q x \, z \, v \) . $
  Their four images are independent and span the respective kernels in the table. This proves exactness of (4.7) and (4.7), including their orientations and the exceptional index $- 2$ in the first sequence.
  On either $C$-side, $T = C xor D C$ has a projective resolution of length at most two. Tensor two such resolutions over the field and totalize. The resulting resolutions of the corresponding $B$-modules $E$ have length at most four, proving the first two bounds in (4.8). Likewise $D B tilde.equiv D C ⊗ D C$ has right $B$-projective dimension at most four. Dualizing a finite projective resolution gives an injective coresolution of $zws_B B$, and proves the last bound. ◻
]

We now resolve $s$. The same multiplication maps will also determine the dual complex, including its right-module cohomology.

#thm([Proposition 4.3.])[
  #emph[The augmentation $C f arrow.r s$ extends to a projective resolution $R arrow.r s$ with 
#[#set math.equation(numbering: n => "(4.9)")
 $ R_0 = C f \, #h(2em) R_i = C e med \( i gt.eq 1 \) \, #h(2em) d_1 = rho_u \, #h(2em) d_(i + 2) = rho_(ell_i) med \( i gt.eq 0 \) . $ <a:simple-resolution>]

 It satisfies 
#[#set math.equation(numbering: n => "(4.10)")
 $ H^a "Hom"_C \( R \, s \) = cases(delim: "{", k & a = 0 \,, 0 & a eq.not 0 \,) #h(2em) H^a "Hom"_C \( R \, C \) = cases(delim: "{", D s & a = 2 \,, 0 & a eq.not 2 \,) $ <a:dual-cohomology>]

 where the second identification is an isomorphism of right $C$-modules.]
] <a:resolution>

#proof[
  On the basis $\( e \, x \, y \, z \, t \, j \)$ of $C e$, right multiplication gives
  $ rho_u \( e \, x \, y \, z \, t \, j \) & = \( u \, v \, v \, 0 \, \( 1 + q \) n \, 0 \) \,\
rho_(ell_i) \( e \, x \, y \, z \, t \, j \) & = \( ell_i \, q^(i + 1) z \, z \, 0 \, \( 1 + q^(i + 2) \) j \, 0 \) . $
  For every $i gt.eq 0$, the coefficient $1 + q^(i + 2)$ is nonzero. Consequently
  $ upright("map") & upright("image") & upright("kernel")\
rho_u & chevron.l u \, v \, n chevron.r_k & chevron.l ell_0 \, z \, j chevron.r_k\
rho_(ell_i) \, med i gt.eq 0 & chevron.l ell_i \, z \, j chevron.r_k & chevron.l ell_(i + 1) \, z \, j chevron.r_k . $
  The first image is $"rad" \( C f \)$, and each later image is the preceding kernel. This proves exactness at every index. Since $"Hom"_C \( C e \, s \) = e s = 0$ and $"Hom"_C \( C f \, s \) = f s = k$, the first equality in (4.10) follows.
  Under $"Hom"_C \( C f \, C \) = f C$ and $"Hom"_C \( C e \, C \) = e C$, the dual cochain complex is
  #[#set math.equation(numbering: n => "(4.11)")
   $ f C arrow.r^(lambda_u) e C arrow.r^(lambda_(ell_0)) e C arrow.r^(lambda_(ell_1)) e C arrow.r^(lambda_(ell_2)) dots.h.c \, $ <a:dual-complex>]
  starting in degree zero. The first arrow is injective, with image $chevron.l u \, y + q x \, z \, v chevron.r_k$. For $i gt.eq 0$,
  $ lambda_(ell_i) \( e \, x \, y \, z \, u \, v \) = \( ell_i \, q^i z \, q z \, 0 \, \( 1 + q^i \) v \, 0 \) . $
  The image and kernel are therefore
  $ & upright("image") & upright("kernel")\
i = 0 & chevron.l ell_0 \, z chevron.r_k & chevron.l ell_(- 1) \, z \, u \, v chevron.r_k\
i gt.eq 1 & chevron.l ell_i \, z \, v chevron.r_k & chevron.l ell_(i - 1) \, z \, v chevron.r_k . $
  Since $q ell_(- 1) = q x + y$, the first kernel equals the image of $lambda_u$. The only remaining cohomology is in degree two:
  $ frac(chevron.l ell_0 \, z \, v chevron.r_k, chevron.l ell_0 \, z chevron.r_k) = k overline(v) . $
  Finally $v f = v$, $v e = 0$, and the only nonzero product of $v$ with a radical basis vector is $v t = q z$, which is a boundary. Thus the radical acts trivially on $k overline(v)$, and its right module structure is exactly $D s$. ◻
]

== 5 Polynomial stable endomorphisms and twists <e:section>

The dual cohomology in Proposition 14 produces a degree-three extension class over $T$. We first determine its products, then tensor two copies and use symmetric duality to determine all negative degrees as well.

#thm([Proposition 5.1.])[
  #emph[Put $cal(J) = T ⊗_C R$, where $R$ is the resolution in (4.9). There is a triangle in the derived category of $T$-modules 
#[#set math.equation(numbering: n => "(5.1)")
 $ s \[ 2 \] arrow.r cal(J) arrow.r s arrow.r^tau s \[ 3 \] \, $ <e:triangle>]

 and the connecting class generates the Yoneda algebra: 
#[#set math.equation(numbering: n => "(5.2)")
 $ "Ext"_T^(*) \( s \, s \) = k \[ tau \] \, #h(2em) \| tau \| = 3 . $ <e:one-polynomial>]

 The complex $cal(J)$ is bounded below, has finite projective $T$-terms, and has bounded homology.]
] <e:polynomial>

#proof[
  Tensor the sequence of $\( T \, C \)$-bimodules $0 arrow.r D C arrow.r T arrow.r C arrow.r 0$ with $R$. Projectivity of each $R_i$ gives a short exact sequence of complexes of left $T$-modules
  #[#set math.equation(numbering: n => "(5.3)")
   $ 0 arrow.r D C ⊗_C R arrow.r cal(J) arrow.r R arrow.r 0 . $ <e:coefficient-sequence>]
  The two outside complexes have action inflated from $C$. For a finite projective left $C$-module $V$, the natural evaluation map
  $ D C ⊗_C V arrow.r D "Hom"_C \( V \, C \) \, #h(2em) phi.alt ⊗ v mapsto #scale(x: 120%, y: 120%)[\(] f mapsto phi.alt \( f \( v \) \) #scale(x: 120%, y: 120%)[\)] $
  is an isomorphism, first for a finite free module and then for its summands. Applying this termwise identifies the left complex in (5.3) with $D "Hom"_C \( R \, C \)$. By (4.10), its only homology is $s$ in homological degree two, with the asserted $C$-module structure. Good truncation therefore identifies it with $s \[ 2 \]$ in the derived category, also after inflating the action to $T$. Fix this identification. The quotient complex resolves $s$, so (5.3) gives (5.1). Its middle complex has projective $T$-terms, and the triangle gives its bounded homology.
  Because $cal(J)$ is bounded below and projective, ordinary induction–restriction adjunction computes
  $ Q_i := "Hom"_(upright(D)^b \( T \)) \( cal(J) \, s \[ i \] \) = H^i "Hom"_T \( cal(J) \, s \) = H^i "Hom"_C \( R \, s \) = cases(delim: "{", k & i = 0 \,, 0 & i eq.not 0 .) $
  Apply derived Hom into shifts of $s$ to (5.1). With ordinary negative Ext interpreted as zero, the resulting long exact sequence contains
  #[#set math.equation(numbering: n => "(5.4)")
   $ Q_(i - 1) arrow.r "Ext"_T^(i - 3) \( s \, s \) arrow.r^(alpha mapsto alpha \[ 3 \] tau) "Ext"_T^i \( s \, s \) arrow.r Q_i . $ <e:polynomial-sequence>]
  At $i = 1$ this is $k arrow.r 0 arrow.r "Ext"_T^1 \( s \, s \) arrow.r 0$, so the first Ext group vanishes. For every $i gt.eq 2$, the middle map in (5.4) is an isomorphism. In particular $"Ext"_T^2 \( s \, s \) = 0$, and at $i = 3$ it sends the identity of $s$ to the nonzero class $tau$. Induction now shows that $tau^m$ is a basis of $"Ext"_T^(3 m) \( s \, s \)$ for every $m gt.eq 0$, and all other positive degrees vanish. Since the isomorphisms are the displayed Yoneda compositions, this proves the algebra assertion (5.2). ◻
]

We now tensor two copies of this self-extension algebra. Set

#[#set math.equation(numbering: n => "(5.5)")
 $ X = s ⊗ s \, #h(2em) cal(H)^a = underline("Hom")_E \( X \, X \[ a \] \) quad \( a in bb(Z) \) . $ <e:stable-groups>]

Let $tau_1 = tau ⊗ 1$ and $tau_2 = 1 ⊗ tau$ be the two external extension classes. We write $cal(P)_m$ for the space of polynomials of total exponent $m$ in $tau_1 \, tau_2$; their cohomological degree is $3 m$. This notation distinguishes these polynomial spaces from the projective resolutions used later.

#thm([Proposition 5.2.])[
  #emph[The module $X$ is nonprojective and 
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(H)^(gt.eq 0) = k \[ tau_1 \, tau_2 \] \, #h(2em) \| tau_1 \| = \| tau_2 \| = 3 . $ <e:two-polynomial>]

 In every integer degree, the only nonzero groups are 
#[#set math.equation(numbering: n => "(5.7)")
 $ cal(H)^(3 m) = cal(P)_m \, #h(2em) cal(H)^(- 3 m - 1) = D cal(P)_m #h(2em) \( m gt.eq 0 \) . $ <e:profile>]

 Under these identifications, postcomposition by a shifted $tau_i$ between negative groups is the transpose of multiplication by $tau_i$ on the polynomial spaces. The maps $cal(H)^(- 1) arrow.r cal(H)^2$ given by either class are zero.]
] <e:all-degrees>

#proof[
  Choose a projective $T$-resolution $Q arrow.r s$. The total complex of $Q ⊗ Q$ is a projective $E$-resolution of $X$. There are finitely many summands in each total degree, and termwise finite projectivity gives an isomorphism of cochain complexes
  $ "Hom"_E \( Q ⊗ Q \, s ⊗ s \) tilde.equiv "Hom"_T \( Q \, s \) ⊗ "Hom"_T \( Q \, s \) . $
  The cohomology of this tensor product is the tensor product of the cohomologies: over a field each complex splits into its homology and contractible summands. Tensoring comparison maps of resolutions computes the external Yoneda products under this isomorphism. In particular the maps acting on the first and second tensor factors commute, since all interchange signs are $+ 1$ in characteristic two. Proposition 15 therefore gives $"Ext"_E^(*) \( X \, X \) = k \[ tau_1 \, tau_2 \]$ as algebras.
  Its degree-three part is nonzero, so $X$ is not projective. Also $"End"_E \( X \) = k$, and the identity cannot factor through a projective: such a factorization would exhibit $X$ as a projective summand. Thus $underline("End")_E \( X \) = k$. Positive Ext agrees with positive stable Hom over the symmetric algebra $E$, proving (5.6). Lemma 5 gives
  $ cal(H)^(- a - 1) tilde.equiv D cal(H)^a #h(2em) \( a gt.eq 0 \) \, $
  which proves the support and dimensions in (5.7).
  To retain the actual multiplication maps, choose a nonzero functional $lambda : cal(H)^(- 1) arrow.r k$. The composition pairing from Lemma 5 identifies $cal(H)^(- 3 m - 1)$ with $D cal(P)_m$ by
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( beta \, p \)_m = lambda #scale(x: 120%, y: 120%)[\(] p \[ - 3 m - 1 \] beta #scale(x: 120%, y: 120%)[\)] \, #h(2em) beta in cal(H)^(- 3 m - 1) \, quad p in cal(P)_m . $ <e:pairing>]
  It is perfect for every $m$. For $m gt.eq 1$, associativity of composition gives, for $p in cal(P)_(m - 1)$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ #scale(x: 120%, y: 120%)[\(] tau_i \[ - 3 m - 1 \] beta \, p #scale(x: 120%, y: 120%)[\)]_(m - 1) = \( beta \, p \[ 3 \] tau_i \)_m . $ <e:transpose>]
  The right-hand side is pairing with polynomial multiplication by $tau_i$. This proves the transpose assertion with its precise shift. For $m = 0$, the target is $cal(H)^2 = 0$, which proves the boundary assertion as well. ◻
]

One can make the negative action especially concrete. Let $eta_(a \, b) in cal(H)^(- 3 \( a + b \) - 1)$ be dual to $tau_1^a tau_2^b$. With multiplication here meaning postcomposition by the appropriately shifted class,

#[#set math.equation(numbering: n => "(5.10)")
 $ tau_1 eta_(a \, b) = cases(delim: "{", eta_(a - 1 \, b) & a > 0 \,, 0 & a = 0 \,) #h(2em) tau_2 eta_(a \, b) = cases(delim: "{", eta_(a \, b - 1) & b > 0 \,, 0 & b = 0 .) $ <e:negative-action>]

These formulas include the zero maps out of $eta_(0 \, 0)$. Products of two negative-degree classes vanish by the support (5.7).

For $H in k^times$, define

#[#set math.equation(numbering: n => "(5.11)")
 $ h_H : T arrow.r T \, quad \( a \, phi.alt \) mapsto \( a \, H phi.alt \) \, #h(2em) sigma_H = h_H ⊗ h_H \, #h(2em) U_H = E_(sigma_H) . $ <e:twist-definition>]

Here $E_(sigma_H)$ is the regular left module with right action $a dot.op b = a sigma_H \( b \)$. These are automorphisms, and $U_H$ is projective on both sides. The tensor functor $U_H \( - \)$ is restriction by $sigma_H^(- 1)$, as shown by the natural balanced isomorphism

#[#set math.equation(numbering: n => "(5.12)")
 $ U_H ⊗_E V arrow.r^(med tilde.op med) "Res"_(sigma_H^(- 1)) V \, #h(2em) a ⊗ v mapsto sigma_H^(- 1) \( a \) v . $ <e:inverse-restriction>]

The same convention applies to $T_(h_H) ⊗_T -$. Let $chi : E arrow.r k$ be the character of $X$. Since $chi sigma_H = chi$, we fix the resulting identification $U_H X = X$. The exact functor $U_H \( - \)$ preserves projectives and acts on all groups $cal(H)^a$, with the shift identifications of Lemma 9.

To determine this action in negative degrees, we first choose an explicit generator in degree $- 1$. Once the action on this generator is known, the composition pairing determines the action on every negative group.

#thm([Lemma 5.3.])[
  #emph[Put 
$ p_f = f ⊗ f \, #h(2em) zeta = f^(*) ⊗ f^(*) in E p_f . $

 For every $a \, b in E$, $a zeta b = chi \( a \) chi \( b \) zeta$. The map $i_X : X arrow.r E p_f$, $i_X \( 1 \) = zeta$, is an embedding with image in $\( "rad" E \) p_f = Omega X$. Regarded as a map $X arrow.r Omega X$, it is nonzero stably and spans $cal(H)^(- 1)$.]
] <e:socle>

#proof[
  The dual basis vector $f^(*) in D C$ is the character of the $f$-simple on $C$. The dual bimodule action in (4.3) shows that multiplication on either side by an element of $C$ scales $f^(*)$ by that character; the square-zero ideal $D C$ kills it on either side. Tensoring proves the asserted action on $zeta$. The projective cover $E p_f arrow.r X$, $a p_f mapsto chi \( a \)$, has kernel $\( "rad" E \) p_f$ by (4.5). The nonzero vector $zeta$ lies in this kernel, so the displayed map is an embedding into $Omega X$.
  We verify nonfactorization through every finite projective. Write $J_E = "rad" E$. If $b in E$ satisfies $J_E b = 0$, symmetry gives
  $ t_E \( a b j \) = t_E \( j a b \) = 0 #h(2em) \( a in E \, med j in J_E \) \, $
  since $j a in J_E$. Nondegeneracy therefore implies $b J_E = 0$. For any map $X arrow.r E$, every vector in its image satisfies this condition. Any left-module map $E arrow.r J_E p_f$ has the form $b mapsto b r$ with $r in J_E p_f$, so its composite with $X arrow.r E$ is zero. The same conclusion holds for finite sums and summands of $E$. Thus all maps $X arrow.r Omega X$ factoring through a finite projective are zero, whereas $i_X eq.not 0$. Finally $cal(H)^(- 1) = D cal(P)_0$ is one-dimensional by Proposition 16. ◻
]

#thm([Proposition 5.4.])[
  #emph[For every $H in k^times$ and every $m gt.eq 0$, the action of $U_H \( - \)$ on the groups in (5.7) is 
#[#set math.equation(numbering: n => "(5.13)")
 $ U_H\|_(cal(H)^(3 m)) = H^(- m) thin 1_(cal(P)_m) \, #h(2em) U_H\|_(cal(H)^(- 3 m - 1)) = H^(m + 2) thin 1_(D cal(P)_m) . $ <e:twist-weights>]

 In particular, the negative action is the stated scalar on the entire $\( m + 1 \)$-dimensional space.]
] <e:twists>

#proof[
  First twist (5.3) by restriction along $h_H^(- 1)$. Because $h_H$ fixes $C$, the map $h_H ⊗ 1$ identifies its middle complex with the original one. It induces the identity on the quotient $R$ and multiplication by $H$ on $D C ⊗_C R$. Write $tau_H$ for the twist of $tau$. Passing to the fixed derived identifications yields a commutative diagram of triangles
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$s \[ 2 \]$])
  content((3.047, 0), [$"Res"_(h_H^(- 1)) cal(J)$])
  content((5.897, 0), [$s$])
  content((8.218, 0), [$s \[ 3 \]$])
  content((0, -1.239), [$s \[ 2 \]$])
  content((3.047, -1.239), [$cal(J)$])
  content((5.897, -1.239), [$s$])
  content((8.218, -1.239), [$s \[ 3 \] .$])
  line((0.534, 0), (1.919, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.3223, -0.6193), [#text(size: 0.73em)[$H$]])
  line((4.175, 0), (5.561, 0), mark: (end: ">"))
  line((3.047, -0.2725), (3.047, -0.9661), mark: (end: ">"))
  content((3.562, -0.6193), [#text(size: 0.73em)[$h_H ⊗ 1$]])
  line((6.233, 0), (7.684, 0), mark: (end: ">"))
  content((6.959, 0.2266), [#text(size: 0.73em)[$tau_H$]])
  line((5.897, -0.2725), (5.897, -0.9661), mark: (end: ">"))
  content((6.219, -0.6193), [#text(size: 0.73em)[$1$]])
  line((8.218, -0.2725), (8.218, -0.9661), mark: (end: ">"))
  content((8.54, -0.6193), [#text(size: 0.73em)[$H$]])
  line((0.534, -1.239), (2.711, -1.239), mark: (end: ">"))
  line((3.383, -1.239), (5.561, -1.239), mark: (end: ">"))
  line((6.233, -1.239), (7.618, -1.239), mark: (end: ">"))
  content((6.926, -1.012), [#text(size: 0.73em)[$tau$]])
})
  Naturality of the connecting morphism gives $H tau_H = tau$. Hence each external class $tau_i$ is sent to $H^(- 1) tau_i$, and preservation of products proves the first formula in (5.13).
  For the negative part we first compute the action on $cal(H)^(- 1)$. Twist the projective presentation
  $ 0 arrow.r Omega X arrow.r E p_f arrow.r X arrow.r 0 . $
  Under (5.12), its comparison with the original presentation is
  $ sigma_H : "Res"_(sigma_H^(- 1)) \( E p_f \) arrow.r E p_f . $
  It is $E$-linear, since $sigma_H \( sigma_H^(- 1) \( a \) b \) = a sigma_H \( b \)$, and induces the identity on $X$. On the kernels it sends $zeta$ to $H^2 zeta$. Thus the generator in Lemma 17 is sent to $H^2$ times itself, proving that $U_H$ acts by $H^2$ on $cal(H)^(- 1)$.
  Finally the exact twist functor preserves shifted composition. Applying it to the product in (5.8), and using its actions on $cal(P)_m$ and $cal(H)^(- 1)$, gives
  $ #scale(x: 120%, y: 120%)[\(] U_H \( beta \) \, H^(- m) p #scale(x: 120%, y: 120%)[\)]_m = H^2 \( beta \, p \)_m #h(2em) \( beta in cal(H)^(- 3 m - 1) \, med p in cal(P)_m \) . $
  Equivalently, $\( U_H \( beta \) \, p \)_m = H^(m + 2) \( beta \, p \)_m$ for every $p$. Nondegeneracy of the pairing forces $U_H \( beta \) = H^(m + 2) beta$ for every $beta$, as asserted. ◻
]

== 6 Derived induction and the trace obstruction <b:section>

We now construct the bimodule that will join the two twists in the triangular algebra. The two-factor filtration follows the organization of #cite(label("OpenAIAR2026")) Section 6. A related use of tensor products of bimodules attached to Hochschild classes occurs in support-variety theory #cite(label("ErdmannEtAl2003")) Definition 2.1 and Theorem 2.3. Here the bimodule comes from derived induction, and its evaluated lifting property is proved by a trace obstruction.

#thm([Proposition 6.1.])[
  #emph[There is a finite $E$-bimodule $Y$, projective separately as a left and as a right $E$-module, such that 
#[#set math.equation(numbering: n => "(6.1)")
 $ W^a := underline("Hom")_E \( X \, \( Y X \) \[ a \] \) tilde.equiv cases(delim: "{", k \, & a = - 3 \, 0 \,, 0 \, & a in.not { - 3 \, 0 } .) $ <b:W>]

 For every $H in k^times$, there is an ordinary bimodule map $g_H : U_H arrow.r Y$ whose evaluation, under $U_H X = X$, represents a nonzero element of $W^0$. The same $Y$ works for all $H$, and all modules and maps are defined over $k$.]
] <b:bimodule>

The two assertions require different arguments. A filtration of derived induction will compute the groups $W^a$. In particular, $W^0 = k$ provides nonzero stable $E$-module maps $X arrow.r Y X$, but does not show that one is the evaluation of a bimodule map $U_H arrow.r Y$. The trace obstruction, combined with stable duality, will prove that this evaluation has nonzero image for every $H$.

=== 6.1 A finite representative of derived induction <a-finite-representative-of-derived-induction>

Let $K$ be the two-sided bar complex for derived induction:

$ K_i = E ⊗ B^(⊗ i) ⊗ E quad \( i gt.eq 0 \) \, #h(2em) K_i = 0 quad \( i < 0 \) . $

This is the ordinary-algebra instance of the bar model for derived tensor functors; see #cite(label("Keller1994")) Sections 6.1 and 6.6. The finite representative needed here will follow from the separate projective-dimension bounds on the two sides. For $i gt.eq 1$, its differential is

$ d_i \( a ⊗ b_1 ⊗ dots.h.c ⊗ b_i ⊗ c \) =  & a b_1 ⊗ b_2 ⊗ dots.h.c ⊗ b_i ⊗ c\
 & + sum_(r = 1)^(i - 1) a ⊗ b_1 ⊗ dots.h.c ⊗ b_r b_(r + 1) ⊗ dots.h.c ⊗ b_i ⊗ c\
 & + a ⊗ b_1 ⊗ dots.h.c ⊗ b_(i - 1) ⊗ b_i c . $

As throughout, signs disappear in characteristic two. Associativity gives $d_(i - 1) d_i = 0$, since each double multiplication occurs twice. Multiplication in degree zero defines a chain map $m : K arrow.r E$.

#thm([Lemma 6.2.])[
  #emph[The complex $K$ represents $E ⊗_B^(upright(bold(L))) E$, has finite projective $E^e$-terms and has homology only in degrees $0 \, dots.h \, 4$. The bimodule $c_5 K$ is projective on both sides. Consequently its stable image 
$ cal(I) = chevron.l K chevron.r = \( c_5 K \) \[ 5 \] $

 has finite side-projective representatives, as does $cal(I) \[ - 1 \]$. One such representative $Y$ of $cal(I) \[ - 1 \]$ is obtained by taking four successive finite bimodule cosyzygies of $c_5 K$.]
] <b:bar-model>

#proof[
  The usual bar resolution of $B$ has terms $B ⊗ B^(⊗ i) ⊗ B$. Its augmented complex is contracted as a complex of vector spaces by inserting a unit. Inserting a unit at one end also proves that tensoring it with a module at the other end gives a projective resolution of that module on the remaining side. Inducing the two outer actions gives $K$, with each term a finite free $E^e$-module.
  On the left, $B ⊗ B^(⊗ i) ⊗ E$ is a projective $B$-resolution of $zws_B E$. By Proposition 13, this module has a projective resolution supported in degrees $0 \, dots.h \, 4$. Comparison of projective resolutions gives a homotopy equivalence between these two resolutions. Applying $E ⊗_B -$ preserves the homotopy equivalence, so $K$, as a left $E$-complex, is homotopy equivalent to a complex of projectives supported in those degrees. The same argument using $E_B$ works on the right. In particular $H_i \( K \) = 0$ for $i > 4$.
  For completeness, this equivalence proves projectivity of the specific cokernel $c_5 K$. On either side, choose a homotopy from the identity of $K$ to a map factoring through the complex ending in degree $4$. In degree $5$ it gives
  $ 1_(K_5) = d_6 h_5 + h_4 d_5 . $
  Modulo $"im" d_6$, the identity of $c_5 K$ therefore factors as
  $ c_5 K arrow.r^(med overline(d)_5 med) K_4 arrow.r^(med q_5 h_4 med) c_5 K \, $
  where $q_5 : K_5 arrow.r c_5 K$ is the quotient map. Thus $c_5 K$ is a summand of a projective on each side. This assertion concerns the two side-module structures; the two splittings need not be bimodule splittings. The high exact sequences $0 arrow.r c_(n + 1) K arrow.r K_n arrow.r c_n K arrow.r 0$, for $n gt.eq 5$, now split on each side. Induction shows that all higher cokernels are side-projective as well.
  To make the finite choice explicit, put $N_0 = c_5 K$, and for $r = 0 \, 1 \, 2 \, 3$ use
  $ 0 arrow.r N_r arrow.r "Hom"_k \( E^e \, N_r \) arrow.r N_(r + 1) arrow.r 0 \, #h(2em) n mapsto \( a mapsto a n \) . $
  Here the $E^e$-action on the middle term is by right multiplication on its input. The middle term is finite injective, hence projective because $E^e$ is symmetric. Since $N_r$ is projective and therefore injective on each $E$-side, this sequence splits on both sides; it follows inductively that every $N_r$ is side-projective. Take $Y = N_4$. Its stable class is $\( c_5 K \) \[ 4 \] = cal(I) \[ - 1 \]$, as required. Lemmas 7 and 9 give the stated stable images and their evaluation compatibilities. We denote the stable map induced by $m$ by $overline(m) : cal(I) arrow.r E$. ◻
]

=== 6.2 The stable Hom profile in every degree <the-stable-hom-profile-in-every-degree>

#thm([Lemma 6.3.])[
  #emph[The bimodule $Y$ of Lemma 20 satisfies (6.1).]
] <b:profile>

#proof[
  The evaluated complex is
  $ K ⊗_E X = E ⊗ B^(⊗ bullet) ⊗ X . $
  Before inducing to $E$, its bar model and $R ⊗ R$ are projective $B$-resolutions of $X = s ⊗ s$. They are homotopy equivalent. Induction preserves this equivalence and gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ K ⊗_E X tilde.eq \( T ⊗_C R \) ⊗ \( T ⊗_C R \) = cal(J) ⊗ cal(J) . $ <b:evaluated-model>]
  In particular, Lemma 9 identifies its stable image with $cal(I) X$.
  We retain the actual attaching maps in the triangle
  $ s \[ 2 \] arrow.r cal(J) arrow.r s arrow.r^tau s \[ 3 \] $
  of (5.1). Choose bounded-below projective models $A_bullet$ for $s \[ 2 \]$ and $Q_bullet$ for $s$, and a chain map $t : Q_bullet arrow.r A_bullet \[ 1 \]$ representing $tau$. The cone of $t \[ - 1 \]$ has underlying graded complex $A_bullet xor Q_bullet$, differential
  $ mat(delim: "(", d_A, t; 0, d_Q) \, $
  and represents $cal(J)$, by Lemma 6. Indeed the cone construction for the rotated triangle gives this identification; comparisons of projective models lift the connecting map and give homotopy equivalences of the cones. Thus this is a homotopy equivalent projective model, with its specified subcomplex and quotient, rather than only an equality of homology groups.
  Tensor two copies of this model and shift by $\[ - 4 \]$. Filter first by $A_bullet ⊗ A_bullet$, then add $Q_bullet ⊗ A_bullet$ and $A_bullet ⊗ Q_bullet$, and finally add $Q_bullet ⊗ Q_bullet$. Every inclusion is split in each graded degree, and the successive quotients resolve
  #[#set math.equation(numbering: n => "(6.3)")
   $ X \, #h(2em) X \[ - 2 \] xor X \[ - 2 \] \, #h(2em) X \[ - 4 \] . $ <b:three-levels>]
  The stable image of the full complex is $cal(L) = \( cal(I) X \) \[ - 4 \]$. With the middle terms in the displayed order, the adjacent connecting maps are the shifted row and column
  $ \( tau_1 \, tau_2 \) \, #h(2em) binom(tau_2, tau_1) . $
  These are the cross differentials $t$ in the relevant factor and the identity in the other factor. Lemma 7 identifies them with the connecting maps after taking stable images.
  We first compute the kernels and cokernels of these adjacent maps in every degree. On the polynomial groups the maps form the two-variable Koszul sequence; on the negative groups they form its dual. We then use the two long exact sequences of the filtration to control the full top attaching map, including its possible component into the bottom level.
  Write $cal(P)_m = k \[ tau_1 \, tau_2 \]_m$ for polynomials of total exponent $m$, and put $cal(P)_m = 0$ for $m < 0$. By Proposition 16,
  $ cal(H)^(3 m) = cal(P)_m \, #h(2em) cal(H)^(- 3 m - 1) = D cal(P)_m quad \( m gt.eq 0 \) \, $
  and all other $cal(H)^a$ vanish. Multiplication by a degree-three class on the negative groups is transpose to polynomial multiplication. For each integer $l$, denote the adjacent maps by
  $ d_l : \( cal(H)^(l - 2) \)^2 & arrow.r cal(H)^(l + 1) \, & d_l \( u \, v \) & = tau_1 u + tau_2 v \,\
d'_l : cal(H)^(l - 4) & arrow.r \( cal(H)^(l - 1) \)^2 \, & d'_l \( w \) & = \( tau_2 w \, tau_1 w \) . $
  Products in these formulas mean shifted postcomposition. We claim
  #[#set math.equation(numbering: n => "(6.4)")
   $ ker d_l & = "im" d'_(l - 1) \,\
"coker" d_(l - 1) & = cases(delim: "{", k \, & l = 0 \,, 0 \, & l eq.not 0 \,) #h(2em) ker d'_l = cases(delim: "{", k \, & l = 3 \,, 0 \, & l eq.not 3 .) $ <b:koszul-middle>]
  To check the middle identity, the polynomial calculation for $m gt.eq 0$ is the exact sequence
  #[#set math.equation(numbering: n => "(6.5)")
   $ 0 arrow.r cal(P)_(m - 1) arrow.r^(thin \( tau_2 \, tau_1 \)^(sans(t)) thin) cal(P)_m^2 arrow.r^(thin \( tau_1 \, tau_2 \) thin) cal(P)_(m + 1) arrow.r 0 . $ <b:polynomial-koszul>]
  The row is onto since every positive-degree monomial is divisible by a variable. If $tau_1 u + tau_2 v = 0$, coprimality implies $u = tau_2 w$ and $v = tau_1 w$, uniquely; the signs agree in characteristic two. When the middle group is $\( D cal(P)_m \)^2$, use the dual of (6.5), interchanging the two middle slots:
  $ D cal(P)_(m + 1) arrow.r \( D cal(P)_m \)^2 arrow.r D cal(P)_(m - 1) . $
  At $m = 0$, the last term is the actual group $cal(H)^2 = 0$, and the first map $D cal(P)_1 arrow.r \( D cal(P)_0 \)^2$ is an isomorphism. This is the seam $l = 1$. If the middle group is unsupported, both its kernel and the image into it are zero. This proves (6.4) for every $l$.
  For the row cokernel, a target $cal(H)^l = cal(P)_m$ gives $cal(P)_(m - 1)^2 arrow.r cal(P)_m$, which is onto for $m gt.eq 1$ and has cokernel $k$ for $m = 0$. A negative target $cal(H)^l = D cal(P)_m$ gives the dual of the injective column $cal(P)_m arrow.r cal(P)_(m + 1)^2$, and is onto for every $m gt.eq 0$. All other targets are zero. For the column kernel, a nonnegative source $cal(P)_m$ maps injectively into $cal(P)_(m + 1)^2$. A source $D cal(P)_m$ for $m gt.eq 1$ is the dual of the surjective row $cal(P)_(m - 1)^2 arrow.r cal(P)_m$, so again the column is injective. The remaining source is $cal(H)^(- 1) = D cal(P)_0 = k$, at $l = 3$, with zero target $\( cal(H)^2 \)^2$. These cases prove (6.4). They include the only possible multiplication from a supported negative degree across zero, namely $cal(H)^(- 1) arrow.r cal(H)^2 = 0$.
  It remains to pass from adjacent maps to the whole filtered object. Let $cal(L)_1$ be the stable image of the lower two levels of (6.3), and put $N^l = underline("Hom")_E \( X \, cal(L)_1 \[ l \] \)$. The first two levels give
  #[#set math.equation(numbering: n => "(6.6)")
   $ 0 arrow.r "coker" d_(l - 1) arrow.r N^l arrow.r^(q_l) ker d_l arrow.r 0 . $ <b:first-two-levels>]
  Let
  $ r_l : cal(H)^(l - 4) arrow.r N^(l + 1) $
  be the #emph[actual] connecting map obtained by attaching the top level. Naturality of the quotient to the middle level gives $q_(l + 1) r_l = d'_l$. Thus $ker r_l subset.eq ker d'_l$, which is zero unless $l = 3$. At that index $N^4 = 0$: its left term in (6.6) is $"coker" d_3 = 0$, and its right term is a kernel in $\( cal(H)^2 \)^2 = 0$. Hence $ker r_3 = cal(H)^(- 1) = k$.
  Moreover,
  $ q_l \( "im" r_(l - 1) \) = "im" d'_(l - 1) = ker d_l . $
  For $l eq.not 0$, $q_l$ is an isomorphism, so $r_(l - 1)$ is onto. At $l = 0$, the vanishing $cal(H)^(- 2) = 0$ gives $N^0 = k$, while the whole incoming source of $r_(- 1)$ is $cal(H)^(- 5) = 0$. Consequently $"coker" r_(l - 1)$ is $k$ at $l = 0$ and zero elsewhere.
  The final long exact sequence gives
  $ 0 arrow.r "coker" r_(l - 1) arrow.r underline("Hom")_E \( X \, cal(L) \[ l \] \) arrow.r ker r_l arrow.r 0 . $
  The two scalar groups therefore survive precisely at $l = 0 \, 3$. This argument permits an additional component of the top attaching map into the bottom level: $N^4 = 0$ and $cal(H)^(- 5) = 0$ already force the asserted kernel and cokernel for the full $r_l$. Finally $Y X = \( cal(I) X \) \[ - 1 \] = cal(L) \[ 3 \]$, so $l = a + 3$. This gives exactly (6.1). ◻
]

=== 6.3 From perfect factorizations to an ordinary trace <from-perfect-factorizations-to-an-ordinary-trace>

The required Hom profile is now established. It remains to construct bimodule maps from the twists whose evaluations generate its degree-zero line. We first show that a particular character map cannot factor through a perfect complex; stable duality will then turn this obstruction into the required maps.

Let $chi : E arrow.r k$ be the character of $X$, write $chi_B = chi \|_B$, and retain $p_f = f ⊗ f$. The $B$-bimodule structure on $D B$ is $\( a lambda b \) \( c \) = lambda \( b c a \)$.

We use the bimodule $D B ⊗ B$, with its outer actions, to connect perfect factorizations with ordinary traces. Using the bound $"id"_B B lt.eq 4$, left coinduction will replace a perfect complex by a bounded complex with terms in $"add" \( D B ⊗ B \)$. For an ordinary composite $v : B arrow.r D B$ through $D B ⊗ B$, the identification $D B ⊗ B tilde.eq "Hom"_k \( B \, B \)$ will express the scalar $v \( 1 \) \( p_f \)$ as the trace of a linear operator.

#thm([Lemma 6.4.])[
  #emph[If a bimodule map $v : B arrow.r D B$ factors in the derived category through a perfect $B^e$-complex, then it factors by ordinary bimodule maps through an object of $"add" \( D B ⊗ B \)$, where the tensor product has its outer bimodule actions.]
] <b:ordinary-factorization>

#proof[
  Represent the perfect intermediate object by a bounded complex $P$ of finite projective bimodules. We first replace it by a bounded complex $P'$ whose terms belong to $"add" \( D B ⊗ B \)$.
  For a finite bimodule $L$, define
  $ J_B \( L \) = "Hom"_k \( B \, L \) \, #h(2em) \( a phi.alt b \) \( c \) = phi.alt \( c a \) b \, #h(2em) j_L \( z \) \( c \) = c z . $
  The map $j_L : L arrow.r J_B \( L \)$ is a natural bimodule monomorphism. Set $C^0 \( L \) = L$ and $C^(r + 1) \( L \) = "coker" j_(C^r \( L \))$. These are additive functors and preserve split retracts. For a fixed $d = 4$ we have the functorial exact sequence
  #[#set math.equation(numbering: n => "(6.7)")
   $ 0 arrow.r L arrow.r J_B \( C^0 \( L \) \) arrow.r dots.h.c arrow.r J_B \( C^(d - 1) \( L \) \) arrow.r C^d \( L \) arrow.r 0 . $ <b:coresolution>]
  For the free bimodule $L = B ⊗ B$, this construction is the left-module coinduced coresolution of $B$, tensored over $k$ with the right regular module $B$. This follows from $"Hom"_k \( B \, B ⊗ B \) = "Hom"_k \( B \, B \) ⊗ B$ and from exactness of tensoring vector spaces. Each coinduced left-module term is a finite injective, hence belongs to $"add" \( D B \)$. The last left-module cokernel is also injective: by Proposition 13, $"id" \( zws_B B \) lt.eq 4$, and dimension shifting gives, for every finite left module $V$,
  $ "Ext"_B^1 \( V \, C^d \( B \) \) tilde.equiv "Ext"_B^(d + 1) \( V \, B \) = 0 . $
  Here $C^d \( B \)$ denotes the same coresolution construction on the left regular module. Thus every term on the right of $L$ in (6.7), including the last cokernel, lies in $"add" \( D B ⊗ B \)$ when $L = B ⊗ B$. The assertion extends to every finite projective bimodule $L$, since the functors in (6.7) preserve finite sums and split retracts.
  Apply this one fixed finite coresolution to each term of $P$. Naturality provides the horizontal maps, giving a bounded double complex. Put the first coinduced term in homological degree $0$ relative to $L$, and the last cokernel in degree $- d$. Its totalization $P'$ is bounded and has all terms in $"add" \( D B ⊗ B \)$. The augmentation $P arrow.r P'$ is a quasi-isomorphism: filtering its cone by the finitely many original degrees has exact associated complexes (6.7). Thus the given derived factorization can be written $B arrow.r P' arrow.r D B$.
  For $V in "add" \( D B ⊗ B \)$ and $i > 0$, we next prove
  #[#set math.equation(numbering: n => "(6.8)")
   $ "Ext"_(B^e)^i \( B \, V \) = 0 \, #h(2em) "Ext"_(B^e)^i \( V \, D B \) = 0 . $ <b:two-orthogonalities>]
  It suffices to take $V = D B ⊗ B$. Coinduction identifies, for a bimodule $Q$,
  $ "Hom"_(B^e) \( Q \, D B ⊗ B \) tilde.equiv "Hom"_(B^(upright("op"))) \( "Res" Q \, B \) . $
  A projective bimodule resolution of $B$ restricts to a right-projective resolution of the free right module $B$. This proves the first vanishing. For the second, tensor a left-projective resolution $Q_bullet$ of $D B$ over $k$ with the right regular module $B$. It is a projective bimodule resolution of $D B ⊗ B$, and
  $ "Hom"_(B^e) \( Q_bullet ⊗ B \, D B \) tilde.equiv "Hom"_B \( Q_bullet \, D B \) . $
  Its positive cohomology vanishes since $zws_B D B$ is injective. Both assertions pass to finite sums and summands.
  Finally choose a projective resolution $Q_B arrow.r B$ and an injective coresolution $D B arrow.r I_(D B)$, regarded as homological complexes. There are natural quasi-isomorphisms of Hom complexes
  #[#set math.equation(numbering: n => "(6.9)")
   $ "Hom"_(B^e)^bullet \( B \, P' \) & arrow.r "Hom"_(B^e)^bullet \( Q_B \, P' \) \,\
"Hom"_(B^e)^bullet \( P' \, D B \) & arrow.r "Hom"_(B^e)^bullet \( P' \, I_(D B) \) . $ <b:Hom-comparisons>]
  To verify them, filter by the finitely many terms of $P'$. For each successive quotient the claim is one of (6.8), together with equality in degree zero and vanishing of negative Ext between modules. A shift of a term merely shifts this comparison. Hence terms in negative degrees cause no exception, and induction on this finite filtration proves (6.9).
  Taking degree-zero cohomology shows that both derived arrows have actual chain-map representatives $alpha : B \[ 0 \] arrow.r P'$ and $beta : P' arrow.r D B \[ 0 \]$. Their composite is the ordinary map $beta_0 alpha_0$, so it factors through $P'_0 in "add" \( D B ⊗ B \)$. It equals $v$ as an ordinary bimodule map, because $"Hom"_(upright(D) \( B^e \)) \( B \, D B \) = "Hom"_(B^e) \( B \, D B \)$. ◻
]

The scalar trace calculation below is related to the trace and corner-dimension calculation in #cite(label("LiuZhouZimmermann2012")) Example 3.2(1) and proof of Theorem 3.8. Here the preceding lemma supplies the reduction from perfect factorizations, and the calculation uses the split corner table (4.6).

#thm([Lemma 6.5.])[
  #emph[The bimodule map 
#[#set math.equation(numbering: n => "(6.10)")
 $ eta : B arrow.r D B \, #h(2em) eta \( a \) = chi_B \( a \) chi_B \, $ <b:character-map>]

 does not factor in the derived category through a perfect $B^e$-complex.]
] <b:trace-obstruction>

#proof[
  The character identities make $eta$ a bimodule map. By Lemma 22, a perfect factorization would give an ordinary factorization through $"add" \( D B ⊗ B \)$. We show that every such factorization $B arrow.r D B$ sends $1$ to a functional vanishing on $p_f$.
  First consider maps
  $ B arrow.r^alpha D B ⊗ B arrow.r^beta D B . $
  Identify $D B ⊗ B$ with $"Hom"_k \( B \, B \)$ by $lambda ⊗ c mapsto \[ x mapsto lambda \( x \) c \]$. The element $alpha \( 1 \)$ satisfies $a alpha \( 1 \) = alpha \( 1 \) a$. Under this identification, its corresponding linear map $f_0$ therefore satisfies
  $ f_0 \( x a \) = f_0 \( x \) a quad \( x \, a in B \) . $
  Thus $f_0 \( x \) = d_0 x$, where $d_0 = f_0 \( 1 \)$. If $\( c_i \)$ is any vector-space basis of $B$, with dual basis $\( c_i^(*) \)$, then
  $ alpha \( 1 \) = sum_i c_i^(*) ⊗ d_0 c_i . $
  Right linearity of $beta$ reduces it to the left-module endomorphism $lambda mapsto beta \( lambda ⊗ 1 \)$ of $D B$. Duality identifies these endomorphisms with endomorphisms of the right regular module $B$, which are left multiplications. Thus the endomorphism of $D B$ is right multiplication by some $b' in B$. Consequently
  $ beta \( lambda ⊗ c \) = lambda b' c \, #h(2em) \( beta alpha \( 1 \) \) \( p_f \) = sum_i c_i^(*) \( b' d_0 c_i p_f \) = "tr"_k #scale(x: 120%, y: 120%)[\(] L_(b' d_0) R_(p_f) #scale(x: 120%, y: 120%)[\)] . $
  Here $L_a$ and $R_a$ are left and right multiplication on the vector space $B$. The order $b' d_0$ follows from the dual action $\( lambda b' c \) \( p_f \) = lambda \( b' c p_f \)$.
  Write $b' d_0 = r + sum_v a_v p_v$, where $r in "rad" B$ and the $p_v$ are its four vertex idempotents. Left and right multiplications commute, and $p_f^2 = p_f$, so
  $ \( L_r R_(p_f) \)^n = L_(r^n) R_(p_f) = 0 $
  for sufficiently large $n$. The radical part has trace zero. For each $v$, the operator $L_(p_v) R_(p_f)$ is a projection onto $p_v B p_f$. The corner dimensions of $B$, obtained from the corner table (4.6), are even; in particular $dim_k \( p_v B p_f \) = 4$ for every $v$. Each projection therefore has trace zero in characteristic two. Linearity gives $\( beta alpha \( 1 \) \) \( p_f \) = 0$.
  A factorization through a finite sum of $D B ⊗ B$ is a sum of such composites. A factorization through a summand extends to that finite sum by its split inclusion and projection. The same vanishing thus holds throughout $"add" \( D B ⊗ B \)$. But $eta \( 1 \) \( p_f \) = chi_B \( p_f \) = 1$, a contradiction. ◻
]

=== 6.4 Lifts with nonzero evaluation <lifts-with-nonzero-evaluation>

We now apply the trace obstruction to obtain the maps required by Proposition 19.

Put $S = "Hom"_k \( X \, X \)$, with bimodule action

$ \( a t b \) \( x \) = a thin t \( b x \) . $

The representation gives a bimodule map $pi : E arrow.r S$. Since $X$ is one-dimensional, $S = k$ with both actions given by $chi$.

#thm([Lemma 6.6.])[
  #emph[For every finite side-projective bimodule $L$, ordinary tensor–Hom adjunction induces a natural isomorphism 
$ underline("Hom")_(E^e) \( L \, S \) med tilde.equiv med underline("Hom")_E \( L X \, X \) . $

 This assertion does not require $S$ to be side-projective.]
] <b:stable-adjunction>

#proof[
  The ordinary adjoint of $f : L arrow.r S$ is $hat(f) \( l ⊗ x \) = f \( l \) \( x \)$. A factorization of $f$ through a finite $E^e$-projective evaluates to a factorization through an $E$-projective.
  Conversely embed $L$ in a finite projective-injective $E^e$-module $J$. The embedding splits as a right $E$-module map because $L_E$ is projective, hence injective over symmetric $E$. Thus $L X arrow.r J X$ is injective. Suppose $hat(f)$ factors as $L X arrow.r P arrow.r X$ with $P$ finite $E$-projective. Injectivity of $P$ extends its first factor to $J X arrow.r P$. Composing with $P arrow.r X$ and applying ordinary adjunction gives $J arrow.r S$ whose restriction to $L$ is $f$. This is a bimodule projective factorization. The two factorization ideals therefore correspond exactly. Naturality is inherited from ordinary adjunction. ◻
]

#thm([Lemma 6.7.])[
  #emph[For every $H in k^times$, there is a stable bimodule map $U_H \[ 1 \] arrow.r cal(I)$ with nonzero evaluated stable map $X \[ 1 \] arrow.r cal(I) X$.]
] <b:evaluated-lift>

#proof[
  Write $U = U_H$ and $phi.alt = pi overline(m) : cal(I) arrow.r S$. All shifts of $U$ and $cal(I)$ have finite side-projective representatives by Lemma 9. Consider the finite-dimensional linear map
  $ phi.alt_(*) : underline("Hom")_(E^e) \( U \[ 1 \] \, cal(I) \) arrow.r underline("Hom")_(E^e) \( U \[ 1 \] \, S \) . $
  Symmetric duality, Lemma 5 applied over $E^e$, identifies its transpose with
  #[#set math.equation(numbering: n => "(6.11)")
   $ underline("Hom")_(E^e) \( S \, U \) arrow.r underline("Hom")_(E^e) \( cal(I) \, U \) \, #h(2em) b mapsto b phi.alt . $ <b:transpose>]
  Indeed the fixed first argument is $U \[ 1 \]$, and its duality shift is $U \[ 1 \] \[ - 1 \] = U$; naturality in the second argument gives the displayed precomposition.
  Let $zeta = f^(*) ⊗ f^(*) in E$, as in Lemma 17. Both its left and right actions are the character $chi$. The map
  $ b_0 : S arrow.r U \, #h(2em) b_0 \( 1 \) = zeta $
  is a bimodule map even for the twisted right action, because
  $ zeta dot.op b = zeta sigma_H \( b \) = chi \( sigma_H \( b \) \) zeta = chi \( b \) zeta . $
  We will prove that $b_0 phi.alt eq.not 0$ stably.
  Suppose otherwise. The derived map $b_0 pi m : K arrow.r U$ then has zero stable image and factors through a perfect $E^e$-complex by Lemma 8. To apply that lemma with projective models, one may take a bounded-below projective resolution $Q arrow.r U$ with finite terms and lift the global chain map $K arrow.r U$ to $K arrow.r Q$; its stable image is the same map $b_0 phi.alt$.
  Restriction of this factorization to $B^e$ still has a perfect intermediate object. Indeed an $E^e$-free module restricts to the outer bimodule $E ⊗ E$. Tensoring the left and right $B$-projective resolutions of $E$ from Proposition 13 gives a $B^e$-projective resolution of length at most $8$. Finite sums and summands have the same bound. A bounded complex of these restricted modules is perfect by its finite term filtration.
  Let $"Bar" \( B \) arrow.r B$ denote the bar resolution. Inclusion of both outer $B$-factors in $E$ defines a $B^e$-chain map
  $ iota : "Bar" \( B \) arrow.r "Res"_(B^e) K \, $
  and hence a derived map $B arrow.r "Res"_(B^e) K$. Since $sigma_H$ fixes $B$, the decomposition
  $ "Res"_(B^e) U = B xor \( D C ⊗ C \) xor \( C ⊗ D C \) xor D B $
  is a decomposition of $B$-bimodules. Let $rho$ be projection to the last summand. The composite
  $ "Bar" \( B \) arrow.r^iota "Res" K arrow.r^(thin b_0 pi m thin) "Res" U arrow.r^rho D B $
  is exactly the character map $eta$ of (6.10) composed with the bar augmentation: in degree zero it sends $a ⊗ c$ to $chi_B \( a c \) chi_B$, since $rho \( zeta \) = chi_B$, and in higher degrees it is zero. Thus our supposed factorization would make $eta$ factor through a perfect $B^e$-complex. Lemma 23 excludes this possibility. We have proved $b_0 phi.alt eq.not 0$.
  It follows from (6.11) that $phi.alt_(*)$ is nonzero. Choose $beta : U \[ 1 \] arrow.r cal(I)$ with $phi.alt beta eq.not 0$. Lemma 24, applied only to the side-projective source $U \[ 1 \]$, identifies this nonzero class with the composite
  $ U \[ 1 \] X arrow.r^(beta X) cal(I) X arrow.r^(overline(m) X) E X tilde.equiv X . $
  This identity follows from ordinary adjunction and from the evaluation of the representation $pi$. The evaluated maps involving $U \[ 1 \] \, cal(I) \, E$ are defined stably by Lemma 9; no stable evaluation functor on the nonside-projective module $S$ is needed. The composite is nonzero, so $beta X$ itself is nonzero. The canonical shift comparison identifies $U \[ 1 \] X$ with $\( U X \) \[ 1 \] = X \[ 1 \]$, proving the assertion. ◻
]

#proof[
  Take the fixed finite side-projective $Y$ constructed in Lemma 20. Lemma 21 proves its required Hom profile. For any $H in k^times$, shift the map of Lemma 25 by $\[ - 1 \]$ and identify $cal(I) \[ - 1 \]$ with $Y$ to obtain a stable map $U_H arrow.r Y$. By the shift and evaluation compatibilities of Lemma 9, its evaluation is a nonzero class $X arrow.r Y X$. A stable map between the fixed finite modules is represented by an ordinary bimodule map; choose one and call it $g_H$. All Hom spaces, dualities, and selections used above are over the original field $k$, so this requires no scalar extension. The construction of $Y$ did not depend on $H$. ◻
]

== 7 The triangular module and the counterexample <sec:triangular>

We now combine the two twists and apply the transfer principle of Proposition 11. Retain $E \, X$ and the finite side-projective bimodule $Y$ from Proposition 19. For brevity, write $L X = L ⊗_E X$ for an $E$-bimodule $L$, and set

$ W^a = underline("Hom")_E \( X \, Y X \[ a \] \) . $

Thus $W^a = k$ for $a = - 3 \, 0$ and is zero otherwise.

=== 7.1 The fiber of the two evaluated maps <the-fiber-of-the-two-evaluated-maps>

For $i = 1 \, 2$, put $U_i = U_(H_i)$. Choose the maps $g_i : U_i arrow.r Y$ supplied by Proposition 19. Using the fixed identifications $U_i X tilde.eq X$, their evaluated stable classes are nonzero elements of the same one-dimensional space $W^0$. Rescale them so that both classes equal a fixed $w eq.not 0$. Choose a finite free $E$-bimodule $Q$ with a surjection $pi : Q arrow.r Y$, and define $F$ by

#[#set math.equation(numbering: n => "(7.1)")
 $ 0 arrow.r F arrow.r U_1 xor U_2 xor Q arrow.r^(\( g_1 \, g_2 \, pi \)) Y arrow.r 0 . $ <t:fiber>]

For example, the action gives such a surjection from $E^e ⊗_k Y$. Since $Y$ is projective on each side, this sequence splits separately on the left and on the right. In particular, $F$ is finite and side-projective.

Let

$ cal(V)^a = underline("Hom")_E \( X \, F X \[ a \] \) . $

Evaluating (7.1) on $X$ preserves exactness, and $Q X$ is $E$-projective. The stable long exact sequence is therefore

#[#set math.equation(numbering: n => "(7.2)")
 $ \( cal(H)^(a - 1) \)^2 arrow.r W^(a - 1) arrow.r cal(V)^a arrow.r^(p^a) \( cal(H)^a \)^2 arrow.r W^a . $ <t:fiber-hom>]

In degree zero the last map is $\( c \, d \) mapsto \( c + d \) w$. It follows that $cal(V)^0$ is a line with a unique element $v_0$ projecting to $\( 1 \, 1 \)$.

For a stable map $g : X arrow.r X \[ a \]$, let $F \( g \)$ denote its image under the exact functor $F ⊗_E -$, using the shift comparisons of Lemma 9. Define

#[#set math.equation(numbering: n => "(7.3)")
 $ Delta^a : \( cal(H)^a \)^2 arrow.r cal(V)^a \, #h(2em) \( g \, h \) mapsto F \( g \) v_0 + v_0 \[ a \] h . $ <t:delta>]

#thm([Lemma 7.1.])[
  #emph[The map $Delta^0$ is surjective. For every $a > 0$ and every $a lt.eq - 3$, $Delta^a$ is an isomorphism, and $Delta^(- 2)$ is injective.]
] <t:comparison-maps>

#proof[
  The projection $p^a$ in (7.2) is an isomorphism for $a > 0$. For $a gt.eq 2$ this follows from the support of $W$; at $a = 1$ it also uses the surjectivity of $\( cal(H)^0 \)^2 arrow.r W^0$. The same support argument applies for $a lt.eq - 4$. At $a = - 3$, both $W^(- 4)$ and $cal(H)^(- 3)$ are zero, so $cal(V)^(- 3) = 0$ and $p^(- 3)$ is again an isomorphism. The remaining relevant low degrees can be read directly from (7.2):
  #[#set math.equation(numbering: n => "(7.4)")
   $ cal(V)^(- 2) = k \, #h(2em) cal(V)^0 = k v_0 \, #h(2em) cal(V)^1 = 0 . $ <t:boundary-fiber>]
  Naturality of the bimodule projections $F arrow.r U_i$ gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ p^a Delta^a \( g \, h \) = #scale(x: 120%, y: 120%)[\(] U_1 \( g \) + h \, med U_2 \( g \) + h #scale(x: 120%, y: 120%)[\)] . $ <t:projected-delta>]
  Indeed each projection sends $v_0$ to the identity of $X$, and evaluation of a bimodule map commutes with the specified shift comparisons. By Proposition 18, at $a = 3 m > 0$ the map in (7.5) is the scalar matrix
  $ mat(delim: "(", H_1^(- m), 1; H_2^(- m), 1) ⊗ 1_(cal(P)_m) \, $
  and at $a = - 3 m - 1 lt.eq - 4$ it is
  $ mat(delim: "(", H_1^(m + 2), 1; H_2^(m + 2), 1) ⊗ 1_(D cal(P)_m) . $
  In both cases $m gt.eq 1$. Algebraic independence of $H_1 \, H_2$ implies that each determinant is nonzero in $k$, for every such $m$. In all other degrees in the asserted ranges, the source and target are zero by Proposition 16 and the already proved isomorphism $p^a$.
  Finally, $Delta^0 \( c \, d \) = \( c + d \) v_0$ is surjective. Since $cal(H)^(- 2) = 0$, the map $Delta^(- 2) : 0 arrow.r cal(V)^(- 2) = k$ is injective. Its surjectivity is neither claimed nor needed. ◻
]

=== 7.2 A cone over the triangular algebra <a-cone-over-the-triangular-algebra>

Form the finite-dimensional algebra

#[#set math.equation(numbering: n => "(7.6)")
 $ Lambda = mat(delim: "(", E, 0; F, E) . $ <t:triangular-algebra>]

A left $Lambda$-module is a triple $\( L \, N \, alpha : F ⊗_E L arrow.r N \)$ of left $E$-modules and an $E$-linear structure map, with action

$ mat(delim: "(", a, 0; b, d) \( x \, y \) = #scale(x: 120%, y: 120%)[\(] a x \, alpha \( b ⊗ x \) + d y #scale(x: 120%, y: 120%)[\)] . $

The column constructions are standard in the theory of totally acyclic complexes over triangular matrix rings; see #cite(label("EshraghiEtAl2014v1")) Lemma 2.2 and Proposition 2.3. Here $F$ is projective on each side, so the required tensor exactness and orthogonality conditions hold. We retain the complete resolution to compute its self-Hom groups. Define the two column functors

$ sans(D)_0 \( L \) = \( L \, F L \, 1 \) \, #h(2em) sans(D)_1 \( L \) = \( 0 \, L \, 0 \) . $

They are exact and preserve finite projectives: exactness uses right projectivity of $F$, and their values on $E$ are the two columns of the regular module $Lambda$. The descriptions of module maps give

#[#set math.equation(numbering: n => "(7.7)")
 $ "Hom"_Lambda \( sans(D)_i \( L \) \, sans(D)_i \( L' \) \) & tilde.eq "Hom"_E \( L \, L' \) quad \( i = 0 \, 1 \) \,\
"Hom"_Lambda \( sans(D)_0 \( L \) \, sans(D)_1 \( L' \) \) & = 0 \, #h(2em) "Hom"_Lambda \( sans(D)_1 \( L \) \, sans(D)_0 \( L' \) \) tilde.eq "Hom"_E \( L \, F L' \) . $ <t:diagonal-hom>]

In the first diagonal slot, the map on the lower component is $F \( g \)$ when the map on the upper component is $g$.

Let $p_f = f ⊗ f$. Use the embedding $i_X : X arrow.r.hook E p_f$, $i_X \( 1 \) = zeta$, established in Lemma 17. Choose a complete resolution $P$ of $X$ over $E$ whose first negative term is $P_(- 1) = E p_f$, and whose degree-zero differential is $d_0 = i_X epsilon.alt$, where $epsilon.alt : P_0 arrow.r X$ is the augmentation. Such a choice is possible because $E$ is symmetric. The complex $F P$ is exact with projective terms, and $c_0 \( F P \) = F X$.

Choose an ordinary map $tilde(v) : X arrow.r F X$ representing $v_0$. Lemma 4 lifts it to a chain map $P arrow.r F P$. By (7.7) this is a chain map

$ V : sans(D)_1 \( P \) arrow.r sans(D)_0 \( P \) . $

Set

#[#set math.equation(numbering: n => "(7.8)")
 $ P_Z = "Cone" \( V \) \, #h(2em) Z = c_0 P_Z . $ <t:cone>]

Thus

$ \( P_Z \)_j = sans(D)_0 \( P_j \) xor sans(D)_1 \( P_(j - 1) \) \, $

with cross differential $V_(j - 1)$ from the second summand to the first summand in degree $j - 1$.

#thm([Lemma 7.2.])[
  #emph[The complex $P_Z$ is totally acyclic. Its degree-zero cokernel $Z$ is finite-dimensional and nonprojective.]
] <t:finite-module>

#proof[
  Both column complexes have projective terms and are exact. Since $Lambda = sans(D)_0 \( E \) xor sans(D)_1 \( E \)$, (7.7)–(7.7) identify their Hom complexes into $Lambda$ with sums of
  $ "Hom"_E \( P \, E \) \, #h(2em) "Hom"_E \( P \, F \) \, #h(2em) 0 . $
  These are exact: $P$ is totally acyclic and $F$ is finite projective on the left. Hence both column complexes are totally acyclic, and so is their cone.
  For an explicit finite description, $Z$ is the triple with upper component $X$ and lower component
  #[#set math.equation(numbering: n => "(7.9)")
   $ N_Z = \( F X xor E p_f \) #scale(x: 120%, y: 120%)[\/] { \( tilde(v) \( x \) \, i_X \( x \) \) : x in X } \, $ <t:explicit-module>]
  whose structure map $F X arrow.r N_Z$ is induced by the first summand. To verify this formula, first quotient the degree-zero lower component by the image of the differential in $sans(D)_0 \( P \)$. This gives $F X$ in its first summand. The remaining relations arise from $P_0$ in the shifted second column. Its two components induce $tilde(v) epsilon.alt$ and $i_X epsilon.alt$, respectively, yielding (7.9).
  The upper-component functor sends the projective generators $sans(D)_0 \( E \)$ and $sans(D)_1 \( E \)$ to $E$ and $0$, and therefore sends every finite projective $Lambda$-module to an $E$-projective. But $X$ is nonprojective, since its degree-three self-extension group is nonzero by Proposition 16. Thus $Z$ is nonprojective. ◻
]

=== 7.3 The full endomorphism complex <the-full-endomorphism-complex>

The complete resolution makes it possible to check both vanishing ranges with the same endomorphism calculation.

#thm([Proposition 7.3.])[
  #emph[The module and resolution in (7.8) satisfy 
$ H^a "Hom"_Lambda \( P_Z \, Z \) = 0 #h(2em) \( a > 0 med upright("or") med a lt.eq - 2 \) . $

]
] <t:vanishing>

#proof[
  Write $A_0 = sans(D)_0 \( P \)$ and $B_0 = sans(D)_1 \( P \)$, so that the underlying graded complex of $P_Z$ is $A_0 xor B_0 \[ 1 \]$. By (7.7), the block $"Hom"_Lambda^bullet \( A_0 \, B_0 \[ 1 \] \)$ is zero. Projection onto the two diagonal blocks therefore gives a short exact sequence of full Hom complexes
  #[#set math.equation(numbering: n => "(7.10)")
   $ 0 arrow.r cal(C)^bullet arrow.r "End"_Lambda^bullet \( P_Z \) arrow.r "End"_Lambda^bullet \( A_0 \) xor "End"_Lambda^bullet \( B_0 \[ 1 \] \) arrow.r 0 \,\
cal(C)^bullet = "Hom"_Lambda^bullet \( B_0 \[ 1 \] \, A_0 \) . $ <t:end-sequence>]
  The underlying degreewise Hom spaces are products as in Lemma 4; the block decomposition has only four blocks. In particular, it does not replace any product by a direct sum.
  The diagonal cohomology is $\( cal(H)^a \)^2$. To fix the cross-block index explicitly, in degree $a$ we have
  $ cal(C)^a & = product_j "Hom"_E \( P_(j - 1) \, F P_(j - a) \)\
 & = product_i "Hom"_E \( P_i \, F P_(i - \( a - 1 \)) \) = "Hom"_E^(a - 1) \( P \, F P \) . $
  The differentials agree under this reindexing in characteristic two. Lemma 4 consequently gives $H^a cal(C)^bullet = cal(V)^(a - 1)$.
  The connecting map in (7.10), from diagonal cohomology in degree $a$ to $H^(a + 1) cal(C)^bullet = cal(V)^a$, is precisely $Delta^a$. Indeed, lift two diagonal cocycles to the diagonal blocks of an endomorphism of the cone and take its cochain differential. The cross component is the sum of its two compositions with $V$. The first diagonal acts downstairs by $F$ of the corresponding map, while the second acts by precomposition. Under the composition-compatible comparison in Lemma 4, this gives $F \( g \) v_0 + v_0 \[ a \] h$, as in (7.3). Thus the long exact sequence gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ 0 arrow.r "coker" Delta^(a - 1) arrow.r H^a "End"_Lambda^bullet \( P_Z \) arrow.r ker Delta^a arrow.r 0 . $ <t:end-cohomology>]
  For $a > 1$ or $a lt.eq - 3$, both outer terms vanish by Lemma 26. At $a = 1$, they vanish by surjectivity of $Delta^0$ and injectivity of $Delta^1$. At $a = - 2$, they vanish by the isomorphism $Delta^(- 3)$ and injectivity of $Delta^(- 2)$. Finally, apply Lemma 4 to the totally acyclic complex $P_Z$ to identify this cohomology with $H^a "Hom"_Lambda \( P_Z \, Z \)$. ◻
]

#prodef([Remark 7.4.])[
  The boundary degrees can also be located completely. Equation (7.2) gives $cal(V)^(- 1) = \( cal(H)^(- 1) \)^2 = k^2$. By Proposition 18, the two rows of $Delta^(- 1)$ are $\( H_i^2 \, 1 \)$, so this map is invertible. Since $Delta^(- 2) : 0 arrow.r k$ and $ker Delta^0 = k$, (7.11) yields
  $ H^a "End"_Lambda^bullet \( P_Z \) = cases(delim: "{", k \, & a = - 1 \, 0 \,, 0 \, & a in.not { - 1 \, 0 } .) $
  In particular the nonzero cokernel of $Delta^(- 2)$ contributes in degree $- 1$, while degree $- 2$ vanishes as required by Proposition 11.
] <t:neighboring-degrees>

=== 7.4 Completion of the proof <completion-of-the-proof>

#proof[
  Fix the finite bimodule maps in (7.1), the complete resolution $P$, and the lifted map used in (7.8). These choices exist over $k$ by the preceding propositions. The algebra $Lambda$ in (7.6) and its module $Z$ in (7.9) are finite-dimensional. By Lemma 27, $Z$ is nonprojective and has the totally acyclic resolution $P_Z$. Proposition 28 supplies both hypotheses on its complete self-Hom groups in Proposition 11. Apply that proposition with $R = Lambda$ to obtain
  $ A = Lambda times.l D Lambda \, #h(2em) M = A ⊗_Lambda Z . $
  It proves that $A$ is finite-dimensional and symmetric, that $M$ is finite-dimensional and nonprojective, and that $"Ext"_A^i \( M \, M \) = 0$ for every $i > 0$. These are all the assertions of Theorem 1. ◻
]

== 8 The endomorphism algebra and homological consequences <sec:consequences>

The symmetric pair constructed in Theorem 1 has a self-orthogonal generator $A xor M$. The classical relation between such generators and dominant dimension turns the module counterexample into an algebra whose entire regular injective resolution is projective. We first isolate this step, then extract the modules in Corollaries 2 and 3.

#thm([Proposition 8.1.])[
  #emph[Let $B$ be a finite-dimensional symmetric algebra over a field and let $N$ be a finite-dimensional nonprojective left $B$-module satisfying $"Ext"_B^i \( N \, N \) = 0$ for all $i > 0$. Put 
$ G = B xor N \, #h(2em) Gamma = "End"_B \( G \)^(upright("op")) \, $

 where endomorphisms compose in the ordinary order. Then 
$ "domdim" \( zws_Gamma Gamma \) = oo \, #h(2em) "id"_Gamma Gamma = oo . $

 In particular, $Gamma$ is not self-injective.]
] <prop:endomorphism>

#proof[
  The module $G$ is a generator-cogenerator: it contains the regular module, and symmetry identifies $B$ with its dual, an injective cogenerator. Moreover
  $ "Ext"_B^i \( G \, G \) = 0 #h(2em) \( i > 0 \) . $
  The $N \, N$ summand vanishes by hypothesis. The summands with first argument $B$ vanish by projectivity, and the remaining summand with second argument $B$ vanishes by injectivity.
  Mueller’s criterion #cite(label("Mueller1968")) Lemma 3 says that, for a generator-cogenerator $G$, vanishing of these groups for $1 lt.eq i lt.eq n$ is equivalent to dominant dimension at least $n + 2$ for its endomorphism algebra. His Theorem 4 identifies the left and right dominant dimensions, so the opposite convention in the definition of $Gamma$ makes no difference to this assertion. Applying the criterion for every $n$ proves $"domdim" \( zws_Gamma Gamma \) = oo$.
  We verify non-self-injectivity directly. The functor
  $ H = "Hom"_B \( G \, - \) : "add" G arrow.r Gamma upright("-") upright("proj") $
  is fully faithful and sends $G$ to the left regular module $Gamma$. Explicitly, if $e in "End"_B \( G \)$ and $h : G arrow.r V$, then $e^(upright("op")) h = h compose e$; full faithfulness follows first on finite sums of $G$ and then on their summands. Suppose that the left regular module $Gamma$ were injective. Its direct summand $H \( N \)$ would be injective as well. Choose a finite injective envelope $N arrow.r.hook J$ over $B$. Since $B$ is symmetric, $J in "add" B subset.eq "add" G$. Left exactness of $H$ gives a monomorphism $H \( N \) arrow.r.hook H \( J \)$, which splits by injectivity of $H \( N \)$. Full faithfulness gives a retraction $J arrow.r N$ of the original inclusion. Thus $N$ is injective, hence projective over the symmetric algebra $B$, a contradiction.
  Finally, every term in the minimal injective resolution of $Gamma$ is projective by infinite dominant dimension. If its injective dimension were finite, this resolution would end in a finite exact sequence
  $ 0 arrow.r Gamma arrow.r I^0 arrow.r dots.h.c arrow.r I^d arrow.r 0 $
  of projective-injective terms. For $d > 0$, the last surjection splits because $I^d$ is projective. Its kernel is then projective, and repeating backwards shows that the first inclusion splits. The case $d = 0$ is immediate. In either case $Gamma$ is a summand of $I^0$ and is injective, contrary to the preceding paragraph. Hence $"id"_Gamma Gamma = oo$. ◻
]

#proof[
  Fix a field extension $K \/ k$. The symmetric structure survives extension of scalars: since $A$ is finite-dimensional, the natural bimodule identification
  $ K ⊗_k D A tilde.eq D_K \( K ⊗_k A \) \, #h(2em) D_K = "Hom"_K \( - \, K \) \, $
  turns $A tilde.eq D A$ into a symmetrizing isomorphism for $A_K$.
  We also record why the module hypotheses survive. For finite $A$-modules $U \, V$, resolve $U$ by finite projective modules. Finite projectivity gives, in every degree,
  $ K ⊗_k "Hom"_A \( P_i \, V \) tilde.eq "Hom"_(A_K) \( K ⊗_k P_i \, K ⊗_k V \) . $
  Flatness commutes with kernels and images, so
  #[#set math.equation(numbering: n => "(8.1)")
   $ K ⊗_k "Ext"_A^i \( U \, V \) tilde.eq "Ext"_(A_K)^i \( K ⊗_k U \, K ⊗_k V \) #h(2em) \( i gt.eq 0 \) . $ <c:basechange>]
  Thus $M_K$ is self-orthogonal. Choose a finite projective surjection $P arrow.r.twohead M$ with kernel $L$. Its extension class in $"Ext"_A^1 \( M \, L \)$ is nonzero, since $M$ is not projective. It remains nonzero under (8.1), because extension of fields is faithful. The extended surjection therefore does not split, and $M_K$ is nonprojective. The degree-zero case of (8.1) is compatible with composition and also identifies
  $ Gamma_K tilde.eq K ⊗_k "End"_A \( A xor M \)^(upright("op")) . $
  These are the same finite Ext and nonprojectivity base-change arguments used in the companion #cite(label("OpenAIAR2026")) Proposition 9.2.
  Apply Proposition 30 to $A_K \, M_K$, and abbreviate $Gamma_K$ to $Gamma$. Write
  $ 0 arrow.r Gamma arrow.r I^0 arrow.r I^1 arrow.r dots.h.c $
  for its minimal injective resolution. Every $I^j$ is projective-injective and $"id"_Gamma Gamma = oo$. This proves the first assertion and refutes the classical Nakayama conjecture. It also refutes the Auslander–Gorenstein conjecture: $"pd"_Gamma I^j = 0 lt.eq j$ for every $j gt.eq 0$, whereas the left self-injective dimension is already infinite.
  There is a nonprojective indecomposable injective left $Gamma$-module $J$. Indeed, finite-dimensional algebras have the same finite number of isomorphism classes of indecomposable projectives and indecomposable injectives, both indexed by the simple modules. If every indecomposable injective were projective, these classes would exhaust the indecomposable projectives, making the regular module injective. This contradicts Proposition 30. Since every $I^j$ is projective, none contains $J$ as a direct summand, giving the omitted-injective failure of the generalized Nakayama conjecture.
  Let $S = "soc" J$. The socle of an indecomposable injective over a finite-dimensional algebra is simple, and $J$ is its injective envelope. If there were a nonzero map $S arrow.r I^j$, it would be injective. Injectivity of $I^j$ would extend it to a map $J arrow.r I^j$. The extension is injective because $S$ is essential in $J$, and it splits because $J$ is injective. This would make $J$ a summand of $I^j$, a contradiction. Hence $"Hom"_Gamma \( S \, I^j \) = 0$ for every $j gt.eq 0$. Applying $"Hom"_Gamma \( S \, - \)$ to the resolution gives
  $ "Ext"_Gamma^i \( S \, Gamma \) = 0 #h(2em) \( i gt.eq 0 \) . $
  The nonzero module $S$ therefore refutes the strong Nakayama conjecture and also gives the simple-Ext formulation of generalized Nakayama failure. In particular, the degree-zero vanishing is part of the conclusion, not only the positive-degree vanishings.
  Finally let $W$ be the direct sum of one representative from each isomorphism class of indecomposable projective-injective left $Gamma$-modules. There are finitely many such classes, so $W$ is finite, projective, and injective. In particular $"Ext"_Gamma^i \( W \, W \) = 0$ for $i > 0$, and every $I^j$ belongs to $"add" W$. The displayed injective resolution is therefore an infinite $"add" W$-coresolution of $Gamma$. Applying $"Hom"_Gamma \( - \, W \)$ preserves its exactness because $W$ is injective. Thus $W$ is Wakamatsu tilting and has projective dimension zero.
  If $W$ were tilting, there would be a finite exact coresolution
  $ 0 arrow.r Gamma arrow.r W^0 arrow.r dots.h.c arrow.r W^r arrow.r 0 \, #h(2em) W^j in "add" W . $
  Every $W^j$ is projective-injective. The backward splitting argument in Proposition 30 would make $Gamma$ injective, a contradiction. Hence $W$ is not tilting, which refutes the Wakamatsu tilting conjecture. ◻
]

The proof works separately over each extension $K \/ k$. It does not require a minimal injective resolution to remain minimal under scalar extension, or an indecomposable injective or simple module to remain indecomposable or simple. The construction of $Gamma_K$ is compatible with scalar extension, and the required $J \, S \, W$ are chosen over $K$.

The successive cokernels of the same injective resolution give the finitistic-dimension consequence.

#proof[
  Fix a field extension $K \/ k$ and abbreviate $Gamma_K$ to $Gamma$. Use the minimal injective resolution of the left regular module over this field,
  $ 0 arrow.r zws_Gamma Gamma arrow.r I^0 arrow.r I^1 arrow.r dots.h.c . $
  Every $I^n$ is finite-dimensional and projective-injective by Corollary 2. Set $C_0 = zws_Gamma Gamma$ and $C_n = "im" \( I^(n - 1) arrow.r I^n \)$ for $n gt.eq 1$. Exactness gives
  $ 0 arrow.r C_n arrow.r I^n arrow.r C_(n + 1) arrow.r 0 #h(2em) \( n gt.eq 0 \) . $
  Thus the $C_(n + 1)$ are successive cokernels, and all $C_n$ are finite.
  Since $C_0$ and $I^0$ are projective, the first sequence gives $"pd"_Gamma C_1 lt.eq 1$. If $C_1$ were projective, its surjection from $I^0$ would split, making $Gamma$ a direct summand of the injective module $I^0$. This would make $Gamma$ injective, contrary to $"id"_Gamma Gamma = oo$. Hence $"pd"_Gamma C_1 = 1$.
  Suppose $n gt.eq 1$ and $"pd"_Gamma C_n = n$. Splicing a length-$n$ projective resolution of $C_n$ with the displayed short exact sequence gives $"pd"_Gamma C_(n + 1) lt.eq n + 1$. For every left module $V$ and $j gt.eq 1$, projectivity of $I^n$ and the long exact Ext sequence give
  $ "Ext"_Gamma^j \( C_n \, V \) tilde.eq "Ext"_Gamma^(j + 1) \( C_(n + 1) \, V \) . $
  There is a left module $V$ with $"Ext"_Gamma^n \( C_n \, V \) eq.not 0$, since otherwise the Ext criterion for projective dimension would give $"pd"_Gamma C_n lt.eq n - 1$. Thus $"Ext"_Gamma^(n + 1) \( C_(n + 1) \, V \) eq.not 0$, proving the reverse bound and $"pd"_Gamma C_(n + 1) = n + 1$. Induction gives the asserted exact dimensions. The finite left modules $C_n$ therefore make the little left finitistic dimension infinite. The big left finitistic dimension is at least the little one, so it is infinite as well. ◻
]

The remaining applications use the established failures of the homological conjectures together with results on tilting modules and stratifying ideals.

A finite left module $P$ over a finite-dimensional algebra $Lambda$ is #emph[almost complete tilting] if it is a direct summand of a tilting module and has one fewer isomorphism class of indecomposable summands than there are isomorphism classes of simple left $Lambda$-modules. Here tilting has the ordinary finite-projective-dimension meaning recalled in Section 1. An #emph[indecomposable complement] is a finite indecomposable module $Y$ such that $P xor Y$ is tilting.

#thm([Corollary 8.2.])[
  (Infinitely many tilting complements).  #emph[For every field extension $K \/ k$, let $Gamma_K$ be the algebra in Corollary 2. There is a finite-dimensional projective almost complete tilting left $Gamma_K^(upright("op"))$-module $P_K$ with infinitely many pairwise nonisomorphic indecomposable complements.]
] <cor:tilting-complements>

#proof[
  Fix $K$ and abbreviate $Gamma_K$ to $Gamma$. By Corollary 2, $Gamma$ fails the generalized Nakayama conjecture. Buan–Solberg #cite(label("BuanSolberg1998")) Theorems 3.1 and 3.4 therefore give an injective almost complete cotilting left $Gamma$-module $U$ with infinitely many pairwise nonisomorphic indecomposable complements $X$. The exact duality $D_K = "Hom"_K \( - \, K \)$ sends finite left $Gamma$-modules to finite left $Gamma^(upright("op"))$-modules. It sends finite injective dimension to finite projective dimension, preserves self-orthogonality, and dualizes the finite cotilting resolution of the injective cogenerator into a finite tilting coresolution of the regular module. Thus $P_K = D_K U$ is projective and almost complete tilting, and $D_K X$ are its complements. Duality preserves indecomposability and distinct isomorphism classes, so there are infinitely many such complements. The witnesses are chosen separately over each extension $K \/ k$. ◻
]

The final application concerns decompositions of derived categories. For an idempotent $e$ in a finite-dimensional algebra $R$, the ideal $R e R$ is #emph[stratifying] if multiplication induces an isomorphism

$ R e ⊗_(e R e) e R arrow.r^tilde.op R e R $

and $"Tor"_i^(e R e) \( R e \, e R \) = 0$ for every $i > 0$. It then induces the standard recollement relating the unbounded derived categories of $R \/ R e R$, $R$, and $e R e$; see #cite(label("ChenFangXi2024")) Introduction. An #emph[idempotent stratification of length $n$], in the convention of #cite(label("ChenFangXi2024")) Definition 4.7, consists of nonzero mutually orthogonal idempotents $e_0 \, dots.h \, e_n$ with sum $1$ such that, on putting $f_i = e_0 + dots.h.c + e_i$, the ideal generated by $f_i$ in $f_(i + 1) R f_(i + 1)$ is stratifying and $e_(i + 1) in.not R f_i R$ for $0 lt.eq i < n$. Thus its length counts the successive nontrivial recollements obtained by passing through these corner algebras.

#thm([Corollary 8.3.])[
  (Idempotent stratifications).  #emph[For every field extension $K \/ k$ and every integer $L gt.eq 1$, there is an auxiliary finite-dimensional indecomposable symmetric $K$-algebra $T_L$ admitting an idempotent stratification of length at least $L$ in the sense of Chen, Fang and Xi. In particular, $T_L$ has a nonzero proper stratifying ideal, and $cal(D) \( T_L upright("-") upright("Mod") \)$ admits a chain of at least $L$ nontrivial standard recollements through successive corner algebras. Here $upright("Mod")$ denotes all left modules and $cal(D)$ is the unbounded derived category.]
] <cor:stratifying>

#proof[
  The base-change argument above gives a symmetric $K$-algebra $A_K$ and a nonprojective self-orthogonal module $M_K$. Choose a nonprojective indecomposable summand $N$ in one block $B$ of $A_K$. The block $B$ is indecomposable and symmetric, and $"Ext"_B^i \( N \, N \) = 0$ for every $i > 0$, since these groups are direct summands of $"Ext"_(A_K)^i \( M_K \, M_K \)$.
  Chen, Fang and Xi #cite(label("ChenFangXi2024")) proof of Theorem 5.13 construct from such a pair, over any field, reduced mirror-reflective algebras $T_n$ that are indecomposable and symmetric. Their Corollary 5.12(1), with Definition 4.7, gives an idempotent stratification of length at least $n$. Theorem 1.2(2) supplies the stated successive nontrivial standard recollements of unbounded derived categories. Taking $n = L$ proves the claim. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
