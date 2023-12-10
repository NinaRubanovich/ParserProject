grammar PythonParser;

// Lexer Rules
// General Tokens
ID: [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER: INT | FLOAT;
INT: '-'?[0-9]+;
FLOAT: '-'?[0-9]+'.'[0-9]+;
STRING: '"' .*? '"' | '\'' .*? '\'';
BOOL: 'True' | 'False';

// Skip single-line comments
COMMENT: '#' ~[\r\n]* -> skip;
ALTCOMMENT: '##' ~[\r\n]* -> skip;

// Skip multi-line comments
MULTI_LINE_COMMENT: '\'\'\'' .*? '\'\'\'' -> skip;

// Whitespace, tabs, newlines
WS: [ \t]+ -> skip;
NEWLINE: '\r'? '\n' -> skip;
NEWLINE_TAB: '\t'* NEWLINE -> skip;

// Start of Parser
start: (statement | comp_statement)* EOF;

// Look for Single Line Statements
statement: assign_statement
   | arith_statement
   | array_statement;

// Look for Compound Statements
comp_statement: if_statement
   | for_statement
   | while_statement;

// Compound Statements
// If-Elif-Else Statements
if_statement: '\t'* 'if' condition ':' nest_state+ ('elif' condition ':'  nest_state+)* ('else' ':' nest_state+)*;

// For Statement
for_statement: '\t'* 'for' ID 'in' ID ':' '\t'* (statement+);

// While Statement
while_statement: 'while' condition ':' nest_state+;

// Look for statements after compound statements
nest_state: '\t' (statement | comp_statement) NEWLINE_TAB*;

// Condition
condition: condition_expr (('and'|'or') condition_expr)?;

condition_expr: ('(')? 'not' ID (')')?
                | ID comp_op ID
                | ID comp_op NUMBER
                | ('(')? ID comp_op NUMBER (')')?
                | ('(')? ID comp_op ID (')')?
                | BOOL;

comp_op: '==' | '!=' | '<' | '<=' | '>' | '>=';

// Single Line Statements
//= += -= *= /=
assign_statement: ID assign_op expr;

//+ - * /
arith_statement: ID '=' arith_expr;

//Array
array_statement: ID '=' '[' array_expr ']';

//Array Expression
array_expr: expr (',' expr)*;

//List of assignment operators
assign_op: '=' | '+=' | '-=' | '*=' | '/=';

//Artithmetic Expression
arith_expr: arith_expr ('*' | '/') arith_expr
   | arith_expr ('+' | '-') arith_expr
   | arith_expr '%' arith_expr
   | ID
   | NUMBER;

//General Expression
expr: arith_expr
   | BOOL
   | STRING
   | array_statement
   | BOOL;