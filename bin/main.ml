open Compilib
open Core

let parse (phrase : string) : Asts.phrase =
  let lexbuf = Lexing.from_string (String.lowercase phrase) in
  Parser.input Lexer.read lexbuf
;;

let translate (ast : Asts.phrase) =
  let lambda_expr =  Compiler.reduce (Compiler.compile_phrase ast) in
  printf "\nSyntax Tree: %s\n" (Asts.string_of_phrase ast);
  printf "Denotation: %s\n" (Lambda.string_of_lambda lambda_expr);
  printf "Semantic Type: %s\n" (Typeinferencer.type_of ast);
;;

let print_grammar () = 
  printf "Here is the context-free grammar for the toy language supported by this tool:\n\n\tS -> NP VP\n\tNP -> PN | DET CN | DET RCN\n\tVP -> IV | TV NP | is ADJ | is a CN | is a RCN\n\tCN -> mathematician | filmmaker | lawyer | engineer | ADJ CN\n\tRCN -> CN that VP | CN that NP TV\n\tIV -> studies | sleeps | eats | swims\n\tTV -> loves | hates | teaches | helps\n\tADJ -> clever | sleepy | funny | grumpy\n\tPN -> Alex | Caleb | Christie | Lauren\n\tDET -> a | every | some | no\n\nTry entering a sentence like: \"Every clever mathematician that Alex loves hates a filmmaker that is grumpy\"
  "
;;

let rec main_loop () =
  printf "\nEnter a phrase: ";
  Out_channel.flush Out_channel.stdout;
  match In_channel.input_line In_channel.stdin with
  | None -> main_loop ()
  | Some "exit" -> exit (0)
  | Some "grammar" -> print_grammar (); main_loop ()
  | Some phrase -> 
      (try
        let ast = parse phrase in 
        translate ast;
      with
      | Lexer.SyntaxError msg ->
        printf "%s\n" msg;
      |  Parser.Error ->
        printf "Invalid phrase entered.\n";);
      main_loop ()
;;

printf "\n\nInstructions:\n- Enter a phrase to see its syntax tree, lambda calculus + predicate logic denotation, and semantic type.\n- Enter \"exit\" to exit the program.\n- Enter \"grammar\" to see what types of phrases can be entered.\n";
main_loop ()