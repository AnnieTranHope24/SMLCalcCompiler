(* calc.lex -- lexer spec *)

type pos = int
type svalue = Tokens.svalue
type ('a, 'b) token = ('a, 'b) Tokens.token
type lexresult = (svalue, pos) token
val pos = ref 1
val error = fn x => TextIO.output(TextIO.stdErr, x ^ "\n")
val eof = fn () => Tokens.EOF(!pos, !pos)
fun sval([], r) = r
  | sval(a::s, r) = sval (s, r*10+(ord(a) - ord(#"0")));

%%

%header (functor calcLexFun(structure Tokens : calc_TOKENS));
alpha=[A-Za-z];
alphanumeric=[A-Za-z0-9_];
digit=[0-9];
reop=[">", "<", ">=","<=","=", "<>" ];
ws=[\ \t];

%%

\n  => (pos := (!pos) + 1; lex());
{ws}+  => (lex());
"("  => (Tokens.LParen(!pos,!pos));
")"  => (Tokens.RParen(!pos,!pos));
"+"  => (Tokens.Plus(!pos,!pos));
"*"  => (Tokens.Times(!pos,!pos));
"/"  => (Tokens.Div(!pos,!pos));
"-"  => (Tokens.Minus(!pos,!pos));
"="  => (Tokens.Equal(!pos,!pos));
";" => (Tokens.Semicolon(!pos,!pos));
":" => (Tokens.Colon(!pos,!pos));
"!" => (Tokens.Exclam(!pos,!pos));
{digit}+  => (Tokens.Int(sval(explode yytext,0),!pos,!pos));
{reop} => (Tokens.RelOp(yytext,!pos,!pos) );
{alpha}{alphanumeric}* =>
   (let val tok = String.implode (List.map (Char.toLower) 
             (String.explode yytext))
    in
      if      tok="s" then Tokens.Store(!pos,!pos)
      else if tok="r" then Tokens.Recall(!pos,!pos)
	  else if tok="get" then Tokens.Get(!pos,!pos)
	  else if tok="let" then Tokens.Let(!pos,!pos)
	  else if tok="val" then Tokens.Val(!pos,!pos)
	  else if tok="fun" then Tokens.Fun(!pos,!pos)
	  else if tok="in" then Tokens.In(!pos,!pos)
	  else if tok="end" then Tokens.End(!pos,!pos)
	  else if tok="if" then Tokens.If(!pos,!pos)
	  else if tok="then" then Tokens.Then(!pos,!pos)
	  else if tok="print" then Tokens.Print(!pos,!pos)
	  else if tok="ref" then Tokens.Ref(!pos,!pos)
	  else if tok="while" then Tokens.While(!pos,!pos)
	  else if tok="do" then Tokens.Do(!pos,!pos)
	  else if tok="else" then Tokens.Else(!pos,!pos)
	  
      else Tokens.ID(yytext,!pos,!pos) 
    end);
.  => (error ("error: bad token "^yytext); lex());

