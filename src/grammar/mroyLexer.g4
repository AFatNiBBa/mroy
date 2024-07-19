
lexer grammar mroyLexer;

//////////////////////////////////////////////////////////////////////////

fragment NUMBER_BIN_DIGIT: '0'..'1';
fragment NUMBER_BIN_INT: NUMBER_BIN_DIGIT ('_' | NUMBER_BIN_DIGIT)*;
fragment NUMBER_BIN_SCIENT: 'e' [+-]? NUMBER_BIN_INT;
fragment NUMBER_BIN
    : NUMBER_BIN_INT NUMBER_BIN_SCIENT?
    | NUMBER_BIN_INT? DOT NUMBER_BIN_INT NUMBER_BIN_SCIENT?
    ;

fragment NUMBER_DEC_DIGIT: '0'..'9';
fragment NUMBER_DEC_INT: NUMBER_DEC_DIGIT ('_' | NUMBER_DEC_DIGIT)*;
fragment NUMBER_DEC_SCIENT: 'e' [+-]? NUMBER_DEC_INT;
fragment NUMBER_DEC
    : NUMBER_DEC_INT NUMBER_DEC_SCIENT?
    | NUMBER_DEC_INT? DOT NUMBER_DEC_INT NUMBER_DEC_SCIENT?
    ;

fragment NUMBER_HEX_DIGIT: NUMBER_DEC_DIGIT | 'a'..'f' | 'A'..'F';
fragment NUMBER_HEX_INT: NUMBER_HEX_DIGIT ('_' | NUMBER_HEX_DIGIT)*;
fragment NUMBER_HEX_SCIENT: 'e' [+-] NUMBER_HEX_INT; // Scientific notation is only allowed when there's an explicit sign
fragment NUMBER_HEX
    : NUMBER_HEX_INT NUMBER_HEX_SCIENT?
    | NUMBER_HEX_INT? DOT NUMBER_HEX_INT NUMBER_HEX_SCIENT?
    ;

NUMBER: NUMBER_DEC | '0b' NUMBER_BIN | '0x' NUMBER_HEX;

//////////////////////////////////////////////////////////////////////////

fragment ID_CHAR_FIRST : ('\\' .) | 'a'..'z' | 'A'..'Z' | '_' | '\u00C0'..'\u00D6' | '\u00D8'..'\u00F6' | '\u00F8'..'\u02FF' | '\u0370'..'\u037D' | '\u037F'..'\u1FFF' | '\u200C'..'\u200D' | '\u2070'..'\u218F' | '\u2C00'..'\u2FEF' | '\u3001'..'\uD7FF' | '\uF900'..'\uFDCF' | '\uFDF0'..'\uFFFD' | '\u{10000}'..'\u{EFFFF}';
fragment ID_CHAR: ID_CHAR_FIRST | '0'..'9' | '\u00B7' | '\u0300'..'\u036F' | '\u203F'..'\u2040';
ID: ID_CHAR_FIRST ID_CHAR*;

//////////////////////////////////////////////////////////////////////////

DOT: '.';

LENGTH: '#';

PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
MOD: '%';
POW: '^';

COMPARE: '<>';
LT: '<';
LTE: '<=';
GT: '>';
GTE: '>=';
EQ: '==';
EQ_STRICT: '===';
NEQ: '!=';
NEQ_STRICT: '!==';

NOT: '!';
AND: '&';
XOR: '~';
OR: '|';

COMMA: ',';

L_PAREN: '(';
R_PAREN: ')';

SPACE: [ \r\n\t]+ -> skip;