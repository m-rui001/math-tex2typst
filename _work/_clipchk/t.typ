#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 420pt, height: 320pt)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.552cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Finite FK comparisons#linebreak()rectangles and sectors]]])])
  content((5, 0), [#box(width: 3.552cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Localization and#linebreak()separated crosscuts]]])])
  content((10, 0), [#box(width: 3.556cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Finite row algebra#linebreak()six-vertex pressure]]])])
  content((2.5, -1.8), [#box(width: 3.552cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Irregular-disk estimates#linebreak()and screening]]])])
  content((10, -1.8), [#box(width: 3.556cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Physical current#linebreak()estimate]]])])
  content((2.5, -3.6), [#box(width: 3.552cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Positive local#linebreak()weights and#linebreak()signed charges]]])])
  content((7.5, -3.6), [#box(width: 3.552cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Observable convergence#linebreak()and crossing formula]]])])
  content((7.5, -5.4), [#box(width: 3.552cm, inset: 0.3333em, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Moving domains#linebreak()and SLE curve#linebreak()convergence]]])])
  line((0.6944, -0.5), (1.806, -1.3), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((4.306, -0.5), (3.194, -1.3), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((10, -0.5), (10, -1.3), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((4.276, -1.8), (8.224, -1.8), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((2.5, -2.3), (2.5, -3.1), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((4.276, -3.6), (5.724, -3.6), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((9.306, -2.3), (8.194, -3.1), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((7.5, -4.1), (7.5, -4.9), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((0.7236, -1.8), (-2.2, -1.8), (-2.2, -5.4), (5.724, -5.4), stroke: (thickness: 0.7pt), mark: (end: ">"))
})