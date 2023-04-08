open Asts
open Lambda

exception TypeMismatch;;

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
    Lambda(y, Application (compile_phrase np, Lambda (x, Application (
      Application (compile_phrase tv, Var y),
      Var x))))
  | DET det -> compile_det det
  | CN cn -> let x = fresh_name "x" in
    Lambda (x, Predicate(string_of_cn cn, [Var x]))
  | TV tv -> let x = fresh_name "x" in
    let y = fresh_name "x" in
    Lambda (x, Lambda(y, Predicate(string_of_tv tv, [Var x; Var y])
  ))
  | (RCN (_, _)
  | TRCN (_, _, _)
  | ADJ _
  | ADJCN (_, _)) -> failwith "todo"
;;

let rec substitute (var: string) (value: Lambda.expr) (e: Lambda.expr): Lambda.expr = 
  match (e : Lambda.expr) with
  | Var v -> if (v = var) then (value) else e
  | Application (e1, e2) -> Application (substitute var value e1, substitute var value e2)
  | Conjunction (e1, e2) -> Conjunction (substitute var value e1, substitute var value e2)
  | Disjunction (e1, e2) -> Disjunction (substitute var value e1, substitute var value e2)
  | Implication (e1, e2) -> Implication (substitute var value e1, substitute var value e2)
  | Negation e1 -> Negation (substitute var value e1)
  | Lambda (x, body) -> if x = var then e else Lambda (x, substitute var value body)
  | ForAll (x, body) -> if x = var then e else ForAll (x, substitute var value body)
  | Exists (x, body) -> if x = var then e else Exists (x, substitute var value body)
  | Predicate (pred, vars) -> Predicate(pred, List.map (substitute var value) vars)
;;

let rec reduce (e : Lambda.expr) : Lambda.expr = 
  match (e : Lambda.expr) with
  | Var _ -> e
  | Predicate (pred, vars) -> Predicate(pred, List.map reduce vars)
  | Lambda (x, b) -> Lambda (x, reduce b)
  | ForAll (x, b) -> ForAll (x, reduce b)
  | Exists (x, b) -> Exists (x, reduce b)
  | Conjunction (e1, e2) -> Conjunction (reduce e1, reduce e2)
  | Disjunction (e1, e2) -> Disjunction (reduce e1, reduce e2)
  | Implication (e1, e2) -> Implication (reduce e1, reduce e2)
  | Negation e1 -> Negation (reduce e1)
  | Application (e1, e2) -> (match (reduce e1) with 
    | Lambda (x, b) -> reduce (substitute x (reduce e2) b)
    | _ -> Application (reduce e1, reduce e2))
;;