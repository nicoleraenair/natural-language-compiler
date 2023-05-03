open Asts

type ty = 
  | E
  | T
  | F of ty * ty

let rec string_of_type (t : ty) : string = 
  match t with 
  | E -> "e"
  | T -> "t"
  | F (x, y) -> "⟨" ^ string_of_type x ^ "," ^ string_of_type y ^ "⟩"
;;

let type_of (p : phrase) : string =
  string_of_type (
    match p with
    | S (_, _) -> T
    | PN _ | CNP (_, _) -> F(F(E,T),T)
    | IVP _ | TVP (_, _) | ISNVP _ | ISADJVP _-> F(E,T)
    | DET _ -> F(F(E,T),F(F(E,T), T))
    | CN _ | RCN (_, _) | TRCN (_, _, _) |ADJCN (_, _) -> F(E,T)
    | TV _ -> F(E,F(E,T))
    | ADJ _ -> F(F(E,T),F(E,T))
  )
;;