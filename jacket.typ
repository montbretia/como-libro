#let pat = tiling(size: (7pt, 40pt))[
  #place(line(stroke: 0.7pt + rgb("#461abe"), start: (0%, 0%), end: (100%, 100%)))
]


#context [

  #align(center+horizon)[
    #set page(fill: rgb("#303f9f"))
    #place(center, rect(width: 200%, height: 200%, fill: pat))
    #set text(white)

    #v(-2em)
    #text(style: "italic", weight: "bold", size: 28pt)[¿CÓMO?]

    #set text(font: "Jost*")
    #text(style: "italic", weight: "regular", size: 13pt)[una introducción a\ la epistemología\ del saber cómo]

      #align(center+bottom)[


        #v(2em)

        #text(size: 13pt)[Felipe Morales Carbonell]

              
        #v(2em)
        #image(width: 0.4in, "images/montbretia.png")
        #text(size: 8pt)[montbretia]
      ]
  ]
]

#pagebreak(to: "odd")
