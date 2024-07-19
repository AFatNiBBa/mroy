
parser grammar mroyParser;

options { tokenVocab = mroyLexer; }

//////////////////////////////////////////////////////////////////////////

start: body EOF;

body: (sequence | SEMI)*;

sequence: expr (COMMA expr)*;

block: L_CURLY body R_CURLY;

expr
    : NUMBER
    | ID
    | STRING
    | CHAR
    | expr DOT ID
    | L_PAREN sequence R_PAREN
    | expr L_PAREN sequence? R_PAREN
    | expr STRING
    | expr MOD
    | (LENGTH | PLUS | MINUS | MUL | NOT | AND | XOR) expr
    | <assoc=right> expr POW expr
    | expr (MUL | DIV | MOD) expr
    | expr (PLUS | MINUS) expr
    | expr COMPARE expr
    | expr (LT | LTE | GT | GTE) expr
    | expr (EQ | EQ_STRICT | NEQ | NEQ_STRICT) expr
    | expr AND expr
    | expr XOR expr
    | expr OR expr
    | flow
    ;

flow
    : block
    | FLOW_IF sequence block (FLOW_ELSE sequence)?
    | FLOW_IF L_PAREN sequence R_PAREN sequence (FLOW_ELSE sequence)?
    | FLOW_DO sequence FLOW_WHILE sequence
    | FLOW_WHILE sequence block
    | FLOW_WHILE L_PAREN sequence R_PAREN sequence
    | FLOW_TRY sequence (FLOW_CATCH sequence | FLOW_CATCH ID block | FLOW_CATCH L_PAREN ID R_PAREN sequence)* (FLOW_FINALLY sequence)?
    | (FLOW_QUOTE | FLOW_DEFER | FLOW_UNSAFE | FLOW_BOTCH) sequence
    ;