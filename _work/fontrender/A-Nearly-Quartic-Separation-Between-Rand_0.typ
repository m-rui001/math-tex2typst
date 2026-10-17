#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((-4, 1.8), [#box(width: 2.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$X_j$#linebreak()$dots.h \ 0\ dots.h$]]])])
  content((0, 1.8), [#box(width: 2.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt), fill: rgb("#edf6ed"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$X_{i_ "ast" }$#linebreak()$1 1 dots.h 1$]]])])
  content((4, 1.8), [#box(width: 2.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$X_{j'}$#linebreak()$dots.h \ 0\ dots.h$]]])])
  content((0, 3), [#text(size: 8pt)[no incoming pointer can find a zero]])
  content((0, -0.2), [#box(width: 3.7cm, inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#f0f0ff"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$B_{i_ "ast" ,s_{i_ "ast" }}$#linebreak()certified address and pointers]]])])
  content((0, -1.75), [#text(size: 9pt)[$A_{i_ "ast" ,1}, dots.h ,A_{i_ "ast" ,r}$#linebreak()$s_{i_ "ast" }=(P(A_{i_ "ast" ,h}))_{h=1}^r$]])
  line((0, -1.75), (0, -0.2), mark: (end: ">"))
  bezier((0, -0.2), (-4, 1.8), (-1.718, 0.1029), (-4, 0.05587), stroke: (paint: rgb("#0000a6")), mark: (end: ">"))
  bezier((0, -0.2), (4, 1.8), (1.718, 0.1029), (4, 0.05587), stroke: (paint: rgb("#0000a6")), mark: (end: ">"))
  line((0, 1.8), (0, -0.2), stroke: (dash: "dashed"))
  content((-4, -0.85), [#text(size: 8pt)[zero witness#linebreak()disqualifies $j$]])
  content((4, -0.85), [#text(size: 8pt)[zero witness#linebreak()disqualifies $j'$]])
})
