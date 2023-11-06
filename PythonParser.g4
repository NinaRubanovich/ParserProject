grammar PythonParser;

//Start of Parser
start: statement+ EOF;

//Look for different statements
statement: assign_statement
   | arith_statement
   | array_statement;

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

//General Tokens
ID: [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER: INT | FLOAT;
INT: [0-9]+;
FLOAT: [0-9]+'.'[0-9]+;
STRING: '"' .*? '"' | '\'' .*? '\'';
BOOL: 'True' | 'False';

//Whitespace, tabs, newlines
WS: [ \t\r\n]+ -> skip;
