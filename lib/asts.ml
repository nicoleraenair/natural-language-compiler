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
  | CNP of determiner * common_noun
  | IVP of intransitive_verb
  | TVP of transitive_verb * phrase

  (* to add:
     - and/or/negate of sentences/vp/np/etc.
     - relative clauses (THAT)
     - DV - eg. gave(_,_,_)
     - adjectives
     - preposition phrases, in such a way that the sentence A dwarf defeated a giant with a sword is generated in two structurally different ways, while there is only one way to generate A dwarf defeated Little Mook with a sword.
     - wanted to INF
     - punctuation
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
