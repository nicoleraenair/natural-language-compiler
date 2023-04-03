type proper_noun = 
  | Nicole
  | Christie
  | Caleb
  | Lauren

type determiner =
  | The
  | A
  | Every
  | Some
  | No

type common_noun = 
  | Mathematician
  | Lawyer
  | Engineer
  | Filmmaker

type noun_phrase = 
  | PNP of proper_noun
  | CNP of determiner * common_noun

type intransitive_verb = 
  | Studied
  | Slept
  | Ate
  | Swam

type transitive_verb =
  | Loved
  | Hated
  | Taught
  | Helped

type verb_phrase = 
  | IVP of intransitive_verb
  | TVP of transitive_verb * noun_phrase

type sentence =
  | S of noun_phrase * verb_phrase

  (* to add:
     - and/or/negate of sentences/vp/np/etc.
     - relative clauses (THAT)
     - DV - eg. gave(_,_,_)
     - adjectives
     - preposition phrases, in such a way that the sentence A dwarf defeated a giant with a sword is generated in two structurally different ways, while there is only one way to generate A dwarf defeated Little Mook with a sword.
     - wanted to INF
     - punctuation
  *)