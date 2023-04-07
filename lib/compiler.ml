open Asts
open Lambda

(*cite palmer for freshening code, edit to make nicer looking eg P, P', P''..., vars + predicates + ?functions *)
let _pcounter = ref "";;
let _xcounter = ref "";;

let fresh_name (prefix : string) : string =
  match prefix with
  | "x" -> let n = !_xcounter in
    _xcounter := n ^ "'";
    prefix ^ n
  | "P" -> let n = !_pcounter in
    _pcounter := n ^ "'";
    prefix ^ n
  | _ -> prefix
;;

let compile_det (det : determiner) : Lambda.expr = 
  let p1 = fresh_name "P" in
  let p2 = fresh_name "P" in
  let x = fresh_name "x" in
  match det with
  | A | Some -> Lambda (p1, Lambda (p2, Exists (x, Conjunction 
        (Application (Var p1, Var x), Application (Var p2, Var x)))))
  | Every -> Lambda (p1, Lambda (p2, ForAll (x, Implication(
      (Application (Var p1, Var x), Application (Var p2, Var x))))))
  | No ->
    Lambda (p1, Lambda (p2, ForAll (x, Implication(
      (Application (Var p1, Var x), Negation(Application (Var p2, Var x)))))))
;;

let rec compile_phrase (p : Asts.phrase) : Lambda.expr = 
  match p with
  | S (np, vp) -> Application (compile_phrase np, compile_phrase vp)
  | PNP pn -> let param = fresh_name "P" in 
    Lambda (param, Application (Var param, Var (string_of_pn pn)))
  | CNP (det, cn) -> Application (compile_phrase det, compile_phrase cn)
  | IVP iv -> let x = fresh_name "x" in
    Lambda (x, Predicate(string_of_iv iv, [Var x]))
  | TVP (tv, np) -> let x = fresh_name "x" in
    let y = fresh_name "x" in
    Lambda(x, Application (compile_phrase np, Lambda (y, Application (
      Application (compile_phrase tv, Var y),
      Var x))))
  | DET det -> compile_det det
  | CN cn -> let x = fresh_name "x" in
    Lambda (x, Predicate(string_of_cn cn, [Var x]))
  | TV tv -> let x = fresh_name "x" in
    let y = fresh_name "x" in
    Lambda (x, Lambda(y, Predicate(string_of_tv tv, [Var x; Var y])
  ))
;;