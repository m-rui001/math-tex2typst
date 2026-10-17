// Does Typst print the braces of a subscript group? Plain markup only, no drawing library, so the
// answer cannot come from anything but the math parser.
#set page(width: 10cm, height: 5cm)
#set text(font: "New Computer Modern")

one: $a_{0}$ $a_{12}$

two: $a_0$ $a_12$

three: [#box[$a_{0}$]] and [#box[text[$a_{0}$]]]
