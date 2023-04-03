%{
open Asts
%}

%token LOVED
%token HATED
%token TAUGHT
%token HELPED
%token STUDIED
%token SLEPT
%token ATE
%token SWAM
%token MATHEMATICIAN
%token LAWYER
%token ENGINEER
%token FILMMAKER
%token THE
%token A
%token EVERY
%token SOME
%token NO
%token NICOLE
%token CHRISTIE
%token CALEB
%token LAUREN
%token EOF

%start <Asts.phrase> input
%%

input:
  | s = sentence; EOF { s } ;

sentence:
  | np = noun_phrase; vp = verb_phrase { S (np,vp) }
  ;

verb_phrase:
  | iv = intransitive_verb { IVP iv }
  | tv = transitive_verb; obj = noun_phrase {TVP (tv, obj)}
  ;

noun_phrase:
  | pn = proper_noun { PNP pn }
  | det = determiner; cn = common_noun { CNP (det, cn) }
  ;

intransitive_verb:
  | STUDIED { Studied }
  | SLEPT { Slept }
  | ATE { Ate }
  | SWAM { Swam }
  ;

transitive_verb:
  | LOVED { Loved }
  | HATED { Hated }
  | TAUGHT { Taught }
  | HELPED { Helped }
  ;

proper_noun:
  | NICOLE { Nicole }
  | CHRISTIE { Christie }
  | CALEB { Caleb }
  | LAUREN { Lauren }

determiner:
  | THE { The }
  | A { A }
  | EVERY { Every }
  | SOME { Some }
  | NO { No }

common_noun: 
  | MATHEMATICIAN { Mathematician }
  | LAWYER { Lawyer }
  | ENGINEER { Engineer }
  | FILMMAKER { Filmmaker }