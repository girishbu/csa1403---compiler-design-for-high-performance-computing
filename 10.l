%{
#include <stdio.h>
%}

/* Patterns */
CAPITAL    [A-Z]+          
WORD       [a-zA-Z]+      
OTHER      .               

%%

{CAPITAL}  { printf("Capital Word: %s\n", yytext); }
{WORD}     ; 
{OTHER}    ;  
%%

int main(int argc, char *argv[]) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
