grammar BKIT;

@lexer::header {
from lexererr import *
}

@lexer::members {
def emit(self):
    tk = self.type
    result = super().emit()
    if tk == self.UNCLOSE_STRING:       
        raise UncloseString(result.text)
    elif tk == self.ILLEGAL_ESCAPE:
        raise IllegalEscape(result.text)
    elif tk == self.ERROR_CHAR:
        raise ErrorToken(result.text)
    elif tk == self.UNTERMINATED_COMMENT:
        raise UnterminatedComment()
    else:
        return result;
}

options{
	language=Python3;
}

program : 
        ( Keyword
        | Interger
        | Id
        | Semic
        | Openparen
        | Closeparen
		| BooleanLiteral
        | Op
		| TEXT
		| QUES
		| NEWLINE
		| WHITESPACE
        )* 
        EOF;

Keyword	: 'if' 
		| 'else'
		| 'while'
		| 'do'
		| 'abstract'
   		| 'continue'
		| 'for' 
        | 'new'
		| 'switch'
		| 'assert'     	
		| 'default'
		| 'package'
		| 'synchronized' 
		| 'boolean'
		| 'goto' 
        | 'private'
     	| 'this' 
		| 'break'
		| 'double'
     	| 'implements'
		| 'protected'
		| 'throw'
		| 'byte'
		| 'import' 
		| 'public'
      	| 'throws'
		| 'case'
		| 'enum'  
     	| 'instanceof'
		| 'return'
      	| 'transient'
		| 'catch' 
		| 'extends'
    	| 'int'    
		| 'short' 
      	| 'try'
		| 'char'  
		| 'final'  
    	| 'interface'
		| 'static'
      	| 'void'
		| 'class' 
		| 'finally' 
		| 'long'  
		| 'strictfp' 
		| 'volatile'
		| 'const'  
		| 'float' 
     	| 'native'
		| 'super'       
    ;

Interger: [0-9]+ ;
Id : [a-z]+ ;
Semic : ';';
Openparen	: '('
			| '['			
			;
Closeparen	: ')'
			| ']'
			;
BooleanLiteral	: 'true' 
				| 'false';
Op : '=='
   | '='
   | '+='
   | '-='
   | '*='
   | '/='
   | '%='
   | '<<='
   | '>>='
   | '&='
   | '^='
   | '|='
   | '|'
   | '^'
   | '~'
   | '<<'
   | '>>'
   | '>'
   | '<'
   | '>='
   | '<='
   | '||'
   | '!='
   | '!'
   | '-'
   | '*'
   | '/'
   | '%'
   | '++'
   | '--'
   | '+'
   | '&&'
   | '&'
   ;
TEXT	: '"' .*? '"' ;
		
QUES	: '?' ;
				
NEWLINE : ('\r'? '\n' | '\r')+ ;
WHITESPACE : (' '|'\t')+ -> skip ;

ERROR_CHAR: .;
UNCLOSE_STRING: .;
ILLEGAL_ESCAPE: .;
UNTERMINATED_COMMENT: .;