open Asts
open Lambda

exception TypeMismatch;;
let _pletter = ref 0;;
let _pprime = ref "";;
let _xletter = ref 0;;
let _xprime = ref "";;
let fresh_name (prefix : string) : string =
  match prefix with
  | "x" -> let x = !_xletter in
    let n = !_xprime in
    _xletter := (x + 1) mod 26;
    _xprime := n ^ (if x = 25 then "'" else "");
    (Char.escaped (Char.chr (((x+23)mod 26) + 97))) ^ n
  | "P" -> let p = !_pletter in
    let n = !_pprime in
    _pletter := (p + 1) mod 26;
    _pprime := n ^ (if p = 25 then "'" else "");
    (Char.escaped (Char.chr (((p+15)mod 26) + 65))) ^ n
  | _ -> failwith "Invalid variable type"

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

let rec compile_phrase (p : Asts.phrase) : Lambda.expr = 
  match p with
  | S (np, vp) -> Application (compile_phrase np, compile_phrase vp)
  | PN pn -> let param = fresh_name "P" in 
    Lambda (param, Application (Var param, Var (string_of_pn pn)))
  | CNP (det, cn) -> Application (compile_phrase det, compile_phrase cn)
  | IVP iv -> let x = fresh_name "x" in
    Lambda (x, Predicate(string_of_iv iv, [Var x]))
  | TVP (tv, np) -> let x = fresh_name "x" in
    let y = fresh_name "x" in
    Lambda(x, Application (compile_phrase np, Lambda (y, Application (
      Application (compile_phrase tv, Var y), Var x))))
  | DET det -> compile_det det
  | CN cn -> let x = fresh_name "x" in
    Lambda (x, Predicate(string_of_cn cn, [Var x]))
  | TV tv -> let x = fresh_name "x" in
    let y = fresh_name "x" in
    Lambda (y, Lambda(x, Predicate(string_of_tv tv, [Var x; Var y])
    ))
  | RCN (cn, vp) -> let x = fresh_name "x" in
    Lambda(x, Conjunction(Application(compile_phrase cn, Var x),Application(compile_phrase vp, Var x)))
  | TRCN (cn, np, tv) -> let x = fresh_name "x" in
    let y = fresh_name "x" in
    Lambda(x, Conjunction(Application(compile_phrase cn, Var x), Application (compile_phrase np, Lambda (y, Application (
      Application (compile_phrase tv, Var x), Var y)))))
  | ISNVP n -> compile_phrase n
  | ADJ adj -> let x = fresh_name "x" in Lambda (x, Predicate(string_of_adj adj, [Var x]))
  | ADJCN (adj, cn) -> let x = fresh_name "x" in
    Lambda(x, Conjunction(Application(compile_phrase adj, Var x), Application(compile_phrase cn, Var x)))
  | ISADJVP adj -> compile_phrase adj

let substitute (var: string) (value: Lambda.expr) (e': Lambda.expr): Lambda.expr = 
  let rec rec_sub (e: Lambda.expr): Lambda.expr = 
    match (e : Lambda.expr) with
    | Var v -> if v = var then value else e
    | Application (e1, e2) -> Application (rec_sub e1, rec_sub e2)
    | Conjunction (e1, e2) -> Conjunction (rec_sub e1, rec_sub e2)
    | Disjunction (e1, e2) -> Disjunction (rec_sub e1, rec_sub e2)
    | Implication (e1, e2) -> Implication (rec_sub e1, rec_sub e2)
    | Negation e1 -> Negation (rec_sub e1)
    | Lambda (x, body) -> if x = var then e else Lambda (x, rec_sub body)
    | ForAll (x, body) -> if x = var then e else ForAll (x, rec_sub body)
    | Exists (x, body) -> if x = var then e else Exists (x, rec_sub body)
    | Predicate (pred, vars) -> Predicate(pred, List.map rec_sub vars)
  in
  rec_sub e'

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