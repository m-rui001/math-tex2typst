#set page(numbering: "1")
A first page.
#pagebreak()
#label("target")Text on the second page.
Counter: #context counter(page).at(<target>).first()
