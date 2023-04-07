
let parse (s : string) : Asts.phrase =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.input Lexer.read lexbuf in
  ast
;;

let translate (s : string) : Lambda.expr = 
  let ast = parse s in
  let lambda = Compiler.compile_phrase ast in 
  lambda
;;
