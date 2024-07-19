
parser grammar mroyParser;

options { tokenVocab = mroyLexer; }

//////////////////////////////////////////////////////////////////////////

start: expr EOF;

sequence: expr (COMMA expr)*;

expr
    : NUMBER
    | ID
    | L_PAREN expr R_PAREN
    | expr L_PAREN sequence? R_PAREN
    | expr DOT ID
    ;