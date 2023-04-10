{
open Lexing
open Parser

exception SyntaxError of string
}


(* 
let int = '-'? ['0'-'9'] ['0'-'9']*
let digit = ['0'-'9']
let frac = '.' digit*
let exp = ['e' 'E'] ['-' '+']? digit+
let float = digit* frac? exp? 
let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
let letter = ['a'-'z' 'A'-'Z']
let id = letter+
*)

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read =
  parse
  | white { read lexbuf }
  | newline { new_line lexbuf; read lexbuf }
  | "loves" { LOVES }
  | "hates" { HATES }
  | "teaches" { TEACHES }
  | "helps" { HELPS }
  | "studies" { STUDIES }
  | "sleeps" { SLEEPS }
  | "eats" { EATS }
  | "swims" { SWIMS }
  | "mathematician" { MATHEMATICIAN }
  | "lawyer" { LAWYER }
  | "engineer" { ENGINEER }
  | "filmmaker" { FILMMAKER }
  | "a" { A }
  | "every" { EVERY }
  | "some" { SOME }
  | "no" { NO }
  | "alex" { ALEX }
  | "christie" { CHRISTIE }
  | "caleb" { CALEB }
  | "lauren" {LAUREN}
  | "that" {THAT}
  | "clever" {CLEVER}
  | "sleepy" {SLEEPY}
  | "funny" {FUNNY}
  | "grumpy" {GRUMPY}
  | "is" {IS}
  | _ { raise (SyntaxError ("Unexpected lexeme: " ^ Lexing.lexeme lexbuf)) }
  | eof      { EOF }