#import "@preview/cetz:0.5.0"
#set page(width: 200pt, height: 200pt, margin: 10pt)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [LOWER-Y])
  content((0, 2), [HIGHER-Y])
  line((4, 0), (4, 2))
})
