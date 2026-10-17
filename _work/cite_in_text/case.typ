#set page(width: 130pt, height: auto, margin: 4pt)
#bibliography("refs.bib", style: "ieee")

Equation with a citation moved out of its text run:

$ "row" #h(2em) #cite(label("Dickson2014"), supplement: [Lemma 2.9, Equation (19)]) . quad "(1)" $

$ bold("phi") <= #cite(label("Pisier1999")) $

#bibliography("refs.bib")
