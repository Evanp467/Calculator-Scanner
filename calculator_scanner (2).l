%option noyywrap

%{
#include <stdio.h>
%}

DIGIT       [0-9]
OCTAL_DIGIT [0-7]
HEX_DIGIT   [0-9a-fA-F]
EXPONENT    [eE][-+]?{DIGIT}+

%%

"0x"{HEX_DIGIT}+               { printf("INT\n"); } /* Hexadecimal */
"0"{OCTAL_DIGIT}+              { printf("INT\n"); } /* Octal */
{DIGIT}+                       { printf("INT\n"); } /* Decimal */

{DIGIT}*"."{DIGIT}+({EXPONENT})? { printf("FLOAT\n"); } /* Floating Point, optional leading 0s */
{DIGIT}+"."{DIGIT}*({EXPONENT})? { printf("FLOAT\n"); } /* Floating Point, mandatory leading 0s */


"+"                             { printf("ADD\n"); } /* Add */
"-"                             { printf("SUBTRACT\n"); } /*SUBTRACT*/
"/"                             { printf("DIVIDE\n"); } /* Divide */
"*"                             { printf("MULTIPLY\n"); } /* Multiply */
"%"                             { printf("MODULO\n"); } /* Modulo */
"="                             { printf("EQUAL\n"); } /* Equal */

[a-f]                           { printf("ID\n"); } /* Variables */

"("                             { printf("OP\n"); } /* Open Parenthesis */
")"                             { printf("CP\n"); } /* Close Parenthesis */

[ \t\n]+                         ; /* Ignore whitespace */

.                               { printf("UNKNOWN\n"); } /* Unknown Character */

%%

int main() {
    while (yylex() != 0);
    return 0;
}
