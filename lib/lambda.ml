type expr =
  | Var of string
  | Lambda of string * expr
  | Application of expr * expr
  | Conjunction of expr * expr
  | Disjunction of expr * expr
  | Negation of expr
  | ForAll of string * expr
  | Exists of string * expr
  | Implication of expr * expr
  | Predicate of string * expr list