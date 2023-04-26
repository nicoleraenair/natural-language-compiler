# natural-language-compiler

## Description

### TODO

- what it does - translates natural language phrases (from a toy subset of english) into their lambda calculus and predicate logic representations (denotations) and determines their semantic types
- what problem it solves - generalizes theory, automates computation of denotations and types, 

## Table of Contents
- [Theoretical Background](#theoretical-background)
    - [Simply Typed Lambda Calculus](#simply-typed-lambda-calculus)
    - [Toy Language](#toy-language)
    - [Semantic Model](#semantic-model)
- [Implementation](#implementation)
- [Installation](#installation)
- [Usage](#usage)

## Theoretical Background
### Simply Typed Lambda Calculus
### TODO
- basic explanation of lambda calculus, conversion, etc.
- This formal system effectively models natural language semantics, as described below, and so this project automates the translation of natural language phrases into a simply typed lambda calculus.

### Toy Language
Translating the entire English language into lambda calculus is outside the scope of this project. Instead, we will work with a small subset of English that includes proper nouns, common nouns, determiners, relative clauses, intransitive verbs, transitive verbs, and adjectives. This toy language is formally specified by the following [context-free grammar](https://en.wikipedia.org/wiki/Context-free_grammar):

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

### Semantic Model
### TODO
This project creates a unified semantic model for computing the types and denotations (lambda calculus/predicate logic translations) for phrases in this toy language.
- table with denotations for all phrase types (from cfg) + example from toy language + types ("Every clever mathematician that Alex loves hates a filmmaker that is grumpy" - build up each part)

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

