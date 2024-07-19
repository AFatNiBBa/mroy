
parser grammar mroyParser;

options { tokenVocab = mroyLexer; }

//////////////////////////////////////////////////////////////////////////

start: sequence EOF;

sequence: expr (COMMA expr)*;

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
    ;