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

let rec string_of_lambda (l : expr) : string = 
  match l with
  | Var x -> x
  | Lambda (x, e) -> "λ" ^ x ^ "." ^ (string_of_lambda e)
  | Application (l1, l2) -> "[" ^ string_of_lambda l1 ^ "]" ^ "(" ^ (string_of_lambda l2) ^ ")"
  | Conjunction (l1, l2) -> "(" ^ string_of_lambda l1 ^ " ∧ " ^ (string_of_lambda l2) ^ ")"
  | Disjunction (l1, l2) -> "(" ^ string_of_lambda l1 ^ " v " ^ (string_of_lambda l2) ^ ")"
  | Negation l1 -> "(¬" ^ string_of_lambda l1 ^ ")"
  | ForAll (x, e) -> "∀" ^ x ^ "(" ^ string_of_lambda e ^ ")"
  | Exists (x, e) -> "∃" ^ x ^ "(" ^ string_of_lambda e ^ ")"
  | Implication (l1, l2) -> "(" ^ string_of_lambda l1 ^ " → " ^ (string_of_lambda l2) ^ ")"
  | Predicate (p, indivs) -> p ^ "(" ^ String.concat "," (List.map string_of_lambda indivs) ^ ")"
;;