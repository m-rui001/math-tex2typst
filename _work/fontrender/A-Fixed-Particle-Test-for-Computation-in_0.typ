#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.15cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$P in R_j$#linebreak()$z=z_n$]]])])
  content((4.8, 0), [#box(width: 2.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$P in R_j$#linebreak()$z=z_n+j Lambda^{-n-1}$]]])])
  content((10.5, 0), [#box(width: 2.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$F_j(P)$#linebreak()$z=z_n+j Lambda^{-n-1}$]]])])
  line((0, 0), (4.8, 0), mark: (end: ">"))
  content((2.4, 0), [$P$ fixed], anchor: "north")
  line((4.8, 0), (10.5, 0), mark: (end: ">"))
  content((7.65, 0), [$z$ fixed], anchor: "north")
  content((4.8, -1.2), [#text(size: 9pt)[$Lambda^n z=j/ Lambda "pmod" 1$#linebreak()the new digit selects the next pulse]])
})
