open Asts

type ty = 
  | E
  | T
  | F of ty * ty


let type_of (p : phrase) : ty =
  match p with
  | S (_, _) -> T
  | PNP _ | CNP (_, _) -> F(F(E,T),T)
  | IVP _ | TVP (_, _) -> F(E,T)
  | DET _ -> F(F(E,T),F(F(E,T), T))
  | CN _ -> F(E,T)
  | TV _ -> F(E,F(E,T))
;;

let rec string_of_type (t : ty) : string = 
  match t with 
  | E -> "e"
  | T -> "t"
  | F (x, y) -> "⟨" ^ string_of_type x ^ "," ^ string_of_type y ^ "⟩"
;;
