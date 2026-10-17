#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.05cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$X_0$ generates $A/k$; two independent classes in $A^u/J_A(X_0)$#linebreak() #text(fill: rgb("#0000a6"))[$[X_1]$] #text(fill: rgb("#cc6600"))[$[X_2]$]]]])])
  content((-3.15, -1.75), [#box(width: 5.752cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Loop and paired eigenvalue changes#linebreak()Section~sec:responses]]])])
  content((3.15, -1.75), [#box(width: 5.752cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[First unsolved word errors#linebreak()Section~sec:word-transfer]]])])
  content((3.15, -3.3), [#box(width: 5.752cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Functional linkage and replication#linebreak()Section~sec:linkage-replication]]])])
  content((-3.15, -3.3), [#box(width: 5.752cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Common spectral relations#linebreak()Section~sec:global-defect]]])])
  content((-3.15, -4.85), [#box(width: 5.752cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Cyclic compatibility of word errors#linebreak()Section~sec:cyclic-obstructions]]])])
  content((3.15, -4.85), [#box(width: 5.752cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Eleven-block correction: $q(w(Z))=0$#linebreak()Section~sec:free-correction]]])])
  content((0, -6.7), [#box(width: 12.05cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Division realization and translation \(Sections~sec:division-realization--sec:generation\)#linebreak() $"X'_0"$ generates $A'/k'$; two independent classes in $"(A')^u/J_{A'}(X'_0)"$#linebreak() #text(fill: rgb("#0000a6"))[$"[X'_1]"$] #text(fill: rgb("#cc6600"))[$"[X'_2]"$]]]])])
  line((0, 0), (0, -0.3), (-3.15, -0.3), (-3.15, -1.75), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
  line((-3.15, -1.75), (3.15, -1.75), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
  line((3.15, -1.75), (3.15, -3.3), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
  line((3.15, -3.3), (-3.15, -3.3), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
  line((-3.15, -3.3), (-3.15, -4.85), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
  line((-3.15, -4.85), (3.15, -4.85), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
  line((3.15, -4.85), (3.15, -5.775), (1.575, -5.775), (0, -5.775), (0, -6.7), stroke: (paint: rgb("#595959"), thickness: 0.8pt), mark: (end: ">"))
})
