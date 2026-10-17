#import "@preview/cetz:0.5.2"
#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)
#lorem(340)
#figure(
  [#block(cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 15), stroke: red)
  rect((0, 0), (10, 15))
}))
  #lorem(20)],
  caption: [Figure 2: BETA-CAPTION-SHOULD-SURVIVE. #lorem(30)],
)
#lorem(200)
#lorem(200)