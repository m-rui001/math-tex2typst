#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((7.9, 8), [#text(size: 9pt)[On $Omega^ compose$: $"W=u^2-|X|_g^2>0"$, $lambda = "sqrt" W$.]], anchor: "south")
  content((3.65, 7.53), [#text(size: 9pt)[$"u|_S>0"$]], anchor: "south")
  content((12.15, 7.53), [#text(size: 9pt)[$"u|_S=0"$]], anchor: "south")
  content((3.65, 6.88), [#box(width: 7.002cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Original collar $(W,y)$#linebreak()$W$ is a smooth boundary defining function.]]])])
  content((12.15, 6.88), [#box(width: 7.001cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Original collar $( sigma_0,y)$#linebreak()$u= sigma_0a$, $X= sigma_0^2Y$, $"a|_S= kappa"$.]]])])
  content((3.65, 4.91), [#box(width: 7.002cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Attached base collar $( lambda ,y)$#linebreak()New smooth structure.#linebreak()$h_s$ is smooth in the attached collar.]]])])
  content((12.15, 4.91), [#box(width: 7.001cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt), fill: rgb("#f7f7f7"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Attached base collar $( lambda ,y)$#linebreak()Original smooth structure retained.#linebreak()$A_s$ is smooth up to $S$.]]])])
  line((3.65, 4.91), (3.65, 6.88), stroke: (paint: rgb("#595959"), thickness: 0.6pt))
  content((3.65, 5.895), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$W= lambda^2$])])
  line((12.15, 6.88), (12.15, 4.91), stroke: (paint: rgb("#595959"), thickness: 0.6pt))
  content((12.15, 5.895), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [retain the collar])])
  content((7.899, 2.96), [#box(width: 14.9cm, inset: 0.3333em, stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt), fill: rgb("#f0f0f0"), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[Both attachments: $"h_s|_TS=g|_TS"$, $"lambda |_S=0"$, $"| dd lambda |_{h_s}|_S= kappa >0"$.#linebreak() Vacuum reduction and global uniqueness#linebreak()$A_s= "dd" Phi$, $T=z- Phi$; the original interior slice is the graph $T=- Phi$.]]])])
  line((3.65, 4.91), (3.65, 3.79), stroke: (paint: rgb("#595959"), thickness: 0.6pt))
  line((12.15, 4.91), (12.15, 3.79), stroke: (paint: rgb("#595959"), thickness: 0.6pt))
  content((3.65, 0.38), [#box(width: 7.002cm, inset: 0.3333em, stroke: (thickness: 0.5pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$v=T+r_*$ is smooth on the original slice.#linebreak()$S "longmapsto" "bigl" (v(y),r_h, theta (y) "bigr" )$#linebreak() Full future horizon section]]])])
  content((12.15, 0.38), [#box(width: 7.001cm, inset: 0.3333em, stroke: (thickness: 0.5pt), [#set text(hyphenate: false); #align(center)[#text(size: 9pt)[$T=- Phi$ is smooth; use $( "mathsf" U, "mathsf" V, theta )$.#linebreak()$S "longmapsto" "bigl" (0,0, theta (y) "bigr" )$#linebreak() Bifurcation sphere]]])])
  line((3.65, 2.12), (3.65, 0.38), stroke: (paint: rgb("#595959"), thickness: 0.6pt))
  content((3.65, 1.25), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [ingoing coordinates])])
  line((12.15, 2.12), (12.15, 0.38), stroke: (paint: rgb("#595959"), thickness: 0.6pt))
  content((12.15, 1.25), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [Kruskal coordinates])])
})
