open Compilib
open Core
open Lexing

let print_position outx lexbuf =
  let pos = lexbuf.lex_curr_p in
  fprintf outx "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)
;;

let parse_with_error (lexbuf : lexbuf) : Asts.phrase =
  try Parser.input Lexer.read lexbuf with
  | Lexer.SyntaxError msg ->
    fprintf stderr "%a: %s\n" print_position lexbuf msg;
    exit (-1)
  |  Parser.Error ->
    fprintf stderr "%a: syntax error\n" print_position lexbuf;
    exit (-1)
;;

let loop phrase () =
  let lexbuf = Lexing.from_string phrase in
  let ast = parse_with_error lexbuf in
  printf "\nSyntax Tree: %s\n" (Asts.string_of_phrase ast);
  printf "Denotation: %s\n" (Lambda.string_of_lambda (Compiler.compile_phrase ast));
  printf "Semantic Type: %s\n" (Typeinferencer.type_of ast);
;;

let () =
  Command.basic_spec ~summary:"Parse and print phrase"
    Command.Spec.(empty +> anon ("phrase" %: string))
    loop
  |> Command_unix.run