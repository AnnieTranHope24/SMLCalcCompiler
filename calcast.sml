structure calcAS = 
struct

datatype
    AST = add' of AST * AST
        | sub' of AST * AST
        | prod' of AST * AST
        | div' of AST * AST
        | negate' of AST
        | integer' of int
        | store' of AST
        | recall'
		| get'
		| ifthenelse' of string * AST * AST*AST*AST
		| funref' of string*AST
		| letfun' of string*string*AST*AST
		| valref' of string
		| seq' of AST * AST
		| print' of AST
		| letref'	of string*AST*AST
		| ref'	of string*AST
		| def' of string
		| while' of string*AST*AST*AST
		| letval' of string * AST * AST;
fun show(recall') = "recall"
  | show(get') = "get"
  | show(while'(s, a,b,c)) = "while("^s^","^show(a)^","^show(b)^","^show(c)^")"
  | show(ref'(s,a)) = "ref("^s^","^show(a)^")"   
  | show(letref'(s,a,b)) = "letref("^s^","^show(a)^","^show(b)^")"  
  | show(def'(s))= "def("^s^")"  
  | show(print'(a))= "print("^show(a)^")"
  | show(seq'(a,b)) = "seq("^show(a)^","^show(b)^")"
  | show (ifthenelse'(s,a,b,c,d)) = "ifthenelse("^s^","^show(a)^","^show(b)^","^show(c)^","^show(d)^")"
  | show(valref'(s)) = "valref("^s^")"
  | show(letval'(s,a,b)) = "letval("^s^","^show(a)^","^show(b)^")"
  | show(funref'(s,a)) = "funref("^s^","^show(a)^")"  
  | show(letfun'(s1,s2,a,b)) = "letfun("^s1^","^s2^","^show(a)^","^show(b)^")"   
  | show(integer'(i)) = "integer("^Int.toString(i)^")"
  | show(store'(a)) = "store("^show(a)^")"
  | show(negate'(a)) = "negate("^show(a)^")"
  | show(div'(a,b)) = "div("^show(a)^","^show(b)^")"
  | show(prod'(a,b)) = "prod("^show(a)^","^show(b)^")"
  | show(sub'(a,b)) = "sub("^show(a)^","^show(b)^")"
  | show(add'(a,b)) = "add("^show(a)^","^show(b)^")"		
	   
end;


