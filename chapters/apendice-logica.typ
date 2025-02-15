#import "../utils.typ": question
#import "../logic.typ": fitch, fitch-r

#[
  #set heading(numbering: none)
  #set enum(numbering: "1)")
  #set table(stroke: 0.5pt + black.lighten(80%))
  #show terms.item: it => {
    set text(size: 10pt)
    block(width: 100%, stroke: 0.5pt + black.lighten(80%), fill:
    black.lighten(95%), inset: 1em, breakable: false, radius: 5pt)[
      #it
    ]
  }

= Apéndice A: Lógica

Este apéndice es un breve recordatorio de algunas las ideas básicas de lógica
que hemos usado en este libro, así como una explicación de la manera en que
hemos formalizado algunos argumentos.

== Lógica proposicional

Una _proposición_ es algo que tiene un _valor de verdad_. En la lógica clásica, el
valor de verdad de una proposición puede ser verdadero o falso. Se puede construir
proposiciones a partir de otras proposiciones mediante la aplicación de ciertos
_operadores lógicos_. Por ejemplo:

+ Sofía ama a Manuel
+ Manuel ama a Gloria
+ Gloria ama a Sofía

pueden combinarse de distintas maneras:

#set enum(start: 4)
+ Sofía ama a Manuel _y_ Gloria ama a Sofía.
+ _Si_ Manuel ama a Gloria, _o_ Gloria ama a Sofía
+ Manuel ama a Gloria _o no es el caso_ que Manuel ama a Gloria

#question[Intuitivamente, ¿en qué casos son verdaderas (4), (5), y (6)?]

En lógica proposicional, en vez de referirnos a proposiciones
particulares, empleamos un lenguaje formal que las representa mediante variables
proposicionales ($p, q, r...$), y en vez de usar expresiones como "y", "si...
entonces...", empleamos símbolos lógicos ($and$, $->$, etc.)

El lenguaje de la lógica proposicional puede definirse recursivamente:

/ Sintaxis del lenguaje $L_P$: Una _fórmula bien formada_ (fbf) de
 $L_P$ es:
 - Una proposición atómica: $p,q, r...$
 - Una negación: si $p$ es una fbf, $not p$ es una fbf (se lee: "no es el caso
   que $p$")
 - Una conjunción: si $p$ y $q$ son fbfs, $p and q$ es una fbf (se lee: "$p$ y
   $q$")
 - Una disjunción: si $p$ y $q$ son fbfs, $p or q$ es una fbf (se lee: "$p$ o
   $q$")
 - Un condicional: si $p$ y $q$ son fbfs, $p -> q$ es una fbf (se lee: "si $p$,
   entonces $q$")
 - Un bicondicional: si $p$ y $q$ son fbfs, $p <-> q$ es una fbf (se lee: "$p$
   si y solo si $q$")

Una asignación de valores de verdad o _valuación_ asigna un valor a una
proposición. 

Dado un número $n$ de proposiciones atómicas, existen $2^n$ valuaciones
posibles. Por ejemplo, para (1) y (2) las combinaciones son:

#figure[
  #table(columns: 1, rows: 4,
  [(1): $v$, (2): $v$], [(1): $v$, (2): $f$],
  [(1): $f$, (2): $v$], [(1): $f$, (2): $f$],
)
]

El valor de verdad de las proposiciones complejas en el lenguaje depende del
valor de las proposiciones básicas de las que estén construidas y de las reglas
que gobiernan a los operadores lógicos. Estas pueden resumirse en la siguiente
tabla (las primeras 2 columnas representan las valuaciones posibles de $p$ y $q$):

#figure[
  #set table(fill: (x, y) => if y == 0 {black.lighten(90%)})

  #table(columns: 7, rows: 5,
  [$p$], [$q$], table.vline(stroke: black), [$not p$], [$p and q$], [$p or q$], [$p -> q$], [$p <-> q$],
  [$v$], [$v$], [$f$],     [$v$],       [$v$],      [$v$],      [$v$],
  [$v$], [$f$], [$f$],     [$f$],       [$v$],      [$f$],      [$f$],
  [$f$], [$v$], [$v$],     [$f$],       [$v$],      [$v$],      [$f$],
  [$f$], [$f$], [$v$],     [$f$],       [$f$],      [$v$],      [$v$],
)
]

Por ejemplo, si asignamos verdad a (1), y falsedad a (2), intuitivamente (4) no
podría ser verdadera; tendría que ser falsa. Sabemos que en este caso, (4) es la
conjunción de (1) y (2), esto es, que tiene la forma $p and q$. La tabla nos
confirma la intuición: cuando $p$ es verdadera y $p$ es falsa, la conjunción $p
and q$ es falsa.

Podemos definir el resultado de aplicar una valuación a una estructura
proposicional recursivamente:

/ Semántica para $L_P$:
  - Para las proposiciones atómicas, la asignación de valores de verdad es
    primitiva (pero se asigna un valor a cada proposición).
  - $v(not p) = v$ si y solo si $v(p) = f$ 
  - $v(p and q) = v$ si y solo si $v(p) = v$ y $v(q) = v$ 
  - $v(p or q) = v$ si y solo si $v(p) = v$ o $v(q) = v$ 
  - $v(p -> q) = v$ si y solo si $v(p) = f$ o $v(q) = v$ 
  - $v(p <-> q) = v$ si y solo si $v(p) = v(q)$ 

Dado un conjunto de valuaciones $V$, una fórmula puede ser _consistente_ si hay
una valuación $in V$ que la hace verdadera, _contradictoria_ si ninguna
valuación $in V$ la hace verdadera, y _tautológica_ si toda valuación $in V$ la
hace falsa (en realidad, siempre nos interesan todas las valuaciones posibles,
así que podemos simplificar esto y omitir $V$). Lo interesante de esto es que
si una fórmula es tautológica es una cuestión meramente formal: el contenido de
las proposiciones no importa. Por ejemplo, $p -> p$ es una tautología, y su
verdad no depende de qué signifique $p$. $p$ podría ser "está lloviendo", o "el
agua es $H_2O$", o cualquier otra cosa, y eso no cambiaría su valor de verdad.

Por dar otros ejemplos: $ p and not q $ es consistente, porque hay una valuación que la
hace verdadera; $ p and not p $ es contradictoria, y $ p or not p $ es
tautológica. #question[Confirme esto usando la tabla.]

Más que las propiedades de estructuras proposicionales, nos interesan las
propiedades de _argumentos_. Un argumento es un conjunto de premisas de las cuales
se deriva una conclusión. En la lógica clásica, tanto las premisas como la conclusión son
proposiciones. Un argumento _válido_ es uno en el que las premisas no pueden ser
verdaderas y la conclusión falsa. Por ejemplo,

#fitch(ratio: (6fr, 2fr))[
+ José ama a María (premisa)
+ Si José ama a María, su amor no es correspondido (premisa)
+ El amor de José no es correspondido (conclusión)
]

es un argumento válido; no hay ningún caso en que las premisas sean verdaderas y
la conclusión falsa. Podemos chequear esto semánticamente: en este caso, basta
ver que no hay ninguna valuación de las premisas que haga falsa la conclusión.
La premisa (1) y la conclusión son proposiciones atómicas: $p$ y $q$. La premisa
(2) es una proposición compleja, un condicional de la forma $p -> q$. 
Tabulamos:

#figure[
  #set table(fill: (x, y) => if y == 0 {black.lighten(90%)})
  #table(columns: 5, rows: 5,
  [$p$], [$q$], table.vline(stroke: black), [$p$], [$p -> q$], table.vline(stroke: black), [$q$],
  [$v$], [$v$], [$v$], [$v$], [$v$],
  [$v$], [$f$], [$v$], [$f$], [$f$],
  [$f$], [$v$], [$f$], [$v$], [$v$],
  [$f$], [$f$], [$f$], [$v$], [$f$],
)
]

Ahora bien, las premisas de un argumento forman algo así como una conjunción: el
conjunto de premisas es verdadero si ninguna premisa es falsa. Entonces,
asignando al conjunto de las premisas el valor de su conjunción:

#figure[
  #set table(fill: (x, y) => if y == 0 {black.lighten(90%)})
  #table(columns: 4, rows: 5,
  [$p$], [$q$], table.vline(stroke: black), [{$p$, $p -> q$}], table.vline(stroke: black), [$q$],
  [$v$], [$v$], [$v$], [$v$],
  [$v$], [$f$], [$f$], [$f$],
  [$f$], [$v$], [$f$], [$v$],
  [$f$], [$f$], [$f$], [$f$],
)
]

Vemos que no hay ninguna valuación en que el conjunto de premisas sea
verdadero y la conclusión falsa.

Para apreciar mejor esto, tomen un argumento inválido; por ejemplo, una
instancia de la falacia de afirmar el consecuente: "$p -> q$, y $q$, así que
$p$".

#figure[
  #set table(fill: (x, y) => if y == 0 {black.lighten(90%)})
  #table(columns: 5, rows: 5,
  [$p$], [$q$], table.vline(stroke: black), [$q$], [$p -> q$], table.vline(stroke: black), [$p$],
  [$v$], [$v$], [$v$], [$v$], [$v$],
  [$v$], [$f$], [$f$], [$f$], [$v$],
  [$f$], [$v$], [$v$], [$v$], [$f$],
  [$f$], [$f$], [$f$], [$v$], [$f$],
)
]

Aquí tenemos:

#figure[
  #set table(fill: (x, y) => {
    if y == 0 {black.lighten(90%)}
    if y == 3 {red.lighten(90%)}
    }
    )
  #table(columns: 4, rows: 5,
  [$p$], [$q$], table.vline(stroke: black), [{$q$, $p -> q$}], table.vline(stroke: black), [$p$],
  [$v$], [$v$], [$v$], [$v$],
  [$v$], [$f$], [$f$], [$v$],
  [$f$], [$v$], [$v$], [$f$],
  [$f$], [$f$], [$f$], [$f$],
)
]

En este caso, sí hay una valuación que hace el conjunto de premisas verdadero y
la conclusión falsa. Por lo tanto, el argumento es inválido.

Esto sugiere que una manera de mostrar que un argumento es válido es mostrar que
ninguna valuación que haga falsa la conclusión puede ser consistente (y al
revés, para mostrar que un argumento es inválido basta con mostrar que una
valuación que haga falsa la conclusión es consistente).

Podemos simplificar el proceso de evaluación de la validez semántica de la
siguiente manera. En vez de construir la tabla completa, construye una tabla con
las premisas y la conclusión, en la que se asigne $f$ a la conclusión, y $v$ a
las premisas. Por ejemplo, para el argumento con premisas $p or q$ y $not p$ y
conclusión $q$:

#figure[
  #set table(fill: (x, y) => if y == 0 {black.lighten(90%)})
  #table(columns: 6,
  [$p$], [$or$], [$q$], table.vline(stroke: black), [$not$], [$p$], table.vline(stroke: black), [$q$],
  [?], [$v$], [?], [$v$], [?], [$f$],
  )
]

Partimos asignando valores a los átomos. Sabemos que $q$ tiene que ser $f$ en
todas las instancias, y que $p$ tiene que ser falso porque su negación es
verdadera:

#figure[
  #set table(fill: (x, y) => if y == 0 {black.lighten(90%)})
  #table(columns: 6,
  [$p$], [$or$], [$q$], table.vline(stroke: black), [$not$], [$p$], table.vline(stroke: black), [$q$],
  [?], [$v$], [$f$], [$v$], [$f$], [$f$],
  )
]

$p$ tiene que ser falso, pero la primera premisa ($p or q$) tiene que ser
verdadera. Pero entonces, $p$ tiene que ser $v$ en esa premisa, porque la
premisa tiene que ser verdadera. Pero eso está en conflicto con la otra
asunción. Esto significa que no hay ningúna valuación consistente que haga las
premisas verdaderas y la conclusión falsa. El argumento es válido.

#question[Chequee lo que pasa cuando aplica este método a un argumento inválido.]

#v(1em)

Hay otra manera de mostrar que un argumento es válido, que consiste en derivar
la conclusión de las premisas mediante la aplicación de ciertas reglas. Esta es
la concepción sintáctica de la validez. Para ello necesitamos un sistema de
pruebas. Hay varias maneras de presentar un sistema de pruebas, pero el que
empleamos aquí es una forma de deducción natural a la manera de Fitch, aunque
simplificado.

En este sistema de pruebas, tenemos reglas para cada operador lógico,
que nos indican cuando introducir o eliminar una aplicación de estos operadores.
Por ejemplo, para la conjunción la regla es que si tenemos $p$ como premisa, y
tenemos $q$ como premisa, podemos introducir una conjunción $p and q$:

/ Conjunción (introducción):
  #fitch[
  + $p$
  + $q$
  + $p and q$ (1, 2 conj. intro)
  ]

Esto simplemente se sigue del hecho de que si el valor de $p$ es verdadero y el
valor de $q$ es verdadero, el valor de $p and q$ es verdadero. Conversamente, si
tenemos $p and q$, podemos derivar $p$ y podemos derivar $q$:

/ Conjunción (eliminación):
  #fitch[
    + $p and q$
    + $p$ (1 conj. elim izq)
    + $q$ (1 conj. elim der)
  ]

Para la disjunción tenemos que si $p$ es verdadero, podemos construir una
disjunción con otra variable arbitraria:

/ Disjunción (introducción):
  #fitch[
  + $p$
  + $p or q$ (1 disj. intro der)
  + $q or p$ (1 disj. intro izq)
  ]

Para eliminar una disjunción, el razonamiento es más complicado. Si tenemos una
disjunción, y tenemos de que cada uno de los disjuntos se sigue lo mismo,
podemos derivar lo que se sigue de los disjuntos:

/ Disjunción (eliminación):
  #fitch[
    + $p or q$
    + $\ [p]\ dots.v \ r$
    + $\ [q]\ dots.v \ r$
    + $r$ (1/2/3 disj. elim)
  ]

Este tipo de razonamiento puede llamarse _razonamiento por casos_, y es de gran
importancia. Es importante notar que esta regla introduce dos sub-pruebas, una
para cada disjunto. 

#question[Trate de probar $p or q, p -> r, q -> s tack r or s$]

Para el condicional, es más sencillo comenzar con la regla de eliminación, que
es conocida también como _modus ponens_:

/ Condicional (eliminación):
  #fitch[
    + $p -> q$
    + $p$
    + $q$ (1, 2 cond. elim. mp)
  ]

La regla de introducción dice que si de una suposición de $p$ puede derivarse
que $q$, se puede derivar $p -> q$. Cuando aplicamos esta regla, descartamos la
suposición:

/ Condicional (introducción):
  #fitch[
    + $\ [p]\ dots.v \ q$
    + $(p -> q)$ (1 cond. intro)
  ]

Este tipo de razonamiento es extremadamente importante en la argumentación
filosófica. Recuerden que a menudo los modelos filosóficos son conjuntos de
tesis (capítulo 2). Haciendo suposiciones, podemos examinar lo que se sigue de
esas tesis bajo esas suposiciones.

Para el bicondicional tenemos como regla de introducción que, si podemos derivar
$q$ de $p$ y $p$ de $q$, podemos derivar $p <-> q$:

/ Bicondicional (introducción):
  #fitch[
  + $\ p\ dots.v \ q$
  + $\ q\ dots.v \ p$
  + $p <-> q$ (1, 2, bicond. intro)
  ]

Y para la eliminación, un equivalente al _modus ponens_:

/ Bicondicional (eliminación A):
  #fitch[
    + $p <-> q$
    + $p$
    + $q$ (1, 2 bicond. elim a)
  ]

y además:

/ Bicondicional (eliminación B):
  #fitch[
    + $p <-> q$
    + $q$
    + $p$ (1, 2, bicond. elim b)
  ]

Para la negación, tenemos como regla de eliminación:

/ Negación (eliminación):
  #fitch[
    + $not not p$
    + $p$ (1, neg elim)
  ]

Y para introducir negaciones, una regla que dice que si se de una proposición se
puede derivar una contradicción, esa proposición es falsa. La premisa que se
niega puede ser descartada, de manera similar a lo que sucedía en la regla de
introducción del condicional. A esta forma argumental se le llama _reductio_:

/ Negación (introducción):
  #fitch[
    + $\ [p]$
    + $\ dots.v\  q$
    + $not q$
    + $bot$
    + $not p$ (1, 2 reductio)
  ]

Como regla derivada de estas, tenemos:

/ Negación (eliminación B):
  #fitch[
  + $\ [not p]$
  + $\ dots.v\  q$
  + $not q$
  + $bot$
  + $not not p$ (1, 2 reductio)
  + $p$ (5, neg elim)
  ]

Vamos a permitir que si algo puede tomarse como verdadero, lo podemos _reiterar_
en cualquier paso de la prueba posterior.

#pagebreak()

Con estas reglas podemos construir cualquier prueba para la lógica
proposicional. Por ejemplo, podemos probar que $(p and q) and r$ se sigue de $p
and (q and r)$:

#fitch[
+ $p and (q and r)$
+ $p$ (1, conj. elim)
+ $(q and r)$ (1, conj. elim)
+ $q$ (3, conj. elim)
+ $r$ (3, conj. elim)
+ $p and q$ (2,4 conj. intro)
+ $(p and q) and r$ (6,5 conj. intro)
]

Como un ejemplo de una prueba en que usamos la regla de reiteración, considérese
esta manera de probar que $q -> p$ a partir de la premisa $p$:

#fitch[
  + $p$ (prem)
  + $[q]$ 
  + $p$ (reit.)
  + $(q -> p)$ (2, 3 cond. intro)
]

Podemos ver que ciertas proposiciones pueden probarse sin premisas. Por ejemplo:
$p -> (q -> p)$:

#fitch[
  + $[p]$
  + $[q]$
  + $p$ (reit)
  + $q -> p$ (2,3 cond. intro)
  + $p -> (q -> p)$ (1,4 cond. intro)
]

Estas proposiciones que pueden probarse sin premisas son tautológicas.

Podemos probar que $p or not p$ es una tautología:

#fitch[
  + $[p]$
  + $p or not p$ (1 disj intro der)
  + $[not (p or not p)]$
  + $bot$
  + $not p$ (1,4 neg intro)
  + $p or not p$ (6 disj intro izq)
  + $[not (p or not p)]$
  + $bot$
  + $p or not p$ (3+7,8 neg elim b)

]

Ya que las tautologías pueden probarse sin requerir ninguna premisa, cualquier
tautología puede insertarse en cualquier momento durante cualquier prueba.

Además, de cualquier proposición se siguen todas las fórmulas que son
lógicamente equivalentes. 

Por ejemplo, de $p -> q$ se puede derivar $not p or q$:

#fitch[
  + $p -> q$
  + $p or not p$ (taut)
  + $[p]$
  + $q$ (1,3 mp) 
  + $not p or q$ (4 disj intro izq)
  + $[not p]$
  + $not p or q$ (6 disj intro der)
  + $not p or q$ (2/3,5/6,7 disj elim)
]

Y podemos probar la dirección contraria también:

#fitch[
 + $not p or q$
 + $[not p]$
 + $[p]$
 + $q$ (2,3 neg elim)
 + $p -> q$ (3,4 cond intro)
 + $[q]$
 + $[p]$
 + $q$ (reit)
 + $p -> q$ (7,8 cond intro)
 + $p -> q$ (1/2,5/6,9 disj elim)
]

Así que, por la regla sobre el bicondicional, sabemos que $p -> q <-> not p or
q$; es decir, sabemos que son equivalentes. Por lo tanto en cualquier caso en
que tenemos $p -> q$ podemos derivar $not p or q$. Por ejemplo, al probar que de
las premisas $p -> q$ y $not q$ se deriva $not p$, podemos hacer uso de esa
equivalencia, a modo de atajo:

#fitch[
  + $p -> q$
  + $not q$
  + $not p or q$ (1 equiv)
  + $[not p]$
  + $not p$ (reit)
  + $[q]$
  + $bot$
  + $not p$#footnote[Este paso puede generar un poco de confusión ($p$ no estaba
  supuesto, así que parece salir de la nada). Aquí me
  aprovecho de la idea de que de una conclusión se puede seguir cualquier cosa
  para probar $not p$.] (2,6 neg intro)
  + $not p$ (3/4,5/6,8 disj elim)
]

A este argumento le llamamos _modus tollens_. Que podamos probarlo usando esta
estrategia muestra que podemos tomarlo como un caso especial de un esquema de
argumento que llamamos _silogismo disjuntivo_: $p or q, not p tack q$.

#question[Pruebe que el silogismo disjuntivo es un esquema argumental válido.]

Algunas equivalencias importantes: 

- $not (p and q) equiv not p or not q$ #fitch-r[de Morgan conj]
- $not (p or q) equiv not p and not q$ #fitch-r[de Morgan disj]
- $p -> q equiv -q -> -p$ #fitch-r[contraposición]
- $p and q equiv q and p$ #fitch-r[connmutatividad conj]
- $p or q equiv q or p$ #fitch-r[connmutatividad disj]
- $p and (q and r) equiv (p and q) and r$ #fitch-r[asociación]
- $p or (q and r) equiv (p or q) or r$ #fitch-r[asociación]
- $p and (q or r) equiv ((p and q) or (p and r))$ #fitch-r[distribución]
- $p or (q and r) equiv ((p or q) and (p or r))$ #fitch-r[distribución]
- $p <-> q equiv (p -> q) and (q -> p)$ #fitch-r[bicondicional]
- $p <-> q equiv (p and q) or (not p and not q)$ #fitch-r[bicondicional]


#question[Pruebe todas estas equivalencias, usando el método semántico y el
método sintáctico.]

Además, hay algunas reglas derivadas de inferencia que pueden ser útiles:

- $p -> q, q -> r tack p -> r$ #fitch-r[silogismo hipotético]

- $(p -> q), (r -> s), (p or r) tack (q or s)$ #fitch-r[dilema constructivo]

- $(p -> q) tack p -> (p and q)$ #fitch-r[absorción]

#question[Pruebe la validez de estos esquemas argumentales.]

== Lógica de predicados

Hay argumentos válidos cuya verdad no queda capturada por la lógica
proposicional. Por ejemplo:

#fitch[
  + Sofía ama a Marco, _por tanto_
  + Alguien ama a Marco
]

parece ser válido, pero en términos proposicionales es meramente consistente.
"Sofía ama a Marco" es una proposición distinta a "Alguien ama a Marco", de modo
que su traducción en el lenguaje de la lógica proposicional es $p tack q$. Pero
claramente esto no es válido, porque no todas las asignaciones de proposiciones
posibles hacen verdadero a un argumento de esa forma (considere: "La luna está
hecha de queso, por tanto, iremos a la playa").

Para capturar lo válido de este tipo de argumento tenemos que introducir una
idea nueva, que es que las proposiciones pueden tener estructura interna. "Sofía
ama a Marco" es una proposición distinta a "Marco ama a Sofía" porque dice cosas
distintas de distintos objetos: "Sofía ama a Marco" dice de Sofía, que ella ama
a Marco; y "Marco ama a Sofía" dice de Marco, que él ama a Sofía. Tenemos a dos
individuos y una misma relación (la de que uno de ellos ame al otro).

Podemos expresar eso usando constantes para individuos ($sans(a), sans(b),
sans(c)...$), variables para individuos ($x, y, z...$) y predicados ($F, H, G...$)
para propiedades y relaciones. Así, "Sofía ama a Marco" se formaliza como $A s
m$, y "Marco ama a Sofía", $A m s$. Empleamos los recursos del lenguaje
proposicional para construir expresiones más complejas.

#question[¿Cómo formalizamos que el amor de Sofía a Marco es correspondido, y cómo
formalizamos que el Amor de Marco a Sofía no es correspondido?]

Además, tenemos que extender nuestro lenguaje para tratar con expresiones como
"alguien", "todos", "algún", etc. Estas expresiones son _cuanfiticadores_. Los
cuantificadores siempre tienen que entenderse en relación a un dominio de
objetos. Si decimos "Todos aman a Sofía", quizás digamos algo cierto sobre el
dominio de las personas que la conocen y que sí la aman. Pero si ampliamos el
dominio al conjunto de todas las personas, es probable que encontremos
individuos que no amen a Sofía. Si decimos que alguien no ama a Sofía, esto sera
verdad en el segundo dominio de personas, pero no en el primero. En la lógica de
predicados clásica, hay dos cuantificadores básicos, uno para "todos", el
_cuantificador universal_, que se escribe $forall$ y otro para "algún", el
_cuantificador existencial_, que se escribe $exists$.

Desde el punto de vista sintáctico, los quantificadores nos permiten construir
proposiciones a partir de lo que se llaman _proposiciones abiertas_. En una
proposición abierta como $F x$ un predicado aplica a una variable cuyo valor no
ha sido determinado. Un cuantificador liga la variable y produce una proposición
que puede ser verdadera o falsa. Por ejemplo, de la proposición abierta $F x$
podemos construir $forall x (F x)$ ("todo x es F") y $exists x (F x)$ ("algún x
es F"). Note que el cuantificador va acompañado de la variable que liga. Esto es
importante cuando el cuantificador cubre a más de una variable. Por ejemplo,
$forall x forall y (A x y)$ podría ser verdadero o falso dependiendo de si la
relación que representa $A$ es simétrica o no. Si no es simétrica, el orden
importa.

El argumento original es, entonces:

#fitch[
  + $A s m$ (premisa)
  + $exists x A x m$ (conclusión)
]

Semánticamente, el argumento funciona porque las condiciones de verdad de una
proposición existencialmente cuantificada son las siguientes. Considerando un
dominio $D$ y una asignación de valores $v$:

- $D, v models exists x phi$ si y solo si hay un $x in D$ tal que $phi$ es
 verdadero de $x$.

Por ejemplo, en el dominio $D = {s, m}$, tomando $phi$ como $A s m$, la verdad
de $A s m$ (que depende de la asignación de valores $v$) implica que hay un $x
in D$ (a saber, $s$), tal que $A x m$. A su vez, de $exists x A x m$ se sigue
que $exists y exists x A x y$: en el dominio hay un $y$ tal que hay un $x$ tal
que $A x y$ es verdadero.

Desde un punto de vista sintáctico, esto equivale a la aplicación de lo que
podríamos llamar una regla de introducción para el cuantificador existencial:

/ Cuantificador existencial (introducción):
  #fitch[
  + $phi[c \/ x]$
  + $exists x phi$ (exist intro)
]

$phi [c \/ x]$ representa que en $phi$ se reemplazan las ocurrencias de una
constante $c$ por una variable $x$.

Igualmente simple es la regla de eliminación del cuantificador universal: si
tenemos una fórmula universalmente quantificada, podemos eliminar el
cuantificador simplemente si reemplazamos la variable por una constante
cualquiera. Si todos los objetos de un dominio satisfacen una fórmula, la
instance de esa fórmula que habla de cualquier objeto es verdadera.

/ Cuantificador universal (eliminación): 
  #fitch[
    + $forall x phi$
    + $phi[x\/c]$ (univ elim)
  ]

Todos hemos visto ejemplos de esto: 

#fitch[
  + Todos los números son primos o no primos
  + El número 3 es primo o no primo
]

Formalmente: 

#fitch[
  + $forall x (P x or not P x)$
  + $P t or not P t$
]

La regla se ajusta a las condiciones de verdad de las proposiciones
universalmente cuantificadas. Dado un modelo $D$ y asignación de valores $v$:

- $D, v models forall x phi$ si y solo si todo $x in D$ es tal que $phi$ es
 verdadero de $x$.

La regla de introducción del cuantificador universal codifica la siguiente idea:
si tomamos un elemento arbitrario del dominio y probamos que algo es verdadero
sobre él, entonces todos los elementos de ese dominio satisfacen esa condición.

/ Cuantificador universal (introducción): 
  #fitch[
    + $phi[c]$
    + $forall x phi$ (univ intro)
  ]
  Con la restricción de que $c$ sea arbitrario.

Por ejemplo, el argumento:

#fitch[
 + El número 10 es o bien par o impar
 + Todo número es o bien par o impar
]

tiene esta estructura. Por supuesto, esto no es una prueba matemáticamente
válida de que todo número es par o impar. Para obtener eso se necesita una
prueba de que el número 10 es arbitrario.

Finalmente, hay una regla de eliminación para el cuantificador existencial, que
añade bastante más complejidad. La idea es que si se tiene una premisa
existencial, si se puede derivar una proposición dada de la suposición de que un
objeto dado del dominio tiene ciertas propiedades, sin hacer más suposiciones
acerca de ese objeto (es decir, si la elección del objeto es arbitraria),
podemos derivar esa proposición de la premisa existencial. Por ejemplo:

#fitch[
  + $exists x (P x and Q x)$
  + $forall x (Q x -> R x)$
  + $P a and Q a$
  + $Q a$ (conj elim)
  + $Q a -> R a$ (2, univ elim)
  + $R a$ (4,5 mp)
  + $exists x R x$ (6 exist intro)
  + $exists x R x$ (1/3,7 exist elim)
]

Aquí sabemos que hay algo que es tanto $P$ como $Q$, y sabemos que si algo es
$Q$, entonces es $R$. Hacemos la suposición de que $a$ es $P$ y $Q$, y a partir
de eso derivamos que hay algo que es $R$. Finalmente, descartamos la suposición
y derivamos que hay algo que es $R$.

La regla es: 

/ Cuantificador existencial (eliminación): 
  #fitch[
    + $exists x phi$
    + $\ phi[x\/c]\ dots.v\ xi$
    + $xi$ (exist elim)

  ]
  $c$ no puede aparecer en $xi$.

Algunas equivalencias útiles que son probables con estas reglas son:

+ $forall x phi equiv not exists x not phi$
+ $exists x phi equiv not forall x not phi$
+ $forall x not phi equiv not exists x phi$
+ $exists x not phi equiv not forall x phi$ 
+ $forall x(phi and psi) equiv forall x(phi) and forall x(psi)$
+ $exists x(phi or psi) equiv exists x(phi) or exists x(psi)$

#question[Pruebe estas equivalencias.]

Un elemento adicional que es útil en los lenguajes de primer orden es el de las
_funciones_. Una función tiene la función sintáctica de los nombres, pero en vez
de ser constante, su valor depende de ciertos valores que se le dan como
argumentos. Por ejemplo, podríamos tener una función $"sum"(x, y)$ cuyo valor
sea la suma de $x$ e $y$. Para lidiar con funciones, tenemos que ajustar un poco
las reglas de los cuantificadores, pero en efecto funcionan de la misma manera
que los predicados--la diferencia está en que mientras un predicado "toma" como
argumentos una serie de objetos y produce un valor de verdad, una función puede
producir un valor de otro tipo.

#fitch[
  + $forall x forall y ("sum"(x, y) = "sum"(y, x))$
  + $forall y ("sum"(1, y) = "sum"(y, 1))$ (univ elim)
]

También es conveniente añadir al lenguaje de primer orden de la lógica de predicados un
elemento adicional, el signo de identidad. Esto nos permite decir cosas como que
"Gabriela Mistral es Lucila Godoy" o "la estrella de la tarde es la estrella de
la mañana", donde se expresa que distintos nombres refieren al mismo objeto. El
comportamiento lógico de la identidad es el esperable. Si tenemos una fórmula
donde aparece la constante $c$, y sabemos que $c = d$, podemos derivar una
versión de la fórmula donde $c$ ha sido reemplazada por $d$:

#fitch[
  + Lucila Godoy es chilena (premisa)
  + Lucila Godoy es Gabriela Mistral (premisa)
  + Gabriela Mistral es chilena (conclusión)
]

Formalmente:

#fitch[
  + $C l$
  + $l = g$
  + $C g$ (ident elim)
]

Adicionalmente, todo es idéntico a sí mismo. Podemos probar esto usando una
regla que nos diga que siempre podemos suponer que, para alguna constante $c$,
$c=c$. Esta suposición tiene que descargarse inmediatamente:

#fitch[
  + $[a = a]$
  + $forall x (x = x)$ (univ intro)
]

#question[Considere el siguiente argumento:

#fitch(ratio: (1fr, 0fr))[
  + Louis Lane cree que Superman es fuerte
  + Clark Kent es Superman
  + Louis Lane cree que Clark Kent es fuerte
]

¿Intuitivamente, es válido o no este argumento? ¿Por qué?

]

#[

#set heading(outlined: false)

== Lecturas recomendadas

Una introducción excelente a la lógica proposicional y de predicados es _The
Logic Manual_ (2010) de Volker Halbach. Una introducción similar, pero más
detallada, es _How Logic Works: A User's Guide_ (2020), de Hans Halvorson.
Otra introducción de mi gusto es _Formal Logic: Its Scope and Limits_, de
Richard Jeffrey (una diferencia con las otras, es que este libro usa el método
de los árboles analíticos como sistema de prueba). En español, el libro _Lógica
para Principiantes_ (2004) de María Manzano y Antonia Huertas es bueno.

El uso filosófico de la lógica no se limita a lenguajes de primer order como los
que describimos aquí. Una clase de lógicas importante filosóficamente es la
lógica modal, que trata de operadores como "es posible que" y "es necesario
que". Estos operadores producen proposiciones a partir de proposiciones, pero no
pueden definirse en términos veritativo-funcionales: algo puede ser falso, y sin
embargo ser posible. Una idea común para dar sentido a esto es que si bien ago
puede ser falso en el mundo actual, podría ser verdadero en un mundo posible que
represnta una manera en que el mundo actual podría haber sido. El libro _Modal
Logics and Philosophy_ (2009) de Rod Girle es una introducción amigable.

_An Introduction to Philosophical Logic_ (2021) de John McFarlane es una buena
presentación de varias lógicas de interés filosófico, así como de varios
problemas filosóficos sobre la lógica. _An Introduction to Non-Classical Logic_
(2008) de Graham Priest, es un recurso valiosísimo que cubre muchísimas de las
lógicas de interés filosófico.

La construcción de buenos argumentos en un sentido amplio va más allá que el
mero uso de métodos lógicos. Un buen libro introductoria a la teoría de la
argumentación es el conciso libro de Anthony Weston, _A Rulebook for Arguments_
(#cite(<Weston2018>, form: "year")).

]

] // context
