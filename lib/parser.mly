%{
open Asts
%}

%token LOVES
%token HATES
%token TEACHES
%token KNOWS
%token STUDIES
%token SLEEPS
%token EATS
%token SWIMS
%token MATHEMATICIAN
%token LAWYER
%token ENGINEER
%token FILMMAKER
%token A
%token EVERY
%token SOME
%token NO
%token ALEX
%token CHRISTIE
%token CALEB
%token LAUREN
%token THAT
%token CLEVER
%token SLEEPY
%token FUNNY
%token GRUMPY
%token IS
%token EOF

%type <Asts.phrase> input, common_noun, determiner, intransitive_verb, noun_phrase, proper_noun, relative_common_noun, sentence, transitive_verb, verb_phrase
%type <Asts.adjective> adjective
%start input

%%

input:
  | s = sentence; EOF { s } 
  | vp = verb_phrase; EOF { vp }
  | np = noun_phrase; EOF { np }
  | rcn = relative_common_noun; EOF { rcn }
  | tv = transitive_verb; EOF { tv }
  | det = determiner; EOF { det }
  | cn = common_noun; EOF { cn }
  | pn = proper_noun; EOF { pn }
  | adj = adjective; EOF { ADJ adj }
  ;

sentence:
  | np = noun_phrase; vp = verb_phrase { S (np,vp) }
  ;

verb_phrase:
  | iv = intransitive_verb { iv }
  | tv = transitive_verb; obj = noun_phrase {TVP (tv, obj)}
  | IS; adj = adjective { ISADJVP adj }
  | IS; A; cn = common_noun { ISNVP cn }
  | IS; A; rcn = relative_common_noun { ISNVP rcn }
  ;

noun_phrase:
  | pn = proper_noun { PNP pn }
  | det = determiner; cn = common_noun { CNP (det, cn) }
  | det = determiner; rcn = relative_common_noun { CNP (det, rcn) }
  ;

relative_common_noun:
  | cn = common_noun; THAT; vp = verb_phrase { RCN (cn, vp) }
  | cn = common_noun; THAT; np = noun_phrase; tv = transitive_verb { TRCN (cn, np, tv) }
  ;

intransitive_verb:
  | STUDIES { IVP Studies }
  | SLEEPS { IVP Sleeps }
  | EATS { IVP Eats }
  | SWIMS { IVP Swims }
  ;

transitive_verb:
  | LOVES { TV Loves }
  | HATES { TV Hates }
  | TEACHES { TV Teaches }
  | KNOWS { TV Knows }
  ;

proper_noun:
  | ALEX { PN Alex }
  | CHRISTIE { PN Christie }
  | CALEB { PN Caleb }
  | LAUREN { PN Lauren }

determiner:
  | A { DET A }
  | EVERY { DET Every }
  | SOME { DET Some }
  | NO { DET No }

common_noun: 
  | MATHEMATICIAN { CN Mathematician }
  | LAWYER { CN Lawyer }
  | ENGINEER { CN Engineer }
  | FILMMAKER { CN Filmmaker }
  | adj = adjective; cn = common_noun { ADJCN (ADJ adj, cn) }

adjective: 
  | CLEVER { Clever }
  | SLEEPY { Sleepy }
  | FUNNY { Funny }
  | GRUMPY { Grumpy }