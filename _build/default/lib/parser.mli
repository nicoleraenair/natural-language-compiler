
(* The type of tokens. *)

type token = 
  | THAT
  | TEACHES
  | SWIMS
  | STUDIES
  | SOME
  | SLEEPY
  | SLEEPS
  | NO
  | MATHEMATICIAN
  | LOVES
  | LAWYER
  | LAUREN
  | KNOWS
  | IS
  | HATES
  | GRUMPY
  | FUNNY
  | FILMMAKER
  | EVERY
  | EOF
  | ENGINEER
  | EATS
  | CLEVER
  | CHRISTIE
  | CALEB
  | ALEX
  | A

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val input: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Asts.phrase)
