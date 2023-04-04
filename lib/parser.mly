%{
open Asts
%}

%token LOVES
%token HATES
%token TEACHES
%token HELPS
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
  | STUDIES { Studies }
  | SLEEPS { Sleeps }
  | EATS { Eats }
  | SWIMS { Swims }
  ;

transitive_verb:
  | LOVES { Loves }
  | HATES { Hates }
  | TEACHES { Teaches }
  | HELPS { Helps }
  ;

proper_noun:
  | ALEX { Alex }
  | CHRISTIE { Christie }
  | CALEB { Caleb }
  | LAUREN { Lauren }

determiner:
  | A { A }
  | EVERY { Every }
  | SOME { Some }
  | NO { No }

common_noun: 
  | MATHEMATICIAN { Mathematician }
  | LAWYER { Lawyer }
  | ENGINEER { Engineer }
  | FILMMAKER { Filmmaker }