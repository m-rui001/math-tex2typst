#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[plain sized word]])
  content((0, -2), [#text(size: 9pt)[#box(width: 3cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#align(center)[Possible delay wrapping across three centimetres]])]])
  content((0, -5), [#text(size: 9pt)[$x^{2} y_{i} (t,z)$]])
  content((0, -7), [plain unsized word])
})
