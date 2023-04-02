(lang dune 3.6)

(name natural_language_compiler)

(generate_opam_files true)

(source
 (github nicoleraenair/natural-language-compiler))

(authors "Nicole Nair")

(maintainers "Nicole Nair")

(license NONE)

(documentation https://github.com/nicoleraenair/natural-language-compiler)

(package
 (name natural_language_compiler)
 (synopsis "Compiler from natural language to predicate logic and lambda calculus representation")
 (description "")
 (depends ocaml dune)
 (tags
  (topics "to describe" your project)))

(using menhir 2.1)

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
