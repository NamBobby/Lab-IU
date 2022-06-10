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
        ( FIELD_REFERENCE
		| FUNCNAME
		| NUMBER
		| DIGIT
        | INTEGER		
        | FLOAT
		| Sign
		| CharacterE
        | Exponent
        | Significand
		| DecimalString
		| ALPHA_CHAR
		| SPEC_CHAR
		| IDENTIFIER
		| LBRACKET
		| RBRACKET
		| LPAREN 
		| RPAREN
		| DOT
		| SEMI
		| COMMA
		| NUMBER
		| TEXT
        )* 
        EOF;

FIELD_REFERENCE	:   '[' ~('[' | ']' )* ']' 	;
FUNCNAME:   ('a'..'z'|'A'..'Z'|'_')+        ;

DIGIT	:    '0'..'9';
INTEGER: DIGIT DIGIT* ;

FLOAT: INTEGER '.' INTEGER     ;
Sign	: '+'
		| '-'
		;
CharacterE 	: 'e'
			| 'E' 
			;	
Exponent : CharacterE Sign* DIGIT ;
Significand : DIGIT '.' DIGIT* 
			| DIGIT* '.' DIGIT;
DecimalString :  Sign* Significand Exponent*;
ALPHA_CHAR :   'a'..'z' | 'A'..'Z'   ;
SPEC_CHAR  :    '-'  '_' ;
IDENTIFIER :   ALPHA_CHAR (INTEGER | ALPHA_CHAR | SPEC_CHAR )*;
LBRACKET   :   '['    ;
RBRACKET  :    ']'    ;
LPAREN    :    '('    ;
RPAREN    :    ')'    ;
DOT       :    '.';
SEMI      :    ';';
COMMA     :    ',';
NUMBER	  :	FLOAT | INTEGER ; 
TEXT	: '"' .*? '"' ;
WS        :   ('\t' | '\r' | '\n' |'ï'|'»'|'¿'|' '|'\t'|'\r'|'\n')+ -> channel(HIDDEN) ;

ERROR_CHAR: .;
UNCLOSE_STRING: .;
ILLEGAL_ESCAPE: .;
UNTERMINATED_COMMENT: .;