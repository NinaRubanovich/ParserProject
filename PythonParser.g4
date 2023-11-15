grammar PythonParser;

// Lexer Rules
tokens {
   INDENT, DEDENT
}

// General Tokens
ID: [a-zA-Z_][a-zA-Z_0-9]*;
NUMBER: INT | FLOAT;
INT: '-'?[0-9]+;
FLOAT: '-'?[0-9]+'.'[0-9]+;
STRING: '"' .*? '"' | '\'' .*? '\'';
BOOL: 'True' | 'False';

// Whitespace, tabs, newlines
WS: [ \t]+ -> skip;
NEWLINE: '\r'? '\n' -> skip;

// Start of Parser
start: statement+ if_statement+ EOF;

// Look for different statements
statement: assign_statement
   | arith_statement
   | array_statement;

// If-Elif-Else Statements
if_statement: 'if' condition ':' (statement)+ DEDENT? ('elif' condition ':'  (statement)+)* DEDENT? ('else' ':' (statement)+)? DEDENT?;

// Condition
condition: condition_expr (('and'|'or') condition_expr)?;

condition_expr: ('(')? 'not' ID (')')?
                | ID comp_op ID
                | ID comp_op NUMBER
                ;

comp_op: '==' | '!=' | '<' | '<=' | '>' | '>=';

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
   | array_statement;