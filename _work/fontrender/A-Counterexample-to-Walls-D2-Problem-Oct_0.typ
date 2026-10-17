#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 10pt)[$F$]])
  content((3, 1.1), [#text(size: 10pt)[$A_{i+1}$]])
  content((6.2, 1.1), [#text(size: 10pt)[$"widehat" A_i$]])
  content((6.2, -1.1), [#text(size: 10pt)[$A_i$]])
  line((0, 0), (3, 1.1), mark: (end: ">"))
  content((1.5, 0.55), [$f_{i+1}$], anchor: "south")
  line((3, 1.1), (6.2, 1.1))
  content((4.6, 1.1), [inclusion], anchor: "south")
  line((6.2, 1.1), (6.2, -1.1), mark: (end: ">"))
  content((6.2, 0), [$p_i$], anchor: "west")
  content((6.85, 0), [#text(size: 9pt)[infinite cyclic#linebreak()cover]], anchor: "west")
  line((0, 0), (6.2, -1.1), mark: (end: ">"))
  content((3.1, -0.55), [$f_i$], anchor: "north")
  content((2.85, -1.85), [#text(size: 9pt)[$s(A_i)<s(A_{i+1}) lt.eq s(F)$]])
})
