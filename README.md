# natural-language-compiler

## Description

This natural language compiler translates words, phrases, and sentences from a subset of English into their lambda calculus and predicate logic representations (and determines their semantic types). 

[Link to Paper]()

## Table of Contents
- [Predicate Logic](#predicate-logic)
- [Lambda Calculus](#lambda-calculus)
- [Toy Language](#toy-language)
- [Implementation](#implementation)
- [Installation](#installation)
- [Usage](#usage)

## Predicate Logic
Predicate logic is a formal logical language whose vocabulary includes individual constants, individual variables, predicates, logical operators, and quantifiers. Here are examples of how this system can model natural language sentences:
- Individual constants refer to specific entities
    - $a$ could represent an entity named Alex
    - $b$ could represent an entity named Bob
    - etc.
- Predicates refer to the attributes and actions of individuals
    - $swims(a)$ represents the sentence "Alex swims"
    - $knows(a,b)$ represents "Alex knows Bob"
    - $old(a)$ respresents "Alex is old"
    - etc.
- Logical operators include ¬ (NOT), ∧ (AND), ∨ (OR), → (IF...THEN)
    - $swims(a) ∧ old(a)$ represents "Alex swims and Alex is old"
    - $swims(a) ∨ swims(b)$ represents "Alex swims or Bob swims", i.e. "Either Alex or Bob swims"
    - $old(a) → old(b)$ represents "If Alex is old, then Bob is old"
    - $¬knows(a,b)$ represents "Alex does not know Bob"
- Qauntifiers include $∀$ (for all), $∃$ (there exists) and can be used with individual variables can be used to model more general statements as follows
    - $∀x(swims(x))$ represents "For all $x$, $x$ swims", i.e. "Everyone swims"
    - $∃y(knows(b,y))$ represents "There exists $y$ such that Bob knows $y$", i.e. "Bob knows someone"
    - $∀p(∃q(knows(p,q)))$ represents "For all $p$, there exists $q$ such that $p$ knows $q$", i.e. "Everyone knows someone"
    - $∀p(politician(p)→evil(p))$ represents "For all $p$, if $p$ is a politician then $p$ is evil", i.e. "Every politician is evil"

These logical symbols can all be combined to create complex sentences. For example, consider the PredL sentence

$$∀x(((mathematician(x) ∧ loves(a,x)) → ∃y((filmmaker(y) ∧ swims(y) ∧ hates(x,y))))).$$  

This represents the sentence "For all $x$, if $x$ is a mathematician and Alex loves $x$, then there exists $y$ such that $y$ is a filmmaker, $y$ swims, and $x$ hates $y$". In other words, "Every mathematician that Alex loves hates a filmmaker that swims".

## Lambda Calculus

Predicate logic allows us to model complete sentences, but we can use the lambda calculus to model even more types of phrases. The syntax of the lambda calculus includes all predicate logic sentences as well as new constructions called lambda abstractions and applications:
- Abstractions are of the form [$λx.e$], representing a function that takes $x$ as an input and outputs $e$.
- Applications are of the form $P (Q)$, representing the application of the function $P$ to the input $Q$.

For example, the abstraction [$λx.x+1$] represents a function that takes in a number and returns a number (so its type can be thought of as <number, number>), and the application $[λx.x+1] (2)$ applies the function to $2$, simplifying to $2 + 1 = 3$. 

This project implements a unified semantic model for computing the types and lambda calculus denotations for natural language phrases. As a simple illustration of how lambda calculus can be applied to natural language semantics, consider the sentence "Alex swims". We can represent each word of this sentence as lambda abstractions as follows:
- "Alex" -> $[λP.P(a)]$
- "swims" -> $[λx.swim(x)]$

To obtain the denotation of "Alex swims", we simply apply that of "Alex" to that of "swims", to obtain the lambda application
$$[λP.P(a)] ([λx.swim(x)]).$$
To simplify this expression, we then substitute $[λx.swim(x)]$ into the input variable $P$ of $[λP.P(a)]$, to obtain
$$[λx.swim(x)] (a).$$
Finally, we substitute $a$ into the input variable $x$ of the function, to obstain
$$swim(a).$$
In this way, lambda calculus allows us to determine logical representations of intermediate words and phrases, as well combine them in order to represent compound phrases and eventually sentences. For a full specification of this model, see the paper linked in the project description (or experiment with the compiler to see how different phrases are represented with lambda calculus).

## Toy Language
This project automates the translation of natural language phrases into the formal language of predicate logic and lambda calculus, but translating the entire English language is outside its scope. Instead, we will work with a small subset of English that includes proper nouns, common nouns, determiners, relative clauses, intransitive verbs, transitive verbs, and adjectives. This toy language is formally specified by the following [context-free grammar](https://en.wikipedia.org/wiki/Context-free_grammar):

```
S -> NP VP
NP -> PN | DET CN | DET RCN
VP -> IV | TV NP | is ADJ | is a CN | is a RCN
RCN -> CN that VP | CN that NP TV
CN -> mathematician | filmmaker | lawyer | engineer | ADJ CN
IV -> studies | sleeps | eats | swims
TV -> loves | hates | teaches | knows
ADJ -> clever | sleepy | funny | grumpy
DET -> a | every | some | no
PN -> Alex | Caleb | Christie | Lauren
```

The following table lists the various phrases included in the language and examples of how they can be constructed from the grammar above.

| Phrase Type | Abbreviation | Example|
| - | - | - |
| proper noun | PN | Alex |
| determiner | DET | every |
| adjective | ADJ | clever |
| instransitive verb | IV | swims |
| transitive verb | TV | loves |
| common noun | CN | filmmaker, <br> ADJ CN: funny lawyer |
| relative clause common noun | RCN | CN that VP: mathematician that sleeps, lawyer that loves Lauren <br> CN that NP VP: lawyer that Lauren loves |
| noun phrase | NP | PN: Christie <br> DET CN: every filmmaker <br> DET RCN: a lawyer that swims|
| verb phrase | VP | IV: sleeps <br> TV NP: teaches Caleb <br> is ADJ: is grumpy <br> is a CN: is a filmmaker <br> is a RCN: is a lawyer that eats |
| sentence | S | NP VP: Alex swims |

Observe that this is an infinitely large language, and that we can construct arbitrarily long and complex phrases, such as `Every funny clever mathematician that Alex loves hates a filmmaker that is a lawyer that swims`.

## Implementation
### TODO
- ocaml, lexing and parsing with ocamllex and menhir, uses core library
- explain lexing, parsing, language asts, compiling, lambda ast, lambda calculus interpreter for reduction, various pretty printers, command-line interface
- highlight skills learned + implementation details for a nontechnical audience

## Installation

1. To install `opam`, find platform-specific installation instructions [here](https://opam.ocaml.org/doc/Install.html) OR copy the following into your terminal:
```bash
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
```

2. To initialize opam, run `opam init` and enter `y` when prompted (you should be asked a question similar to `Do you want opam to modify ~/.zshrc? [N/y/f]`).

3. To install the OCaml compiler, run both of the following:
```bash
opam switch create 4.14.1
eval $(opam env)
```

4. To install `core`, a required library, run:
```bash
opam install core
eval $(opam env)
```

5. Finally, to run the program, either
- clone this repo and run with `dune` or `make run`, OR
- download a bytecode executable version of this project [here](https://drive.google.com/file/d/1Z__ZGe8doHst5BGAcg2UhfVKyjmrAbcp/view?usp=sharing) and run with `ocamlrun main.bc`.

## Usage

Running the program launches a command-line interface and prints a set of simple instructions to the terminal:  
<img width="697" alt="Screen Shot 2023-04-26 at 6 32 10 PM" src="https://user-images.githubusercontent.com/63452077/234717096-b2f455ec-d3cf-496d-832f-97b4877d3dc0.png">  
As stated in the instructions, the user can enter `grammar` in order to display the toy language grammar and an example sentence that can be translated:  
<img width="697" alt="Screen Shot 2023-04-26 at 6 20 53 PM" src="https://user-images.githubusercontent.com/63452077/234716106-4c9b5434-da93-41d8-921b-1a894598154a.png">  
When a phrase is entered, the lambda calculus denotation as well as the semantic type of the phrase are printed:  
<img width="697" alt="Screen Shot 2023-04-26 at 6 21 07 PM" src="https://user-images.githubusercontent.com/63452077/234716234-ab3853bf-8c64-421a-9107-3191683b70b8.png">  
Entering a phrase that violates the syntactic rules of the toy language or uses words that are either misspelled or not in the toy language will produce the corresponding error messages (with the latter case taking precedence, so a synactically nonsensical phrase with a misspelled word will produce an invalid word error):  
<img width="697" alt="Screen Shot 2023-04-26 at 6 29 02 PM" src="https://user-images.githubusercontent.com/63452077/234716842-2240337e-b0e5-4c4d-ae06-37e93655442d.png">  
In addition to full sentences, individual words or phrases can also be translated:  
<img width="697" alt="Screen Shot 2023-04-26 at 6 39 02 PM" src="https://user-images.githubusercontent.com/63452077/234717916-e724497d-224e-40c8-bee1-1da8d143a779.png">  

## Extensions
### TODO

