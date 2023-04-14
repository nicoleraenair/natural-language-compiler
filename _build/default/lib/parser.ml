
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
open Asts

# 48 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_input) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: input. *)

  | MenhirState13 : (('s, _menhir_box_input) _menhir_cell1_IS, _menhir_box_input) _menhir_state
    (** State 13.
        Stack shape : IS.
        Start symbol: input. *)

  | MenhirState17 : ((('s, _menhir_box_input) _menhir_cell1_IS, _menhir_box_input) _menhir_cell1_A, _menhir_box_input) _menhir_state
    (** State 17.
        Stack shape : IS A.
        Start symbol: input. *)

  | MenhirState22 : (('s, _menhir_box_input) _menhir_cell1_common_noun, _menhir_box_input) _menhir_state
    (** State 22.
        Stack shape : common_noun.
        Start symbol: input. *)

  | MenhirState31 : (('s, _menhir_box_input) _menhir_cell1_transitive_verb, _menhir_box_input) _menhir_state
    (** State 31.
        Stack shape : transitive_verb.
        Start symbol: input. *)

  | MenhirState34 : (('s, _menhir_box_input) _menhir_cell1_determiner, _menhir_box_input) _menhir_state
    (** State 34.
        Stack shape : determiner.
        Start symbol: input. *)

  | MenhirState37 : (('s, _menhir_box_input) _menhir_cell1_adjective, _menhir_box_input) _menhir_state
    (** State 37.
        Stack shape : adjective.
        Start symbol: input. *)

  | MenhirState39 : ((('s, _menhir_box_input) _menhir_cell1_common_noun, _menhir_box_input) _menhir_cell1_noun_phrase, _menhir_box_input) _menhir_state
    (** State 39.
        Stack shape : common_noun noun_phrase.
        Start symbol: input. *)

  | MenhirState45 : (('s, _menhir_box_input) _menhir_cell1_transitive_verb, _menhir_box_input) _menhir_state
    (** State 45.
        Stack shape : transitive_verb.
        Start symbol: input. *)

  | MenhirState53 : (('s, _menhir_box_input) _menhir_cell1_noun_phrase, _menhir_box_input) _menhir_state
    (** State 53.
        Stack shape : noun_phrase.
        Start symbol: input. *)

  | MenhirState57 : (('s, _menhir_box_input) _menhir_cell1_determiner, _menhir_box_input) _menhir_state
    (** State 57.
        Stack shape : determiner.
        Start symbol: input. *)

  | MenhirState61 : (('s, _menhir_box_input) _menhir_cell1_adjective, _menhir_box_input) _menhir_state
    (** State 61.
        Stack shape : adjective.
        Start symbol: input. *)


and ('s, 'r) _menhir_cell1_adjective = 
  | MenhirCell1_adjective of 's * ('s, 'r) _menhir_state * (Asts.phrase)

and ('s, 'r) _menhir_cell1_common_noun = 
  | MenhirCell1_common_noun of 's * ('s, 'r) _menhir_state * (Asts.phrase)

and ('s, 'r) _menhir_cell1_determiner = 
  | MenhirCell1_determiner of 's * ('s, 'r) _menhir_state * (Asts.phrase)

and ('s, 'r) _menhir_cell1_noun_phrase = 
  | MenhirCell1_noun_phrase of 's * ('s, 'r) _menhir_state * (Asts.phrase)

and ('s, 'r) _menhir_cell1_transitive_verb = 
  | MenhirCell1_transitive_verb of 's * ('s, 'r) _menhir_state * (Asts.phrase)

and ('s, 'r) _menhir_cell1_A = 
  | MenhirCell1_A of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IS = 
  | MenhirCell1_IS of 's * ('s, 'r) _menhir_state

and _menhir_box_input = 
  | MenhirBox_input of (Asts.phrase) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 107 "lib/parser.mly"
           ( ADJ Clever )
# 141 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_02 =
  fun () ->
    (
# 108 "lib/parser.mly"
           ( ADJ Sleepy )
# 149 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_03 =
  fun () ->
    (
# 109 "lib/parser.mly"
          ( ADJ Funny )
# 157 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_04 =
  fun () ->
    (
# 110 "lib/parser.mly"
           ( ADJ Grumpy )
# 165 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_05 =
  fun () ->
    (
# 100 "lib/parser.mly"
                  ( CN Mathematician )
# 173 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_06 =
  fun () ->
    (
# 101 "lib/parser.mly"
           ( CN Lawyer )
# 181 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_07 =
  fun () ->
    (
# 102 "lib/parser.mly"
             ( CN Engineer )
# 189 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_08 =
  fun () ->
    (
# 103 "lib/parser.mly"
              ( CN Filmmaker )
# 197 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_09 =
  fun adj cn ->
    (
# 104 "lib/parser.mly"
                                      ( ADJCN (adj, cn) )
# 205 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_10 =
  fun () ->
    (
# 94 "lib/parser.mly"
      ( DET A )
# 213 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_11 =
  fun () ->
    (
# 95 "lib/parser.mly"
          ( DET Every )
# 221 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_12 =
  fun () ->
    (
# 96 "lib/parser.mly"
         ( DET Some )
# 229 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_13 =
  fun () ->
    (
# 97 "lib/parser.mly"
       ( DET No )
# 237 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_14 =
  fun s ->
    (
# 39 "lib/parser.mly"
                      ( s )
# 245 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_15 =
  fun vp ->
    (
# 40 "lib/parser.mly"
                          ( vp )
# 253 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_16 =
  fun np ->
    (
# 41 "lib/parser.mly"
                          ( np )
# 261 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_17 =
  fun rcn ->
    (
# 42 "lib/parser.mly"
                                    ( rcn )
# 269 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_18 =
  fun tv ->
    (
# 43 "lib/parser.mly"
                              ( tv )
# 277 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_19 =
  fun det ->
    (
# 44 "lib/parser.mly"
                          ( det )
# 285 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_20 =
  fun cn ->
    (
# 45 "lib/parser.mly"
                          ( cn )
# 293 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_21 =
  fun pn ->
    (
# 46 "lib/parser.mly"
                          ( pn )
# 301 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_22 =
  fun adj ->
    (
# 47 "lib/parser.mly"
                         ( adj )
# 309 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_23 =
  fun () ->
    (
# 74 "lib/parser.mly"
            ( IVP Studies )
# 317 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_24 =
  fun () ->
    (
# 75 "lib/parser.mly"
           ( IVP Sleeps )
# 325 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_25 =
  fun () ->
    (
# 76 "lib/parser.mly"
         ( IVP Eats )
# 333 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_26 =
  fun () ->
    (
# 77 "lib/parser.mly"
          ( IVP Swims )
# 341 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_27 =
  fun pn ->
    (
# 63 "lib/parser.mly"
                     ( PNP pn )
# 349 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_28 =
  fun cn det ->
    (
# 64 "lib/parser.mly"
                                       ( CNP (det, cn) )
# 357 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_29 =
  fun det rcn ->
    (
# 65 "lib/parser.mly"
                                                 ( CNP (det, rcn) )
# 365 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_30 =
  fun () ->
    (
# 88 "lib/parser.mly"
         ( PN Alex )
# 373 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_31 =
  fun () ->
    (
# 89 "lib/parser.mly"
             ( PN Christie )
# 381 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_32 =
  fun () ->
    (
# 90 "lib/parser.mly"
          ( PN Caleb )
# 389 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_33 =
  fun () ->
    (
# 91 "lib/parser.mly"
           ( PN Lauren )
# 397 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_34 =
  fun cn vp ->
    (
# 69 "lib/parser.mly"
                                             ( RCN (cn, vp) )
# 405 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_35 =
  fun cn np tv ->
    (
# 70 "lib/parser.mly"
                                                                   ( TRCN (cn, np, tv) )
# 413 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_36 =
  fun np vp ->
    (
# 51 "lib/parser.mly"
                                       ( S (np,vp) )
# 421 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_37 =
  fun () ->
    (
# 81 "lib/parser.mly"
          ( TV Loves )
# 429 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_38 =
  fun () ->
    (
# 82 "lib/parser.mly"
          ( TV Hates )
# 437 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_39 =
  fun () ->
    (
# 83 "lib/parser.mly"
            ( TV Teaches )
# 445 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_40 =
  fun () ->
    (
# 84 "lib/parser.mly"
          ( TV Knows )
# 453 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_41 =
  fun iv ->
    (
# 55 "lib/parser.mly"
                           ( iv )
# 461 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_42 =
  fun obj tv ->
    (
# 56 "lib/parser.mly"
                                            (TVP (tv, obj))
# 469 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_43 =
  fun adj ->
    (
# 57 "lib/parser.mly"
                        ( ISADJVP adj )
# 477 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_44 =
  fun cn ->
    (
# 58 "lib/parser.mly"
                            ( ISNVP cn )
# 485 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_action_45 =
  fun rcn ->
    (
# 59 "lib/parser.mly"
                                      ( ISNVP rcn )
# 493 "lib/parser.ml"
     : (Asts.phrase))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | A ->
        "A"
    | ALEX ->
        "ALEX"
    | CALEB ->
        "CALEB"
    | CHRISTIE ->
        "CHRISTIE"
    | CLEVER ->
        "CLEVER"
    | EATS ->
        "EATS"
    | ENGINEER ->
        "ENGINEER"
    | EOF ->
        "EOF"
    | EVERY ->
        "EVERY"
    | FILMMAKER ->
        "FILMMAKER"
    | FUNNY ->
        "FUNNY"
    | GRUMPY ->
        "GRUMPY"
    | HATES ->
        "HATES"
    | IS ->
        "IS"
    | KNOWS ->
        "KNOWS"
    | LAUREN ->
        "LAUREN"
    | LAWYER ->
        "LAWYER"
    | LOVES ->
        "LOVES"
    | MATHEMATICIAN ->
        "MATHEMATICIAN"
    | NO ->
        "NO"
    | SLEEPS ->
        "SLEEPS"
    | SLEEPY ->
        "SLEEPY"
    | SOME ->
        "SOME"
    | STUDIES ->
        "STUDIES"
    | SWIMS ->
        "SWIMS"
    | TEACHES ->
        "TEACHES"
    | THAT ->
        "THAT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
    fun _menhir_stack _v ->
      MenhirBox_input _v
  
  let rec _menhir_run_55 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_noun_phrase -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _v _tok ->
      let MenhirCell1_noun_phrase (_menhir_stack, _, np) = _menhir_stack in
      let vp = _v in
      let _v = _menhir_action_36 np vp in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let s = _v in
          let _v = _menhir_action_14 s in
          _menhir_goto_input _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_43 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let vp = _v in
          let _v = _menhir_action_15 vp in
          _menhir_goto_input _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_49 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let rcn = _v in
          let _v = _menhir_action_17 rcn in
          _menhir_goto_input _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_41_spec_53 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_noun_phrase -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _v _tok ->
      let iv = _v in
      let _v = _menhir_action_41 iv in
      _menhir_run_55 _menhir_stack _v _tok
  
  let rec _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLEEPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | MATHEMATICIAN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | LAWYER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | GRUMPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | FUNNY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | FILMMAKER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | ENGINEER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | CLEVER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLEEPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
      | MATHEMATICIAN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LAWYER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | GRUMPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
      | FUNNY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
      | FILMMAKER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENGINEER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CLEVER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_adjective -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_adjective (_menhir_stack, _menhir_s, adj) = _menhir_stack in
      let cn = _v in
      let _v = _menhir_action_09 adj cn in
      _menhir_goto_common_noun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_common_noun : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState37 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState57 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_59 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | THAT ->
          let _menhir_stack = MenhirCell1_common_noun (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let cn = _v in
          let _v = _menhir_action_20 cn in
          _menhir_goto_input _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_common_noun -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TEACHES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | SWIMS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_26 () in
          _menhir_run_41_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | STUDIES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_23 () in
          _menhir_run_41_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SOME ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | SLEEPS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_24 () in
          _menhir_run_41_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | LOVES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | LAUREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_33 () in
          _menhir_run_32_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | KNOWS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | IS ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | HATES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_38 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | EVERY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | EATS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_25 () in
          _menhir_run_41_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CHRISTIE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_run_32_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CALEB ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_32 () in
          _menhir_run_32_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALEX ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_30 () in
          _menhir_run_32_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | A ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SOME ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | NO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | LAUREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_33 () in
          _menhir_run_32_spec_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EVERY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | CHRISTIE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_run_32_spec_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CALEB ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_32 () in
          _menhir_run_32_spec_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALEX ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_30 () in
          _menhir_run_32_spec_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | A ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32_spec_31 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transitive_verb -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let pn = _v in
      let _v = _menhir_action_27 pn in
      _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transitive_verb -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, tv) = _menhir_stack in
      let obj = _v in
      let _v = _menhir_action_42 obj tv in
      _menhir_goto_verb_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_verb_phrase : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState53 ->
          _menhir_run_55 _menhir_stack _v _tok
      | MenhirState00 ->
          _menhir_run_43 _menhir_stack _v _tok
      | MenhirState22 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_common_noun -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_common_noun (_menhir_stack, _menhir_s, cn) = _menhir_stack in
      let vp = _v in
      let _v = _menhir_action_34 cn vp in
      _menhir_goto_relative_common_noun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_relative_common_noun : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_49 _menhir_stack _v _tok
      | MenhirState57 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_35 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_determiner -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_determiner (_menhir_stack, _menhir_s, det) = _menhir_stack in
      let rcn = _v in
      let _v = _menhir_action_29 det rcn in
      _menhir_goto_noun_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_noun_phrase : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState45 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState31 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_53 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TEACHES ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
      | SWIMS ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_26 () in
          _menhir_run_41_spec_53 _menhir_stack _v _tok
      | STUDIES ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_23 () in
          _menhir_run_41_spec_53 _menhir_stack _v _tok
      | SLEEPS ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_24 () in
          _menhir_run_41_spec_53 _menhir_stack _v _tok
      | LOVES ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
      | KNOWS ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
      | IS ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
      | HATES ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_38 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
      | EOF ->
          let np = _v in
          let _v = _menhir_action_16 np in
          _menhir_goto_input _menhir_stack _v
      | EATS ->
          let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_25 () in
          _menhir_run_41_spec_53 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SLEEPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | GRUMPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNNY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CLEVER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | A ->
          let _menhir_stack = MenhirCell1_A (_menhir_stack, MenhirState13) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SLEEPY ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | MATHEMATICIAN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_05 () in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | LAWYER ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | GRUMPY ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | FUNNY ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | FILMMAKER ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_08 () in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | ENGINEER ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | CLEVER ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_IS -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IS (_menhir_stack, _menhir_s) = _menhir_stack in
      let adj = _v in
      let _v = _menhir_action_43 adj in
      _menhir_goto_verb_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_IS, _menhir_box_input) _menhir_cell1_A as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | THAT ->
          let _menhir_stack = MenhirCell1_common_noun (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EATS | EOF | HATES | IS | KNOWS | LOVES | SLEEPS | STUDIES | SWIMS | TEACHES ->
          let MenhirCell1_A (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_IS (_menhir_stack, _menhir_s) = _menhir_stack in
          let cn = _v in
          let _v = _menhir_action_44 cn in
          _menhir_goto_verb_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_common_noun as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_noun_phrase (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TEACHES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LOVES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | KNOWS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HATES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_38 () in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_common_noun, _menhir_box_input) _menhir_cell1_noun_phrase -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_noun_phrase (_menhir_stack, _, np) = _menhir_stack in
      let MenhirCell1_common_noun (_menhir_stack, _menhir_s, cn) = _menhir_stack in
      let tv = _v in
      let _v = _menhir_action_35 cn np tv in
      _menhir_goto_relative_common_noun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_20 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_IS, _menhir_box_input) _menhir_cell1_A -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_A (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_IS (_menhir_stack, _menhir_s) = _menhir_stack in
      let rcn = _v in
      let _v = _menhir_action_45 rcn in
      _menhir_goto_verb_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_41_spec_22 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_common_noun -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let iv = _v in
      let _v = _menhir_action_41 iv in
      _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_32_spec_22 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_common_noun -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let pn = _v in
      let _v = _menhir_action_27 pn in
      _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_determiner as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | THAT ->
          let _menhir_stack = MenhirCell1_common_noun (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EATS | EOF | HATES | IS | KNOWS | LOVES | SLEEPS | STUDIES | SWIMS | TEACHES ->
          let MenhirCell1_determiner (_menhir_stack, _menhir_s, det) = _menhir_stack in
          let cn = _v in
          let _v = _menhir_action_28 cn det in
          _menhir_goto_noun_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_32_spec_45 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_transitive_verb -> _ -> _ -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let pn = _v in
      let _v = _menhir_action_27 pn in
      _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  let rec _menhir_run_45 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SOME ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState45 _tok
      | NO ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState45 _tok
      | LAUREN ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_33 () in
          _menhir_run_32_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EVERY ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState45 _tok
      | EOF ->
          let tv = _v in
          let _v = _menhir_action_18 tv in
          _menhir_goto_input _menhir_stack _v
      | CHRISTIE ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_run_32_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CALEB ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_32 () in
          _menhir_run_32_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALEX ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_30 () in
          _menhir_run_32_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | A ->
          let _menhir_stack = MenhirCell1_transitive_verb (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState45 _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_41_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _v _tok ->
      let iv = _v in
      let _v = _menhir_action_41 iv in
      _menhir_run_43 _menhir_stack _v _tok
  
  let rec _menhir_run_57 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SLEEPY ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | MATHEMATICIAN ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | LAWYER ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | GRUMPY ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | FUNNY ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | FILMMAKER ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | EOF ->
          let det = _v in
          let _v = _menhir_action_19 det in
          _menhir_goto_input _menhir_stack _v
      | ENGINEER ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | CLEVER ->
          let _menhir_stack = MenhirCell1_determiner (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_61 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SLEEPY ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState61 _tok
      | MATHEMATICIAN ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LAWYER ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | GRUMPY ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState61 _tok
      | FUNNY ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState61 _tok
      | FILMMAKER ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let adj = _v in
          let _v = _menhir_action_22 adj in
          _menhir_goto_input _menhir_stack _v
      | ENGINEER ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CLEVER ->
          let _menhir_stack = MenhirCell1_adjective (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState61 _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_51 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let pn = _v in
          let _v = _menhir_action_21 pn in
          _menhir_goto_input _menhir_stack _v
      | EATS | HATES | IS | KNOWS | LOVES | SLEEPS | STUDIES | SWIMS | TEACHES ->
          let pn = _v in
          let _v = _menhir_action_27 pn in
          _menhir_goto_noun_phrase _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TEACHES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | SWIMS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_26 () in
          _menhir_run_41_spec_00 _menhir_stack _v _tok
      | STUDIES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_23 () in
          _menhir_run_41_spec_00 _menhir_stack _v _tok
      | SOME ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | SLEEPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | SLEEPS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_24 () in
          _menhir_run_41_spec_00 _menhir_stack _v _tok
      | NO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_13 () in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | MATHEMATICIAN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_05 () in
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | LOVES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | LAWYER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | LAUREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_33 () in
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | KNOWS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_40 () in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IS ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | HATES ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_38 () in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | GRUMPY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | FUNNY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | FILMMAKER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | EVERY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | ENGINEER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | EATS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_25 () in
          _menhir_run_41_spec_00 _menhir_stack _v _tok
      | CLEVER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | CHRISTIE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | CALEB ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_32 () in
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | ALEX ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_30 () in
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | A ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_10 () in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let input =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_input v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
