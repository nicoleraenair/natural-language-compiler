# natural-language-compiler

## Description

- what it does
- how it is implemented
- what problem it solves

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
- basic explanation of lambda calculus, conversion, etc.
- This formal system effectively models natural language semantics, as described below, and so this project automates the translation of natural language phrases into a simply typed lambda calculus.

### Toy Language
Translating the entire English language into lambda calculus is outside the scope of this project. Instead, we will work with a small subset of English that includes proper nouns, common nouns, determiners, relative clauses, intransitive verbs, transitive verbs, and adjectives. This toy language is specified by the following [context-free grammar](https://en.wikipedia.org/wiki/Context-free_grammar):

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
This project creates a unified semantic model for computing the types and denotations (lambda calculus/predicate logic translations) for phrases in this toy language.
- table with denotations for all phrase types (from cfg) + example from toy language + types ("Every clever mathematician that Alex loves hates a filmmaker that is grumpy" - build up each part)

## Implementation

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

- gif of above example

## Extensions

- 
