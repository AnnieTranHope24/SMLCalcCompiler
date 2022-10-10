signature calc_TOKENS =
sig
type ('a,'b) token
type svalue
val Do:  'a * 'a -> (svalue,'a) token
val While:  'a * 'a -> (svalue,'a) token
val Ref:  'a * 'a -> (svalue,'a) token
val Colon:  'a * 'a -> (svalue,'a) token
val Exclam:  'a * 'a -> (svalue,'a) token
val Print:  'a * 'a -> (svalue,'a) token
val Semicolon:  'a * 'a -> (svalue,'a) token
val Fun:  'a * 'a -> (svalue,'a) token
val Else:  'a * 'a -> (svalue,'a) token
val Then:  'a * 'a -> (svalue,'a) token
val If:  'a * 'a -> (svalue,'a) token
val RelOp: (string) *  'a * 'a -> (svalue,'a) token
val ID: (string) *  'a * 'a -> (svalue,'a) token
val Get:  'a * 'a -> (svalue,'a) token
val End:  'a * 'a -> (svalue,'a) token
val In:  'a * 'a -> (svalue,'a) token
val Equal:  'a * 'a -> (svalue,'a) token
val Val:  'a * 'a -> (svalue,'a) token
val Let:  'a * 'a -> (svalue,'a) token
val Int: (int) *  'a * 'a -> (svalue,'a) token
val Recall:  'a * 'a -> (svalue,'a) token
val Store:  'a * 'a -> (svalue,'a) token
val Div:  'a * 'a -> (svalue,'a) token
val Times:  'a * 'a -> (svalue,'a) token
val Minus:  'a * 'a -> (svalue,'a) token
val Plus:  'a * 'a -> (svalue,'a) token
val RParen:  'a * 'a -> (svalue,'a) token
val LParen:  'a * 'a -> (svalue,'a) token
val EOF:  'a * 'a -> (svalue,'a) token
end
signature calc_LRVALS=
sig
structure Tokens : calc_TOKENS
structure ParserData:PARSER_DATA
sharing type ParserData.Token.token = Tokens.token
sharing type ParserData.svalue = Tokens.svalue
end
