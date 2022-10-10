functor calcLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : calc_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(* calc.grm - parser spec *)

open calcAS;


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\000\000\000\000\
\\001\000\001\000\092\000\004\000\022\000\005\000\021\000\000\000\
\\001\000\001\000\093\000\003\000\093\000\004\000\093\000\005\000\093\000\
\\006\000\020\000\007\000\019\000\008\000\093\000\013\000\093\000\
\\014\000\093\000\015\000\093\000\018\000\093\000\020\000\093\000\
\\021\000\093\000\023\000\093\000\029\000\093\000\000\000\
\\001\000\001\000\094\000\003\000\094\000\004\000\094\000\005\000\094\000\
\\006\000\020\000\007\000\019\000\008\000\094\000\013\000\094\000\
\\014\000\094\000\015\000\094\000\018\000\094\000\020\000\094\000\
\\021\000\094\000\023\000\094\000\029\000\094\000\000\000\
\\001\000\001\000\095\000\003\000\095\000\004\000\095\000\005\000\095\000\
\\006\000\020\000\007\000\019\000\008\000\095\000\013\000\095\000\
\\014\000\095\000\015\000\095\000\018\000\095\000\020\000\095\000\
\\021\000\095\000\023\000\095\000\029\000\095\000\000\000\
\\001\000\001\000\096\000\003\000\096\000\004\000\096\000\005\000\096\000\
\\006\000\096\000\007\000\096\000\008\000\096\000\013\000\096\000\
\\014\000\096\000\015\000\096\000\018\000\096\000\020\000\096\000\
\\021\000\096\000\023\000\096\000\029\000\096\000\000\000\
\\001\000\001\000\097\000\003\000\097\000\004\000\097\000\005\000\097\000\
\\006\000\097\000\007\000\097\000\008\000\097\000\013\000\097\000\
\\014\000\097\000\015\000\097\000\018\000\097\000\020\000\097\000\
\\021\000\097\000\023\000\097\000\029\000\097\000\000\000\
\\001\000\001\000\098\000\003\000\098\000\004\000\098\000\005\000\098\000\
\\006\000\098\000\007\000\098\000\008\000\098\000\013\000\098\000\
\\014\000\098\000\015\000\098\000\018\000\098\000\020\000\098\000\
\\021\000\098\000\023\000\098\000\029\000\098\000\000\000\
\\001\000\001\000\099\000\003\000\099\000\004\000\099\000\005\000\099\000\
\\006\000\099\000\007\000\099\000\008\000\099\000\013\000\099\000\
\\014\000\099\000\015\000\099\000\018\000\099\000\020\000\099\000\
\\021\000\099\000\023\000\099\000\029\000\099\000\000\000\
\\001\000\001\000\100\000\003\000\100\000\004\000\100\000\005\000\100\000\
\\006\000\100\000\007\000\100\000\008\000\018\000\013\000\100\000\
\\014\000\100\000\015\000\100\000\018\000\100\000\020\000\100\000\
\\021\000\100\000\023\000\100\000\029\000\100\000\000\000\
\\001\000\001\000\101\000\003\000\101\000\004\000\101\000\005\000\101\000\
\\006\000\101\000\007\000\101\000\008\000\101\000\013\000\101\000\
\\014\000\101\000\015\000\101\000\018\000\101\000\020\000\101\000\
\\021\000\101\000\023\000\101\000\029\000\101\000\000\000\
\\001\000\001\000\102\000\003\000\102\000\004\000\102\000\005\000\102\000\
\\006\000\102\000\007\000\102\000\008\000\102\000\013\000\102\000\
\\014\000\102\000\015\000\102\000\018\000\102\000\020\000\102\000\
\\021\000\102\000\023\000\102\000\029\000\102\000\000\000\
\\001\000\001\000\103\000\003\000\103\000\004\000\103\000\005\000\103\000\
\\006\000\103\000\007\000\103\000\008\000\103\000\013\000\103\000\
\\014\000\103\000\015\000\103\000\018\000\103\000\020\000\103\000\
\\021\000\103\000\023\000\103\000\029\000\103\000\000\000\
\\001\000\001\000\104\000\003\000\104\000\004\000\104\000\005\000\104\000\
\\006\000\104\000\007\000\104\000\008\000\104\000\013\000\104\000\
\\014\000\104\000\015\000\104\000\018\000\104\000\020\000\104\000\
\\021\000\104\000\023\000\104\000\029\000\104\000\000\000\
\\001\000\001\000\105\000\003\000\105\000\004\000\105\000\005\000\105\000\
\\006\000\105\000\007\000\105\000\008\000\105\000\013\000\105\000\
\\014\000\105\000\015\000\105\000\018\000\105\000\020\000\105\000\
\\021\000\105\000\023\000\105\000\029\000\105\000\000\000\
\\001\000\001\000\106\000\003\000\106\000\004\000\106\000\005\000\106\000\
\\006\000\106\000\007\000\106\000\008\000\106\000\013\000\106\000\
\\014\000\106\000\015\000\106\000\018\000\106\000\020\000\106\000\
\\021\000\106\000\023\000\106\000\029\000\106\000\000\000\
\\001\000\001\000\107\000\002\000\031\000\003\000\107\000\004\000\107\000\
\\005\000\107\000\006\000\107\000\007\000\107\000\008\000\107\000\
\\013\000\107\000\014\000\107\000\015\000\107\000\018\000\107\000\
\\020\000\107\000\021\000\107\000\023\000\107\000\026\000\045\000\
\\029\000\107\000\000\000\
\\001\000\001\000\107\000\002\000\031\000\003\000\107\000\004\000\107\000\
\\005\000\107\000\006\000\107\000\007\000\107\000\008\000\107\000\
\\013\000\107\000\014\000\107\000\015\000\107\000\018\000\107\000\
\\020\000\107\000\021\000\107\000\023\000\107\000\029\000\107\000\000\000\
\\001\000\001\000\108\000\003\000\108\000\004\000\108\000\005\000\108\000\
\\006\000\108\000\007\000\108\000\008\000\108\000\013\000\108\000\
\\014\000\108\000\015\000\108\000\018\000\108\000\020\000\108\000\
\\021\000\108\000\023\000\108\000\029\000\108\000\000\000\
\\001\000\001\000\109\000\003\000\109\000\004\000\109\000\005\000\109\000\
\\006\000\109\000\007\000\109\000\008\000\109\000\013\000\109\000\
\\014\000\109\000\015\000\109\000\018\000\109\000\020\000\109\000\
\\021\000\109\000\023\000\109\000\029\000\109\000\000\000\
\\001\000\001\000\110\000\003\000\110\000\004\000\022\000\005\000\021\000\
\\006\000\110\000\007\000\110\000\008\000\110\000\013\000\110\000\
\\014\000\110\000\015\000\110\000\018\000\110\000\020\000\110\000\
\\021\000\110\000\023\000\110\000\029\000\110\000\000\000\
\\001\000\001\000\111\000\003\000\111\000\004\000\022\000\005\000\021\000\
\\006\000\111\000\007\000\111\000\008\000\111\000\013\000\111\000\
\\014\000\111\000\015\000\111\000\018\000\111\000\020\000\111\000\
\\021\000\111\000\023\000\111\000\029\000\111\000\000\000\
\\001\000\001\000\112\000\003\000\112\000\004\000\112\000\005\000\112\000\
\\006\000\112\000\007\000\112\000\008\000\112\000\013\000\112\000\
\\014\000\112\000\015\000\112\000\018\000\112\000\020\000\112\000\
\\021\000\112\000\023\000\112\000\029\000\112\000\000\000\
\\001\000\001\000\113\000\003\000\113\000\004\000\113\000\005\000\113\000\
\\006\000\113\000\007\000\113\000\008\000\113\000\013\000\113\000\
\\014\000\113\000\015\000\113\000\018\000\113\000\020\000\113\000\
\\021\000\113\000\023\000\113\000\029\000\113\000\000\000\
\\001\000\001\000\114\000\003\000\114\000\004\000\114\000\005\000\114\000\
\\006\000\114\000\007\000\114\000\008\000\114\000\013\000\114\000\
\\014\000\114\000\015\000\114\000\018\000\114\000\020\000\114\000\
\\021\000\114\000\023\000\114\000\029\000\114\000\000\000\
\\001\000\001\000\115\000\003\000\115\000\004\000\115\000\005\000\115\000\
\\006\000\115\000\007\000\115\000\008\000\115\000\013\000\115\000\
\\014\000\115\000\015\000\115\000\018\000\115\000\020\000\115\000\
\\021\000\115\000\023\000\115\000\029\000\115\000\000\000\
\\001\000\001\000\116\000\003\000\116\000\004\000\022\000\005\000\021\000\
\\006\000\116\000\007\000\116\000\008\000\116\000\013\000\116\000\
\\014\000\116\000\015\000\116\000\018\000\116\000\020\000\116\000\
\\021\000\116\000\023\000\043\000\029\000\116\000\000\000\
\\001\000\001\000\117\000\003\000\117\000\004\000\117\000\005\000\117\000\
\\006\000\117\000\007\000\117\000\008\000\117\000\013\000\117\000\
\\014\000\117\000\015\000\117\000\018\000\117\000\020\000\117\000\
\\021\000\117\000\023\000\117\000\029\000\117\000\000\000\
\\001\000\001\000\118\000\003\000\118\000\004\000\118\000\005\000\118\000\
\\006\000\118\000\007\000\118\000\008\000\118\000\013\000\118\000\
\\014\000\118\000\015\000\118\000\018\000\118\000\020\000\118\000\
\\021\000\118\000\023\000\118\000\029\000\118\000\000\000\
\\001\000\001\000\119\000\003\000\119\000\004\000\119\000\005\000\119\000\
\\006\000\119\000\007\000\119\000\008\000\119\000\013\000\119\000\
\\014\000\119\000\015\000\119\000\018\000\119\000\020\000\119\000\
\\021\000\119\000\023\000\040\000\029\000\119\000\000\000\
\\001\000\001\000\120\000\003\000\120\000\004\000\120\000\005\000\120\000\
\\006\000\120\000\007\000\120\000\008\000\120\000\013\000\120\000\
\\014\000\120\000\015\000\120\000\018\000\120\000\020\000\120\000\
\\021\000\120\000\023\000\041\000\029\000\120\000\000\000\
\\001\000\001\000\121\000\003\000\121\000\004\000\121\000\005\000\121\000\
\\006\000\121\000\007\000\121\000\008\000\121\000\013\000\121\000\
\\014\000\121\000\015\000\121\000\018\000\121\000\020\000\121\000\
\\021\000\121\000\023\000\121\000\029\000\121\000\000\000\
\\001\000\001\000\122\000\003\000\122\000\004\000\022\000\005\000\021\000\
\\006\000\122\000\007\000\122\000\008\000\122\000\013\000\122\000\
\\014\000\122\000\015\000\122\000\018\000\122\000\020\000\122\000\
\\021\000\122\000\023\000\122\000\029\000\122\000\000\000\
\\001\000\001\000\123\000\003\000\123\000\004\000\123\000\005\000\123\000\
\\006\000\123\000\007\000\123\000\008\000\123\000\013\000\123\000\
\\014\000\123\000\015\000\123\000\018\000\123\000\020\000\123\000\
\\021\000\123\000\023\000\123\000\029\000\123\000\000\000\
\\001\000\002\000\017\000\005\000\016\000\009\000\015\000\010\000\014\000\
\\011\000\013\000\016\000\012\000\017\000\011\000\019\000\010\000\
\\024\000\009\000\028\000\008\000\000\000\
\\001\000\002\000\017\000\005\000\016\000\009\000\015\000\010\000\014\000\
\\011\000\013\000\016\000\012\000\017\000\028\000\019\000\010\000\
\\024\000\009\000\025\000\027\000\027\000\070\000\028\000\008\000\000\000\
\\001\000\002\000\017\000\005\000\016\000\009\000\015\000\010\000\014\000\
\\011\000\013\000\016\000\012\000\017\000\028\000\019\000\010\000\
\\024\000\009\000\025\000\027\000\028\000\008\000\000\000\
\\001\000\002\000\029\000\000\000\
\\001\000\002\000\062\000\000\000\
\\001\000\003\000\052\000\000\000\
\\001\000\003\000\058\000\000\000\
\\001\000\003\000\061\000\004\000\022\000\005\000\021\000\000\000\
\\001\000\003\000\074\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\013\000\048\000\018\000\047\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\014\000\087\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\015\000\090\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\020\000\066\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\020\000\067\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\021\000\077\000\000\000\
\\001\000\004\000\022\000\005\000\021\000\021\000\078\000\000\000\
\\001\000\012\000\033\000\022\000\032\000\000\000\
\\001\000\013\000\057\000\000\000\
\\001\000\013\000\063\000\000\000\
\\001\000\013\000\079\000\000\000\
\\001\000\014\000\075\000\000\000\
\\001\000\014\000\081\000\000\000\
\\001\000\015\000\085\000\000\000\
\\001\000\015\000\088\000\000\000\
\\001\000\017\000\044\000\000\000\
\\001\000\017\000\050\000\000\000\
\\001\000\017\000\051\000\000\000\
\\001\000\017\000\068\000\000\000\
\\001\000\018\000\042\000\000\000\
\\001\000\029\000\064\000\000\000\
\"
val actionRowNumbers =
"\034\000\011\000\009\000\007\000\
\\004\000\001\000\036\000\037\000\
\\034\000\017\000\015\000\050\000\
\\012\000\014\000\034\000\036\000\
\\008\000\034\000\034\000\034\000\
\\034\000\029\000\030\000\062\000\
\\026\000\058\000\016\000\036\000\
\\043\000\034\000\059\000\060\000\
\\010\000\039\000\006\000\005\000\
\\003\000\002\000\036\000\036\000\
\\036\000\036\000\033\000\051\000\
\\040\000\034\000\034\000\041\000\
\\038\000\052\000\013\000\031\000\
\\028\000\063\000\027\000\034\000\
\\024\000\046\000\047\000\022\000\
\\061\000\035\000\036\000\032\000\
\\034\000\034\000\042\000\054\000\
\\036\000\025\000\048\000\049\000\
\\053\000\036\000\055\000\034\000\
\\034\000\034\000\056\000\036\000\
\\020\000\021\000\044\000\018\000\
\\057\000\034\000\019\000\045\000\
\\023\000\000\000"
val gotoT =
"\
\\001\000\089\000\002\000\005\000\003\000\004\000\004\000\003\000\
\\005\000\002\000\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\023\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\002\000\028\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\005\000\032\000\006\000\001\000\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\033\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\004\000\034\000\005\000\002\000\006\000\001\000\000\000\
\\004\000\035\000\005\000\002\000\006\000\001\000\000\000\
\\003\000\036\000\004\000\003\000\005\000\002\000\006\000\001\000\000\000\
\\003\000\037\000\004\000\003\000\005\000\002\000\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\044\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\002\000\047\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\051\000\008\000\022\000\009\000\021\000\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\052\000\008\000\022\000\009\000\021\000\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\053\000\008\000\022\000\009\000\021\000\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\054\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\057\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\002\000\058\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\063\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\067\000\008\000\022\000\009\000\021\000\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\069\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\002\000\070\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\002\000\071\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\074\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\078\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\002\000\080\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\002\000\081\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\002\000\082\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\002\000\024\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\007\000\084\000\008\000\022\000\009\000\021\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\002\000\087\000\003\000\004\000\004\000\003\000\005\000\002\000\
\\006\000\001\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 90
val numrules = 32
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit | RelOp of  (string)
 | ID of  (string) | Int of  (int) | DefExpr of  (AST)
 | RefExpr of  (AST) | ExprSeq of  (AST) | Factor of  (AST)
 | NegFactor of  (AST) | StoreIt of  (AST) | Term of  (AST)
 | Expr of  (AST) | Prog of  (AST)
end
type svalue = MlyValue.svalue
type result = AST
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn _ => false
val preferred_change : (term list * term list) list = 
nil
val noShift = 
fn _ => false
val showTerminal =
fn (T 0) => "EOF"
  | (T 1) => "LParen"
  | (T 2) => "RParen"
  | (T 3) => "Plus"
  | (T 4) => "Minus"
  | (T 5) => "Times"
  | (T 6) => "Div"
  | (T 7) => "Store"
  | (T 8) => "Recall"
  | (T 9) => "Int"
  | (T 10) => "Let"
  | (T 11) => "Val"
  | (T 12) => "Equal"
  | (T 13) => "In"
  | (T 14) => "End"
  | (T 15) => "Get"
  | (T 16) => "ID"
  | (T 17) => "RelOp"
  | (T 18) => "If"
  | (T 19) => "Then"
  | (T 20) => "Else"
  | (T 21) => "Fun"
  | (T 22) => "Semicolon"
  | (T 23) => "Print"
  | (T 24) => "Exclam"
  | (T 25) => "Colon"
  | (T 26) => "Ref"
  | (T 27) => "While"
  | (T 28) => "Do"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22)
 $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 15) $$ (T 14) $$ (T 13)
 $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ 
(T 4) $$ (T 3) $$ (T 2) $$ (T 1) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.Expr Expr, Expr1left, Expr1right)) :: 
rest671)) => let val  result = MlyValue.Prog (Expr)
 in ( LrTable.NT 0, ( result, Expr1left, Expr1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.Term Term, _, Term1right)) :: _ :: ( _, ( 
MlyValue.Expr Expr, Expr1left, _)) :: rest671)) => let val  result = 
MlyValue.Expr (add'(Expr,Term))
 in ( LrTable.NT 1, ( result, Expr1left, Term1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.Term Term, _, Term1right)) :: _ :: ( _, ( 
MlyValue.Expr Expr, Expr1left, _)) :: rest671)) => let val  result = 
MlyValue.Expr (sub'(Expr,Term))
 in ( LrTable.NT 1, ( result, Expr1left, Term1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.Term Term, Term1left, Term1right)) :: 
rest671)) => let val  result = MlyValue.Expr (Term)
 in ( LrTable.NT 1, ( result, Term1left, Term1right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.StoreIt StoreIt, _, StoreIt1right)) :: _ :: 
( _, ( MlyValue.Term Term, Term1left, _)) :: rest671)) => let val  
result = MlyValue.Term (prod'(Term,StoreIt))
 in ( LrTable.NT 2, ( result, Term1left, StoreIt1right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.StoreIt StoreIt, _, StoreIt1right)) :: _ :: 
( _, ( MlyValue.Term Term, Term1left, _)) :: rest671)) => let val  
result = MlyValue.Term (div'(Term,StoreIt))
 in ( LrTable.NT 2, ( result, Term1left, StoreIt1right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.StoreIt StoreIt, StoreIt1left, StoreIt1right
)) :: rest671)) => let val  result = MlyValue.Term (StoreIt)
 in ( LrTable.NT 2, ( result, StoreIt1left, StoreIt1right), rest671)

end
|  ( 7, ( ( _, ( _, _, Store1right)) :: ( _, ( MlyValue.NegFactor 
NegFactor, NegFactor1left, _)) :: rest671)) => let val  result = 
MlyValue.StoreIt (store'(NegFactor))
 in ( LrTable.NT 3, ( result, NegFactor1left, Store1right), rest671)

end
|  ( 8, ( ( _, ( MlyValue.NegFactor NegFactor, NegFactor1left, 
NegFactor1right)) :: rest671)) => let val  result = MlyValue.StoreIt (
NegFactor)
 in ( LrTable.NT 3, ( result, NegFactor1left, NegFactor1right), 
rest671)
end
|  ( 9, ( ( _, ( MlyValue.NegFactor NegFactor, _, NegFactor1right)) ::
 ( _, ( _, Minus1left, _)) :: rest671)) => let val  result = 
MlyValue.NegFactor (negate'(NegFactor))
 in ( LrTable.NT 4, ( result, Minus1left, NegFactor1right), rest671)

end
|  ( 10, ( ( _, ( MlyValue.Factor Factor, Factor1left, Factor1right))
 :: rest671)) => let val  result = MlyValue.NegFactor (Factor)
 in ( LrTable.NT 4, ( result, Factor1left, Factor1right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.Int Int, Int1left, Int1right)) :: rest671))
 => let val  result = MlyValue.Factor (integer'(Int))
 in ( LrTable.NT 5, ( result, Int1left, Int1right), rest671)
end
|  ( 12, ( ( _, ( _, _, RParen1right)) :: ( _, ( MlyValue.ExprSeq 
ExprSeq, _, _)) :: ( _, ( _, LParen1left, _)) :: rest671)) => let val 
 result = MlyValue.Factor (ExprSeq)
 in ( LrTable.NT 5, ( result, LParen1left, RParen1right), rest671)
end
|  ( 13, ( ( _, ( _, Recall1left, Recall1right)) :: rest671)) => let
 val  result = MlyValue.Factor (recall')
 in ( LrTable.NT 5, ( result, Recall1left, Recall1right), rest671)
end
|  ( 14, ( ( _, ( _, Get1left, Get1right)) :: rest671)) => let val  
result = MlyValue.Factor (get')
 in ( LrTable.NT 5, ( result, Get1left, Get1right), rest671)
end
|  ( 15, ( ( _, ( MlyValue.ID ID, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.Factor (valref'(ID))
 in ( LrTable.NT 5, ( result, ID1left, ID1right), rest671)
end
|  ( 16, ( ( _, ( _, _, End1right)) :: ( _, ( MlyValue.ExprSeq 
ExprSeq2, _, _)) :: _ :: ( _, ( MlyValue.ExprSeq ExprSeq1, _, _)) :: _
 :: ( _, ( MlyValue.ID ID, _, _)) :: _ :: ( _, ( _, Let1left, _)) :: 
rest671)) => let val  result = MlyValue.Factor (
letval'(ID, ExprSeq1,ExprSeq2))
 in ( LrTable.NT 5, ( result, Let1left, End1right), rest671)
end
|  ( 17, ( ( _, ( _, _, End1right)) :: ( _, ( MlyValue.ExprSeq 
ExprSeq2, _, _)) :: _ :: ( _, ( MlyValue.ExprSeq ExprSeq1, _, _)) :: _
 :: _ :: ( _, ( MlyValue.ID ID, _, _)) :: _ :: ( _, ( _, Let1left, _))
 :: rest671)) => let val  result = MlyValue.Factor (
letref'(ID, ExprSeq1, ExprSeq2))
 in ( LrTable.NT 5, ( result, Let1left, End1right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.Expr Expr4, _, Expr4right)) :: _ :: ( _, ( 
MlyValue.Expr Expr3, _, _)) :: _ :: ( _, ( MlyValue.Expr Expr2, _, _))
 :: ( _, ( MlyValue.RelOp RelOp, _, _)) :: ( _, ( MlyValue.Expr Expr1,
 _, _)) :: ( _, ( _, If1left, _)) :: rest671)) => let val  result = 
MlyValue.Factor (ifthenelse'(RelOp, Expr1, Expr2, Expr3, Expr4))
 in ( LrTable.NT 5, ( result, If1left, Expr4right), rest671)
end
|  ( 19, ( ( _, ( MlyValue.Expr Expr4, _, Expr4right)) :: _ :: ( _, ( 
MlyValue.Expr Expr3, _, _)) :: _ :: ( _, ( MlyValue.Expr Expr2, _, _))
 :: _ :: ( _, ( MlyValue.Expr Expr1, _, _)) :: ( _, ( _, If1left, _))
 :: rest671)) => let val  result = MlyValue.Factor (
ifthenelse'("=", Expr1, Expr2, Expr3, Expr4))
 in ( LrTable.NT 5, ( result, If1left, Expr4right), rest671)
end
|  ( 20, ( ( _, ( _, _, RParen1right)) :: ( _, ( MlyValue.Expr Expr, _
, _)) :: _ :: ( _, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let
 val  result = MlyValue.Factor (funref'(ID, Expr))
 in ( LrTable.NT 5, ( result, ID1left, RParen1right), rest671)
end
|  ( 21, ( ( _, ( _, _, End1right)) :: ( _, ( MlyValue.Expr Expr2, _,
 _)) :: _ :: ( _, ( MlyValue.Expr Expr1, _, _)) :: _ :: _ :: ( _, ( 
MlyValue.ID ID2, _, _)) :: _ :: ( _, ( MlyValue.ID ID1, _, _)) :: _ ::
 ( _, ( _, Let1left, _)) :: rest671)) => let val  result = 
MlyValue.Factor (letfun'(ID1, ID2, Expr1, Expr2))
 in ( LrTable.NT 5, ( result, Let1left, End1right), rest671)
end
|  ( 22, ( ( _, ( _, _, RParen1right)) :: ( _, ( MlyValue.ExprSeq 
ExprSeq, _, _)) :: _ :: ( _, ( _, Print1left, _)) :: rest671)) => let
 val  result = MlyValue.Factor (print'(ExprSeq))
 in ( LrTable.NT 5, ( result, Print1left, RParen1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.ExprSeq ExprSeq3, _, ExprSeq3right)) :: _
 :: ( _, ( MlyValue.ExprSeq ExprSeq2, _, _)) :: _ :: ( _, ( 
MlyValue.ExprSeq ExprSeq1, _, _)) :: ( _, ( _, While1left, _)) :: 
rest671)) => let val  result = MlyValue.Factor (
while'(ExprSeq1, ExprSeq2, ExprSeq3))
 in ( LrTable.NT 5, ( result, While1left, ExprSeq3right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.Expr Expr, Expr1left, Expr1right)) :: 
rest671)) => let val  result = MlyValue.ExprSeq (Expr)
 in ( LrTable.NT 6, ( result, Expr1left, Expr1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.ExprSeq ExprSeq, _, ExprSeq1right)) :: _ ::
 ( _, ( MlyValue.Expr Expr, Expr1left, _)) :: rest671)) => let val  
result = MlyValue.ExprSeq (seq'(Expr,ExprSeq))
 in ( LrTable.NT 6, ( result, Expr1left, ExprSeq1right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.ExprSeq ExprSeq, _, ExprSeq1right)) :: _ ::
 ( _, ( MlyValue.RefExpr RefExpr, RefExpr1left, _)) :: rest671)) =>
 let val  result = MlyValue.ExprSeq (seq'(RefExpr,ExprSeq))
 in ( LrTable.NT 6, ( result, RefExpr1left, ExprSeq1right), rest671)

end
|  ( 27, ( ( _, ( MlyValue.DefExpr DefExpr, DefExpr1left, 
DefExpr1right)) :: rest671)) => let val  result = MlyValue.ExprSeq (
DefExpr)
 in ( LrTable.NT 6, ( result, DefExpr1left, DefExpr1right), rest671)

end
|  ( 28, ( ( _, ( MlyValue.RefExpr RefExpr, RefExpr1left, 
RefExpr1right)) :: rest671)) => let val  result = MlyValue.ExprSeq (
RefExpr)
 in ( LrTable.NT 6, ( result, RefExpr1left, RefExpr1right), rest671)

end
|  ( 29, ( ( _, ( MlyValue.ExprSeq ExprSeq, _, ExprSeq1right)) :: _ ::
 ( _, ( MlyValue.DefExpr DefExpr, DefExpr1left, _)) :: rest671)) =>
 let val  result = MlyValue.ExprSeq (seq'(DefExpr,ExprSeq))
 in ( LrTable.NT 6, ( result, DefExpr1left, ExprSeq1right), rest671)

end
|  ( 30, ( ( _, ( MlyValue.Expr Expr, _, Expr1right)) :: _ :: _ :: ( _
, ( MlyValue.ID ID, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.RefExpr (ref'(ID, Expr))
 in ( LrTable.NT 7, ( result, ID1left, Expr1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.ID ID, _, ID1right)) :: ( _, ( _, 
Exclam1left, _)) :: rest671)) => let val  result = MlyValue.DefExpr (
def'(ID))
 in ( LrTable.NT 8, ( result, Exclam1left, ID1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.Prog x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a 
end
end
structure Tokens : calc_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun LParen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.VOID,p1,p2))
fun RParen (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.VOID,p1,p2))
fun Plus (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.VOID,p1,p2))
fun Minus (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun Times (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun Div (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun Store (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun Recall (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun Int (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.Int i,p1,p2))
fun Let (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun Val (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun Equal (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun In (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun End (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun Get (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.ID i,p1,p2))
fun RelOp (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.RelOp i,p1,p2))
fun If (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun Then (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun Else (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun Fun (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun Semicolon (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun Print (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun Exclam (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun Colon (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun Ref (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun While (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun Do (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
end
end
