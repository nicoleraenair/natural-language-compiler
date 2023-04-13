type proper_noun = 
  | Alex
  | Christie
  | Caleb
  | Lauren

type determiner =
  | A
  | Every
  | Some
  | No

type common_noun = 
  | Mathematician
  | Lawyer
  | Engineer
  | Filmmaker

type intransitive_verb = 
  | Studies
  | Sleeps
  | Eats
  | Swims

type transitive_verb =
  | Loves
  | Hates
  | Teaches
  | Knows

type adjective =
  | Clever
  | Sleepy
  | Funny
  | Grumpy

type phrase = 
  | S of phrase * phrase
  | PNP of phrase (* pn *)
  | CNP of phrase * phrase (* det cn / det rcn / det adjcn / det trcn *)
  | DET of determiner
  | PN of proper_noun
  | CN of common_noun
  | IVP of intransitive_verb
  | TVP of phrase * phrase (* tv np *)
  | TV of transitive_verb
  | RCN of phrase * phrase (* cn that ivp / cn that tvp *)
  | TRCN of phrase * phrase * phrase (* cn that np tv *)
  | ADJ of adjective
  | ADJCN of phrase * phrase (* adj cn / adj cn *)
  | ISNVP of phrase (* cn/rcn/trcn *)
  | ISADJVP of adjective (* adj *)

  (* to add:
    - S(CN, is a CN/rcn/trcn/adjcn)
   
    alex/every lawyer is clever
    christie is a lawyer

    extensions:

    - punctuation (commas eg for and)
    - wanted to INF, didn't INF
    - preposition phrases
    - syntactic ambiguities

    ! and/or/negate of sentences/vp/np/etc.
      | SOR of phrase * phrase
      | SAND of phrase * phrase
      | NOR of phrase * phrase
      | NAND of phrase * phrase
      | VOR of phrase * phrase
      | VAND of phrase * phrase
    caleb studies and lauren eats and ...
    caleb sleeps and(VP) swims = caleb sleeps and caleb swims
  *)

(* could also be single-letter variables, could be user-customizable *)
let string_of_pn (pn : proper_noun) : string = 
  match pn with
  | Alex -> "Alex"
  | Christie -> "Christie"
  | Caleb -> "Caleb"
  | Lauren -> "Lauren"
;;

(*is there a way to automatically just get the string version of the variant?*)
let string_of_cn (cn : common_noun) : string = 
  match cn with
  | Mathematician -> "mathematician"
  | Lawyer -> "lawyer"
  | Engineer -> "engineer"
  | Filmmaker -> "filmmaker"
;;

let string_of_iv (iv : intransitive_verb) : string =
  match iv with
  | Studies -> "studies"
  | Sleeps -> "sleeps"
  | Eats -> "eats"
  | Swims -> "swims"
;;

let string_of_tv (tv : transitive_verb) : string =
  match tv with
  | Loves -> "loves"
  | Hates -> "hates"
  | Teaches -> "teaches"
  | Knows -> "knows"
;;

let string_of_adj (adj : adjective) : string = 
  match adj with
  | Clever -> "clever"
  | Sleepy -> "sleepy"
  | Funny -> "funny"
  | Grumpy -> "grumpy"
;;

let string_of_det (det : determiner) : string = 
  match det with A -> "a" | Every -> "every" | Some -> "some" | No -> "no"
;;

let rec string_of_phrase (p : phrase) : string = 
  match p with
  | S (np, vp) -> "S(" ^ string_of_phrase np ^ "," ^ string_of_phrase vp ^ ")"
  | PNP pn -> "PNP(" ^ string_of_phrase pn ^ ")"
  | CNP (det, cn) -> "CNP(" ^ string_of_phrase det ^ "," ^ string_of_phrase cn ^ ")"
  | PN pn -> "PN(" ^ string_of_pn pn ^ ")"
  | DET det -> "DET(" ^ string_of_det det ^ ")"
  | CN cn -> "CN(" ^ string_of_cn cn ^ ")"
  | IVP iv -> "IVP(" ^ string_of_iv iv ^ ")"
  | TVP (tv, np) -> "TVP(" ^ string_of_phrase tv ^ "," ^ string_of_phrase np ^ ")"
  | TV tv -> "TV(" ^ string_of_tv tv ^ ")"
  | RCN (cn, vp) -> "RCN(" ^ string_of_phrase cn ^ "," ^ string_of_phrase vp ^ ")"
  | TRCN (cn, np, tv) -> "TRCN(" ^ string_of_phrase cn ^ "," ^ string_of_phrase np ^ "," ^ string_of_phrase tv ^ ")"
  | ADJ adj -> "ADJ(" ^ string_of_adj adj ^ ")"
  | ADJCN (adj, n) -> "ADJCN(" ^ string_of_phrase adj ^ "," ^ string_of_phrase n ^ ")"
  | ISNVP n -> "ISNVP(" ^ string_of_phrase n ^ ")"
  | ISADJVP adj -> "ISADJVP(" ^ string_of_adj adj ^ ")"
;;
