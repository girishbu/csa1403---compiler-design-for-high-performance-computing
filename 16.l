%{
#include <stdio.h>
%}


NUMBER  [0-9]+
WORD    [a-zA-Z]+

%%

{NUMBER}   { printf("Number: %s\n", yytext); }
{WORD}     { printf("Word: %s\n", yytext); }
[ \t\n]+   ;   
.          ;   

%%

int main(int argc, char *argv[]) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    printf("Enter the statement:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
