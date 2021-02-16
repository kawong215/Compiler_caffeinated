grammar caffeinated;

@header {
#include "wci/intermediate/TypeSpec.h"
using namespace wci::intermediate;
}

program   : header mainBlock '.' ;
header    : PROGRAM IDENTIFIER ';' ; 
mainBlock : block;
block     : declarations compoundStmt ;

// FOR FUNCTIONS
menu : menu_header block;
menu_header: menu_TYPE IDENTIFIER '(' param_type ':' varList ')'; 
menu_TYPE : INTEGER_TYPE | CHAR_TYPE | FLOAT_TYPE | NOTHING;  
menu_call : IDENTIFIER; 
param_type : INTEGER_TYPE | CHAR_TYPE | FLOAT_TYPE;

declarations : VAR declList ';' END_VAR;
declList     : decl ( ';' decl )* ;
decl         : varList ':' typeId ;
varList      : varId ( ',' varId )* ;
varId        : IDENTIFIER ;
typeId       : IDENTIFIER ;

compoundStmt : BEGIN stmtList END ;

stmt : compoundStmt
     | assignmentStmt
     | whileStmt
     | printStmt
     | ifStmt
     | menu_call // function call
     |
     ;

stmtList       : stmt ( ';' stmt )* ;

assignmentStmt : variable '=' expr ;

ifStmt         : IF '(' expr ')' THEN '(' stmtList ')';

whileStmt	   : DO '(' stmtList ')' WHILE '(' expr ')';

// USED FOR PRINTING
printStmt      : PRINTF '(' formatString printArg* ')' ;
formatString   : STRING ;
printArg       : ',' expr ;

variable : IDENTIFIER ;

expr locals [ TypeSpec *type = nullptr ]
    : expr mulDivOp expr   # mulDivExpr
    | expr addSubOp expr   # addSubExpr
    | expr rel_op expr		# rel_expr
    | data_type				# dataExpr
    | variable             # variableExpr
    | '(' expr ')'         # parenExpr
    ;

mulDivOp : MUL_OP | DIV_OP ;
addSubOp : ADD_OP | SUB_OP ;

rel_op : LESS_THAN | GREATER_THAN | EQUALS | GT_EQ | LT_EQ | NOT_EQ ;

data_type locals [ TypeSpec *type = nullptr ]
    : INTEGER    # integerConst
    | FLOAT      # floatConst
    | CHARACTER  #charConst 
    ;

PROGRAM : 'CUSTOMER' ;
VAR     : 'TOPPINGS' ;
END_VAR : 'END_TOPPINGS'; 
BEGIN   : 'ORDER' ;
END     : 'PICKUP' ;
WHILE   : 'WHILE' ;
DO      : 'BREW' ;
IF      : 'MILK' ;
THEN    : 'THEN' ;
PRINTF  : 'RECEIPT' ;

// for function calls

INTEGER_TYPE: 'BOBA_MENU';
CHAR_TYPE : 'SWEET_MENU';
FLOAT_TYPE : 'ICE_MENU';
NOTHING : 'DECAF_MENU'; 

IDENTIFIER : [a-zA-Z][a-zA-Z0-9]* ;
INTEGER    : [0-9]+ ;
FLOAT      : [0-9]+ '.' [0-9]+ ;
CHARACTER : '\''[a-zA-Z]'\''; // single quotes around char

MUL_OP :   '*' ;
DIV_OP :   '/' ;
ADD_OP :   '+' ;
SUB_OP :   '-' ;

//Relational Operators
LESS_THAN   : '<' ;
GREATER_THAN: '>' ;
EQUALS      : '==' ;
GT_EQ       : '>=' ;
LT_EQ       : '<=' ;
NOT_EQ      : '!=' ;

NEWLINE : '\r'? '\n' -> skip  ;
WS      : [ \t]+ -> skip ;
BlockComment : '/*' .*? '*/' -> skip ;
LineComment : '//' ~ [\r\n]* -> skip ;

QUOTE  : '\'' ;
STRING : QUOTE STRING_CHAR* QUOTE ;
fragment STRING_CHAR : QUOTE QUOTE  // two consecutive quotes
                     | ~('\'')      // any non-quote character
                     ;