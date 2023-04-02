
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TRUE
    | STRING of (
# 6 "lib/parser.mly"
       (string)
# 16 "lib/parser.ml"
  )
    | RIGHT_BRACK
    | RIGHT_BRACE
    | NULL
    | LEFT_BRACK
    | LEFT_BRACE
    | INT of (
# 3 "lib/parser.mly"
       (int)
# 26 "lib/parser.ml"
  )
    | ID of (
# 5 "lib/parser.mly"
       (string)
# 31 "lib/parser.ml"
  )
    | FLOAT of (
# 4 "lib/parser.mly"
       (float)
# 36 "lib/parser.ml"
  )
    | FALSE
    | EOF
    | COMMA
    | COLON
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState04 : (('s, _menhir_box_prog) _menhir_cell1_LEFT_BRACK, _menhir_box_prog) _menhir_state
    (** State 04.
        Stack shape : LEFT_BRACK.
        Start symbol: prog. *)

  | MenhirState08 : (('s, _menhir_box_prog) _menhir_cell1_LEFT_BRACK, _menhir_box_prog) _menhir_state
    (** State 08.
        Stack shape : LEFT_BRACK.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_LEFT_BRACE, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : LEFT_BRACE.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_STRING, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : STRING.
        Start symbol: prog. *)

  | MenhirState20 : (('s, _menhir_box_prog) _menhir_cell1_obj_field, _menhir_box_prog) _menhir_state
    (** State 20.
        Stack shape : obj_field.
        Start symbol: prog. *)

  | MenhirState24 : (('s, _menhir_box_prog) _menhir_cell1_value, _menhir_box_prog) _menhir_state
    (** State 24.
        Stack shape : value.
        Start symbol: prog. *)

  | MenhirState32 : (('s, _menhir_box_prog) _menhir_cell1_LEFT_BRACE, _menhir_box_prog) _menhir_state
    (** State 32.
        Stack shape : LEFT_BRACE.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_obj_field = 
  | MenhirCell1_obj_field of 's * ('s, 'r) _menhir_state * (string * Asts.value)

and ('s, 'r) _menhir_cell1_value = 
  | MenhirCell1_value of 's * ('s, 'r) _menhir_state * (Asts.value)

and ('s, 'r) _menhir_cell1_LEFT_BRACE = 
  | MenhirCell1_LEFT_BRACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFT_BRACK = 
  | MenhirCell1_LEFT_BRACK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STRING = 
  | MenhirCell1_STRING of 's * ('s, 'r) _menhir_state * (
# 6 "lib/parser.mly"
       (string)
# 105 "lib/parser.ml"
)

and _menhir_box_prog = 
  | MenhirBox_prog of (Asts.value option) [@@unboxed]

let _menhir_action_01 =
  fun xs ->
    let vl = 
# 229 "<standard.mly>"
    ( xs )
# 116 "lib/parser.ml"
     in
    (
# 41 "lib/parser.mly"
                                              ( vl )
# 121 "lib/parser.ml"
     : (Asts.value list))

let _menhir_action_02 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 129 "lib/parser.ml"
     : ((string * Asts.value) list))

let _menhir_action_03 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 137 "lib/parser.ml"
     : ((string * Asts.value) list))

let _menhir_action_04 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 145 "lib/parser.ml"
     : (Asts.value list))

let _menhir_action_05 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 153 "lib/parser.ml"
     : (Asts.value list))

let _menhir_action_06 =
  fun k v ->
    (
# 38 "lib/parser.mly"
                                              ( (k, v) )
# 161 "lib/parser.ml"
     : (string * Asts.value))

let _menhir_action_07 =
  fun xs ->
    let obj = 
# 229 "<standard.mly>"
    ( xs )
# 169 "lib/parser.ml"
     in
    (
# 35 "lib/parser.mly"
                                              ( obj )
# 174 "lib/parser.ml"
     : ((string * Asts.value) list))

let _menhir_action_08 =
  fun v ->
    (
# 21 "lib/parser.mly"
              ( Some v )
# 182 "lib/parser.ml"
     : (Asts.value option))

let _menhir_action_09 =
  fun () ->
    (
# 22 "lib/parser.mly"
              ( None   )
# 190 "lib/parser.ml"
     : (Asts.value option))

let _menhir_action_10 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 198 "lib/parser.ml"
     : ((string * Asts.value) list))

let _menhir_action_11 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 206 "lib/parser.ml"
     : ((string * Asts.value) list))

let _menhir_action_12 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 214 "lib/parser.ml"
     : (Asts.value list))

let _menhir_action_13 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 222 "lib/parser.ml"
     : (Asts.value list))

let _menhir_action_14 =
  fun obj ->
    (
# 25 "lib/parser.mly"
                                              ( `Assoc obj  )
# 230 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_15 =
  fun vl ->
    (
# 26 "lib/parser.mly"
                                              ( `List vl    )
# 238 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_16 =
  fun s ->
    (
# 27 "lib/parser.mly"
                                              ( `String s   )
# 246 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_17 =
  fun i ->
    (
# 28 "lib/parser.mly"
                                              ( `Int i      )
# 254 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_18 =
  fun x ->
    (
# 29 "lib/parser.mly"
                                              ( `Float x    )
# 262 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_19 =
  fun () ->
    (
# 30 "lib/parser.mly"
                                              ( `Bool true  )
# 270 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_20 =
  fun () ->
    (
# 31 "lib/parser.mly"
                                              ( `Bool false )
# 278 "lib/parser.ml"
     : (Asts.value))

let _menhir_action_21 =
  fun () ->
    (
# 32 "lib/parser.mly"
                                              ( `Null       )
# 286 "lib/parser.ml"
     : (Asts.value))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | EOF ->
        "EOF"
    | FALSE ->
        "FALSE"
    | FLOAT _ ->
        "FLOAT"
    | ID _ ->
        "ID"
    | INT _ ->
        "INT"
    | LEFT_BRACE ->
        "LEFT_BRACE"
    | LEFT_BRACK ->
        "LEFT_BRACK"
    | NULL ->
        "NULL"
    | RIGHT_BRACE ->
        "RIGHT_BRACE"
    | RIGHT_BRACK ->
        "RIGHT_BRACK"
    | STRING _ ->
        "STRING"
    | TRUE ->
        "TRUE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_40_spec_00 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      MenhirBox_prog _v
  
  let rec _menhir_run_39_spec_00 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let v = _v in
      let _v = _menhir_action_08 v in
      _menhir_run_40_spec_00 _menhir_stack _v
  
  let rec _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_value (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_19 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_1 in
              let _v = _menhir_action_16 s in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_21 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | LEFT_BRACK ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
          | LEFT_BRACE ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
          | INT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_4 in
              let _v = _menhir_action_17 i in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | FLOAT _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_6 in
              let _v = _menhir_action_18 x in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | _ ->
              _eRR ())
      | RIGHT_BRACK ->
          let x = _v in
          let _v = _menhir_action_12 x in
          _menhir_goto_separated_nonempty_list_COMMA_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_BRACK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_19 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_16 s in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | LEFT_BRACK ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LEFT_BRACE ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_17 i in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | FLOAT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_18 x in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | RIGHT_BRACK ->
          let _v = _menhir_action_04 () in
          _menhir_run_27_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFT_BRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
      | RIGHT_BRACE ->
          let _v = _menhir_action_02 () in
          _menhir_run_22_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_STRING (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_19 () in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_1 in
              let _v = _menhir_action_16 s in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_21 () in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LEFT_BRACK ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
          | LEFT_BRACE ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
          | INT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_4 in
              let _v = _menhir_action_17 i in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FLOAT _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_6 in
              let _v = _menhir_action_18 x in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_STRING -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_STRING (_menhir_stack, _menhir_s, k) = _menhir_stack in
      let v = _v in
      let _v = _menhir_action_06 k v in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_obj_field (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
          | _ ->
              _eRR ())
      | RIGHT_BRACE ->
          let x = _v in
          let _v = _menhir_action_10 x in
          _menhir_goto_separated_nonempty_list_COMMA_obj_field_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_obj_field_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState32 ->
          _menhir_run_16_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState09 ->
          _menhir_run_16_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_obj_field -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_obj_field (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_11 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_obj_field_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16_spec_32 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let x = _v in
      let _v = _menhir_action_03 x in
      _menhir_run_22_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_22_spec_32 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let xs = _v in
        _menhir_action_07 xs
      in
      let MenhirCell1_LEFT_BRACE (_menhir_stack, _menhir_s) = _menhir_stack in
      let obj = _v in
      let _v = _menhir_action_14 obj in
      _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_value : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_39_spec_00 _menhir_stack _v
      | MenhirState04 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_16_spec_09 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACE -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_03 x in
      _menhir_run_22_spec_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_22_spec_09 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACE -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _v =
        let xs = _v in
        _menhir_action_07 xs
      in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LEFT_BRACE (_menhir_stack, _menhir_s) = _menhir_stack in
      let obj = _v in
      let _v = _menhir_action_14 obj in
      _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_27_spec_08 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACK -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _v =
        let xs = _v in
        _menhir_action_01 xs
      in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LEFT_BRACK (_menhir_stack, _menhir_s) = _menhir_stack in
      let vl = _v in
      let _v = _menhir_action_15 vl in
      _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_separated_nonempty_list_COMMA_value_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState04 ->
          _menhir_run_26_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState08 ->
          _menhir_run_26_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACK -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let x = _v in
      let _v = _menhir_action_05 x in
      _menhir_run_27_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_27_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACK -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let xs = _v in
        _menhir_action_01 xs
      in
      let MenhirCell1_LEFT_BRACK (_menhir_stack, _menhir_s) = _menhir_stack in
      let vl = _v in
      let _v = _menhir_action_15 vl in
      _menhir_goto_value _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_26_spec_08 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LEFT_BRACK -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_05 x in
      _menhir_run_27_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_value -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_value (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_13 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _v = _menhir_action_19 () in
          _menhir_run_39_spec_00 _menhir_stack _v
      | STRING _v ->
          let s = _v in
          let _v = _menhir_action_16 s in
          _menhir_run_39_spec_00 _menhir_stack _v
      | NULL ->
          let _v = _menhir_action_21 () in
          _menhir_run_39_spec_00 _menhir_stack _v
      | LEFT_BRACK ->
          let _menhir_stack = MenhirCell1_LEFT_BRACK (_menhir_stack, MenhirState00) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_19 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
          | STRING _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v in
              let _v = _menhir_action_16 s in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_21 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
          | LEFT_BRACK ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
          | LEFT_BRACE ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
          | INT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v in
              let _v = _menhir_action_17 i in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
          | FLOAT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_18 x in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_20 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
          | RIGHT_BRACK ->
              let _v = _menhir_action_04 () in
              _menhir_run_27_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | LEFT_BRACE ->
          let _menhir_stack = MenhirCell1_LEFT_BRACE (_menhir_stack, MenhirState00) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
          | RIGHT_BRACE ->
              let _v = _menhir_action_02 () in
              _menhir_run_22_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | INT _v ->
          let i = _v in
          let _v = _menhir_action_17 i in
          _menhir_run_39_spec_00 _menhir_stack _v
      | FLOAT _v ->
          let x = _v in
          let _v = _menhir_action_18 x in
          _menhir_run_39_spec_00 _menhir_stack _v
      | FALSE ->
          let _v = _menhir_action_20 () in
          _menhir_run_39_spec_00 _menhir_stack _v
      | EOF ->
          let _v = _menhir_action_09 () in
          _menhir_run_40_spec_00 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
