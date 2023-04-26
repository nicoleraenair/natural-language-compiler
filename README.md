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
Modelling the entire English language with lambda calculus is outside the scope of this project. Instead, we will work with a small subset of English that includes proper nouns, common nouns, determiners, relative clauses, intransitive verbs, transitive verbs, and adjectives. This toy language is specified by the following context-free grammar:

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

This language includes
- PN: proper nouns (eg. Alex)
- DET: determiners (eg. every)
- ADJ: adjectives (eg. clever)
- IV: instransitive verbs (eg. swims)
- TV: transitive verbs (eg. loves)
- CN: common nouns, that are
    - terminal (eg. filmmaker), or
    - made up of an ADJ followed by another CN (eg. funny lawyer)
- RCN: relative clause common nouns, that are
    - made up of a CN, "that", and a VP (eg. mathematician that sleeps, lawyer that loves Lauren)
    - made up of a CN, "that", an NP, and a VP (eg. lawyer that Lauren loves)
- NP: noun phrases, that are
    - proper nouns (eg. Christie)
    - made up of a DET and a CN (eg. every filmmaker)
    - made up of a DET and a RCN (eg. a lawyer that swims)
- VP: verb phrases, that are
    - intransitive verbs
    - made up of a TV and an NP (eg. teaches Caleb)
    - made up of "is" and an ADJ (eg. is grumpy)
    - made up of "is a" and a CN (eg. is a filmmaker)
    - made up of "is a" and a RCN (eg. is a lawyer that eats)
- S: sentences, that are made up of a NP and a VP (eg. Alex swims)

Observe that this is an infinitely large language, and that we can construct arbitrarily long and complex phrases, such as `Every funny clever mathematician that Alex loves hates a filmmaker that is a lawyer that swims`.

### Semantic Model
- this project creates a unified semantic model for computing types and denotations for a subset of english
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
- download a bytecode executable version of this project [here](https://drive.google.com/file/d/1RCSNvgDAjuDPD0fXjg9f8YGZG4jVjf88/view?usp=sharing) and run with `ocamlrun main.bc`.

## Usage

- gif of above example

## Extensions

- 
