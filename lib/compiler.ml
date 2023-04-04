open Asts
open Lambda

(*cite palmer for freshening code, edit to make nicer looking eg P, P', P''..., vars + predicates + ?functions *)
let _counter = ref 0;;
let fresh_name (prefix : string) : string =
  let n = !_counter + 1 in
  _counter := n;
  prefix ^ "_" ^ string_of_int n
;;

let compile_det (det : determiner) : Lambda.expr = 
  match det with
  | A | Some -> let p1 = fresh_name "P" in
    let p2 = fresh_name "P" in
    let x = fresh_name "x" in
    Lambda (p1, Lambda (p2, Exists (x, Conjunction 
        (Application (Var p1, Var x), Application (Var p2, Var x))
    )))
  | Every -> let p1 = fresh_name "P" in
    let p2 = fresh_name "P" in
    let x = fresh_name "x" in
    Lambda (p1, Lambda (p2, ForAll (x, Implication(
      (Application (Var p1, Var x), Application (Var p2, Var x))
    ))))
  | No -> let p1 = fresh_name "P" in
    let p2 = fresh_name "P" in
    let x = fresh_name "x" in
    Lambda (p1, Lambda (p2, ForAll (x, Implication(
      (Application (Var p1, Var x), Negation(Application (Var p2, Var x)))
    ))))
;;

let rec compile_phrase (p : Asts.phrase) : Lambda.expr = 
  match p with
  | S (np, vp) -> Application (compile_phrase np, compile_phrase vp)
  | PNP pn -> let param = fresh_name "P" in 
    Lambda (param, Application (Var param, Var (string_of_pn pn)))
  | CNP (det, cn) -> let x = fresh_name "x" in
    Application (compile_det det, Lambda (x, Predicate(string_of_cn cn, [Var x])))
  | IVP iv -> let x = fresh_name "x" in
    Lambda (x, Predicate(string_of_iv iv, [Var x]))
  | TVP (tv, np) -> let x = fresh_name "x" in
    let y = fresh_name "y" in
    Lambda (x, Application (compile_phrase np,
      Lambda(y, Predicate(string_of_tv tv, [Var x; Var y]))
    ))
;;