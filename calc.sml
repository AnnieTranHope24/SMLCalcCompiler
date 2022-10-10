structure calc =
struct
open RegisterAllocation;
open calcAS;
    
     structure calcLrVals = calcLrValsFun(structure Token = LrParser.Token) 
               
     structure calcLex = calcLexFun(structure Tokens = calcLrVals.Tokens)

     structure calcParser = Join(structure Lex= calcLex
                                structure LrParser = LrParser
                                structure ParserData = calcLrVals.ParserData)
                                  
     val input_line =
       fn f =>
          let val sOption = TextIO.inputLine f
          in
            if isSome(sOption) then
               Option.valOf(sOption)
            else
               ""
          end

     val calcparse = 
         fn filename =>
           let val instrm = TextIO.openIn filename
               val lexer = calcParser.makeLexer(fn i => input_line instrm)
               val _ = calcLex.UserDeclarations.pos := 1
               val error = fn (e,i:int,_) => 
                               TextIO.output(TextIO.stdOut," line " ^ (Int.toString i) ^ ", Error: " ^ e ^ "\n")
           in 
                calcParser.parse(30,lexer,error,()) before TextIO.closeIn instrm
           end

     (* These functions are needed for if-then-else expressions and functions *)
     val label = ref 0;

     fun nextLabel() = 
         let val lab = !label
         in 
           label := !label + 1;
           "L"^Int.toString(lab)
         end

     val relOpOpposites = [("=","<>"),("<>","="),("<=",">"),(">=","<"),("<",">="),(">","<=")];

     exception notLocated;
   
     fun opposite(relOp) = 
       let fun mappedVal x nil = raise notLocated
             | mappedVal (x:string) ((y,z)::rest) = if x = y then z else mappedVal x rest
       in
         mappedVal relOp relOpOpposites 
       end

     (* These functions are needed for function and constant bindings *)

     fun forloop (0, f, x) = 0
       | forloop (y, f, x) = (f x; forloop(y-1, f, x));
            
         
     exception unboundId;  
     
     datatype Type = function' of string
                   | constant' of string;
      
     fun boundTo(name,[]) = 
         let val idname = (case name of 
                              function'(s) => s
                            | constant'(s) => s)
         in
           TextIO.output(TextIO.stdOut, "Unbound identifier "^idname^" referenced or type error!\n");
           raise unboundId
         end

       | boundTo(name,(n,ol,depth)::t) = if name=n then ol else boundTo(name,t);

     fun depthOf(name,[]) = 
         let val idname = (case name of 
                              function'(s) => s
                            | constant'(s) => s)
         in
           TextIO.output(TextIO.stdOut, "Unbound identifier "^idname^" referenced or type error!\n");
           raise unboundId
         end

       | depthOf(name,(n,ol,depth)::t) = if name=n then depth else depthOf(name,t); 
   
     val frameSize = 88;

     (* This is the code generation for the compiler *)

     exception Unimplemented; 
  
     fun codegen(add'(t1,t2),outFile,bindings,offset,depth) = 
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
             val reg2 = popReg()
             val reg1 = popReg()    
         in
           TextIO.output(outFile,reg1 ^ ":="^reg1^"+"^reg2^"\n");
           delReg(reg2);
           pushReg(reg1)
         end
            
       | codegen(sub'(t1,t2),outFile,bindings,offset,depth) = 
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
             val reg2 = popReg()
             val reg1 = popReg()                
         in
           TextIO.output(outFile,reg1 ^ ":="^reg1^"-"^reg2^"\n");
           delReg(reg2);
           pushReg(reg1)
         end
 
       | codegen(integer'(i),outFile,bindings,offset,depth) = 
         let val r = getReg()
         in
           TextIO.output(outFile, r ^ ":=" ^ Int.toString(i) ^ "\n");
           pushReg(r)
         end
       | codegen(negate'(t),outFile,bindings,offset,depth) = 
         let val _ = codegen(t,outFile,bindings,offset,depth)
			val r = popReg()
         in
			
			TextIO.output(outFile,r ^ ":="^r^"* negone \n");
           pushReg(r)
         end
		|codegen(store'(t),outFile,bindings,offset,depth) = 
         let val _ = codegen(t,outFile,bindings,offset,depth)
			val r = popReg()
         in	
			TextIO.output(outFile, "MEM:="^r^"\n");
           pushReg(r)
         end
		|codegen(recall', outFile,bindings,offset,depth) = 
			let val reg = getReg()
			in
				TextIO.output(outFile,reg ^ ":= MEM \n");
				pushReg(reg)
			end		 
		|codegen(prod'(t1, t2),outFile,bindings,offset,depth) = 
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
             val reg2 = popReg()
             val reg1 = popReg()              
         in
           TextIO.output(outFile,reg1 ^ ":="^reg1^"*"^reg2^"\n");
           delReg(reg2);
           pushReg(reg1)
         end
		|codegen(div'(t1, t2),outFile,bindings,offset,depth) = 
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
             val reg2 = popReg()
             val reg1 = popReg()              
         in
           TextIO.output(outFile,reg1 ^ ":="^reg1^"/"^reg2^"\n");
           delReg(reg2);
           pushReg(reg1)
         end
		 (* we copied code for add', but aren't doing any store yet *)
		| codegen(letval'(s,t1,t2),outFile,bindings,offset,depth) = 
         let val _ = codegen(t1,outFile,bindings,offset,depth)
			 val reg1 = popReg()
			 val olString = Int.toString offset
			 in
			 TextIO.output(outFile, "M[SP+" ^ olString^"] :=" ^ reg1^"\n");
			 delReg(reg1);  
		 (* figure out where to store the value for s -
		    use the offset! Also need to create a new binding
			for s and its offset - and add it to the front of bindings *)
			let
             val _ = codegen(t2,outFile,(constant'(s),olString,depth)::bindings,offset+1,depth)
             val reg2 = popReg()                 
         in			        
           pushReg(reg2)
         end
		 end
		 (* we grabbed code from recall' problems are here *)
		 | codegen(valref'(s),outFile,bindings,offset,depth) = 
         let val reg1 = getReg()    
			val olString = boundTo(constant'(s), bindings)
         in
			TextIO.output(outFile, reg1^":=SP\n");
				let val dChange =  depth-depthOf(constant'(s),bindings)
				in
				forloop(dChange, TextIO.output, (outFile, reg1^":=M["^reg1^"+0]\n"));(*# follow the access link*)			
           TextIO.output(outFile,reg1^":=M["^reg1^"+"^olString^"]\n");
           pushReg(reg1)
         end 
		 end
		 
		 
		| codegen(letfun' (s1,s2,t1,t2),outFile,bindings,offset,depth) = 
		let val l0 = nextLabel()
			val l1 = nextLabel()
			in
			TextIO.output(outFile,"goto "^ l0^"\n");
			TextIO.output(outFile, l1^":\n");
			TextIO.output(outFile, "M[SP+2]:=PR0\n");
			TextIO.output(outFile,"M[SP+3]:=PR1\n")	;
			TextIO.output(outFile,"M[SP+4]:=PR2\n")	;
			TextIO.output(outFile,"M[SP+5]:=PR3\n")	;
			TextIO.output(outFile,"M[SP+6]:=PR4\n")	;
			TextIO.output(outFile,"M[SP+7]:=PR5\n")	;
			TextIO.output(outFile,"M[SP+8]:=PR6\n")	;
			TextIO.output(outFile,"M[SP+9]:=PR7\n");
			TextIO.output(outFile,"M[SP+10]:=PR8\n");
			TextIO.output(outFile,"M[SP+11]:=PR9\n");

				
				(* TextIO.output(outFile,reg1^":=M["^reg1^"+11]\n") *)
			(* let val reg = popReg() *)
				(* in *)
					(* TextIO.output(outFile,reg^":=SP\n"); *)
					(* pushReg(reg); *)
				
			let
             val _ = codegen(t1,outFile,(function'(s1),l1,depth)::(constant'(s2),"11",depth+1)::bindings,12,depth+1)
			 val reg1 = popReg()
			 in
			 
			 pushReg(reg1);
			 TextIO.output(outFile,"PR9:="^reg1^"\n");
			 TextIO.output(outFile,"PR0:=M[SP+2]\n");
			 TextIO.output(outFile,"PR1:=M[SP+3]\n");
			 TextIO.output(outFile,"PR2:=M[SP+4]\n");
			 TextIO.output(outFile,"PR3:=M[SP+5]\n");
			 TextIO.output(outFile,"PR4:=M[SP+6]\n");
			 TextIO.output(outFile,"PR5:=M[SP+7]\n");
			 TextIO.output(outFile,"PR6:=M[SP+8]\n");
			 TextIO.output(outFile,"PR7:=M[SP+9]\n");
			 TextIO.output(outFile,"PR8:=M[SP+10]\n");
			 TextIO.output(outFile,"SP:=M[SP+1]\n");
			 TextIO.output(outFile,"PC:=PR8\n");
			 TextIO.output(outFile,l0^":\n");
			 delReg(reg1);
			let val _ = codegen(t2,outFile,(function'(s1),l1,depth)::(constant'(s2),"11",depth+1)::bindings,offset,depth)
				val reg2 = popReg()(*do not change depth*)
				in
					pushReg(reg2)
				end


			end
			end
			
			
		| codegen (funref'(s,t),outFile,bindings,offset,depth) =
			 let val _ = codegen(t,outFile,bindings,offset,depth)
				val reg = popReg()	
				in
					TextIO.output(outFile,"PR8:=SP\n");(*# set the access link*)
				let val dChange =  depth-depthOf(function'(s),bindings)(*in main*)
				in
				(* TextIO.output(outFile,Int. toString dChange^"PR8:=\n"); *)
				forloop(dChange, TextIO.output, (outFile, "PR8:=M[PR8+0]\n"));(*# follow the access link*)
					TextIO.output(outFile,"M[SP+"^Int.toString offset^"]:=PR8\n");(*make changes here*)
					let val os=offset +1
					in
					TextIO.output(outFile,"M[SP+"^Int.toString os^"]:=SP\n");(*make changes here*)
					TextIO.output(outFile,"PR9:="^reg^"\n");(*make changes here*)
					TextIO.output(outFile,"PR8:="^Int. toString offset^"\n");
					TextIO.output(outFile,"SP:=SP+PR8\n");
					TextIO.output(outFile,"PR8:=PC+1\n");
					TextIO.output(outFile,"goto "^boundTo(function'(s), bindings)^"\n");
					TextIO.output(outFile,reg^":=PR9\n");				
					pushReg(reg)
				end
				end
				end
			
		|	codegen(get', outFile, bindings, offset, depth) = 
			let val r=getReg()
			in
				TextIO.output(outFile, "readInt("^r^")\n");
				pushReg(r)
			end
		| codegen(ifthenelse'(s,t1,t2,t3,t4),outFile,bindings,offset,depth) = 
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
             val reg2 = popReg()
             val reg1 = popReg()  
			 val nextl1 = nextLabel()
         in
           TextIO.output(outFile,"if "^reg1^opposite(s)^reg2^ " then goto "^nextl1^"\n");
		   delReg(reg2);
		   delReg(reg1);
         let val _ = codegen(t3,outFile,bindings,offset,depth)
             val reg3 = popReg()  
			 val nextl2 = nextLabel()
			 in
		   TextIO.output(outFile,"goto "^nextl2^"\n");
		   TextIO.output(outFile,nextl1^":"^"\n");
		   delReg(reg3);
         let val _ = codegen(t4,outFile,bindings,offset,depth)
             val reg4 = popReg()  
			 in		   
			 TextIO.output(outFile,nextl2^":"^"\n");		   
           pushReg(reg4)
		 end
         end		
		 end
		 |codegen(seq'(t1, t2),outFile,bindings,offset,depth) = 
		(* | codegen(_,outFile,bindings,offset,depth) = *)
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
			 val reg2= popReg()
			 val reg1 = popReg()
			 in 
			 TextIO.output(outFile,reg1^":="^reg2^"\n");
			 delReg(reg2);
			 pushReg(reg1)
			 end
          (* raise Unimplemented)  *)
		  |codegen(print'(t),outFile,bindings,offset,depth) =
          let val _ = codegen(t,outFile,bindings,offset,depth)  
				val reg = popReg()
			in 
			TextIO.output(outFile,"writeInt("^reg^")\n");
			pushReg(reg)
			end
		  |codegen(letref'(s,t1,t2),outFile,bindings,offset,depth) =
          let val _ = codegen(t1,outFile,bindings,offset,depth) 	
			 val reg1 = popReg()
			 val olString = Int.toString offset
			 in
			 TextIO.output(outFile, "M[SP+" ^ olString^"] :=" ^ reg1^"\n");
			 delReg(reg1);  
			let
             val _ = codegen(t2,outFile,(constant'(s),olString,depth)::bindings,offset+1,depth)
             val reg2 = popReg()                 
         in			        
           pushReg(reg2)
         end
		 end
		  

		 
		 
		 
		  |codegen(ref'(s,t),outFile,bindings,offset,depth) =

		  
		  
         let val _ = codegen(t,outFile,bindings,offset,depth) 	
			val reg1 = popReg()    
			val olString = boundTo(constant'(s), bindings)
         in
			TextIO.output(outFile,"M[SP+" ^ olString^"] :=" ^ reg1^"\n");
           pushReg(reg1) 
		 end


		 
		  
		  |codegen(def'(s),outFile,bindings,offset,depth) =		  
  

         let val reg1 = getReg()    
			val olString = boundTo(constant'(s), bindings)
         in
			TextIO.output(outFile, reg1^":=SP\n");
				let val dChange =  depth-depthOf(constant'(s),bindings)
				in
				forloop(dChange, TextIO.output, (outFile, reg1^":=M["^reg1^"+0]\n"));(*# follow the access link*)			
           TextIO.output(outFile,reg1^":=M["^reg1^"+"^olString^"]\n");
           pushReg(reg1)
         end 
		 end  
		 |codegen(while'(s, t1, t2, t3),outFile,bindings,offset,depth) =	
         let val _ = codegen(t1,outFile,bindings,offset,depth)
             val _ = codegen(t2,outFile,bindings,offset,depth)
             val reg2 = popReg()
             val reg1 = popReg()  
			 val nextl1 = nextLabel()
			 val beginLoop = nextLabel()
         in
			TextIO.output(outFile,beginLoop^":\n");
           TextIO.output(outFile,"if "^reg1^opposite(s)^reg2^ " then goto "^nextl1^"\n");
		   delReg(reg2);
		   delReg(reg1);
		   
         let val _ = codegen(t3,outFile,bindings,offset,depth)
             val reg3 = popReg()  
			 
			 in
		   TextIO.output(outFile,"goto "^beginLoop^"\n");
		   TextIO.output(outFile,nextl1^":"^"\n");
		   pushReg(reg3);

         end		
		 end		 
                                    
     fun compile filename  = 
         let val (ast, _) = calcparse filename
             val outFile = TextIO.openOut("a.ewe")
         in
           TextIO.output(TextIO.stdOut, show(ast));
           TextIO.output(TextIO.stdOut, "\n");		 
           TextIO.output(outFile,"SP:=100\n");
           TextIO.output(outFile,"PR0 := 0\n");
           TextIO.output(outFile,"PR1 := 0\n");
           TextIO.output(outFile,"PR2 := 0\n");
           TextIO.output(outFile,"PR3 := 0\n");
           TextIO.output(outFile,"PR4 := 0\n");
           TextIO.output(outFile,"PR5 := 0\n");
           TextIO.output(outFile,"PR6 := 0\n");
           TextIO.output(outFile,"PR7 := 0\n");
           TextIO.output(outFile,"PR8 := 0\n");
           TextIO.output(outFile,"PR9 := 0\n");
           TextIO.output(outFile,"cr := 13\n");
           TextIO.output(outFile,"nl := 10\n");
		   TextIO.output(outFile,"negone:= -1 \n");
           TextIO.output(outFile,"nullchar:=0\n");
           let val s = codegen(ast,outFile,[(function'("output"),"output",0),
                                            (function'("input"),"input",0)],0,0)
               val reg1 = popReg()
           in 
             TextIO.output(outFile,"writeInt("^reg1^")\nhalt\n\n");
             delReg(reg1);
             TextIO.output(outFile,"###### input function ######\n");
             TextIO.output(outFile,"input:  readInt(PR9)\t\t# read an integer into function result register\n");
             TextIO.output(outFile,"SP:=M[SP+1]\t\t# restore the stack pointer\n");
             TextIO.output(outFile,"PC:=PR8\t\t\t# return from whence you came\n");
             TextIO.output(outFile,"###### output function ######\n");
             TextIO.output(outFile,"output:  writeInt(PR9)\t\t# write the integer in function parameter register\n");
             TextIO.output(outFile,"writeStr(cr)\n");
             TextIO.output(outFile,"SP:=M[SP+1]\t\t# restore the stack pointer\n");
             TextIO.output(outFile,"PC:=PR8\t\t\t# return from whence you came\n");
             TextIO.output(outFile,"equ PR0 M[0]\n");
             TextIO.output(outFile,"equ PR1 M[1]\n");
             TextIO.output(outFile,"equ PR2 M[2]\n");
             TextIO.output(outFile,"equ PR3 M[3]\n");
             TextIO.output(outFile,"equ PR4 M[4]\n");
             TextIO.output(outFile,"equ PR5 M[5]\n");
             TextIO.output(outFile,"equ PR6 M[6]\n");
             TextIO.output(outFile,"equ PR7 M[7]\n");
             TextIO.output(outFile,"equ PR8 M[8]\n");
             TextIO.output(outFile,"equ PR9 M[9]\n");
			 TextIO.output(outFile,"equ negone M[10]\n");
             TextIO.output(outFile,"equ MEM M[12]\n");
             TextIO.output(outFile,"equ SP M[13]\n");
             TextIO.output(outFile,"equ cr M[14]\n");
             TextIO.output(outFile,"equ nl M[15]\n");
             TextIO.output(outFile,"equ nullchar M[16]\n");
             printRegs(!regList,outFile); 
             TextIO.closeOut(outFile)
           end
         end 
         handle _ => (TextIO.output(TextIO.stdOut, "An error occurred while compiling!\n\n")); 
             
       
     fun run(a,b::c) = (compile b; OS.Process.success)
       | run(a,b) = (TextIO.print("usage: sml @SMLload=calc\n");
                     OS.Process.success)
end


