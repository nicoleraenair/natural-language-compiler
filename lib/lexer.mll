{
open Lexing
open Parser

exception SyntaxError
}

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read =
  parse
  | white { read lexbuf }
  | newline { new_line lexbuf; read lexbuf }
  | "loves" { LOVES }
  | "hates" { HATES }
  | "teaches" { TEACHES }
  | "knows" { KNOWS }
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
  | _ { raise SyntaxError }
  | eof      { EOF }