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
  | Helps

type phrase = 
  | S of phrase * phrase
  | PNP of proper_noun
  | CNP of phrase * phrase
  | DET of determiner
  | CN of common_noun
  | IVP of intransitive_verb
  | TVP of phrase * phrase
  | TV of transitive_verb

  (* to add:
     - and/or/negate of sentences/vp/np/etc.
     - relative clauses (THAT)
     - is adjective (adj. = x.strong(x))

     every starfish waves
     sal sings and robert dances
    martha is a doctor?
    paola sings and(VP) dances
     extensions: punctuation, wanted to INF, didn't INF, preposition phrases, in such a way that the sentence A dwarf defeated a giant with a sword is generated in two structurally different ways, while there is only one way to generate A dwarf defeated Little Mook with a sword.


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
  | Helps -> "helps"
;;

let string_of_det (det : determiner) : string = 
  match det with A -> "a" | Every -> "every" | Some -> "some" | No -> "no"
;;

let rec string_of_phrase (p : phrase) : string = 
  match p with
  | S (np, vp) -> "S(" ^ string_of_phrase np ^ "," ^ string_of_phrase vp ^ ")"
  | PNP pn -> string_of_pn pn
  | CNP (det, cn) -> "CNP(" ^ string_of_phrase det ^ "," ^ string_of_phrase cn ^ ")"
  | DET det -> string_of_det det
  | CN cn -> string_of_cn cn
  | IVP iv -> string_of_iv iv
  | TVP (tv, np) -> "TVP(" ^ string_of_phrase tv ^ "," ^ string_of_phrase np ^ ")"
  | TV tv -> string_of_tv tv
;;
