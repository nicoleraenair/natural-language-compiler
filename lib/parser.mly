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

%start input

%type <Asts.phrase> input
%type <Asts.phrase> sentence
%type <Asts.phrase> verb_phrase
%type <Asts.phrase> noun_phrase

%type <Asts.intransitive_verb> intransitive_verb
%type <Asts.transitive_verb> transitive_verb
%type <Asts.proper_noun> proper_noun
%type <Asts.determiner> determiner
%type <Asts.common_noun> common_noun

%%

input:
  | s = sentence; EOF { s } 
  | vp = verb_phrase; EOF { vp }
  | np = noun_phrase; EOF { np }
  | tv = transitive_verb; EOF { TV tv }
  | det = determiner; EOF { DET det }
  | cn = common_noun; EOF { CN cn }
  ;

sentence:
  | np = noun_phrase; vp = verb_phrase { S (np,vp) }
  ;

verb_phrase:
  | iv = intransitive_verb { IVP iv }
  | tv = transitive_verb; obj = noun_phrase {TVP (TV tv, obj)}
  ;

noun_phrase:
  | pn = proper_noun { PNP pn }
  | det = determiner; cn = common_noun { CNP (DET det, CN cn) }
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