#set text(lang: "en", size: 11pt)
#set math.equation(numbering: none)

= Test A: manual number on right

$ x = y $ #h(2em) "(1)"

= Test B: math.equation function with numbering

#math.equation(numbering: "(1)", $ y = z $)

= Test C: set inside display via show rule

#set math.equation(numbering: "(1)")
#show math.equation: it => it

Display A (should be numbered):
$ a = 1 $

Display B (should be numbered):
$ b = 2 $ <eq:b>
