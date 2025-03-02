#set heading(numbering: none)

#set text(costs: (hyphenation: 50%))

// to italicize titles in notes
#let italics_regex = regex("★.*_(.*)_")

#show italics_regex: it => {
  let content = it.text.match(italics_regex).captures.first()
  [★ En español: #emph(content)]
}

#bibliography(style: "bib/apa-annotated-bibliography.csl",
full: true,
(
  "bib/general.bib",
  "bib/mapuche.bib",
))

#set page(numbering: none)
#pagebreak(to: "even")

#place(center+horizon)[
  #v(2em)

  Santiago, Chile

  #v(1em)

  #datetime.today().display("[day]-[month]-[year]")
]
