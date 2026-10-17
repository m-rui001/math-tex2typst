#set page(margin: 1cm)
#set figure(numbering: "1")

== shape one: two labels after the figure

#figure([one], caption: [Cap one]) <s1:a> <s1:b>

page of s1:a = #context counter(page).at(<s1:a>).first()
page of s1:b = #context counter(page).at(<s1:b>).first()

== shape two: label inside the figure content

#figure([#label("s2:c") two], caption: [Cap two]) <s2:d>

page of s2:c = #context counter(page).at(<s2:c>).first()
page of s2:d = #context counter(page).at(<s2:d>).first()

== shape three: first name on a wrapper block, second on the figure

#block[<s3:a> #figure([three], caption: [Cap three]) <s3:b>]

page of s3:a = #context counter(page).at(<s3:a>).first()
page of s3:b = #context counter(page).at(<s3:b>).first()

== shape four: second name on an empty box in front of the figure

#figure([#box(width: 0pt, height: 0pt)<s4:a> four], caption: [Cap four]) <s4:b>

page of s4:a = #context counter(page).at(<s4:a>).first()
page of s4:b = #context counter(page).at(<s4:b>).first()
