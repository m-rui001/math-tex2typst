#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The Bogomolov--Pop reconstruction theorem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 The reconstruction problem <sec:introduction>

Birational anabelian geometry asks how much of a field can be read from its Galois groups. Over algebraically closed constants, the arithmetic Galois action disappears. Bogomolov’s program proposes that a particularly small quotient still remembers every function field of dimension at least two: the quotient in which commutators are central. We prove the Isom form of this assertion, including surfaces and the prime $2$.

=== 1.1 The exact statement <the-exact-statement>

Fix a prime $ell$. A function field $F \/ kappa$ in this paper is a finitely generated extension of an algebraically closed field $kappa$. For $"char" F eq.not ell$, let $G_F^(\( ell \))$ be the maximal pro-$ell$ quotient of the absolute Galois group, and set

$ Pi_F^a = G_F^(\( ell \)) \/ \[ G_F^(\( ell \)) \, G_F^(\( ell \)) \] \, #h(2em) Pi_F^c = G_F^(\( ell \)) \/ \[ \[ G_F^(\( ell \)) \, G_F^(\( ell \)) \] \, G_F^(\( ell \)) \] . $

All commutator subgroups are closed. The kernel $Delta_F = ker \( Pi_F^c arrow.r Pi_F^a \)$ is central. Our commutator convention is $\[ x \, y \] = x^(- 1) y^(- 1) x y$. Lifting elements of $Pi_F^a$ to $Pi_F^c$ therefore defines a continuous alternating $bb(Z)_ell$-bilinear map

$ \[ med \, med \]_F : Pi_F^a times Pi_F^a arrow.r Delta_F . $

An isomorphism $phi : Pi_L^a arrow.r Pi_K^a$ is #emph[bracket-compatible] if it is a continuous $bb(Z)_ell$-module isomorphism and there is a continuous $bb(Z)_ell$-module isomorphism $psi : Delta_L arrow.r Delta_K$ such that

$ psi \( \[ sigma \, tau \]_L \) = \[ phi sigma \, phi tau \]_K quad \( sigma \, tau in Pi_L^a \) . $

Write $"Isom"^c \( Pi_L^a \, Pi_K^a \)$ for this set. The units $bb(Z)_ell^times$ act by multiplication on $phi$; the corresponding map on the central kernel can be multiplied by the square of the same unit.

Write $F^i$ for the perfect closure of $F$; in characteristic zero this is $F$ itself. Let $"Isom"^i \( K \, L \)$ consist of the field isomorphisms $alpha : K^i arrow.r L^i$ satisfying $alpha \( k \) = l$. If the common characteristic is $p > 0$, put

$ "Isom"_F^i \( K \, L \) = "Isom"^i \( K \, L \) \/ #scale(x: 120%, y: 120%)[\(] alpha tilde.op "Frob"_L^n compose alpha \, med n in bb(Z) #scale(x: 120%, y: 120%)[\)] . $

Frobenius is an automorphism of a perfect field, so negative integers are allowed. In characteristic zero take no quotient. If the characteristics differ, set $"Isom"_F^i \( K \, L \) = diameter$.

Field isomorphisms induce contravariant Galois isomorphisms. Passing to the above quotients gives the canonical map in the following theorem.

#thm([Theorem 1.1.])[
  (Bogomolov–Pop reconstruction).  #emph[Let $k$ and $l$ be arbitrary algebraically closed fields of characteristics different from $ell$, and let $K \/ k$ and $L \/ l$ be function fields with $"trdeg" \( K \/ k \) \, "trdeg" \( L \/ l \) gt.eq 2$. Then 
$ Phi_(K \, L) : "Isom"_F^i \( K \, L \) arrow.r "Isom"^c \( Pi_L^a \, Pi_K^a \) \/ bb(Z)_ell^times \, #h(2em) \[ alpha \] mapsto \[ alpha^(*) \] \, $

 is a bijection.]
] <thm:main>

Thus the theorem resolves the pro-$ell$ abelian-by-central Bogomolov–Pop reconstruction conjecture positively. Neither equality of characteristics nor equality of relative transcendence degrees is assumed. Both are forced by a bracket-compatible isomorphism. The input contains no distinguished valuations, inertia groups, or curve quotients.

=== 1.2 Previous work and the proof <previous-work-and-the-proof>

Bogomolov introduced the abelian-by-central approach to birational reconstruction #cite(label("Bogomolov1991")). The local approach detects valuations through commuting elements and their associated multiplicative characters #cite(label("BT2002")) #cite(label("TopazCL2017")). Bogomolov and Tschinkel proved the surface case over algebraic closures of finite fields #cite(label("BT2008")), followed by higher-dimensional reconstruction #cite(label("BT2011")); Pop established a corresponding birational reconstruction theorem #cite(label("PopBI2012")). The precise Isom formulation, including its scalar and Frobenius ambiguities, is recorded in #cite(label("TopazRat2016")) Introduction, Conjecture 1.

Pop’s global reconstruction theorem recovers a function field from its total decomposition graph together with suitable rational quotients #cite(label("PopGraphs2012")) #cite(label("PopBI2012")). His later reconstruction theorem with divisorial inertia applies in relative transcendence degree greater than two #cite(label("Pop2018")) Theorem 1.1; its additional inertia datum must itself be recovered to solve the conjecture from the group alone. The local theory of commuting pairs supplies quasi-divisorial valuations, which can be nontrivial on the constants #cite(label("Pop2018")) #cite(label("Topaz2019")). Pop’s minimized decomposition theory also recognizes certain residual curves over algebraic closures of finite fields, with Topaz’s appendix treating the required residue characteristic $ell$ case #cite(label("PopMin2015")).

Related reconstruction results use additional structure. Silberstein studies the full absolute Galois group under a prime-field-closure hypothesis #cite(label("Silberstein2013")). Topaz’s integral cohomological reconstruction uses a specified arithmetic Galois action in transcendence degree at least three #cite(label("Topaz2019")) Theorems A and B; his Torelli-type theorem uses mixed Hodge structures and cup products over constants embedded in $bb(C)$ #cite(label("TopazTorelli2025")). These results concern different input data. Here only the original pro-$ell$ abelian-by-central datum is supplied, and neither the constant field nor geometric inertia is distinguished in advance.

Our task is to recover the missing geometric information uniformly over the constants. Write $hat(F) = "proj lim"_e F^times \/ F^(times ell^e)$ for the completed multiplicative group and $\[ f \]$ for the class of a nonzero function. Choose Kummer identifications, and dualize a bracket-compatible isomorphism to an isomorphism $Theta : hat(K) arrow.r hat(L)$ of completed multiplicative groups. The central step proves that, for fixed $t in K \\ k$, the entire pencil

$ h_a = Theta \[ t - a \] \, #h(2em) a in k \, $

has uniformly bounded divisor-support degree on a fixed projective model of $L$. This is stronger than finiteness of each individual support.

Bogomolov–Tschinkel already used bounded-genus curves and Hurwitz estimates to prove finiteness of $ell$-adic supports #cite(label("BT2011")) Section 6, proof of Proposition 6.1. Here the bound is uniform over a whole pencil and is obtained by finite tests over arbitrary constants. A finite list of Kummer classes is specialized and restricted to a smooth residual curve of bounded genus, preserving all relations at the chosen finite level and the relevant divisor supports. Five fixed members of the pencil then bound the degree of a separable map to the projective line by Riemann–Hurwitz. The bound also controls every additional member, at every sufficiently high $ell$-power level. The use of five anchors works for $ell = 2$.

The pencil detects infinitely many prime divisors, and the uniform degree bound places them in a family of finite type. Their incidence with the model produces a curve subfield after a finite field extension. A normal-base-change argument allows us to use one parameter curve for every Kummer class and every exponent; no uncountability assumption enters. Norms and the finite-rank intersection of distinct completed curve fields descend this subfield to $L$. Applying the same argument to $Theta^(- 1)$ gives a bijection of the completed relatively algebraically closed curve subfields.

These subfields distinguish true divisorial valuations from those that also value the constants. They also recover point inertia and genus, and hence all relatively algebraically closed rational subfields. Their quotient diagrams supply exactly the input to Pop’s global reconstruction theorem. The new geometric steps are the uniform pencil bound and the incidence argument that recovers curve subfields; the remaining steps use the local valuation theory and Pop’s reconstruction theorem described above.

The proof follows this order. Section 2 fixes the Kummer topology and the relation between the two formulations of the group input. Section 3 supplies the local correspondence. Sections Section 4 and 5 prove the residual test and uniform support bound. Section 6 recovers curve subfields and rational quotients. Section 7 checks compatibility on the decomposition graphs before applying Pop’s theorem and completing the Isom statement and its ambiguity checks.

== 2 Kummer duality and the group input <sec:preliminaries>

We first give the topological form of Kummer duality needed for selected subfields and residue fields. In this section the residue characteristic is allowed to equal $ell$ unless explicitly excluded.

For a function field $F \/ kappa$ over algebraically closed constants, put

$ W_F = "Hom" \( F^times \, bb(Z)_ell \) \, #h(2em) hat(F) = "proj lim"_(e gt.eq 1) F^times \/ F^(times ell^e) . $

Equip $W_F$ with pointwise convergence and $hat(F)$ with its $ell$-adic topology. We use additive notation for these modules and write $\[ f \]$ for the class of $f in F^times$. In particular $\[ f g \] = \[ f \] + \[ g \]$. All characters vanish on $kappa^times$. We abbreviate $F^times \/ F^(times q)$ to $F^times \/ q$. An annihilator $B^perp$ of $B subset F^times$ or $B subset hat(F)$ is taken in $W_F$; for $B subset W_F$ it is taken in $hat(F)$, using evaluation.

#thm([Lemma 2.1.])[
  (Continuous evaluation).  #emph[The group $F^times \/ kappa^times$ is free abelian. Consequently $W_F$ is a product of copies of $bb(Z)_ell$, and evaluation gives 
$ hat(F) = "Hom"_(upright(c o n t)) \( W_F \, bb(Z)_ell \) \, #h(2em) hat(F) \/ ell^e hat(F) = F^times \/ F^(times ell^e) . $

 The module $hat(F)$ is torsion free, and evaluations on $W_F$ detect every finite-level class.]
] <prelim:duality>

#proof[
  Choose a normal integral projective model of $F \/ kappa$. A rational function with zero Weil divisor on this model is a global unit and hence a constant. Thus the divisor map embeds $F^times \/ kappa^times$ in the free abelian group of prime divisors; a subgroup of a free abelian group is free.
  For a basis indexed by a set $J$, the character group is $bb(Z)_ell^J$. Modulo $ell^e$, a continuous character on this compact product depends on finitely many coordinates. Compatible such characters are therefore families $\( c_j \)_(j in J)$ in $bb(Z)_ell$ with only finitely many $c_j in.not ell^e bb(Z)_ell$ for each $e$. This is exactly the completion of $xor.big_(j in J) bb(Z)$. Reduction modulo $ell^e$ and coordinate evaluations prove the assertions. Divisibility of $kappa^times$ removes the constants at every level. ◻
]

When $"char" F eq.not ell$, a choice of a compatible system of $ell$-power roots of unity identifies the Tate module $bb(Z)_ell \( 1 \)$ with $bb(Z)_ell$. Kummer theory then identifies $Pi_F^a$ with $W_F$. An isomorphism $phi : Pi_L^a arrow.r Pi_K^a$ has evaluation dual

$ "(1)" quad Theta : hat(K) arrow.r hat(L) \, #h(2em) Theta \( h \) \( sigma \) = h \( phi sigma \) . $ <eq:theta>

Changing the Tate identifications multiplies this map by one unit. We fix the identifications for the proof.

#thm([Lemma 2.2.])[
  (Subfields and finite extensions).  #emph[Let $E subset F$ be function fields over the same algebraically closed field $kappa$.]
  + #emph[If $E$ is relatively algebraically closed in $F$, then $hat(E) arrow.r hat(F)$ is injective, its image is closed and $ell$-saturated, and restriction $W_F arrow.r W_E$ is a continuous surjection. Here $ell$-saturated means that $ell h in hat(E)$ for $h in hat(F)$ implies $h in hat(E)$.]
  + #emph[If $F \/ E$ is finite, its completion map is injective, and inclusion followed by norm on completions is multiplication by $\[ F : E \]$.]
] <prelim:completion>

#proof[
  In the first case, a root in $F$ of an element of $E$ is algebraic over $E$, so injectivity holds at every finite level. Alternatively, on a normal integral projective $E$-model of $F$, the divisor map embeds $F^times \/ E^times$ into a free abelian group: its kernel consists of global units, which are algebraic over $E$ and therefore lie in $E$. Thus $F^times \/ E^times$ is free abelian, and
  $ 0 arrow.r E^times \/ kappa^times arrow.r F^times \/ kappa^times arrow.r F^times \/ E^times arrow.r 0 $
  splits as a sequence of abelian groups. Completion preserves this splitting. The two completed free factors are torsion free, proving closedness and saturation. Every character on $E^times$ extends along the splitting, proving the asserted surjection; continuity follows from the pointwise topologies.
  For a finite extension, the field norm is defined also in the inseparable case and sends an element of $E$ to its $\[ F : E \]$-th power. It induces the stated composite on completions. Torsion freeness from Lemma 2 proves injectivity. ◻
]

The next observation lets us apply Pop’s reconstruction theorems to the stated group input.

#thm([Lemma 2.3.])[
  (Lifting bracket-compatible isomorphisms).  #emph[Every bracket-compatible isomorphism in Theorem 1 is the abelianization of a continuous isomorphism $Pi_L^c arrow.r Pi_K^c$. This holds also for $ell = 2$.]
] <prelim:central-lift>

#proof[
  Use the given maps to identify the bases of the two central extensions with one abelian pro-$ell$ group $A$ and their kernels with one group $B$. Let $E_1 \, E_2$ denote these extensions. In the fiber product $P = E_1 times_A E_2$, quotient by the diagonal central subgroup ${ \( b \, b \) : b in B }$. The resulting group $Q$ is abelian: the commutator of two pairs has identical components by bracket compatibility. It fits into an exact sequence of abelian pro-$ell$ groups
  $ 0 arrow.r B arrow.r Q arrow.r A arrow.r 0 . $
  By Lemma 2, $A$ is a product of copies of $bb(Z)_ell$. Such products are projective in the category of abelian pro-$ell$ groups. Indeed Pontryagin duality changes $A$ into a direct sum of copies of $bb(Q)_ell \/ bb(Z)_ell$, a divisible, hence injective, discrete torsion group. Consequently $Q arrow.r A$ has a continuous section.
  The inverse image of this section in $P$ maps isomorphically to each $E_i$. For fixed first component, the second component can be adjusted by a unique element of $B$ to land over the section; its uniqueness also proves that each projection has trivial kernel. These are continuous bijections between compact Hausdorff groups, hence isomorphisms. The resulting map $E_1 arrow.r E_2$ induces the prescribed base and kernel maps. The proof uses no division by $2$ and leaves no additional power datum to specify. ◻
]

=== 2.1 Orders on a curve <orders-on-a-curve>

For a smooth projective integral curve $C \/ kappa$ with function field $E$, its closed points are $kappa$-rational. Each normalized order $"ord"_P : E^times arrow.r bb(Z)$ extends to $hat(E) arrow.r bb(Z)_ell$.

#thm([Lemma 2.4.])[
  (Curve kernels).  #emph[If $"char" kappa eq.not ell$, then 
$ ker (E^times \/ E^(times ell) arrow.r^(\( "ord"_P \)_P) xor.big_(P in C) bb(Z) \/ ell) tilde.eq "Pic" \( C \) \[ ell \] . $

 Its dimension over $bb(F)_ell$ is $2 g \( C \)$. The kernel of all exact point orders on $hat(E)$ is the Tate module $T_ell "Pic" \( C \)$ and has $bb(Z)_ell$-rank $2 g \( C \)$.]
] <prelim:curve-kernel>

#proof[
  The same argument works with $q = ell^e$. If $"div" \( f \) = q D$, send $\[ f \]$ to the divisor class of $D$. Changing $f$ by a $q$-th power does not change this class. Every $q$-torsion divisor class occurs. The kernel consists of functions $c u^q$; the constant $c in kappa^times$ is a $q$-th power. This proves the finite-level identification. The $q$-torsion of the Jacobian over an algebraically closed field of characteristic prime to $q$ is $\( bb(Z) \/ q \)^(2 g \( C \))$ #cite(label("Stacks")) Tag 0C1Z, Lemma 53.17.1. Under reduction from $ell^(e + 1)$ to $ell^e$, the divisor class is multiplied by $ell$. Taking the inverse limit gives the exact-order kernel and its rank. ◻
]

In particular, an isomorphism of the $W$-groups carrying the family of point inertia lines bijectively onto the corresponding family preserves the genus. A generator of each line can change by a unit; this changes neither vanishing nor nonvanishing of any finite-level order. We will use this observation only after proving that the residue characteristics differ from $ell$.

== 3 Recovering the local data <local:section>

The commutator detects a relation between multiplicative characters. That relation recovers quasi-prime divisors, including those that value constants nontrivially. At this stage their residue fields may have characteristic $ell$. We therefore work with character groups throughout and use a Galois interpretation only at the top field. For the commuting-pair approach to valuation detection and its development via rigid elements, see #cite(label("Bogomolov1991")) #cite(label("BT2002")) #cite(label("TopazCL2017")). We use the character-space formulation below to include the required residue fields.

=== 3.1 Commutators and alternating characters <commutators-and-alternating-characters>

For any field $F$, put

$ cal(G)_F = W_F ⊗_(bb(Z)_ell) bb(Q)_ell . $

A pair $f \, g in cal(G)_F$ is #emph[alternating] if

$ "(2)" quad f \( x \) g \( 1 - x \) = f \( 1 - x \) g \( x \) #h(2em) \( x in F \\ { 0 \, 1 } \) . $ <local:alternating>

A subspace is alternating if each pair of its elements is alternating. Every character in $cal(G)_F$ kills $- 1$.

#thm([Lemma 3.1.])[
  #emph[Let $F \/ kappa$ be a function field over an algebraically closed field of characteristic different from $ell$. Under Kummer duality $W_F = Pi_F^a$, two elements of $W_F$ are alternating if and only if their commutator in $Delta_F$ is zero. This assertion holds also for $ell = 2$.]
] <local:commuting>

#proof[
  We give the finite-coefficient argument, keeping track of the infinite rank of $W_F$. Write $G = G_F^(\( ell \))$, $A = G^(upright(a b))$ and $R = bb(Z) \/ ell^e$, with trivial action. Kummer duality makes $A$ a product of copies of $bb(Z)_ell$.
  First, a class in $H_(upright(c o n t))^2 \( A \, R \)$ is determined by its commutator form. Indeed, a class with zero commutator defines an abelian extension of $A$ by $R$. Such an extension splits continuously: the Pontryagin dual of $A$ is a direct sum of copies of $bb(Q)_ell \/ bb(Z)_ell$, hence is divisible and injective. Conversely every continuous alternating bilinear form $A times A arrow.r R$ is the commutator form of a cup-product class. To see this, continuity and compactness give an open subgroup in the radical of the form, so it depends on finitely many coordinates. In coordinate characters $x_i$ it is a sum of the forms
  $ x_i \( a \) x_j \( b \) - x_j \( a \) x_i \( b \) \, #h(2em) i < j \, $
  which come from the cocycles $x_i union x_j$. Consequently cup products generate $H_(upright(c o n t))^2 \( A \, R \)$. This proof uses no division by $2$. In particular, even when $ell = 2$, a diagonal cup has zero commutator and therefore vanishes. No extra power or Bockstein class survives on the torsion-free group $A$.
  Next, inflation
  $ H_(upright(c o n t))^2 \( G \, R \) arrow.r H^2 \( G_F \, R \) $
  is injective. Let $F \( ell \)$ be the maximal Galois pro-$ell$ extension of $F$. An element of $F \( ell \)^times$ lies in a finite Galois $ell$-extension $F' \/ F$. Adjoin to $F'$ the $ell^e$-th roots of all its $F$-conjugates. Since the roots of unity lie in $F$, the resulting field is again a finite Galois $ell$-extension of $F$. Thus $F \( ell \)^times$ is $ell^e$-divisible. Kummer theory gives $H^1 \( G_(F \( ell \)) \, R \) = 0$, and the five-term sequence proves the claimed injectivity.
  Fix compatible identifications of the roots of unity with the coefficient groups. The degree-two norm-residue theorem #cite(label("MS1982")) identifies the kernel of the tensor cup map
  $ \( F^times \/ F^(times ell^e) \) ⊗_R \( F^times \/ F^(times ell^e) \) arrow.r H^2 \( G_F \, R \) $
  with the subgroup generated by the Steinberg tensors $\[ x \] ⊗ \[ 1 - x \]$. Since the tensor cup map onto $H_(upright(c o n t))^2 \( A \, R \)$ is surjective, the kernel of inflation from $A$ to $G$ is generated by the Steinberg cups $\[ x \] union \[ 1 - x \]$.
  Finally, put $N = \[ G \, G \]$. The five-term sequence for $N subset G$ identifies this same kernel with
  $ "Hom"_(upright(c o n t)) \( N \/ \[ N \, G \] \, R \) = "Hom"_(upright(c o n t)) \( Delta_F \, R \) . $
  The commutator form of the transgression of a character $chi$ is $chi \( \[ med \, med \]_F \)$, up to the uniform sign determined by the transgression convention. Its value at $f \, g$ therefore vanishes for all $chi$ precisely when
  $ f \( x \) g \( 1 - x \) - f \( 1 - x \) g \( x \) = 0 med \( mod med ell^e \) $
  for every $x eq.not 0 \, 1$. Continuous characters to finite cyclic $ell$-groups separate points of $Delta_F$. Letting $e$ vary proves the assertion. ◻
]

It follows that a bracket-compatible isomorphism preserves alternating pairs on $W_F$, and hence on $cal(G)_F$: multiply rationalized characters by powers of $ell$ and use (2). The latter relation makes sense on residue fields of every characteristic, without invoking their Galois groups.

=== 3.2 Character groups of valuations <character-groups-of-valuations>

We regard equivalent valuations as the same valuation. Write $v lt.eq w$ if $v$ is a coarsening of $w$. For a valuation $v$ of $F$, let $cal(O)_v$, $frak(m)_v$, $F v$ and $v F$ denote its valuation ring, maximal ideal, residue field and value group. Set

$ U_v = cal(O)_v^times \, #h(2em) U_v^1 = 1 + frak(m)_v \, #h(2em) I_v = U_v^perp subset D_v = \( U_v^1 \)^perp subset W_F \, $

and write $cal(I)_v = I_v ⊗ bb(Q)_ell$ and $cal(D)_v = D_v ⊗ bb(Q)_ell$. These are the #emph[minimized] inertia and decomposition groups. When both $F$ and $F v$ have characteristic different from $ell$, they agree with the usual abelian inertia and decomposition groups. Their definitions above impose no characteristic restriction.

A subset of $cal(G)_F$ is #emph[valuative] if it is contained in $cal(I)_v$ for some valuation $v$. We use the following local character theorem #cite(label("Topaz2019")) Fact 2.1, Lemma 2.5 and Corollary 2.7:

+ Every valuative subset $Sigma$ has a unique coarsest valuation $v_Sigma$ with $Sigma subset cal(I)_(v_Sigma)$. It coarsens every valuation with this property.
+ In an alternating subspace $S$, the valuative elements form a valuative subspace $Sigma$ of codimension at most one, and $S subset cal(D)_(v_Sigma)$.
+ If $Sigma$ is valuative and a character $f$ alternates with every member of $Sigma$, then $f in cal(D)_(v_Sigma)$.

These statements use $"Hom" \( F^times \, bb(Z)_ell \) ⊗ bb(Q)_ell$ and hold for arbitrary fields $F$. The condition on the value at $- 1$ in the local character theorem is automatic here. This is the form needed below when $"char" \( F v \) = ell$.

Let now $F \/ kappa$ be a function field over an algebraically closed field, of transcendence degree $s$. A #emph[quasi-prime divisor] is a valuation minimal among those satisfying

$ v F \/ v kappa tilde.equiv bb(Z) \, #h(2em) "trdeg" \( F v \/ kappa v \) = s - 1 . $

A quasi-prime $r$-divisor is a composition of $r$ successive quasi-prime divisors of the successive residue function fields. It satisfies

$ "(3)" quad v F \/ v kappa tilde.equiv bb(Z)^r \, #h(2em) "trdeg" \( F v \/ kappa v \) = s - r . $ <local:rank>

The residue constants $kappa v$ are algebraically closed.

We recall the finite-generation point implicit in (3). The valuation transcendence-degree inequality is

$ "(4)" quad "rrank" \( v F \/ v kappa \) + "trdeg" \( F v \/ kappa v \) lt.eq s \, $ <local:abhyankar>

where $"rrank"$ is dimension after tensoring with $bb(Q)$. At equality, choose relative value-independent elements and elements with algebraically independent residues. Together they form a transcendence basis, and $F$ is finite over the resulting rational field. The finite-extension valuation inequality then shows that the relative value group is finitely generated and the residue extension is finitely generated. Since $v kappa$ is divisible, $v F \/ v kappa$ is torsion free, hence is a finitely generated free abelian group. Applying this argument successively gives (3).

#thm([Lemma 3.2.])[
  #emph[For a quasi-prime $r$-divisor $v$ of $F \/ kappa$, restriction to units induces a canonical topological isomorphism 
$ D_v \/ I_v tilde.equiv W_(F v) . $

 If $f \, g in cal(D)_v$, they are alternating if and only if their residual characters in $cal(G)_(F v)$ are alternating.]
] <local:residue>

#proof[
  There is an exact sequence of abelian groups
  $ 0 arrow.r \( F v \)^times \/ \( kappa v \)^times arrow.r F^times \/ \( kappa^times U_v^1 \) arrow.r v F \/ v kappa arrow.r 0 . $
  Its final term is free, so applying $"Hom" \( - \, bb(Z)_ell \)$ gives a surjection $D_v arrow.r W_(F v)$ with kernel $I_v$. This map is continuous for pointwise convergence; compactness makes the induced bijection on the quotient a topological isomorphism.
  For the second assertion, use (2). If $v \( x \) > 0$, then $1 - x$ is a principal unit. If $v \( x \) < 0$, the identity $1 - x = - x \( 1 - x^(- 1) \)$ makes the characters of $1 - x$ equal those of $x$. If $v \( x \) = 0$ and $v \( 1 - x \) > 0$, then $x$ is a principal unit. In each case the alternating determinant is zero. In the remaining case $x$ and $1 - x$ are units with residues different from $0 \, 1$, and the determinant is exactly the residual determinant. Conversely every residual element different from $0 \, 1$ has such a lift. ◻
]

In particular, a unit representing a class modulo $ell^e$ evaluates on $D_v \/ I_v$ exactly as its residue does on $W_(F v)$. This observation will allow finite Kummer tests to pass through a valuation.

=== 3.3 An intrinsic description of quasi-prime divisors <an-intrinsic-description-of-quasi-prime-divisors>

The next argument follows the character-space proof of #cite(label("Topaz2019")) Fact 3.2 and Theorem 3.3. We include it because we need it also in residue characteristic $ell$, whereas that section of the cited paper is stated in a cohomological setting with characteristic different from $ell$.

#thm([Lemma 3.3.])[
  #emph[For $F \/ kappa$ as above, in any characteristic, $s$ is the maximum dimension of an alternating subspace of $cal(G)_F$. If $S$ has dimension $s$, its valuative subspace is $cal(I)_u$ for its associated valuation $u$, and $u$ attains equality in (4).]
] <local:dimension>

#proof[
  For every valuation $u$, characters kill the divisible constant group, so
  $ dim_(bb(Q)_ell) cal(I)_u lt.eq "rrank" \( u F \/ u kappa \) . $
  Let $S$ be alternating and let $Sigma$ be its valuative subspace, with associated valuation $u$. If $S = Sigma$, the asserted dimension bound follows from (4). Otherwise $Sigma$ has codimension one in $S$. A character in $S \\ Sigma subset cal(D)_u$ has nonzero residual character. Thus $F u eq.not kappa u$, and $"trdeg" \( F u \/ kappa u \) gt.eq 1$. Consequently
  $ dim S lt.eq "rrank" \( u F \/ u kappa \) + 1 lt.eq s . $
  This also bounds arbitrary alternating subspaces, by applying the argument to their finite-dimensional subspaces.
  There is a full discrete flag at a smooth closed point on a model of $F \/ kappa$. Its inertia space has dimension $s$ and is alternating by the valuation inequality for $x$ and $1 - x$. Thus the maximum equals $s$.
  If $dim S = s$ and $S = Sigma$, all inequalities
  $ s lt.eq dim cal(I)_u lt.eq "rrank" \( u F \/ u kappa \) lt.eq s $
  are equalities. If $S eq.not Sigma$, all inequalities
  $ s - 1 lt.eq dim cal(I)_u lt.eq "rrank" \( u F \/ u kappa \) lt.eq s - "trdeg" \( F u \/ kappa u \) lt.eq s - 1 $
  are equalities. In both cases $Sigma = cal(I)_u$ and $u$ has no transcendence defect. ◻
]

#thm([Lemma 3.4.])[
  #emph[Assume $s gt.eq 2$. A line $H subset cal(G)_F$ is the inertia space of a quasi-prime divisor if and only if there are two $s$-dimensional alternating subspaces $S_1 \, S_2$ with $S_1 ∩ S_2 = H$. The valuation is unique. If $0 eq.not h in H$, its decomposition space is 
$ cal(D)_v = { f in cal(G)_F : \( h \, f \) upright(" is alternating") } . $

]
] <local:quasiprime>

#proof[
  Suppose first that $v$ is quasi-prime. The residue function field $F v \/ kappa v$ has two independent discrete valuations of full rank $s - 1$, trivial on the constants. For example, choose two independent prime divisors on a rational subfield on a transcendence basis, complete each to a flag, and prolong the flags to the finite extension $F v$. Independent valuation approximation #cite(label("ADF2020")) Theorem 1.2 makes their inertia spaces disjoint. Composing with $v$ gives two alternating inertia spaces of dimension $s$ whose intersection is $cal(I)_v$.
  Conversely, let $S_1 \, S_2$ be as stated. By Lemma 8, their valuative parts are $Sigma_i = cal(I)_(u_i)$, where each $u_i$ has no transcendence defect and $dim Sigma_i gt.eq s - 1$. We first show that $H$ is valuative. If, say, $u_1 lt.eq u_2$, then
  $ Sigma_1 subset Sigma_2 \, #h(2em) Sigma_1 subset S_1 ∩ S_2 = H . $
  Since $dim Sigma_1 gt.eq 1$, this proves the claim. If the valuations are incomparable, let $w$ be their finest common coarsening. Applying independent valuation approximation on $F w$ shows that the principal-unit groups of $u_1$ and $u_2$ generate $U_w$. Indeed, approximate a unit $a$ by $b$ for the first residual valuation and approximate $1$ by $b$ for the second. Then $a = \( a \/ b \) b$ is a product of the two required principal units. A character in $H$ annihilates both principal-unit groups, and hence belongs to $cal(I)_w$. Again $H$ is valuative. In either case,
  $ H = Sigma_1 ∩ Sigma_2 . $
  Let $v = v_H$ be its coarsest associated valuation. It coarsens both $u_i$, and
  $ H subset cal(I)_v subset cal(I)_(u_1) ∩ cal(I)_(u_2) = H . $
  A coarsening of a valuation without transcendence defect also has no transcendence defect: relative rational ranks add under composition, and the two valuation inequalities sum to the equality for the finer valuation. Thus $v$ has no transcendence defect. Its relative value group is finitely generated free, and its rank is $dim cal(I)_v = 1$. Hence $v F \/ v kappa tilde.equiv bb(Z)$. A coarsening with the same relative rank would have the same inertia space, contradicting the defining minimality of $v_H$. Therefore $v$ is quasi-prime, and the coarsest-valuation description also proves uniqueness.
  Every member of $cal(D)_v$ alternates with $h$, by the calculation in Lemma 7. For the converse apply the third part of the local character theorem to the valuative line $H$. ◻
]

The integral groups are recovered without an index ambiguity:

$ I_v = cal(I)_v ∩ W_F \, #h(2em) D_v = cal(D)_v ∩ W_F . $

Indeed these are annihilators with values in the torsion-free group $bb(Z)_ell$. In particular they are saturated submodules.

#thm([Proposition 3.5.])[
  #emph[Let $K \/ k$ and $L \/ l$ be function fields over algebraically closed fields of characteristic different from $ell$, each of transcendence degree at least two. Let $phi : W_L arrow.r W_K$ be a continuous bracket-compatible $bb(Z)_ell$-module isomorphism. Then their transcendence degrees agree, say they are $d$. For every $1 lt.eq r < d$, the map $phi$ carries exactly the pairs $I_w subset D_w$ of quasi-prime $r$-divisors of $L \/ l$ onto the corresponding pairs of $K \/ k$. For matched pairs it induces a continuous isomorphism 
$ D_w \/ I_w tilde.equiv W_(L w) med arrow.r med D_v \/ I_v tilde.equiv W_(K v) $

 that preserves alternating pairs.]
] <local:transport>

#proof[
  Lemma 6 makes the alternating relation intrinsic to the bracket. Lemma 8 then recovers $d$, and Lemma 9 recovers the rationalized rank-one pairs. Intersecting with the integral modules recovers the exact pairs. Lemma 7 supplies the residual character spaces and their alternating relation. If $u$ is a valuation of $F v$, the inverse images of $I_u$ and $D_u$ under $D_v arrow.r W_(F v)$ are $I_(u compose v)$ and $D_(u compose v)$, respectively, directly from the unit and principal-unit definitions. Apply the same characteristic-free recognition argument to each residue function field. Continuing while its transcendence degree is at least two recovers precisely the successive quasi-prime divisors through rank $d - 1$. The construction applies to $phi^(- 1)$ as well. ◻
]

=== 3.4 Recognizing the finite-constant residual curves <recognizing-the-finite-constant-residual-curves>

The remaining local input recognizes certain residual curves and all their point inertia groups. It does not yet distinguish true divisors from quasi-prime divisors on the original function field.

We first describe the topological test. A compact abelian pro-$ell$ group $G$ with a family $\( T_i \)$ of procyclic subgroups is #emph[complete-curve-like] if one can choose generators $tau_i$ so that $tau_i$ tends to zero outside finite subsets, the resulting map

$ product_i bb(Z)_ell arrow.r G \, #h(2em) \( a_i \) mapsto sum_i a_i tau_i $

has kernel the diagonal copy of $bb(Z)_ell$, and its cokernel is a finitely generated $bb(Z)_ell$-module. The diagonal kernel expresses the single relation among the point inertias of a complete curve. This property is invariant under continuous module isomorphisms.

For this criterion, let $F \/ kappa$ be a function field over an algebraically closed field of characteristic different from $ell$; its residue fields may still have characteristic $ell$. Form the closed subset

$ cal(I)_F = overline(union.big_(u upright(" quasi-prime")) I_u) subset W_F . $

This is the closure of a #emph[union], not the closed subgroup generated by that union. For a quasi-prime $\( s - 1 \)$-divisor $v$, let

$ "(5)" quad cal(R)_v = "im" #scale(x: 120%, y: 120%)[\(] cal(I)_F ∩ D_v arrow.r D_v \/ I_v #scale(x: 120%, y: 120%)[\)] \, $ <local:residual-set>

and consider all maximal procyclic subgroups of $D_v \/ I_v$ contained in $cal(R)_v$.

Pop’s residual-curve criterion #cite(label("PopMin2015")) Section 4, Theorem 4.2(i)(a) applies when

+ $v F$ has no nonzero $ell$-divisible convex subgroup;
+ there is a subfield $kappa_1 subset F$ with $kappa_1 v = kappa v$ and $"trdeg" \( F \/ kappa_1 \) = "trdeg" \( F v \/ kappa_1 v \) = 1$.

It states that the group with the family just described is complete-curve-like exactly when $kappa v$ is an algebraic closure of a finite field. In that case the family is precisely all point inertia subgroups of the smooth projective curve with function field $F v$. The criterion allows $"char" \( F v \) = ell$; this is the purpose of the minimized groups and of Topaz’s Appendix to #cite(label("PopMin2015")).

#thm([Lemma 3.6.])[
  #emph[Every quasi-prime $\( s - 1 \)$-divisor $v$ of $F \/ kappa$ satisfies the two hypotheses of the residual-curve criterion.]
] <local:criterion-hypotheses>

#proof[
  For a quasi-prime divisor $u$, an $ell$-divisible convex subgroup $H subset u F$ has zero image in $u F \/ u kappa tilde.equiv bb(Z)$. Thus $H subset u kappa$. Coarsening by $H$ preserves the relative rank one. Since $u$ attains equality in the valuation inequality, its coarsening does also, so its residual transcendence degree is still $s - 1$. Minimality forces $H = 0$.
  Now consider a composite quasi-prime divisor. The value group of its last residual step is a nonzero convex subgroup $Gamma$ of the full value group and has the rank-one property just proved. If $H$ were a nonzero $ell$-divisible convex subgroup of the full group, convexity would make $H ∩ Gamma$ $ell$-divisible: an $ell$-th part of a positive element remains between zero and that element. Convex subgroups are comparable, so $H ∩ Gamma$ is nonzero. This contradicts the rank-one case.
  For the second hypothesis choose $x_1 \, dots.h \, x_(s - 1)$ whose values are rationally independent modulo $v kappa$, and put $kappa_1 = kappa \( x_1 \, dots.h \, x_(s - 1) \)$. Relative value independence implies algebraic independence. In a polynomial in the $x_i$, distinct monomials have different values modulo $v kappa$, and there is a unique term of least value. A quotient of polynomials with value zero consequently has residue in $kappa v$: equality of the two least values forces the same monomial, leaving a quotient of constants. It follows that $kappa_1 v = kappa v$. The two asserted transcendence degrees are then one by (3). ◻
]

#thm([Proposition 3.7.])[
  #emph[In the setting of Proposition 10, let $w$ and $v$ be matched quasi-prime $\( d - 1 \)$-divisors. Then $l w$ is algebraic over a finite field if and only if $k v$ is. When this holds, the induced isomorphism $W_(L w) arrow.r W_(K v)$ carries the full family of point inertia subgroups of the respective smooth projective curves onto each other. Corresponding normalized order characters differ by units of $bb(Z)_ell$.]
] <local:curves>

#proof[
  Proposition 10 recovers every group used in (5). A continuous isomorphism preserves the closure of the union, its intersection with decomposition, its quotient image and the maximal procyclic subgroups in that image. Lemma 11 verifies the hypotheses of Pop’s criterion on both sides. The complete-curve-like property therefore holds simultaneously, and the criterion identifies the entire point families when it does. The resulting isomorphism identifies each full procyclic subgroup with its counterpart, so it sends a generator to a generator, differing only by a $bb(Z)_ell$-unit. ◻
]

Only after separately excluding residue characteristic $ell$ will we use these point lines to compare genera. For the present purpose, Proposition 12 provides exact point-order vanishing at every finite level, with no assumption on the cardinality or transcendence degree of the original constant fields.

== 4 Finite tests on residual curves <sec:residual-tests>

We next construct residual curves that retain any prescribed finite collection of Kummer relations. The curve can depend on the functions and on the exponent. Its genus, however, is bounded in terms of one fixed projective model. This distinction will make the pencil estimate uniform.

Fix a normal integral projective model $X subset bb(P)_l^N$ of $L \/ l$, and put $d = "trdeg" \( L \/ l \) gt.eq 2$. For a prime divisor $D$ on $X$, let $deg D$ denote its degree in this embedding. For an integer $m gt.eq 2$ and $g in L^times$, set

$ s_m \( g \) = sum_(D subset X upright(" prime divisor")\
"ord"_D \( g \) equiv.not 0 med \( mod med m \)) deg D . $

This is a finite sum.

#thm([Lemma 4.1.])[
  (Finite residual tests).  #emph[There is an integer $G_X gt.eq 0$, depending only on the embedded variety $X$, with the following property. Given $g_1 \, dots.h \, g_r in L^times$ and $q = ell^e$, $e gt.eq 1$, there is a quasi-prime $\( d - 1 \)$-divisor $w$ of $L \/ l$ such that:]
  + #emph[$l w$ is an algebraic closure of a finite field of characteristic different from $ell$, and $L w = l w \( C \)$ for a smooth projective integral curve $C \/ l w$ with $g \( C \) lt.eq G_X$;]
  + #emph[$w \( g_j \) = 0$ for every $j$, and, for every $\( n_1 \, dots.h \, n_r \) in \( bb(Z) \/ q \)^r$, 
$ product_j g_j^(n_j) in L^(times q) quad arrow.l.r.double quad product_j overline(g)_j^(n_j) in \( L w \)^(times q) \; $

]
  + #emph[for $m = ell$ and $m = q$, 
$ "(6)" quad \# { P in C \( l w \) : "ord"_P \( overline(g)_j \) equiv.not 0 med \( mod med m \) } = s_m \( g_j \) #h(2em) \( 1 lt.eq j lt.eq r \) . $ <tests:support>

]
  #emph[Here $overline(g)_j$ is the residue of $g_j$ at $w$.]
] <tests:residual>

We use the following form of Bertini irreducibility. Its hypotheses include the finite covering maps that occur below.

#thm([Lemma 4.2.])[
  (Hyperplane sections of a quasi-finite map).  #emph[Let $V$ be an integral variety over an algebraically closed field, and let $f : V arrow.r bb(P)^N$ be quasi-finite, with $dim V = a gt.eq 2$. For a general hyperplane $H$, the inverse image $f^(- 1) \( H \)$ is geometrically irreducible. If $f$ factors as a finite étale map to a smooth locally closed subvariety $U subset bb(P)^N$, this inverse image is also smooth for a general $H$.]
] <tests:bertini>

#proof[
  We recall the incidence argument for irreducibility; see also #cite(label("Stacks")) Lemma 37.32.3, Tag 0G4F. Write $B = \( bb(P)^N \)^(*)$ and
  $ I = { \( x \, H \) in V times B : f \( x \) in H } . $
  The projection to $V$ is a projective bundle, so $I$ is integral. In $I times_B I$, the open set lying over pairs $\( x \, y \)$ with $f \( x \) eq.not f \( y \)$ is a projective bundle with fiber $bb(P)^(N - 2)$ over an irreducible open subset of $V times V$. It is therefore irreducible of dimension $2 a + N - 2$. The locus of pairs with $f \( x \) = f \( y \)$ has dimension at most $a$, since $f$ is quasi-finite; the incidence above it has dimension at most $a + N - 1$. This is strictly smaller than $2 a + N - 2$.
  Every component of the generic hyperplane section has dimension $a - 1$: a hyperplane cuts a nonzero nonunit in an integral variety of finite type over a field. Consequently every component of its square has dimension $2 a - 2$. The equal-image locus cannot supply a component of this generic square. The generic square is thus irreducible. Equivalently, the function field of $B$ is separably algebraically closed in that of $I$, so the generic hyperplane section is geometrically irreducible. Geometric irreducibility spreads to a nonempty open of $B$ #cite(label("Stacks")) Lemma 37.27.5, Tag 0559. Finally, a general hyperplane section of the smooth embedded variety $U$ is smooth by Bertini, and its étale inverse image is smooth. ◻
]

#proof[
  #emph[Spread the finite data.] Let $D_1 \, dots.h \, D_s$ be the prime divisors occurring in the divisors of the $g_j$. There is a closed subset $B_X subset X$ of codimension at least two such that $X \\ B_X$ is smooth, the $D_i \\ B_X$ are smooth pairwise disjoint Cartier divisors, and, near each of them, every $g_j$ is a power of a local equation times a unit. Off their union the $g_j$ are units. These assertions follow by deleting the singular loci, the pairwise divisor intersections and the proper closed exceptional subsets on which the required local identities fail.
  Choose a smooth dense open $U subset X$ on which all $g_j$ are units. The simultaneous root cover
  $ V = "Spec"_U cal(O)_U \[ T_1 \, dots.h \, T_r \] \/ \( T_1^q - g_1 \, dots.h \, T_r^q - g_r \) arrow.r U $
  is finite étale of degree $q^r$. Let $H$ be the subgroup generated by the $\[ g_j \]$ in $L^times \/ L^(times q)$. Kummer theory shows that each connected component of $V$ has degree $\| H \|$ over $U$. Since $U$ is smooth, these components are integral.
  All these data descend to a finitely generated domain $R subset l$ in which $ell$ is invertible. Enlarge $R$ and then localize it so that the following properties hold in every geometric fiber:
  - the embedded model $X_R$ is projective and flat, with normal integral fibers and the Hilbert polynomial of $X$;
  - the $D_(i \, R)$ are distinct geometrically integral divisors with their original degrees, and the local divisor identities and smoothness conditions above hold outside a subset of fiberwise codimension at least two;
  - the root cover and its disjoint decomposition into components extend, and every component has geometrically integral fibers and finite locally free degree $\| H \|$ over $U_R$.
  These are finite spreading conditions. Flatness makes the projective Hilbert polynomials constant. Geometric integrality and normality spread from the generic fiber after shrinking; the latter uses the proper flat finite-presentation form of #cite(label("EGAIV3")) Theorem 12.2.4(iv),(viii). The equations $g_j = u pi^n$, the inverses specifying units, the component idempotents, and the finite locally free ranks are all finite algebraic data. Spreading them preserves the exact orders and degrees, rather than just the supports. The dimension bound on the omitted closed set also persists after shrinking.
  For later use include a separating transcendence basis $x_1 \, dots.h \, x_d$ of $L \/ l$, a primitive element $y$ over $l \( x_1 \, dots.h \, x_d \)$, its monic minimal polynomial, and common birational opens with $X$. After another localization, the same presentation and birational identification hold in the geometric fibers, with the reduced polynomial irreducible of its original degree over the rational function field. Preserve as well the nonzero reductions of the finitely many numerators and denominators used for the $g_j$. This follows either by spreading those common opens and geometric integrality, or by spreading the absolutely irreducible defining polynomial after clearing denominators.
  #emph[Realize a good fiber as a residue field.] Choose a closed point $s in "Spec" R$. Its residue field is finite and has characteristic different from $ell$. A valuation ring of $l$ dominating $R_s$ exists #cite(label("Stacks")) Lemma 10.50.2, Tag 00IA. Its residue field is algebraically closed. If that residue field is not algebraic over a finite field, give a transcendence basis independent values in an ordered free abelian group, prolong the resulting valuation to the residue field, and compose. This yields a valuation $s_0$ of $l$ with the same center $s$ and residue field $lambda$ algebraic over a finite field. Residues of algebraically closed fields are algebraically closed, so $lambda$ is an algebraic closure of a finite field. The composition does not change the center because every nonzero element of a finite field has value zero. This construction uses a transcendence basis of arbitrary cardinality; there is no restriction on the size of $l$.
  Extend $s_0$ to $l \( x_1 \, dots.h \, x_d \)$ by the Gauss valuation, whose residue field is $lambda \( x_1 \, dots.h \, x_d \)$ and whose value group is $s_0 l$. Prolong it to $L$. The element $y$ is integral and its residue satisfies the reduced irreducible polynomial, of degree $\[ L : l \( x_1 \, dots.h \, x_d \) \]$. The fundamental valuation inequality therefore forces the residue degree to be that degree and the value-group index to be one #cite(label("Stacks")) Section 15.125, Tag 0ASF. We obtain a valuation $s_X$ with
  $ s_X L = s_0 l \, #h(2em) L s_X = lambda \( X_s \) \, $
  and with the $g_j$ reducing to their specified rational functions on $X_s$. This also explains why no extra ramification or defect is hidden in the passage to the good fiber.
  #emph[Cut down to a curve.] Over $lambda$, choose a general flag of $d - 1$ hyperplanes in the fixed projective embedding. Make the final section $C$ avoid the omitted codimension-two set and meet the $D_(i \, s)$ transversely. The intersections with different $D_(i \, s)$ are disjoint. The final section is smooth and integral. Apply Lemma 14 successively to the finite list of covering components as well as to the reduced underlying base sections; each restricted covering component remains integral over $U_s ∩ C$. At every step the varieties to which irreducibility is applied have dimension at least two, including the last surface-to-curve step. Smoothness of the restricted cover follows from its étaleness over the smooth curve open.
  For completeness, intermediate scheme sections need only have irreducible support and be smooth at the generic points used by the flag. All those points lie in the original smooth locus. Choose the hyperplanes also to avoid the finitely many associated points at each stage, so their equations are non-zero-divisors. The hyperplane exact sequences give
  $ P_C \( n \) = Delta^(d - 1) P_X \( n \) \, #h(2em) Delta P \( n \) = P \( n \) - P \( n - 1 \) . $
  As $C$ is smooth integral, its genus is consequently fixed by the embedded model $X$; denote it by $G_X$. All conditions imposed on the flag are finitely many nonempty open conditions. They can be met over the infinite algebraically closed field $lambda$, even when it is countable.
  Compose $s_X$ with the successive divisorial valuations of this flag. For the first composition, the relative value group is the innermost convex copy of $bb(Z)$, and its residue transcendence degree drops by one. Every proper coarsening kills this copy of $bb(Z)$ and therefore has all its values supplied by constants. The first composition is thus a quasi-prime divisor. The remaining flag valuations are prime divisors over the residue constants, giving a quasi-prime $\( d - 1 \)$-divisor $w$. All $g_j$ are units at every generic point in the flag, so $w \( g_j \) = 0$, and $L w = lambda \( C \)$.
  #emph[Check relations and orders.] An old relation $product_j g_j^(n_j) = b^q$ specializes: since $w \( g_j \) = 0$, torsion-freeness of the value group gives $w \( b \) = 0$. Thus the old relation kernel in $\( bb(Z) \/ q \)^r$ is contained in the new one. On the other hand, every component of the root cover restricted to $U_s ∩ C$ is integral and has degree $\| H \|$. Kummer theory gives the same order $\| H \|$ for the subgroup generated by the residue classes. The two finite relation kernels therefore have the same order, so they are equal.
  Finally, $C$ meets $D_(i \, s)$ in exactly $deg D_i$ distinct transverse points. At each such point the order of $overline(g)_j$ equals the unchanged integer $"ord"_(D_i) \( g_j \)$. There are no other zeros or poles. This proves (6), in fact for every divisor $m$ of $q$, and completes the construction. ◻
]

== 5 A uniform bound for pencils <sec:pencil>

The preceding construction tests a finite collection of functions at a finite Kummer level. We now combine such tests with five fixed members of a pencil. Riemann–Hurwitz bounds the degree of every residual pencil, which in turn bounds the support of the entire original pencil. Bounded-genus curve sections and Riemann–Hurwitz already underlie the finite-support argument of Bogomolov and Tschinkel #cite(label("BT2011")) Section 6, proof of Proposition 6.1. Here the fixed anchors give one bound for every member of the pencil, and the finite residual tests allow arbitrary algebraically closed constants.

Keep the model $X$ of the preceding section and the Kummer isomorphism $Theta : hat(K) arrow.r hat(L)$. For $h in hat(L)$ and $e gt.eq 1$, define

$ S_e \( h \) = { D subset X upright(" prime divisor") : "ord"_D \( h \) equiv.not 0 med \( mod med ell^e \) } \, #h(2em) "Supp"_X \( h \) = { D : "ord"_D \( h \) eq.not 0 } . $

The order maps extend continuously to $hat(L)$. Each $S_e \( h \)$ is finite, because $h$ modulo $ell^e$ is represented by an ordinary rational function. The exact support need not be finite a priori. The sets $S_e \( h \)$ increase with $e$, and their union is $"Supp"_X \( h \)$.

#thm([Theorem 5.1.])[
  (Uniform pencil support).  #emph[For every $t in K \\ k$, there is a finite constant $B_t$ such that 
$ sum_(D in "Supp"_X \( Theta \[ t - a \] \)) deg D lt.eq B_t #h(2em) upright("for every ") a in k . $

 In particular, all these supports are finite, with a bound independent of the member of the pencil.]
] <pencil:uniform>

#proof[
  Choose five distinct anchors $a_1 \, dots.h \, a_5 in k$, including $0$. In characteristic zero include $1$ and $ell$ as well. Put $h_a = Theta \[ t - a \]$ and
  $ N_i = sum_(D in S_1 \( h_(a_i) \)) deg D quad \( 1 lt.eq i lt.eq 5 \) \, #h(2em) c_ell = 5 \( 1 - 1 \/ ell \) - 2 = 3 - 5 \/ ell . $
  The $N_i$ are finite before any exact-support assertion is known. Moreover $c_ell gt.eq 1 \/ 2$, so the constant
  $ "(7)" quad B = max {1 \, frac(2 G_X - 2 + sum_(i = 1)^5 N_i, c_ell)} $ <pencil:constant>
  is finite and depends only on $X$, $Theta$, $t$ and the fixed anchors. We prove the theorem with $B_t = 2 B$.
  Fix one additional $a in k$, and list the distinct elements among the five anchors and $a$ as $a_j$. Write $u_j = t - a_j$. For all sufficiently large $e$, the classes $\[ u_j \]$ modulo $q = ell^e$ are nonzero and pairwise distinct and generate a noncyclic subgroup. Indeed the functions $t - a_j$ are independent modulo constants: a multiplicative relation would give a constant rational function of the transcendental element $t$ and hence have all exponents zero. Their images in the free abelian group $K^times \/ k^times$ are therefore independent. Integral evaluations detect nonzero elements and nonzero two-by-two determinants, which remain nonzero modulo a sufficiently large power of $ell$. Equivalently, one can prolong two distinct point valuations of $k \( t \)$ to $K$ to obtain a diagonal evaluation matrix with nonzero integer entries. The necessary lower bound on $e$ may depend on $a$.
  Choose representatives $g_j in L^times$ of $h_(a_j)$ modulo $q$, and apply Lemma 13. It gives $w$, a residual curve $C$, and the same noncyclic subgroup with distinct nonzero generators in $\( L w \)^times \/ \( L w \)^(times q)$. Evaluation on $D_w \/ I_w = W_(L w)$ detects these classes. By Proposition 10, there is a corresponding quasi-prime $\( d - 1 \)$-divisor $v$ of $K \/ k$, and the evaluations of the $u_j$ on $D_v$ modulo $q$ are likewise nonzero, distinct and noncyclic.
  #emph[Normalize the residual pencil.] We first show that
  $ "(8)" quad v \( k \( t \) \) = v k . $ <pencil:no-relative-value>
  Otherwise $v \( k \( t \) \) \/ v k$ is a nonzero subgroup of the finitely generated free group $v K \/ v k$. The valuation transcendence-degree inequality for $k \( t \) \/ k$ makes it cyclic and gives $k \( t \) v = k v$. Every function of value in $v k$ then becomes a principal unit after multiplication by constants. Since $D_v$ kills constants and principal units, evaluation on $D_v$ factors through this cyclic relative value group. Its image modulo $q$ is cyclic, a contradiction.
  All the $v \( u_j \)$ have a common value $gamma in v k$. For if $v \( u_j \) < v \( u_h \)$, then $u_j \/ \( a_h - a_j \) = 1 + u_h \/ \( a_h - a_j \)$ is a principal unit, forcing the evaluation of $u_j$ to vanish. Also $v \( a_j - a_h \) = gamma$ whenever $j eq.not h$: a strictly larger value would make $u_j \/ u_h$ a principal unit and force two evaluations to coincide. Choose $b in k^times$ with $v \( b \) = gamma$, and fix one listed anchor $a_0$. Set
  $ tau_0 = overline(\( t - a_0 \) \/ b) \, #h(2em) beta_j = overline(\( a_j - a_0 \) \/ b) . $
  These expressions are defined, the $beta_j$ are distinct elements of $k v$, and
  $ "(9)" quad overline(u_j \/ b) = tau_0 - beta_j . $ <pencil:residual-linear>
  The element $tau_0$ is nonconstant: a constant residue would make $\( t - a_0 \) \/ b$ a constant times a principal unit and give zero evaluation.
  The residue characteristic is different from $ell$. This is automatic if $k$ has positive characteristic. In characteristic zero, the anchor differences $1 - 0$ and $ell - 0$ have the same value, so $v \( ell \) = v \( 1 \) = 0$. Thus $ell$ is nonzero in $k v$ in that case as well.
  #emph[Compare the two residual curves.] The constants $l w$ are algebraic over a finite field. Proposition 12 therefore gives the same assertion for $k v$ and identifies the full families of point inertia lines in $W_(L w)$ and $W_(K v)$. Let $C' \/ k v$ be the smooth projective curve with function field $K v$. By Lemma 5, the mod-$ell$ kernels of the point order maps have dimensions $2 g \( C \)$ and $2 g \( C' \)$. The residual isomorphism identifies these kernels, and hence
  $ "(10)" quad g \( C' \) = g \( C \) lt.eq G_X . $ <pencil:genus>
  Generators of matched point inertia lines differ by units of $bb(Z)_ell$. Consequently the number of nonzero point orders modulo $ell$ or $q$ is preserved by the comparison. Because constants have zero Kummer class, evaluation identifies the classes of the functions in (9) with those of $overline(g)_j$ modulo $q$.
  #emph[Use the five anchors to bound the degree.] Write $p = "char" \( k v \) > 0$, using the finite-constant recognition above. Remove inseparability by writing $tau_0 = tau^(p^r)$ with $r gt.eq 0$ maximal. Such an $r$ is finite, as a nonzero integer point order of $tau_0$ cannot be divisible by arbitrarily high powers of $p$. The function $tau$ gives a separable morphism $tau : C' arrow.r bb(P)^1$ of some degree $n gt.eq 1$. Let $beta'_j$ be the $p^r$-th root of $beta_j$ in $k v$. These constants are distinct, and
  $ tau_0 - beta_j = \( tau - beta'_j \)^(p^r) . $
  Since $p eq.not ell$, this power does not affect whether any point order is zero modulo $ell$ or $q$.
  Over the value $beta'_i$ corresponding to anchor $i$, at most $N_i$ points have ramification index not divisible by $ell$. Indeed such a point contributes a nonzero order modulo $ell$ to $tau_0 - beta_i$; transport to $C$ and (6) give the bound $N_i$. Every other point of that fiber has ramification index at least $ell$, so there are at most $n \/ ell$ of them. If $r_i$ denotes the total number of points in the fiber, then
  $ r_i lt.eq N_i + n \/ ell \, #h(2em) sum_(P divides beta'_i) \( e_P - 1 \) = n - r_i gt.eq \( 1 - 1 \/ ell \) n - N_i . $
  For a separable morphism of smooth curves, the different exponent at $P$ is at least $e_P - 1$, including in the presence of wild ramification. The five fibers are disjoint. Riemann–Hurwitz therefore yields
  $ 2 g \( C' \) - 2 + 2 n gt.eq sum_(i = 1)^5 sum_(P divides beta'_i) \( e_P - 1 \) gt.eq 5 \( 1 - 1 \/ ell \) n - sum_(i = 1)^5 N_i . $
  Together with (10) this gives $c_ell n lt.eq 2 G_X - 2 + sum_i N_i$, and hence $n lt.eq B$. This argument uses the different inequality, not the tame Riemann–Hurwitz formula; see #cite(label("Stacks")) Section 53.12, Tag 0C1B.
  #emph[Pass from finite tests to exact supports.] For every tested $j$, all zeros and poles of $tau - beta'_j$ lie in two fibers, over $beta'_j$ and infinity. There are at most $2 n$ such points. The number of its nonzero point orders modulo $q$ is therefore at most $2 B$. Transport this bound to $C$ and apply (6) to obtain
  $ "(11)" quad sum_(D in S_e \( h_a \)) deg D lt.eq 2 B . $ <pencil:finite-level-bound>
  The right side is independent of $a$, $e$, the finite descent data and the residual test. For each fixed $a$, the inequality holds for every sufficiently large $e$.
  Finally $S_e \( h_a \)$ increases to $"Supp"_X \( h_a \)$. If the exact support had total degree greater than $2 B$, a finite subset would already have degree greater than $2 B$; that subset would lie in $S_e \( h_a \)$ for all sufficiently large $e$, contradicting (11). Every prime divisor has positive integer degree, so the exact support is finite. This proves the asserted uniform bound. ◻
]

#thm([Corollary 5.2.])[
  #emph[For every $z in K^times$, the class $Theta \[ z \]$ has finite support on $X$.]
] <pencil:finite>

#proof[
  If $z in.not k$, apply Theorem 15 to $t = z$ and $a = 0$. If $z in k^times$, its Kummer class is zero because $k^times$ is divisible. ◻
]

== 6 Recovering the curve subfields <sec:curve-recovery>

A #emph[curve subfield] of $K \/ k$ will mean a subfield $E subset K$ containing $k$, relatively algebraically closed in $K$, and of transcendence degree one over $k$. Such a field is finite over $k \( t \)$ for each $t in E \\ k$. We identify its completed multiplicative group $hat(E)$ with its image in $hat(K)$ by Lemma 3.

#thm([Theorem 6.1.])[
  #emph[The map $Theta$ gives a bijection between the completed curve subfields of $K \/ k$ and those of $L \/ l$. More precisely, for every curve subfield $E subset K$ there is a unique curve subfield $P subset L$ such that 
$ Theta \( hat(E) \) = hat(P) . $

]
] <recovery:curves>

Theorem 15 bounds the degrees of the prime divisors detected by a pencil. We first show that infinitely many occur. Their incidence family gives containment in a completed curve field over a finite extension of $L$. Intersections and norms then descend this containment to $L$, and the inverse correspondence gives equality.

=== 6.1 The divisors detected by a pencil <the-divisors-detected-by-a-pencil>

Fix $t in K \\ k$, let $E$ be the relative algebraic closure of $k \( t \)$ in $K$, and put

$ h_a = Theta \[ t - a \] \, #h(2em) cal(S) = union.big_(a in k) "Supp"_X \( h_a \) . $

Here $X \/ l$ is the fixed normal projective model used in Theorem 15. That theorem bounds the degree of every member of $cal(S)$ by a constant depending on $t$ and $X$.

#thm([Lemma 6.2.])[
  #emph[The set $cal(S)$ is infinite. For every $z in E^times$, every $j gt.eq 1$, and every representative $g in L^times$ of $Theta \[ z \] med mod med ell^j$, all but finitely many $D in cal(S)$ satisfy 
$ "(12)" quad "ord"_D \( g \) = 0 \, #h(2em) g \|_D in l \( D \)^(times ell^j) . $ <eq:recovery-residue-powers>

]
] <recovery:residue-powers>

#proof[
  The classes $\[ t - a \]$ are independent in $k \( t \)^times \/ ell$, as evaluation at their distinct zeros shows. The kernel of $k \( t \)^times \/ ell arrow.r K^times \/ ell$ is finite dimensional: adjoining roots for any finite independent subset of that kernel gives an elementary abelian $ell$-extension contained in the finite extension $E \/ k \( t \)$. Thus their images span an infinite-dimensional subspace of $K^times \/ ell$, and the same is true of the $h_a$ in $hat(L) \/ ell = L^times \/ ell$.
  The kernel of divisor evaluation
  $ L^times \/ ell arrow.r xor.big_(D in X^(\( 1 \))) bb(F)_ell $
  is finite dimensional. Indeed, take a smooth dense open $U subset X$. A function whose divisor on $U$ is divisible by $ell$ defines a $mu_ell$-torsor on $U$: its divisor divided by $ell$ is Cartier. The kernel therefore embeds in $H_(upright(acute(e) t))^1 \( U \, mu_ell \)$, which is finite dimensional by Deligne’s finiteness theorem #cite(label("DeligneSGA4half")) Théorèmes de finitude, Theorem 1.1. If $cal(S)$ were finite, both the image and the kernel of divisor evaluation on the pencil span would be finite dimensional, a contradiction.
  For $D in cal(S)$, let $w_D$ be its divisorial valuation and let $v$ be the quasi-prime divisor of $K \/ k$ supplied by Proposition 10. Its inertia detects some $\[ t - a \]$. Consequently $v E \/ v k$ is nonzero inside the rank-one group $v K \/ v k$. The valuation transcendence-degree inequality applied to $E \/ k$ gives $"trdeg" \( E v \/ k v \) = 0$, so $E v = k v$ because $k v$ is algebraically closed.
  If $"ord"_D \( Theta \[ z \] \) = 0$, inertia evaluation implies $v \( z \) in v k$. Multiplying $z$ first by a constant to give it value zero, and then by a constant with the reciprocal residue, makes it a principal unit. Thus $D_v$ kills $\[ z \]$, and $D_(w_D)$ kills $Theta \[ z \]$. By Corollary 16, the excluded $D$ form a finite set. Discard also the finitely many prime divisors in the ordinary divisor of $g$. For every remaining $D$, $g$ is a unit at $D$, and its residue has zero evaluation modulo $ell^j$ against $D_(w_D) \/ I_(w_D) = W_(l \( D \))$. Finite-level Kummer duality gives (12). ◻
]

=== 6.2 One incidence curve for every Kummer test <one-incidence-curve-for-every-kummer-test>

The following geometric lemma permits an arbitrary collection of tests. In particular, neither the constants nor the collection must be countable or uncountable.

#thm([Lemma 6.3.])[
  #emph[Let $l$ be algebraically closed, let $X \/ l$ be a normal integral projective variety of dimension $d gt.eq 2$, and let $cal(S)$ be an infinite set of prime divisors of bounded degree in a fixed projective embedding. Let $cal(A)$ be any collection of pairs $\( g \, q \)$, where $g in l \( X \)^times$ and $q gt.eq 1$ is prime to $"char" l$. Suppose that, for each pair separately, all but finitely many $D in cal(S)$ satisfy 
$ "ord"_D \( g \) = 0 \, #h(2em) g \|_D in l \( D \)^(times q) . $

 There exist a finite field extension $M \/ l \( X \)$ and a curve field $P_0 \/ l$ contained in $M$ such that $M \/ P_0$ is regular and 
$ g in \( M overline(P_0) \)^(times q) quad upright("for every ") \( g \, q \) in cal(A) . $

 The same fields $M$ and $P_0$ work for the entire collection.]
] <recovery:incidence>

#proof[
  #emph[Place the divisors in a bounded family.] Integral subvarieties of fixed dimension and bounded degree in $bb(P)_l^N$ have only finitely many Hilbert polynomials #cite(label("GrothHilbert1961")) Section 2 and Lemma 2.4; see also #cite(label("Tanaka2023")) Proposition 5.3.
  The Hilbert points of $cal(S)$ therefore lie in a finite union of projective Hilbert schemes of $X$, with their universal flat families #cite(label("GrothHilbert1961")) Theorem 3.2 and the Hilbert specialization after Proposition 3.8. Their closure has a positive-dimensional irreducible component on which they are dense. Give it its reduced structure and shrink to an integral variety $T$ such that the universal family
  $ Z subset T times X arrow.r T $
  has geometrically integral divisor fibers. This is possible by constructibility of geometric integrality #cite(label("Stacks")) Tags 0579, 055B; the family is flat by construction.
  #emph[Fix one incidence curve.] Choose an integral locally closed curve $T' subset T$ now, before making any of the tests in $cal(A)$, and put $Z' = Z times_T T'$. Both $Z$ and $Z'$ are integral. Indeed, flatness over an integral base excludes vertical components and embeds affine coordinate rings in their generic-fiber localizations, while the generic fibers are geometrically integral. Both incidence maps to $X$ are dominant. Otherwise a proper closed subset of $X$ would contain infinitely many distinct prime-divisor fibers; each would have to be one of its finitely many components of dimension $d - 1$. Distinct parameter points give distinct divisors because they are distinct Hilbert points.
  Set
  $ M = l \( Z' \) \, #h(2em) P_0 = l \( T' \) . $
  Dominance embeds $l \( X \)$ into $M$. Since $dim Z' = d$, this is a finite extension. Geometric integrality of the generic fiber of $Z' arrow.r T'$ means that $M \/ P_0$ is regular.
  Figure 1 records the two projections that determine these fields.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Z'$])
  content((3.2, 0), [$Z$])
  content((6.4, 0), [$X$])
  content((0, 3.2), [$T'$])
  content((3.2, 3.2), [$T$])
  line((0.595, 0), (2.69, 0), mark: (end: ">"))
  line((0, 0.4), (0, 2.8), mark: (end: ">"))
  line((3.71, 0), (5.89, 0), mark: (end: ">"))
  content((4.8, -0.45), [$"pr"_X$])
  line((3.2, 0.4), (3.2, 2.8), mark: (end: ">"))
  line((0.595, 3.2), (2.69, 3.2), mark: (end: ">"))
  line((0.595, 3.2), (0.595, 2.9))
})],
    caption: [Figure 1: The left square is Cartesian. The composite $Z' arrow.r X$ is dominant and generically finite, giving $l \( X \) subset M = l \( Z' \)$; the vertical map gives $P_0 = l \( T' \) subset M$. The curve $T'$ is fixed before the tests $\( g \, q \)$. Auxiliary normal covers used to split a test may depend on that test, but $M$ and $P_0$ do not. ],
  ) <fig:incidence>
  #emph[Extend each splitting to the fixed curve.] It remains to prove all the power assertions without changing $T'$. Fix one pair $\( g \, q \)$. Let $U subset X$ be the unit locus of $g$, and let
  $ Y = Z^(upright(s m) \/ T) ∩ "pr"_X^(- 1) \( U \) . $
  Then $Y arrow.r T$ is smooth. Its fibers over the generic points of $T$ and of $T'$ are nonempty and geometrically integral: geometric integrality supplies a dense smooth locus, and dominance of the two incidence maps supplies the unit condition. Over $Y$ consider the degree-$q$ finite étale cover
  $ C_g = "Spec"_Y cal(O)_Y \[ u \] \/ \( u^q - g \) . $
  On every tested fiber satisfying the hypothesis and meeting $Y$, a rational $q$-th root extends to a regular unit by normality of the smooth fiber. Thus the cover splits into $q$ copies on those fibers. The number of geometric irreducible components is constant on a dense open of $T$ #cite(label("Stacks")) Tag 055A. That number must be $q$, by the dense set of tested fibers. A degree-$q$ finite étale cover of a normal integral scheme with $q$ components has degree one on each component. It follows that the cover is split on the geometric generic fiber over $T$.
  This last dense open need not meet $T'$. To pass to the fixed curve, descend the generic splitting to a finite extension of $l \( T \)$ and normalize $T$ in it, obtaining a finite surjective morphism $tilde(T) arrow.r T$. The scheme $tilde(Y) = Y times_T tilde(T)$ is normal because it is smooth over a normal base #cite(label("Stacks")) Tag 034F. It is integral because its generic fiber is geometrically integral and it is flat over the integral base. The pulled-back cover is generically split and finite étale over this normal integral scheme, hence split everywhere: each component is finite birational over the normal target and is an isomorphism #cite(label("Stacks")) Lemma 58.11.2, Tag 0BQL. Surjectivity of $tilde(T) arrow.r T$ provides a lift of a geometric point above the generic point of $T'$. Restricting the split cover to that point proves that $g$ has a $q$-th root in $M overline(P_0)$. The auxiliary finite extension may depend on $\( g \, q \)$; the already chosen fields $M$ and $P_0$ do not. ◻
]

=== 6.3 Kummer descent and intersections <kummer-descent-and-intersections>

We next turn geometric splitting into membership in a completed curve field. Two elementary facts keep track of the finite extension introduced by the incidence construction.

#thm([Lemma 6.4.])[
  #emph[Let $M \/ P$ be a regular field extension, let $q$ be prime to the characteristic, and suppose $mu_q subset P$. If $g in M^times$ becomes a $q$-th power in $M overline(P)$, then its class in $M^times \/ M^(times q)$ comes from a unique class in $P^times \/ P^(times q)$.]
] <recovery:kummer-descent>

#proof[
  A $q$-th root $r$ of $g$ is separable over $M$, so it already belongs to $M P^(upright(s e p))$: the remaining constant extension is purely inseparable. Choose a finite Galois extension $P' \/ P$ with $r in M P'$. Regularity identifies $"Gal" \( M P' \/ M \)$ with $"Gal" \( P' \/ P \)$. The ratios $sigma \( r \) \/ r in mu_q$ form a character of this group. By Hilbert’s Theorem 90, there is $b in P' ""^times$ with these same ratios. Then $r \/ b in M$ and $b^q in P$, giving $g = b^q \( r \/ b \)^q$. Finally, if an element of $P$ has a $q$-th root in $M$, that root is algebraic over $P$ and therefore belongs to $P$. This proves uniqueness. ◻
]

#thm([Lemma 6.5.])[
  #emph[Let $N \/ l$ be a function field over algebraically closed constants of characteristic different from $ell$. If $P$ and $Q$ are distinct curve subfields of $N \/ l$, then $hat(P) ∩ hat(Q) subset hat(N)$ has finite $bb(Z)_ell$-rank.]
] <recovery:intersection>

#proof[
  The compositum $P Q$ has transcendence degree two over $l$; otherwise relative algebraic closedness in $N$ would force $P = Q$. Let $C_P$ and $C_Q$ be the smooth projective curves of these fields. The product is integral, and its function field identifies with $P Q$: the rational map defined by the two subfields has two-dimensional, hence dense, image in $C_P times C_Q$.
  For a point $x in C_P \( l \)$, take the valuation of the divisor ${ x } times C_Q$. Extend it by a Gauss valuation over a transcendence basis for $N \/ P Q$, then prolong it across the remaining finite extension. Its normalized order $w$ on $N$ is zero on $Q^times$ and restricts to $e "ord"_x$ on $P^times$, for some integer $e > 0$. This construction allows inseparable extensions and all ramification indices.
  An element of $hat(P) ∩ hat(Q)$ has $w$-order zero by its $Q$-representation. Its $x$-order is therefore zero, since multiplication by $e$ is injective on $bb(Z)_ell$. This holds for every $x$. By Lemma 5, the intersection embeds in the finite-rank Tate module of $"Pic"^0 \( C_P \)$. ◻
]

#proof[
  Let $E subset K$ be a curve subfield, and choose $t in E \\ k$. Relative algebraic closedness makes $E$ the relative algebraic closure of $k \( t \)$ in $K$. Apply Lemmas 18 and 19 to one representative of each $Theta \[ z \] med mod med ell^j$, for $z in E^times$ and $j gt.eq 1$. We obtain fields $L subset M$ and $P_0 subset M$ as in the incidence lemma.
  Put $H = Theta \( hat(E) \)$. We claim that its image in $hat(M)$ lies in $hat(P)_0$. At level $ell^j$, every element of $hat(E)$ is represented by an actual $z in E^times$. Lemma 20 puts its image in $P_0^times \/ P_0^(times ell^j)$. These classes are unique because $P_0$ is relatively algebraically closed in $M$, and their uniqueness makes them compatible as $j$ varies. Taking inverse limits proves the claim. Completion maps across $M \/ L$ are injective by Lemma 3.
  Choose a finite normal extension $N \/ L$ containing $M$, allowing an inseparable part, and let $P_N$ be the relative algebraic closure of $P_0$ in $N$. It is a curve subfield of $N \/ l$. The image of $H$ lies in $hat(P)_N$. Every $sigma in "Aut"_L \( N \)$ fixes $H$, so $H$ also lies in $accent(sigma \( P_N \), ̂)$. It has infinite rank: $hat(E) \/ ell$ has infinite dimension, as the pencil argument in Lemma 18 shows. Indeed, lifts of any finite mod-$ell$ independent set are $bb(Z)_ell$-independent: a nonzero relation, divided by the smallest $ell$-power in its coefficients, would reduce to a nonzero mod-$ell$ relation. Torsion freeness justifies this division. Lemma 21 therefore forces $sigma \( P_N \) = P_N$ for every $sigma$.
  Set $P_L = P_N ∩ L$. This field has transcendence degree one over $l$. Indeed, for $G = "Aut"_L \( N \)$, the field $P_N^G$ has transcendence degree one and lies in $N^G$. In characteristic zero $N^G = L$. In characteristic $p > 0$, $N^G \/ L$ is finite purely inseparable, so a common $p^a$-th power sends $P_N^G$ into $P_L$. Moreover $P_L$ is relatively algebraically closed in $L$: an element of $L$ algebraic over $P_L$ is algebraic over $P_N$, hence lies in $P_N$. Taking the relative algebraic closure of any nonconstant rational subfield shows that $P_L \/ l$ is finitely generated.
  The norm $N_(N \/ L)$ sends $P_N^times$ into $P_L^times$. In fact, if $s$ is the inseparable degree of $N \/ L$, then
  $ N_(N \/ L) \( x \) = (product_(sigma in G) sigma \( x \))^s \; $
  the right side lies in $P_N$ because $P_N$ is $G$-stable, and the norm lies in $L$. On completions, norm composed with inclusion is multiplication by $\[ N : L \]$. We conclude that $\[ N : L \] H subset hat(P)_L$. The latter is saturated in $hat(L)$ by Lemma 3, so $H subset hat(P)_L$. Here the prime-to-$ell$ factor of $\[ N : L \]$ is a unit of $bb(Z)_ell$, and saturation removes its remaining $ell$-power factor.
  Apply the same argument to $Theta^(- 1)$. It gives a curve subfield $E' subset K$ with
  $ hat(E) subset Theta^(- 1) \( hat(P)_L \) subset hat(E)' . $
  The infinite-rank intersection forces $E' = E$ by Lemma 21. Both inclusions are therefore equalities. That lemma also proves uniqueness. Reversing $K$ and $L$ proves the asserted bijection. ◻
]

=== 6.4 Divisorial valuations and rational quotients <divisorial-valuations-and-rational-quotients>

We can now distinguish valuations trivial on the constants. Throughout this subsection, a #emph[divisorial valuation] means such a quasi-prime divisor, with its discrete value group normalized to $bb(Z)$.

The following criterion adapts Topaz’s Lemma A.7 #cite(label("TopazTorelli2025")) Lemma A.7 to completed multiplicative groups. The proof below verifies the needed hypotheses in this setting.

#thm([Proposition 6.6.])[
  #emph[A quasi-prime divisor $v$ of $K \/ k$ is divisorial if and only if 
$ "(13)" quad D_v^perp ∩ hat(E) = 0 $ <eq:recovery-divisorial>

 for some curve subfield $E$ of $K \/ k$. Consequently $phi$ preserves divisorial inertia and decomposition groups in both directions.]
] <recovery:divisorial>

#proof[
  Suppose $v$ is trivial on $k$. Its residue field has transcendence degree $d - 1 gt.eq 1$. Choose $t$ with transcendental residue, and let $E$ be the relative algebraic closure of $k \( t \)$ in $K$. The valuation is trivial on $k \( t \)$ and hence on its algebraic extension $E$. Thus $E$ embeds into $K v$. Its relative algebraic closure in $K v$ is finite over $E$, so the induced completion map is injective: factor it through that finite extension and then a relatively algebraically closed inclusion. Residual evaluation by $D_v \/ I_v = W_(K v)$ proves (13).
  Conversely, suppose $v \| k$ is nontrivial, and let $E$ be any curve subfield. Choose $x in E \\ k$, replacing it by $x^(- 1)$ if necessary so that $v \( x \) gt.eq 0$, and choose $c in k$ with $v \( c \) > 0$. Then $1 + c x$ is a nonconstant principal unit. Its class in $hat(E)$ is nonzero and is killed by $D_v$, so (13) fails. The criterion is invariant under $Theta$ by Theorem 17 and the local correspondence. ◻
]

For a curve subfield $E subset K$, restriction gives a surjection

$ rho_E : W_K arrow.r W_E . $

This is the continuous surjection of Lemma 3.

#thm([Proposition 6.7.])[
  #emph[The point inertia lines of every curve subfield $E$ are precisely the saturations of the nonzero images $rho_E \( I_v \)$ for divisorial valuations $v$ of $K \/ k$. The correspondence of Theorem 17 preserves these lines and the genus. In particular, it matches exactly the relatively algebraically closed rational subfields.]
  #emph[If $Theta \( hat(E) \) = hat(P)$, the induced continuous isomorphism $phi_E : W_P arrow.r W_E$ makes the diagram 
(14)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$W_L$])
  content((3.2, 0), [$W_K$])
  content((0, 1.7), [$W_P$])
  content((3.2, 1.7), [$W_E$])
  line((0.68, 0), (2.52, 0), mark: (end: ">"))
  content((1.6, -0.45), [$phi$])
  line((0, 0.4), (0, 1.3), mark: (end: ">>"))
  content((-0.45, 0.85), [$rho_P$])
  line((3.2, 0.4), (3.2, 1.3), mark: (end: ">>"))
  content((3.65, 0.85), [$rho_E$])
  line((0.68, 1.7), (2.52, 1.7), mark: (end: ">"))
  content((1.6, 2.15), [$phi_E$])
})

 commute and matches the point inertia lines on its targets. For rational $E$ and $P$, these are the geometric rational quotient diagrams, with their point decomposition data.]
] <recovery:rational>

#proof[
  A divisorial valuation restricted nontrivially to $E$ is an integer multiple of a point valuation on its smooth projective curve: its value group is a nonzero subgroup of $bb(Z)$, and it is trivial on $k$. Conversely, extend any point valuation of $E$ by a Gauss valuation over a transcendence basis for $K \/ E$, then prolong it over the remaining finite extension. The resulting valuation is divisorial on $K \/ k$. Its restriction is $e "ord"_x$ for some $e > 0$. Saturation of the nonzero image recovers $bb(Z)_ell "ord"_x$, including when $ell$ divides $e$.
  The dual of $Theta \|_(hat(E))$ defines $phi_E$. Evaluation against elements of $hat(E)$ proves the commutativity of (14). Proposition 22 and the preceding description of point lines show that $phi_E$ matches them. Their generators may differ by units, which do not change the common kernel of point-order evaluations modulo $ell$. Its dimension is twice the genus by Lemma 5. Hence genus is preserved. A smooth projective curve over an algebraically closed field has genus zero exactly when its function field is rational.
  If $k \( t \)$ is relatively algebraically closed in $K$, the extension $K \/ k \( t \)$ is regular. Only separability needs explanation. In characteristic $p > 0$, relative algebraic closedness implies $t in.not K^p$. Since $k$ is perfect, $t$ can be included in a separating transcendence basis for $K \/ k$, proving that $K \/ k \( t \)$ is separably generated. Characteristic zero is immediate. Thus these are exactly the rational subfields defined by general elements. Finally, the residue field at a point of a rational curve is the algebraically closed constant field, whose character group is zero. Point decomposition therefore equals point inertia, and the diagram also carries the required point decomposition data. ◻
]

The curve correspondence has consequently recovered both the true divisorial valuations and all geometric rational quotients from the original datum. The final reconstruction theorem can now be applied with these intrinsically determined objects.

== 7 From the recovered quotients to the field <sec:reconstruction>

We have recovered the geometric data needed for the last step. We now specify that data and Pop’s reconstruction theorems, so that their application uses exactly the original group input.

For a function field $F \/ kappa$, a #emph[divisorial flag] is a sequence of valuations obtained by taking a prime divisor trivial on $kappa$, then a prime divisor on its residue field, and continuing in this way. The empty flag is included. The #emph[total decomposition graph] records, at each such flag, the abelian pro-$ell$ group of the residue field, and at each next divisorial valuation its inertia and decomposition subgroups and the quotient map to the next residue group. Thus the graph retains the group maps as well as the flags. At a one-variable field over algebraically closed constants, its terminal data are precisely the point inertia lines: the residual groups at closed points vanish, so point decomposition equals point inertia.

We use the following two results of Pop.

#thm([Proposition 7.1.])[
  (Pop’s reconstruction theorems).  #emph[Let $F \/ kappa$ and $F' \/ kappa'$ be function fields of transcendence degree greater than one over algebraically closed fields of characteristic different from $ell$.]
  + #emph[From $Pi_F^c arrow.r Pi_F^a$ and the union of its true divisorial inertia groups, one recovers the total decomposition graph, functorially under class-two isomorphisms whose abelianizations preserve this union.]
  + #emph[Suppose an isomorphism between the total decomposition graphs of $F$ and $F'$ is compatible with all their geometric rational quotient diagrams. Then its map on the top abelian groups is induced, up to one unit in $bb(Z)_ell$, by an isomorphism of perfect closures in the opposite direction carrying the constant fields onto each other. That field isomorphism is unique modulo Frobenius twists in positive characteristic, and unique in characteristic zero.]
  #emph[In (2), a geometric rational quotient is restriction to $kappa \( u \) subset F$ with $F \/ kappa \( u \)$ regular, together with the point inertia and decomposition data on its target. Compatibility means that restriction commutes with the graph isomorphisms and the induced isomorphisms of these targets.]
] <reconstruction:pop>

#proof[
  #emph[Reference and hypotheses.] Part (1) is #cite(label("Pop2018")) Proposition 2.4; the surrounding section assumes transcendence degree greater than one. Part (2) is the Isom statement of #cite(label("PopBI2012")) Theorem 2.1(2), restating #cite(label("PopGraphs2012")) Main Theorem. The stated theorem requires Bertini-type families of rational quotients; all geometric rational quotients form such a family. More explicitly, for algebraically independent $x \, t$ with $x$ separating, the general functions
  $ a x + t \, #h(2em) frac(t, a' x + a) \, #h(2em) frac(a'' t + a' x + a + 1, t + a' x + a) $
  in #cite(label("PopGraphs2012")) Fact/Definition 43 define relatively algebraically closed rational subfields for the prescribed cofinite choices of constants. Every one of these subfields is among the quotients in (2). Thus its hypotheses imply precisely the required Bertini compatibility. No restriction to finite-field closures or to dimension greater than two occurs in this Isom statement. ◻
]

We emphasize the distinction between the two citations. The later #cite(label("Pop2018")) Theorem 1.1 reconstructs rational quotients from divisorial inertia under a dimension-greater-than-two hypothesis. Here those quotients have already been recovered by Section 6, so that theorem is unnecessary.

#proof[
  A field isomorphism $alpha : K^i arrow.r L^i$ induces a contravariant isomorphism of absolute Galois groups, well defined up to an inner automorphism. Purely inseparable extension does not change these groups. Abelianization removes the inner ambiguity, and the induced class-two map preserves the commutator. Thus it gives a member of $"Isom"^c \( Pi_L^a \, Pi_K^a \)$. In positive characteristic, absolute Frobenius on algebraic closures commutes with field automorphisms; composition with any integer Frobenius power therefore gives the same allowed orbit. This proves well-definedness of $Phi_(K \, L)$.
  Conversely, let $phi : Pi_L^a arrow.r Pi_K^a$ be bracket-compatible. Lemma 4 lifts it to a class-two isomorphism. After choosing Tate identifications, let $Theta$ be its dual (1). Proposition 10 recovers the common relative transcendence degree and the quasi-divisorial pairs. The finite residual tests and the uniform support bound prove the completed curve-subfield correspondence in Theorem 17. The recognition statements in Section 6 then show that $phi$ preserves true divisorial inertia and every relatively algebraically closed rational quotient, including its point lines.
  Proposition 23 gives the actual commuting quotient diagrams in (14). Their vertical maps are surjective, and their target isomorphisms $phi_E$ match all point inertia lines. For rational targets these are the entire point decomposition data. Thus the same fixed $phi$ is compatible with every geometric rational quotient; no independent rescaling of the targets is needed.
  Part (1) of Proposition 24 gives the total decomposition-graph isomorphism. The quotient squares also commute on these graphs. Indeed, restriction along an actual regular inclusion $E = k \( t \) subset K$ is a geometric rational quotient morphism #cite(label("PopBI2012")) Section 2, Embeddings and Restrictions. At a flag vertex its map is obtained by restricting to the decomposition subgroup and passing to the inertia quotient #cite(label("PopGraphs2012")) Definition/Remark 24 and Definition 25. If the flag restricts trivially to $E$, its inertia is killed, and the top square descends to the residual square. Otherwise its nonzero inertia image lies in a unique point line of $E$, where decomposition equals inertia and the residue group is trivial. The same description applies to $P subset L$. Local images can have finite index: saturation identifies the point line, but the actual subgroup images and maps are retained. Applying these restriction and quotient operations successively along each flag therefore proves compatibility for the same fixed $phi$ and $phi_E$.
  Part (2), applied to the recovered rational quotients, gives an isomorphism $alpha : K^i arrow.r L^i$ with $alpha \( k \) = l$ and $\[ phi \] = \[ alpha^(*) \]$. Choices of Tate identifications are absorbed by the one allowed global unit. This proves surjectivity. It also proves that different characteristics cannot give a bracket-compatible isomorphism.
  Finally, two field isomorphisms with the same Galois-side orbit give the same compatible graph and quotient data after one global unit adjustment. The uniqueness assertion in Proposition 24 identifies them modulo Frobenius in positive characteristic, and identifies them outright in characteristic zero. On perfect closures the Frobenius powers are exactly the integer powers appearing in the definition of $"Isom"_F^i \( K \, L \)$. This proves injectivity and completes the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
