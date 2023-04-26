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

### Toy Language
- cfg, explanation

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
