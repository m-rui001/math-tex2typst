#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)
[#cetz.canvas({
  import cetz.draw: *
   set text(size: 9pt)
  content((0, 0), [#box(width: 3.082cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center)[Reset#linebreak()\(t\[2,5\]\)#linebreak()\(v'\_=0\)]])])
  content((3.432, 0), [#box(width: 3.082cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center)[Preparation#linebreak()\(t\(8,12\)\)#linebreak()add $U_ ell (t,z)$]])])
  content((6.865, 0), [#box(width: 3.083cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), fill: rgb("#fff5eb"), [#set text(hyphenate: false); #align(center)[Possible delay#linebreak()\(t\(48,52\)\)#linebreak()speed set by $z$]])])
  content((10.3, 0), [#box(width: 3.084cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#595959")), fill: rgb("#f2f2ff"), [#set text(hyphenate: false); #align(center)[Readout#linebreak()\(t\(74,80\)\)#linebreak()add aligned terms to $z^2$]])])
  line((0, 0), (3.432, 0), mark: (end: ">"))
  line((3.432, 0), (6.864, 0), mark: (end: ">"))
  line((6.864, 0), (10.3, 0), mark: (end: ">"))
  line((3.432, -0.45), (10.3, -0.45), stroke: (paint: rgb("#262626")))
  content((6.864, -0.45), [$a(t)=L$ throughout preparation, delay and readout], anchor: "north")
})