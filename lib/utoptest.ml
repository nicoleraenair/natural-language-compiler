let parse (s : string) : Asts.phrase =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.input Lexer.read lexbuf in
  ast